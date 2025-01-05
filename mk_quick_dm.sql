 
-- qd: mk_qdm2.sql quick diagrm wth : tserver, session, qury, table, tablet and ash
-- usage :  overview, thinking proe
-- actual model will differ

drop table ybx_ashy_log ; 

drop table ybx_tblt_rep ;
drop table ybx_tata_lnk ;
drop table ybx_tblt_mst ; 

drop table ybx_tabl_mst ; 

drop table ybx_datb_log ; 
drop table ybx_datb_mst ; 

drop table ybx_qury_log ; 
drop table ybx_qury_pln ; 
drop table ybx_qury_mst ; 

drop table ybx_sess_log ; 
drop table ybx_sess_mst ; 

drop table ybx_tsrv_log ; 
drop table ybx_tsrv_mst ; 

drop table ybx_mast_log ; 
drop table ybx_mast_mst ; 

drop table ybx_host_log ; 
drop table ybx_host_mst ; 

drop table ybx_univ_log ; 
drop table ybx_univ_mst ; 

\echo .
\echo drops done
\echo .

-- universe.., the _log is more important.
-- drop table ybx_univ_mst
create table ybx_univ_mst (
  univ_uuid   text        not null  primary key
, log_dt      timestamp             default now ()
, host_found  text        not null  default ybx_get_host ()
) ; 

-- universe data, logged regularly by do_snap.sh
-- drop table ybx_univ_log ;
 create table ybx_univ_log (
  snap_id     bigint  not null              -- fk to snapshot
, univ_uuid   text    not null
, log_dt      timestamp default now ()      -- can also come from snapshot
, log_host    text default ybx_get_host ()  -- can also come from snapshot
, clst_uuid   text
, version     int
, info        text -- just grab the json, can always filter later
, constraint ybx_univ_log_pk primary key ( snap_id, univ_uuid )
, constraint ybx_univ_log_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id )
, constraint ybx_univ_log_fk_univ foreign key ( univ_id ) references ybx_univ_mst ( id )
--, constraint to univ_mst..
) ;






create table ybx_tsrv_mst (
  tsrv_uuid   uuid primary key
, host        text
) ;  

create table ybx_sess_mst (
  id                bigint  generated always as identity  primary key
, tsrv_uuid         uuid not null 
, pid               int
, backend_start     timestamp with time zone default now() -- try to catch from act or from lowest ash.sample_date
, host              text   -- for the record, prefer readable host instead of ts-uuid
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
, found_at_tsrv uuid          -- consider FK, but no real need..
, found_at_host text          -- just for curiousity sake
, query       text
) ;

create table ybx_tabl_mst (
  tabl_uuid       uuid primary key
, oid             oid
, datid           oid     -- fk to database
, schemaname      text
, tableowner      text
, relkind         text
);

create table ybx_tblt_mst ( 
  tblt_uuid       uuid primary key
, tabl_uuid       uuid
, tsrv_uuid       uuid  -- e.g. host where this tablet is local, found
, host            text  -- just or info
, role            text  -- leader or follower
, state           text  -- tombstone or other
, constraint ybx_tblt_mst_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
-- only if in same db , constraint ybx_tblt_mst_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid ) 
) ; 
  
create table ybx_ashy_log (
    id                    bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tsrv_uuid               uuid not null,
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
  tblt_uuid             uuid ,      -- determine from wait_event_aux
  sample_weight         real NULL,
  wait_event_type       text NULL,
    ysql_dbid              oid NULL
, constraint ybx_ashy_log_tblt_fk foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid ) 
, constraint ybx_ashy_log_qury_fk foreign key ( query_id ) references ybx_qury_mst ( queryid ) 
, constraint ybx_ashy_log_tsrv_fk foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_ashy_log_sess_fk foreign key ( client_addr, client_port ) references ybx_sess_mst ( client_addr,client_port ) 
) ;



