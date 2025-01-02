 
-- qd: quick diagrm wth : tserver, session, qury, table, tablet and ash

drop table ybx_ashy_log ; 
drop table ybx_tblt_mst ; 
drop table ybx_tabl_mst ; 
drop table ybx_qury_mst ; 
drop table ybx_sess_mst ; 
drop table ybx_tsrv_mst ; 

create table ybx_tsrv_mst (
  tsrv_uuid   text primary key
, host        text
) ;  

create table ybx_sess_mst (
  id                bigint  generated always as identity  primary key
, tsrv_uuid         text not null 
, pid               int
, backend_start     timestamp with time zone default now() -- try to catch from act or from lowest ash.sample_date
, host              text   -- prefer host instead of ts-uuid
, client_addr       text   -- or inet
, client_port       int
, client_hostname   text
, gone_dt           timestamp with time zone -- null, until gone.
, datid             oid
, usesysid          oid
, leader_pid        int
, app_name          text    -- from pg_stat_activity
, constraint ybx_sess_mst_uk unique ( tsrv_uuid, pid, backend_start ) 
, constraint ybx_sess_tsrv_fk foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_sess_client_uk unique ( client_addr, client_port ) 
) ;

 create table ybx_qury_mst (
  queryid     bigint not null primary key
, log_dt      timestamp with time zone  default now()
, found_at_tsrv text                       -- consider FK, but no real need..
, query       text
) ;

create table ybx_tabl_mst (
  tabl_uuid       text primary key
, oid             oid
, datid           oid     -- fk to database
, schemaname      text
, tableowner      text
, relkind         text
);

create table ybx_tblt_mst ( 
  tblt_uuid       text primary key
, tabl_uuid       text
, tsrv_uuid       text
, role            text  -- leader or follower
, state           text  -- tombstone or other
, constraint ybx_tblt_mst_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid ) 
) ; 
  
create table ybx_ashy_log (
    id                    bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tsrv_uuid               text not null,
  host                  text NULL,
  sample_time           timestamptz  NULL,
  root_request_id       uuid NULL,
  rpc_request_id        bigint default 0,
  wait_event_component  text NULL,
  wait_event_class      text NULL,
  wait_event            text NULL,
  top_level_node_id     uuid NULL,
  query_id              bigint NULL,
  ysql_session_id       int8 NULL, -- no longer needed ?
  pid                   int8 NULL,
  client_node_ip        text NULL,
  client_addr           text, 
  client_port           integer, 
  wait_event_aux        text NULL,
  tblt_uuid             text , 
  sample_weight         real NULL,
  wait_event_type       text NULL,
    ysql_dbid              oid NULL
, constraint ybx_ashy_log_tblt_fk foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid ) 
, constraint ybx_ashy_log_qury_fk foreign key ( query_id ) references ybx_qury_mst ( queryid ) 
, constraint ybx_ashy_log_tsrv_fk foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_ashy_log_sess_fk foreign key ( client_addr, client_port ) references ybx_sess_mst ( client_addr,client_port ) 
) ;



