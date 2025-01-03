/* 
  file: yblog.sql

  usage: deploy this sql to create all logging tables and functions.

*/

/* 
drop stmts in case needed

the order of drop is important..

drop table ybx_kvlog ; 
drop table ybx_intf ; 

drop table ybx_tsrv_log ;
drop table ybx_tsrv_mst ;

drop table ybx_mast_log ;
drop table ybx_mast_mst ;

drop table ybx_host_log ;
drop table ybx_host_mst ;

drop table ybx_univ_log ;
drop table ybx_univ_mst ; 

drop function ybx_get_host() ; 

*/

    
-- need function to get hostname, faster if SQL function ?
-- define early bcse used as default for columns
 
CREATE OR REPLACE FUNCTION ybx_get_host()
RETURNS TEXT AS $$
    SELECT setting 
    FROM pg_settings
    WHERE name = 'listen_addresses';
$$ LANGUAGE sql;
 

-- helper table to interface key-value pairs
-- drop table ybx_kvlog ;
create table ybx_kvlog (
  host    text not null default ybx_get_host()
, key     text not null
, value   text
, constraint ybx_kvlog_pk primary key ( host, key )
);

-- helper table for interfaces
-- catch data from programs, notably from yb-admin with | as sep
-- to cut out items:  split_part ( slurp, '|', 1 ) 
-- see also: unames.sql
-- drop table ybx_intfc ;
create table ybx_intf (
  id      bigint          generated always as identity primary key
, log_dt  timestamp       default now ()
, host    text            default ybx_get_host ()
, slurp   text
) ;


-- the main snapshot table. parent-FK to some of the logs
-- consider : do we need a mst ? 
-- consider : phase out.. snap_id of limited use bcse logging on many servers.
create table ybx_snap_log (
  id          bigint      generated always as identity primary key
, log_dt      timestamp   default now ()
, host        text        -- generated on which host
, duration_ms bigint      -- measure time it took to log
) ;

-- wanted to make it look better but cannot override cache flag ??
alter sequence ybx_snap_log_id_seq cache 1 ;

-- universe.., the _log is more important.
-- drop table ybx_univ_mst
create table ybx_univ_mst (
  univ_uuid   text        not null  primary key
, log_dt      timestamp             default now ()      
, log_host    text        not null  default ybx_get_host () 
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
) ;


-- the host, equivalent of hostname, $HOSTNAME, "linux-server" or "machine", or "container".
-- drop table ybx_host_mst ;
create table ybx_host_mst (
  host              text        not null  primary key
, log_dt            timestamp             default now()
, log_host          text        not null  default ybx_get_host() 
, comment_txt       text        -- any comments, for ex how this host was "detected"
);

-- drop table ybx_host_log ;
create table ybx_host_log (
  id                bigint generated always as identity primary key
, host              text        not null
, log_dt            timestamp   default now()
, nr_processes      int           -- possibly ps -ef | wc -l
, master_mem        bigint        -- from 7000/memz?raw
, tserver_mem       bigint        -- from 9000/memz?raw
, disk_usage_mb     bigint        -- from du -sm /root/var
, nr_local_tablets  bigint        -- possibly tsever-property
, top_info          text          -- 2nd line of top -n2
) ;


-- drop table ybx_mast_mst ;
 create table ybx_mast_mst (
  snap_id     bigint
, mast_uuid   uuid
, host        text
, log_dt      timestamp with time zone default now() 
, constraint ybx_mast_mst_pk primary key ( mast_uuid )
, constraint ybx_mast_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id )
) ;

-- drop table ybx_mast_log ;
create table ybx_mast_log (
  snap_id     bigint  not null              -- fk to snapshot
, mast_uuid   uuid  
, host        text
, log_dt      timestamp default now()
, port        int
, role        text
, state       text
, bcasthp     text
, constraint ybx_mast_log_pk primary key ( snap_id, mast_uuid )
, constraint ybx_mast_log_fk_mast_fk foreign key ( mast_uuid ) references ybx_mast_mst ( mast_uuid )
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , constraint .. fk_host.
) ;


-- tsever
-- drop table ybx_tsrv_mst ;
create table ybx_tsrv_mst (
  tsrv_uuid   uuid      primary key
, snap_id     bigint    not null 
, host        text
, constraint ybx_tsrv_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id )
-- , fk to host? 
) ;
-- serves as FK to several, notably tsrv_log, sess_mst, host, root_req, and ash?


-- drop table ybx_tsrv_log ;
create table ybx_tsrv_log (
  snap_id     bigint    not null 
, tsrv_uuid   uuid      not null
, host        text
, log_dt      timestamp default now()
, port        int
, hb_delay_s  int
, status      text
, rd_psec     real
, wr_psec     real
, uptime      bigint
-- add server_metrics
, constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid )
, constraint ybx_tsrv_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
, constraint ybx_tsrv_log_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , constraint yb_tsrv_log_fk_host foreign key ( host      ) references ybx_host_mst ( host ) 
) ;
-- note: add tserver_metrics(), to this record
-- there are no evident futher dependetns, hence no id neede as key?


