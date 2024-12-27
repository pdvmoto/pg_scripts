-- 
-- mk_osdata.sql: tables to collect os-data, univers, masters, tservers.
-- 
-- other files : unames.sh, unames.sql, do_snap.sh : collect data using uname and sql
-- 
-- get os data from program or file into tbl, then parse..
-- we start by collecting "sample data".
-- the abstract of "parent tables" can wait: Host, Cluster, Universe, Master, TSever..
-- 
-- todo datamodel:
--  - nr_postgres_procs : separate count for postgres procs ? : TBD
--  - universe and cluster ? collect the json string into ybx_unvr_log : done
--  - parent tables for node, mster, tserver, with static data (names, OS, UUID), no log-time: part done
--  - introduce "snapshot_id": point-in-time where multiple data (node, master, tserver) is colletcted: done
--  - introduce master-records: host (name, ip, os, processors..) univese, cluster, also : table.. ?
--  - loging for master and tserver entities separate tables ? scrape from yb-admin and yb-functions() : done
--
--  - tables + indexes: could be part of snapshot but only for "global" info. so no.
--    Better collect info on each host/node/tsrvr. And generate the mst info as needed
--      - ybx_tabl_mst
--      - ybx_tabl_log (from ybx_tblinfo, low freq)
--        - ybx_tabl_log_stats ( per host, per log_dt, e.g. per ash-loop?, highter freq )
--      - ybx_indx_mst
--      - ybx_indx_log ( per snap )
--        - ybx_tabl_log_stats ( per host )
--    note: bcse tables and indexes can be discovered during host-log, 
--      they can not be linked to (global) snap_id, or they need a snap-sequene local to host
--
--  - sessions:
--      - tsrv_uuid + pid + start: key to ash-data
--      - client_addr + port : key to pg_stat_activity
--
--  - root_request:
--      rr_uuid: key.. descendent of session (top -level), or descendent of 000
--
--  - queries: 
--      - ybx_quer_mst : id + text, keep once.. 
--      - ybx_quer_log : id, per host, per log_dt, cumulative pg_stat_statements
--      - ybx_quer_rtrq : id per root_req, link of query to session via root_req
--
--  - rr_qry, link to root_req + 
--
--  - tablets: alwys per host, bse coming from yb_local_tablets.
--      - ybx_tblt_mst : tblt_uuid + tsrv_uuid, table_id ? role..
--        Can a tablet occur multiple times on a tsrv, when moving around.. yes 
--
-- todo process
--  - determine interval, 1 min? 3 min ? 
--  - UUID or text ?? text is easier to like%, uuid more efficiet, more correct?
-- 
-- other files:
--  - unames.sh + SQL: must run on every host 
--  - do_snap.sh (could be an SQL file...): should only run on 1 host, low freq
-- 

/*

-- helper tables
drop table ybx_kvlog ;
drop table ybx_intf ;

-- real tables, in correct order

drop table ybx_host_log ;
drop table ybx_host_mst ;

drop table ybx_mast_log ;
drop table ybx_mast_mst ;

drop table ybx_tsrv_log ;
drop table ybx_tsrv_mst ;

drop table ybx_univ_log ; 
drop table ybx_univ_mst ; 

drop table ybx_snap_log ; 

*/

-- drop table ybx_kvlog ;
create table ybx_kvlog (
  host    text not null default ybx_get_host()
, key     text not null
, value   text
, constraint ybx_kvlog_pk primary key ( host, key ) 
);


-- catch data from programs, notably from yb-admin with | as sep 
-- use split_part to cut out items..
-- drop table ybx_intfc ; 
create table ybx_intf (
  id      bigint          generated always as identity primary key
, log_dt  timestamp       default now () 
, host    text            default ybx_get_host ()
, slurp   text
) ;

-- the main snapshot table. parent-FK to some of the logs
create table ybx_snap_log (
  id          bigint      generated always as identity primary key
, log_dt      timestamp   default now () 
, host        text        -- generated on which host
, duration_ms bigint      -- measure time it took to log
) ; 

-- wanted to make it look better.
-- but cannot override cache flag ?? 
alter sequence ybx_snap_log_id_seq cache 1 ;

-- universe data
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

-- add: master + tserver to link universe and hosts to mast + sever 


-- poll data from host., poll per host, hence no snap_id

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

-- master_logging

-- drop table ybx_mast_mst ; 
create table ybx_mast_mst ( 
  snap_id     bigint
, host        text
, mast_uuid   text 
, constraint ybx_mast_mst_pk primary key ( host, mast_uuid )
, constraint ybx_mast_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ; 

-- drop table ybx_mast_log ; 
create table ybx_mast_log (
  snap_id     bigint  not null              -- fk to snapshot 
, mast_uuid   text 
, host        text
, log_dt      timestamp default now()
, port        int
, role        text
, state       text
, bcasthp     text
, constraint ybx_mast_log_pk primary key ( snap_id, mast_uuid ) 
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ;

-- drop table ybx_tsrv_mst ;
create table ybx_tsrv_mst ( 
  snap_id     bigint
, host        text
, tsrv_uuid   text 
, constraint ybx_tsrv_mst_pk primary key ( host, tsrv_uuid )
, constraint ybx_tsrv_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ; 

-- drop table ybx_tsrv_log ; 
create table ybx_tsrv_log (
  snap_id     bigint not null -- fk
, tsrv_uuid   text
, host        text
, log_dt      timestamp default now()
, port        int
, hb_delay_s  int
, status      text
, rd_psec     real
, wr_psec     real
, uptime      bigint
, constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid ) 
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ;



