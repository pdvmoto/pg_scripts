/* 
  file: mk_yblog.sql, deploy the logging system for ash++

  usage: deploy this sql to create all logging tables and functions.

  1. this file and subfiles, to 
    1a: _d to drop tables + fuctions (slow)
    1b: create tables (slow... and catalog-problems?)
    1b: _f create functions (faster to create-replace)
  2. do_ashloop + st_ashloop.sh
  3. uname.sql + sh (can include in ashloop?)
  4. do_snap.sh on 1 node
  5. cron, if still needed


todo: 
 - define views to clarify (join) data, for ex: tblt, session: join to show host
 - in do_snap: also collect missing mast_mst and tsrv_mst : done..
   manual workaround 
    insert into ybx_tsrv_mst  ( snap_id, host, tsrv_uuid )
    select snap_id, host, tsrv_uuid from ybx_tsrv_log 
    where snap_id = 1; -- any single valid snap_id..
 - qury_log, add logs records per run from pg_stat_stmnt
 - uncomment FKs:  but need ensure parent-records present...
 - replace host by tsrv_uuid in queries for tsrv, mast, sess, where host=..
 - get_ashy : stmnt and activity can move to qury + sess ? 
 - tblt_mst : is per  tablet, so no link to node/tsrv.. ? 
    - tblt_rep : replica per node.. , should hve role (lead/follow) and state (tombst)
    - tablet repl can have gone-dt per node.. tablet_mst: gone_dt only when tble gone.

in case we need:
with s as ( select max ( id ) as snap_id from ybx_snap_log )
insert into ybx_tsrv_mst ( snap_id, host, tsrv_uuid ) 
select snap_id, host, tsrv_uuid 
from ybx_tsrv_log s
where snap_id = s.snap_id ;
*/

/* 
drop stmts in case needed, separate file

the order of drop is important..
-- - */

-- drop table ybx_kvlog ; 
-- drop table ybx_intf ; 


\i mk_yblog_d.sql

 */

-- -- -- -- HELPER FUNCTIONS stay with tables.. -- -- -- --
    
-- need function to get hostname, faster if SQL function ?
-- define early bcse used as default for columns
-- note: also need ybx_get_tsuuid 
CREATE OR REPLACE FUNCTION ybx_get_host()
RETURNS TEXT AS $$
    SELECT setting 
    FROM pg_settings
    WHERE name = 'listen_addresses';
$$ LANGUAGE sql;
 
-- tsrv_uuid...
-- note : wont work for blacklisted node.. need ybx_tsrv_mst for that
CREATE OR REPLACE FUNCTION ybx_get_tsrv( p_host text )
RETURNS uuid AS $$
    SELECT uuid::uuid
    FROM yb_servers () 
    WHERE host = p_host;
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

/* generic logging..
-- drop table ybx_log ;  
*/
-- drop table ybx_log; 
 create table ybx_log (
    id          bigint        generated always as identity
  , logged_dt   timestamptz   not null
  , host        text
  , component   text
  , ela_ms      double precision
  , info_txt   text
  , constraint ybx_log_pk primary key (logged_dt asc, id  asc)
  ) ;


\! echo .
\! echo '-- -- -- -- SNAP nd UNIV -- -- -- --'
\! echo .

-- the main snapshot table. parent-FK to some of the logs
-- consider : phase out.. snap_id of limited use bcse logging on many servers.
-- consider : do we need a mst ? => Yes, to detect "missing mast/tsrv from snpshot" 
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
-- , constraint ybx_univ_log_fk_univ foreign key ( univ_uuid ) references ybx_univ_mst ( univ_uuid )
-- log_host is FK to host, but not very relevant (yet) ?
) ;

\! echo . 
\! echo '-- -- -- -- HOST -- -- -- -- '
\! echo . 

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
--, constraint to mst, when host_mst is filled
) ;


\! echo .
\! echo '-- -- -- -- MASTER and T-SERVER and LOGs -- -- -- -- '
\! echo .

-- drop table ybx_mast_mst ;
-- note: port belongs to master..but stored on both mst + log
-- note: log_dt could be from snap_id
 create table ybx_mast_mst (
  snap_id     bigint
, mast_uuid   uuid 
, host        text
, port        int
, log_dt      timestamp with time zone default now() 
, log_host    text      default ybx_get_host () -- informational, Which host did logging
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
-- , constraint ybx_mast_log_fk_mast_fk foreign key ( mast_uuid ) references ybx_mast_mst ( mast_uuid )
   , constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , constraint .. fk_host.
) ;


-- tsever
-- drop table ybx_tsrv_mst ;
create table ybx_tsrv_mst (
  tsrv_uuid   uuid
, snap_id     bigint    not null 
, host        text
, port        int
, constraint ybx_tsrv_mst_pk      primary key ( tsrv_uuid )
, constraint ybx_tsrv_mst_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , fk to host? 
) ;
-- serves as FK to several, notably tsrv_log, sess_mst, host, root_req, and ash?

-- on tsrv: we scrape from yb-admin, 
-- plus all fields from yb_tservers_metrics()
-- there may be overlap, and a lot of the data seems to never change ? 
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
-- add fields for server_metrics
, mem_free_mb            bigint
, mem_total_mb           bigint
, mem_aval_mb            bigint
, ts_root_mem_limit_mb   bigint
, ts_root_mem_slimit_mb  bigint
, ts_root_mem_cons_mb    bigint
, cpu_user    real
, cpu_syst    real
, ts_status   text
, ts_error    text
   , constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid )
-- , constraint ybx_tsrv_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
   , constraint ybx_tsrv_log_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , constraint ybx_tsrv_log_fk_host foreign key ( host      ) references ybx_host_mst ( host ) 
) ;
-- note: add tserver_metrics(), to this record
-- there are no evident futher dependetns, hence no id neede as key?


\! echo .
\! echo '-- -- -- -- DATABASE and LOG -- -- -- '
\! echo .

-- drop table ybx_datb_mst ; 
 create table ybx_datb_mst (
  datid     oid not null primary key
, datname   text
, log_host  text                      default ybx_get_host()   -- logged at host
, log_dt    timestamp with time zone  default now()  
);
-- key is oid, snap_id just host+dt where it was found

-- datab_log: id+host+log_dt are generated, 
-- other fields from pg_stat_database
-- doesnt really need ID ?? datid, tsrv/host, log_dt are real key? 
-- note: no snap_id, bcse log is per host, and snap_id is global
-- drop table ybx_datb_log ; 
 create table ybx_datb_log (
  id          bigint        generated always as identity primary key
, datid       oid           -- fk to mst
, tsrv_uuid   uuid          default ybx_get_tsrv( ybx_get_host () ) 
, log_host    text          default ybx_get_host() 
, log_dt      timestamp with time zone    default now ()
, numbackends   integer                  
, xact_commit   bigint                  
, xact_rollback bigint                  
, blks_read     bigint                
, blks_hit      bigint               
, tup_returned  bigint              
, tup_fetched   bigint             
, tup_inserted  bigint            
, tup_updated   bigint           
, tup_deleted   bigint          
, conflicts     bigint         
, temp_files    bigint        
, temp_bytes    bigint       
, deadlocks     bigint      
, checksum_failures       bigint 
, checksum_last_failure   timestamp with time zone 
, blk_read_time           double precision        
, blk_write_time          double precision       
, session_time            double precision      
, active_time             double precision     
, idle_in_transaction_time  double precision  
, sessions                bigint             
, sessions_abandoned      bigint            
, sessions_fatal          bigint           
, sessions_killed         bigint          
, stats_reset             timestamp with time zone 
-- , constraint ybx_datb_log_fk_datb foreign key ( datid     ) references ybx_datb_mst ( datid    )
-- , constraint ybx_datb_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
-- , constraint ybx_datb_log_uk unique key ( datid, tsrv_uuid, log_dt ) -- purely info..
) ;

-- alter table ybx_datb_log 
--   add constraint ybx_datb_log_fk_mst foreign key ( datid ) 
--                          references ybx_datb_mst ( datid ) ; 

-- with skip-scan, only one of the indexes would suffice ? 
-- and why does index on empty table take so long? 
create unique index ybx_datb_log_dh on ybx_datb_log ( datid,  log_host, log_dt ); 
create        index ybx_datb_log_hd on ybx_datb_log ( log_host,  datid, log_dt ); 


\! echo .
\! echo '-- -- -- -- SESSION MASTER and LOGs -- -- -- -- '
\! echo .

-- drop table ybx_sess_mst ;
create table ybx_sess_mst (
  id                bigint  generated always as identity  primary key
, tsrv_uuid         uuid   
, host              text   -- prefer host instead of ts-uuid
, pid               int
, backend_start     timestamp with time zone default now() -- try to catch from act or from lowest ash.sample_date
, gone_dt           timestamp with time zone -- null, until gone.
, client_addr       text   -- or inet ? 
, client_port       int
, client_hostname   text
, datid             oid 
, usesysid          oid
, leader_pid        int
, app_name          text    -- from pg_stat_activity
, backend_type      text
-- , constraint ybx_sess_mst_uk_pid unique ( tsrv_uuid, pid, backend_start )
-- , constraint ybx_sess_mst_uk_clt unique ( client_addr, client_port, backend_start )
-- , constraint ybx_sess_mst_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
-- constraint datid FK to datb_mst
-- Q: is usesysid same as user-id ?
-- if FK to ash or root_req, need to insert based on ash...
-- polling: how frequent... sessions can live <1sec.
-- some provision to catch the ones not found via pg_stat_activity.. merge some from  ash ?
) ;

-- session log info comes from pg_stat_activity previous: ybx_pgs_acct
-- (and others  ? )
-- pk can be sess_id + log_dt ? we dont expect (many) dependents of sess-log,
-- some/many data-items can go to sess_mst
-- and ts_uuid not needed, bcse session (sess_mst) is already linked to tsrv_uuid
-- drop table ybx_sess_log ;
 create table ybx_sess_log (
  sess_id           bigint
, tsrv_uuid         uuid not null   -- 
, log_dt            timestamp with time zone default now()
, host            text,             -- 
  datid           oid         NULL, -- 
  datname         name        NULL, -- 
  pid             int4        NULL, -- can go, but informative 
  leader_pid      int4        NULL, -- 
  usesysid        oid         NULL, -- 
  usename         name        NULL, -- 
  application_name text       NULL, -- 
  client_addr     inet        NULL, -- 
  client_hostname text        NULL, -- 
  client_port     int4        NULL, -- 
  backend_start   timestamptz NULL, -- ^ can go
  xact_start      timestamptz NULL,
  query_start     timestamptz NULL,
  state_change    timestamptz NULL,
  wait_event_type text NULL,
  wait_event      text NULL,
  state           text NULL,
  backend_xid     xid NULL,
  backend_xmin    xid NULL,
  query_id        bigint NULL,
  query           text NULL,
  backend_type    text NULL,
  catalog_version         int8 NULL,
  allocated_mem_bytes     int8 NULL,
  rss_mem_bytes   int8 NULL,
  yb_backend_xid uuid NULL
, constraint ybx_sess_log_pk      primary key ( sess_id, log_dt )
, constraint ybx_sess_log_fk_sess foreign key ( sess_id ) references ybx_sess_mst ( id )
-- constr: qry_id, yb_backend_xid ?
-- datid: already in mst
);


\! echo .
\! echo '-- -- -- -- QUERY and LOG -- -- -- -- '
\! echo .

-- Queries... mst is just lookup, bcse Ash only has query-id, not usr, dbid...

-- drop table ybx_qury_mst ;
 create table ybx_qury_mst (  
  queryid     bigint not null primary key
, log_dt      timestamp with time zone  default now()  
, log_tsrv    uuid          -- default get_tsrv() consider FK, but no real need..
, log_host    text          -- default ybx_get_host() -- just for curiousity sake
, query       text
) ;     
-- serves as fk to many.
-- note that identical syntax can appear for diff users and in diff dbid
-- hence dbid and userid not in qury_mst, but may be needed in _log or others

-- add defaults for 0-6, find desc
insert into ybx_qury_mst (queryid, log_host, query ) values
  ( 0, ybx_get_host(), '0 zero')
, ( 1, ybx_get_host(), '1 one')
, ( 2, ybx_get_host(), '2 flush')
, ( 3, ybx_get_host(), '3 compaction')
, ( 4, ybx_get_host(), '4 four')
, ( 5, ybx_get_host(), '5 five')
, ( 6, ybx_get_host(), '6 six') ;


-- qury_log: is for the moment yb_pgs_stmt
-- data from pg_stat_statement
-- added ID bcse difficult to find working UK/PK from pg_stat_stmts

-- drop table ybx_qury_log ;
 create table ybx_qury_log ( 
  id          bigint    generated always as identity primary key
, tsrv_uuid   uuid      not null default ybx_get_tsrv( ybx_get_host () )
, queryid     bigint    not null
, log_dt      timestamp with time zone not null default clock_timestamp() -- will this be unique?
, userid                  oid              
, dbid                    oid             
, toplevel                boolean        
, plans                   bigint        
, total_plan_time         double precision 
, min_plan_time           double precision
, max_plan_time           double precision 
, mean_plan_time          double precision
, stddev_plan_time        double precision 
, calls                   bigint           
, total_exec_time         double precision
, min_exec_time           double precision 
, max_exec_time           double precision
, mean_exec_time          double precision 
, stddev_exec_time        double precision
, rows                    bigint         
, shared_blks_hit         bigint        
, shared_blks_read        bigint       
, shared_blks_dirtied     bigint      
, shared_blks_written     bigint     
, local_blks_hit          bigint    
, local_blks_read         bigint   
, local_blks_dirtied      bigint  
, local_blks_written      bigint 
, temp_blks_read          bigint           
, temp_blks_written       bigint          
, blk_read_time           double precision
, blk_write_time          double precision 
, temp_blk_read_time      double precision 
, temp_blk_write_time     double precision
, wal_records             bigint          
, wal_fpi                 bigint         
, wal_bytes               numeric       
, jit_functions           bigint       
, jit_generation_time     double precision 
, jit_inlining_count      bigint          
, jit_inlining_time       double precision 
, jit_optimization_count  bigint          
, jit_optimization_time   double precision 
, jit_emission_count      bigint          
, jit_emission_time       double precision 
, yb_latency_histogram    jsonb            
-- , constraint ybx_qury_log_pk primary key ( tsrv_uuid, queryid, log_dt, id )
-- , constraint ybx_qury_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
-- , constraint ybx_qury_log_fk_qury foreign key ( queryid   ) references ybx_qury_mst ( queryid ) 
) ; 
-- qury_log is copy of pg_stat_statements
-- fks disables for the moment.. needs collecting data in the right order!

-- drop table ybx_qury_pln ;
 create table ybx_qury_pln (
  id          bigint generated always as identity
, queryid     bigint    not null
, tsrv_uuid   uuid      not null                default ybx_get_tsrv ( ybx_get_host() ) 
, log_dt      timestamp with time zone not null default now()
, plan_info   text
--, constraint ybx_qury_pln_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
, constraint ybx_qury_pln_fk_qury foreign key ( queryid   ) references ybx_qury_mst ( queryid )
) ;


\! echo .
\! echo '-- -- -- -- TABLE and TABLET and LOGs -- -- -- -- '
\! echo .

-- assume table_ID (uuid) is unique inside a cluster or universe ?
-- drop table ybx_tabl_mst ;
 create table ybx_tabl_mst (
  tabl_uuid       uuid primary key
, oid             oid
, datid           oid     -- fk to database
, schemaname      text
, tableowner      text
, relkind         text
, constraint ybx_tabl_mst_fk_datb foreign key ( datid ) references ybx_datb_mst ( datid )
);

-- for future use...
-- note that the log is local to a tsrv, and has log_dt as key-field
-- drop table ybx_tabl_log ;
 create table ybx_tabl_log (
  tabl_uuid         uuid
, tsrv_uuid         uuid    default ybx_get_tsrv ( ybx_get_host() )
, log_dt            timestamp with time zone default now()
, table_info        text -- log/save time-dependent info from pg_stats or pg_tables
, constraint ybx_tabl_log_pk primary key ( tabl_uuid, tsrv_uuid, log_dt )
, constraint ybx_tabl_log_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid )
-- , constraint ybx_tabl_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
) ;


-- tablet master is rather abstract, but needed to link to tata and tables/indexs/etc
-- the actual 3 or 5 replicas will appear in the _log
-- drop table ybx_tblt_mst ;
 create table ybx_tblt_mst (
  tblt_uuid       uuid      not null  primary key
, tabl_uuid       uuid      NULL      -- does NOT apply to COLOCATED objects
, log_tsrv        uuid      null      default ybx_get_tsrv ( ybx_get_host() )  -- information only, e.g. is where this tablet is detected
, log_dt          timestamp with time zone  not null default  now ()
, gone_dt         timestamp with time zone      null  -- null signals tablet still exists, in use
, log_host        text      null      default ybx_get_host() -- just or info
, table_type            text NULL,
  namespace_name        text NULL,
  ysql_schema_name      text NULL,
  table_name            text NULL,
  partition_key_start   bytea NULL,
  partition_key_end     bytea NULL
-- , constraint ybx_tblt_mst_fk_tsrv foreign key ( log_tsrv ) references ybx_tsrv_mst ( tsrv_uuid )
-- , constraint possible FKs to tsrv, datb(oid, datid), user (oid), table (oid)
-- link or constraint to datb oid or datid? No bcse tablet not known to postgres
) ;
  
-- tablet replica: one of the copies of a tablet..
-- this is a physical item (file) kept on a tsrv , and can move/change over time..
-- smller table just to keep track of tablet replicas and movements
-- note that the log_dt could be min-sample-time from ash as well
-- drop table ybx_tblt_rep ;
 create table ybx_tblt_rep (
  tblt_uuid         uuid not null
, tsrv_uuid         uuid not null                     default ybx_get_tsrv ( ybx_get_host() ) 
, log_dt            timestamp with time zone not null default now ()
, gone_dt           timestamp with time zone null        -- null signifies: still Active, in useoo
, role              text not null default '-undetected-'
, state             text not null default '-undetected-'
, constraint ybx_tblt_rep_pk primary key  ( tblt_uuid, tsrv_uuid, log_dt )  
-- tablet local to 1 tsrv, but can move in multiple times
-- , constraint ybx_tblt_rep_fk_tblt foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid )
-- , constraint ybx_tblt_rep_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
-- link or constraint to datb oid or datid? No, bcse tablet not know to postgres
) ;

-- in case of COLOCATED: table - tablet is an n:n..
-- link-table
-- drop table ybx_tata_lnk
 create table ybx_tata_lnk (
  tabl_uuid         uuid not null
, tblt_uuid         uuid not null
, log_dt            timestamp with time zone default now ()
, constraint ybx_tata_lnk_uk      primary key ( tabl_uuid, tblt_uuid ) 
, constraint ybx_tata_lnk_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid )
, constraint ybx_tata_lnk_fk_tblt foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid )
) ;

-- -- -- -- ASH -- -- -- --

-- note id is PK for the moment, but comby of tsrv + sample-time is expected unique..
-- drop table ybx_ashy_log ; 
 CREATE TABLE ybx_ashy_log (
  id                    bigint        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tsrv_uuid             uuid          not null    default ybx_get_tsrv ( ybx_get_host () ) ,   -- found at this tsrv..
  sample_time           timestamptz   not null    default now () ,
  host                  text          not null    default ybx_get_host(),
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
  client_addr           inet,
  client_port           integer,
  wait_event_aux        text NULL,
  sample_weight         real NULL,
  wait_event_type       text NULL,
  ysql_dbid              oid NULL
  --, constraint ybx_ashy_pk primary key ( id )
  --, constraint ybx_ashy_pk primary key ( host/tsrv_uuid , pid, sample_time )
) ;


-- drop table ybx_evlst ;  

-- \echo ybx_ash_evlst: eventlist, keep track of which eventw we know-of

-- later: connect to yb_wait_event_descr..
-- drop table ybx_evnt_mst ; 
 create table ybx_evnt_mst (
  id                      bigint generated always as identity primary key
, wait_event_component    text not null
, wait_event_type         text
, wait_event_class        text
, wait_event              text not null
, log_dt                  timestamptz   default now()
, log_tsrv                uuid          default ybx_get_tsrv ( ybx_get_host () )
, log_host                text          default ybx_get_host () 
, wait_event_notes        text
--, constraint ybx_evnt_lst_uk unique key ( wait_event_component asc, wait_event )
--, constraint : tsrv_uuid, host ? purely informative 
);


\echo .
\echo $0 : tables created. next is function (use separate file.. ) 
\echo .


-- use separate file to develop functions..faster
\i mk_yblog_f.sql

\q


-- now the functions, start with some simple ones,
-- then do the ASH and qury as the most complicated oneso
-- to start with ASH, we need to disable constrints, 
-- as parent-records may no be there


-- logging of universe: do_snap.sh/sql..
-- logging of host_mst, mast_m/l + tsrv_m/l: do_snap
-- logging of hosts: unames...

-- logging of databases: get_datb
-- logging session: get_sess() : both mst + log
-- logging queries: get_qury() : fow now just mst, 
--    qury_log will be similar to pg_stmt, and activity
-- logging of tablets : 
-- logging ash: get_ashy() : mainly ash, but stil does activity

/* ****

ybx_get_datb(): function to insert databases and logging

logs both datb_mst, if new db, and datb_log tables.

*/

CREATE OR REPLACE FUNCTION ybx_get_datb()
  RETURNS bigint    
  LANGUAGE plpgsql
AS $$
DECLARE
  nr_rec_processed BIGINT         := 0 ;
  n_datb_new    bigint            := 0 ; -- newly found from pg_stat_db
  n_datb_log    bigint            := 0 ; -- log- the numbes from pg_stat_db
  n_datb_upd    bigint            := 0 ; -- had to get data from pg_other view
  this_host     text              := ybx_get_host() ;  -- only get this once..
  retval        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp(); 
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  cmmnt_txt      text              := 'comment ' ;
BEGIN

  RAISE NOTICE 'ybx_get_datb() : starting..' ;

  insert into ybx_datb_mst (  datid,   datname ) 
  select                    d.datid, d.datname 
  from pg_catalog.pg_stat_database d
  where not exists  ( select 'x' 
                      from ybx_datb_mst m 
                      where d.datid = m.datid ) ; 

  GET DIAGNOSTICS n_datb_new := ROW_COUNT;
  retval := retval + n_datb_new ;

  RAISE NOTICE 'ybx_get_datb() nr new : % ', n_datb_new ;

  -- the log-data.. 
  insert into ybx_datb_log ( 
      datid         
    , numbackends  
    , xact_commit 
    , xact_rollback
    , blks_read   
    , blks_hit   
    , tup_returned 
    , tup_fetched 
    , tup_inserted 
    , tup_updated 
    , tup_deleted 
    , conflicts  
    , temp_files 
    , temp_bytes 
    , deadlocks 
    , checksum_failures 
    , checksum_last_failure 
    , blk_read_time        
    , blk_write_time      
    , session_time       
    , active_time       
    , idle_in_transaction_time 
    , sessions              
    , sessions_abandoned   
    , sessions_fatal      
    , sessions_killed    
    , stats_reset )  
  select 
      datid         
    , numbackends  
    , xact_commit 
    , xact_rollback
    , blks_read   
    , blks_hit   
    , tup_returned 
    , tup_fetched 
    , tup_inserted 
    , tup_updated 
    , tup_deleted 
    , conflicts  
    , temp_files 
    , temp_bytes 
    , deadlocks 
    , checksum_failures 
    , checksum_last_failure 
    , blk_read_time        
    , blk_write_time      
    , session_time       
    , active_time       
    , idle_in_transaction_time 
    , sessions              
    , sessions_abandoned   
    , sessions_fatal      
    , sessions_killed    
    , stats_reset 
  from pg_stat_database d ; 
  -- no where clause needed, just log
      
  GET DIAGNOSTICS n_datb_log := ROW_COUNT;
  retval := retval + n_datb_log ;

  RAISE NOTICE 'ybx_get_datb() nr logged : % ', n_datb_log ;


  duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;

  RAISE NOTICE 'ybx_get_datb() elapsed : % ms'     , duration_ms ;

  cmmnt_txt :=  'get_datb: from new: ' || n_datb_new
                    || ', from_log: '  || n_datb_log
                    || ', from upd: '  || n_datb_upd || '.';
  
  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_datb', duration_ms, cmmnt_txt ;
  
  -- end of fucntion..            
  return retval ;   
  
END; -- ybx_get_datb, to incrementally populate table
$$
; 

-- -- -- -- GET QUERIES -- -- -- --  

/* *****************************************************************

function : ybx_get_qury();

collect SQL from ash + pg_stat_stmnts + pg_stat_activity for current node
and update any empty qry text if possible, with pg_stat as source

todo: qury_log not done yet...!  ybx_pgs_stmt currently loggin stmnts

returns total nr of records

*/

CREATE OR REPLACE FUNCTION ybx_get_qury()
  RETURNS bigint
  LANGUAGE plpgsql
AS $$
DECLARE
  nr_rec_processed BIGINT         := 0 ;
  n_qrys_ash    bigint            := 0 ; -- from ash
  n_qrys_act    bigint            := 0 ; -- from pg_stat_act
  n_qrys_stmt   bigint            := 0 ; -- from pg_stat
  n_qrys_upd    bigint            := 0 ; -- had to get query-text from pg_stat
  n_stmt_log    bigint            := 0 ; -- if stmnt-stats get logged..
  this_host     text              := ybx_get_host() ;  -- only get this once..
  retval        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  cmmnt_txt      text              := 'comment ' ;
BEGIN

  RAISE NOTICE 'ybx_get_qury() : starting..' ;

  -- note tsrv + host can use dflts
  insert /*qury_1 from ash */ into ybx_qury_mst ( queryid, log_tsrv, log_host, log_dt )
    select a.query_id, ybx_get_tsrv ( this_host), this_host, min ( a.sample_time ) 
    from yb_active_session_history a            -- consider select from table after gathering data ?
    where a.sample_time > ( start_dt - make_interval ( secs=>900 ) )
      and not exists ( select 'x' from ybx_qury_mst m where m.queryid = a.query_id ) 
    group by a.query_id, this_host ; 

  GET DIAGNOSTICS n_qrys_ash := ROW_COUNT;
  retval := retval + n_qrys_ash ;

  RAISE NOTICE 'ybx_get_qury() from ash : % '     , n_qrys_ash ;

  insert /* qury_2 from act */ into ybx_qury_mst ( queryid, log_tsrv, log_host, log_dt, query )
    select a.query_id, ybx_get_tsrv ( this_host), this_host, min ( coalesce ( a.query_start, clock_timestamp() ) ), min ( a.query)
      from pg_stat_activity a
     where not exists ( select 'x' from ybx_qury_mst m where m.queryid = a.query_id ) 
       and a.query_id is not null
    group by a.query_id, this_host, query ;  -- note the min-query : bcse multiple texts can exist?

  GET DIAGNOSTICS n_qrys_act := ROW_COUNT;
  retval := retval + n_qrys_act ;

  RAISE NOTICE 'ybx_get_qury() from act : % '     , n_qrys_act ;

  -- consider a merge with 4.. 
  -- use dflt for log_dt
  insert /*qury_3 from stmt */ into ybx_qury_mst ( queryid, query )
    select s.queryid,  min ( s.query ) -- explain appears with same queryid 
      from pg_stat_statements s
     where not exists ( select 'x' from ybx_qury_mst m where m.queryid = s.queryid )  
    group by s.queryid ;  -- note the min-query : bcse multiple texts can exist?

  GET DIAGNOSTICS n_qrys_stmt := ROW_COUNT;
  retval := retval + n_qrys_stmt ;

  RAISE NOTICE 'ybx_get_qury() from stmt : % '     , n_qrys_stmt ;

  -- consider a merge.. 
  update /*qury_4_upd */ ybx_qury_mst m
    set query = ( select min ( query ) 
                  from pg_stat_statements s 
                  where m.queryid = s.queryid 
                    and length ( s.query) is not null )
  where coalesce (  ( trim ( m.query)), '' ) = ''  -- pg funny way to detect empty or null..  
  ; 

  GET DIAGNOSTICS n_qrys_upd := ROW_COUNT;
  retval := retval + n_qrys_upd ;

  RAISE NOTICE 'ybx_get_qury() from upd  : % '     , n_qrys_upd ;

  duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;

  RAISE NOTICE 'ybx_get_qury() elapsed : % ms'     , duration_ms ;

  cmmnt_txt := 'get_qury_mst from : ash: '  || n_qrys_ash 
                              || ', act: '  || n_qrys_act 
                              || ', stmt: ' || n_qrys_stmt 
                              || ', upd: '  || n_qrys_upd || '.';

  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_qury', duration_ms, cmmnt_txt ;

  -- -- -- now do the qury_LOG data... 

  -- end of fucntion..
  return retval ;

END; -- ybx_get_qury, to incrementally populate table
$$
;

-- -- -- -- GET SESS -- -- -- --

/* *****************************************************************

function : ybx_get_sess();

collect ash + pg_stat_stmnts + pg_stat_activity for current node
returns total nr of records

*/

CREATE OR REPLACE FUNCTION ybx_get_sess()
  RETURNS bigint
  LANGUAGE plpgsql
AS $$
DECLARE
  nr_rec_processed BIGINT         := 0 ;
  n_sess_act    bigint            := 0 ; -- from pg_stat_act
  n_sess_ash    bigint            := 0 ; -- from ash
  n_sess_upd    bigint            := 0 ; -- had to get data from pg_other view
  n_sess_log    bigint            := 0 ; -- nr of lines logged+updated.
  this_host     text              := ybx_get_host() ;  -- only get this once..
  this_tsrv     uuid              := ybx_get_tsrv( ybx_get_host() ) ;  -- only get this once..
  retval        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  cmmnt_txt      text              := 'comment ' ;
BEGIN

  RAISE NOTICE 'ybx_get_sess() : starting..' ;

  -- get from pg_stat_activity., the easiest one bcse usually not too many lines (less than ash)
  -- save log-data for a log-table with time-dependent data
  insert /* get_sess_1 */ into ybx_sess_mst 
        ( tsrv_uuid, host,     pid,         backend_start
       ,  client_addr,         client_port, client_hostname 
       , datid,               usesysid,     leader_pid, app_name, backend_type ) 
  select this_tsrv, this_host, pid, backend_start
       , host ( client_addr) ::text, client_port, client_hostname
       , datid,               usesysid,     leader_pid, application_name, backend_type
    from pg_stat_activity a 
    where not exists ( select 'X' from ybx_sess_mst m 
                        where this_host             = m.host   -- prefer uuid here...
                          and a.pid                 = m.pid
                          and a.backend_start       = m.backend_start 
                          and m.gone_dt         is null -- still open, e.g. session was not terminated 
                      ) ;

  GET DIAGNOSTICS n_sess_act := ROW_COUNT;
  retval := retval + n_sess_act ;

  RAISE NOTICE 'ybx_get_sess() from act : % '     , n_sess_act ;

  -- get from ash, many more lines...?
  -- but only catch those who are "local" e.g. top_level_node=000 or top_level_node = local tsrv
  -- and not exists in table yet..
  -- option: when detecting a new combi if cl_add+port: put tsrv+cl_add+port somewhere for later addition?
  -- but investigate via collected data in ash + activity first: do any sess get discoverd from ash-only ?
  insert /* get_sess_2 */ into ybx_sess_mst 
        ( tsrv_uuid, host,      pid,  backend_start
         , client_addr
         , client_port ) 
  select this_tsrv,  this_host, a.pid, min(a.sample_time)
         , split_part ( client_node_ip, ':', 1 ) as client_addr
         , split_part ( client_node_ip, ':', 2 )::int as client_port
    from yb_active_session_history a 
    where 1=0 -- disable for the moment
      and not exists ( select 'X' from ybx_sess_mst m 
                        where this_host         = m.host
                          and a.pid             = m.pid
                          and m.gone_dt is null -- e.g. session was not terminated 
                      ) 
     group by this_tsrv, this_host, a.pid, 5, 6 ;

     -- can not limit records by time, as this would lead to double-counts after 900sec 
     --  and a.sample_time >  ( now - make_interval ( secs=> 900  ) )  ;  -- limit nr records..

  GET DIAGNOSTICS n_sess_ash := ROW_COUNT;
  retval := retval + n_sess_ash ;

  RAISE NOTICE 'ybx_get_sess() from ash : % ', n_sess_ash ;

  -- now find the closed sessions..
  update /* get_sess_3_upd */ ybx_sess_mst m
  set gone_dt = now()
  where host=ybx_get_host ()
   and gone_dt is null 
  and not exists ( select 's' from pg_stat_activity  a 
                    where ybx_get_host() = m.host
                      and a.pid = m.pid
                      and a.backend_start = m.backend_start ) ; 

  GET DIAGNOSTICS n_sess_upd := ROW_COUNT;
  retval := retval + n_sess_upd ;

  RAISE NOTICE 'ybx_get_sess() nr gone : % ', n_sess_upd ;

  duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;

  -- for sess_log: just copy whatever is in pg_stat_activity, joint with sess_mst

  -- constants for tsrv+host, dont overuse functions to get tsrv + host: too slow
  -- with /* get_sess_3_act */ 
  --   h as ( select ybx_get_host () as host, now() as smpltm )
  insert /* get_sess_3_act */ into ybx_sess_log (
    sess_id
    tsrv_uuid,
    pid,
    host ,
    datid ,
    datname ,
    leader_pid , 
    usesysid ,
    usename ,
    application_name ,
    client_addr ,
    client_hostname ,
    client_port ,
    backend_start ,
    xact_start ,
    query_start ,
    state_change ,
    wait_event_type ,
    wait_event ,
    state ,
    backend_xid ,
    backend_xmin ,
    query_id ,
    query ,
    backend_type ,
    catalog_version ,
    allocated_mem_bytes ,
    rss_mem_bytes ,
    yb_backend_xid 
    )
  select 
    sm.sess_id, 
    this_tsrv, 
    pid, 
    sm.host, 
    datid ,
    datname ,
    leader_pid , 
    usesysid ,
    usename ,
    application_name ,
    client_addr ,
    client_hostname ,
    client_port ,
    backend_start ,
    xact_start ,
    query_start ,
    state_change ,
    wait_event_type ,
    wait_event ,
    state ,
    backend_xid ,
    backend_xmin ,
    query_id ,
    query ,
    backend_type ,
    catalog_version ,
    allocated_mem_bytes ,
    rss_mem_bytes ,
    yb_backend_xid
  from pg_stat_activity a
     , ybx_sess_mst     sm 
  where sm.tsrv_uuid      = this_tsrv
    and sm.pid            = a.pid
    and sm.backend_start  = p.backend_start;
  -- join pg_stat_act with mst to fetch sess_id, 
  -- assume datid etc are all functions of PID 

  GET DIAGNOSTICS n_sess_log := ROW_COUNT;
  retval := retval + n_sess_log ;
  RAISE NOTICE 'ybx_get_ashy() sess_log : % ' , n_sess_log ; 
    
  duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;

  RAISE NOTICE 'ybx_get_sess() elapsed : % ms'     , duration_ms ;

  cmmnt_txt := 'get_sess: ash: '     || n_sess_ash
                    || ', act: '     || n_sess_act 
                    || ', closed: '  || n_sess_upd 
                    || ', logged: '  || n_sess_log || '.';

  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_sess', duration_ms, cmmnt_txt ;
  -- end of fucntion..
  return retval ;   

END; -- ybx_get_sess, to incrementally populate table
$$
; 

/* **************** GET TABLETS ******************

function : ybx_get_tblts();

collect ybx_tblt with local tablets, local to current node
handles both mst (parent needed) and replica (local)

returns total nr of records inserted and updated

todo: how to spot tablet-replicas from nodes that have dissapeared... ? 

*/

CREATE OR REPLACE FUNCTION ybx_get_tblt()
  RETURNS bigint
  LANGUAGE plpgsql
AS $$
DECLARE
  nr_rec_processed bigint         := 0 ;
  n_mst_created     bigint            := 0 ;
  n_rep_created     bigint            := 0 ;
  n_mst_gone    bigint            := 0 ;
  n_rep_gone    bigint            := 0 ;
  n_gone        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  retval        bigint            := 0 ;
  cmmnt_txt     text              := ' ' ;
BEGIN

-- insert any new-found tablets
-- with /* get_tblt_1 */ 
--   h as ( select ybx_get_host () as host )

insert /* get_tblt_1 */ into ybx_tblt_mst (
  tblt_uuid,
  tabl_uuid ,
  table_type ,
  namespace_name ,
  ysql_schema_name ,
  table_name ,
  partition_key_start ,
  partition_key_end
)
select
  tablet_id::uuid,
  table_id::uuid tabl_uuid ,
  table_type ,
  namespace_name ,
  ysql_schema_name ,
  table_name ,
  partition_key_start ,
  partition_key_end
from yb_local_tablets t
where not exists (
  select 'x' from ybx_tblt_mst m
  where 1=1 
  and   t.tablet_id::uuid   =  m.tblt_uuid
  and   m.gone_dt           is null  --  catch moving + returning tablets 
  ) ;

GET DIAGNOSTICS n_mst_created := ROW_COUNT;
retval := retval + n_mst_created ;

RAISE NOTICE 'ybx_get_tblt() mst_created : % tblts' , n_mst_created ; 

-- insert Replicas..this node only
insert /* get_tblt_2 */ into ybx_tblt_rep (
  tblt_uuid    -- tsrv, host, log_dt, role, state, .. all defaut to correct values, check
)
select
  l.tablet_id::uuid
from yb_local_tablets l
where not exists (
  select 'x' from ybx_tblt_rep r
  where r.tsrv_uuid       = ybx_get_tsrv( ybx_get_host() )   
  and   r.tblt_uuid       = l.tablet_id::uuid 
  and   r.gone_dt         is null  --  catch moving + returning tablets 
  ) ;

GET DIAGNOSTICS    n_rep_created := ROW_COUNT;
retval := retval + n_rep_created ;
RAISE NOTICE 'ybx_get_tblt() rep_created : % tblts'  , n_rep_created ; 

-- detect gone-replicas
update /* get_tblt_3 */ ybx_tblt_rep r 
  set gone_dt = start_dt 
where 1=1 
and   r.gone_dt    is null                            -- has no end time yet
and   r.tsrv_uuid  = ybx_get_tsrv( ybx_get_host () )  -- same, local tsrv_uuid 
and not exists (                             -- no more local tblt
  select 'x' from yb_local_tablets l
  where   r.tblt_uuid  =  l.tablet_id::uuid
  )
;

GET DIAGNOSTICS    n_rep_gone := ROW_COUNT;
retval := retval + n_rep_gone ;
RAISE NOTICE 'ybx_get_tblt() rep_gone : % tblts'  , n_rep_gone ; 

-- update the gone_date on mst if tablet no longer present in replicas..
-- signal gone_date if ... gone
update /* get_tblt_4 */ ybx_tblt_mst m 
  set gone_dt = start_dt 
where 1=1 
and   m.gone_dt    is null            -- no end time yet
and not exists (                      -- no more open replicas
  select 'x' from ybx_tblt_rep r
  where   m.tblt_uuid  =  r.tblt_uuid
  and     m.gone_dt    is null        -- reps no longer existing...  
  )
;

GET DIAGNOSTICS    n_mst_gone := ROW_COUNT;
retval := retval + n_mst_gone ;
RAISE NOTICE 'ybx_get_tblt() mst_gone : % tblts'  , n_mst_gone ; 

duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ; 

RAISE NOTICE 'ybx_get_tblt() elapsed  : % ms'     , duration_ms ; 

cmmnt_txt := 'm_created: ' || n_mst_created 
        || ', r_created: ' || n_rep_created 
        || ', r_gone: '    || n_rep_gone 
        || ', m_gone: '    || n_mst_gone || '.' ;

insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
       select clock_timestamp(), ybx_get_host(), 'ybx_get_tblt', duration_ms, cmmnt_txt ; 

  -- end of fucntion..
  return retval ;

END; -- function ybx_get_tblt: to get_tablets
$$
;

/* ******************* ASH ****************************************

function : ybx_get_ashy();

new version, for table ybx_ashy..

todo: move pgs_stmt to qury_log..

collect ash + pg_stat_stmnts + pg_stat_activity for current node
returns total nr of records

*/ 

CREATE OR REPLACE FUNCTION ybx_get_ashy()
  RETURNS bigint
  LANGUAGE plpgsql 
AS $$
DECLARE
  nr_rec_processed BIGINT         := 0 ;
  n_ashrecs     bigint            := 0 ; 
  n_stmnts      bigint            := 0 ; 
  n_actvty      bigint            := 0 ; 
  retval        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  cmmnt_txt      text              := 'comment ' ;
BEGIN

-- ash-records, much faster using with clause ?
with /* get_ash_1 */ 
  h as ( select ybx_get_host () as host )
, t as ( select ybx_get_tsrv ( ybx_get_host () ) tsrv_uuid )
-- , l as ( select al.* from ybx_ash al 
--              where al.host = ybx_get_host()
--                and al.sample_time > (now() - interval '900 sec' ) )
insert into ybx_ashy_log  (
  tsrv_uuid
, host 
, sample_time 
, root_request_id 
, rpc_request_id
, wait_event_component 
, wait_event_class 
, wait_event 
, top_level_node_id 
, query_id 
, ysql_session_id  -- find related info
, pid
, client_node_ip 
, wait_event_aux
, sample_weight 
, wait_event_type 
, ysql_dbid
)
select 
  t.tsrv_uuid
, h.host as host
, a.sample_time  
, a.root_request_id  
, coalesce ( a.rpc_request_id, 0 )  as rpc_id
, a.wait_event_component 
, a.wait_event_class 
, a.wait_event 
, a.top_level_node_id 
, a.query_id 
, 0 -- a.ysql_session_id  -- find related info
, a.pid
, a.client_node_ip 
, a.wait_event_aux
, a.sample_weight 
, a.wait_event_type 
, a.ysql_dbid
from yb_active_session_history a , h h, t t
where not exists ( select 'x' from ybx_ashy_log b 
                   where b.host            = h.host  -- prefer ts-uuid
                   and   b.sample_time     = a.sample_time
                   and   b.root_request_id = a.root_request_id
                   and   b.rpc_request_id  = coalesce ( a.rpc_request_id, 0 )
                   and   b.wait_event      = a.wait_event
                   -- and   b.sample_time > ( start_dt - make_interval ( secs=>900 ) )
                 );

GET DIAGNOSTICS n_ashrecs := ROW_COUNT;
retval := retval + n_ashrecs ;

RAISE NOTICE 'ybx_get_ashy() yb_act_sess_hist : % ' , n_ashrecs ; 

-- now collect pg_stat_stmnts (and activity )
-- note: explain causes duplicte queryids... 
with /* get_ash_2_stmt */ 
     h as ( select ybx_get_host () as host )
-- , t as ( select ybx_get_tsrv ( ybx_get_host () ) tsrv_uuid )
insert into ybx_pgs_stmt ( 
  host ,   -- check if qryid is same on host
	userid , 
	dbid , 
    toplevel ,
	queryid , 
	query , 
    plans ,
    total_plan_time ,
      min_plan_time ,
      max_plan_time, 
     mean_plan_time ,
   stddev_plan_time ,
	calls , 
	total_exec_time ,
  	  min_exec_time  ,
	  max_exec_time  ,
	 mean_exec_time ,
   stddev_exec_time  ,
	"rows"  ,
	shared_blks_hit  ,
	shared_blks_read  ,
	shared_blks_dirtied  ,
	shared_blks_written  ,
	local_blks_hit  ,
	local_blks_read  ,
	local_blks_dirtied  ,
	local_blks_written ,
	temp_blks_read ,
	temp_blks_written ,
	blk_read_time ,
	blk_write_time ,
    wal_records ,
    wal_fpi ,
    wal_bytes ,
    jit_functions ,
    jit_generation_time ,
    jit_inlining_count ,
    jit_inlining_time ,
    jit_optimization_count ,
    jit_optimization_time ,
    jit_emission_count ,
    jit_emission_time ,
	yb_latency_histogram 
)
select 
  h.host,
	userid , 
	dbid , 
    toplevel ,
	queryid , 
	query , 
    plans ,
    total_plan_time ,
    min_plan_time ,
    max_plan_time, 
    mean_plan_time ,
    stddev_plan_time ,
	calls , 
	total_exec_time ,
  	  min_exec_time  ,
	  max_exec_time  ,
	 mean_exec_time ,
   stddev_exec_time  ,
	"rows"  ,
	shared_blks_hit  ,
	shared_blks_read  ,
	shared_blks_dirtied  ,
	shared_blks_written  ,
	local_blks_hit  ,
	local_blks_read  ,
	local_blks_dirtied  ,
	local_blks_written ,
	temp_blks_read ,
	temp_blks_written ,
	blk_read_time ,
	blk_write_time ,
    wal_records ,
    wal_fpi ,
    wal_bytes ,
    jit_functions ,
    jit_generation_time ,
    jit_inlining_count ,
    jit_inlining_time ,
    jit_optimization_count ,
    jit_optimization_time ,
    jit_emission_count ,
    jit_emission_time ,
	yb_latency_histogram 
from pg_stat_statements s
   , h h
where 1=0
and not exists ( select 'x' from ybx_pgs_stmt y
                 where y.host = h.host
                 and   y.dbid = s.dbid
                 and   y.userid = s.userid
                 and   y.queryid = s.queryid
) 
and lower ( substring ( s.query from 1 for 8 )) != 'explain ' 
;

GET DIAGNOSTICS n_stmnts := ROW_COUNT;
retval := retval + n_stmnts ;
RAISE NOTICE 'ybx_get_ashy() pg_stat_stmnts   : % ' , n_stmnts ; 

-- collect acitivity..

with /* get_ashy_3_act */ h as ( select ybx_get_host () as host, now() as smpltm )
insert into ybx_pgs_act (
  host ,
  sample_time ,
  datid ,
  datname ,
  pid ,
  leader_pid , 
  usesysid ,
  usename ,
  application_name ,
  client_addr ,
  client_hostname ,
  client_port ,
  backend_start ,
  xact_start ,
  query_start ,
  state_change ,
  wait_event_type ,
  wait_event ,
  state ,
  backend_xid ,
  backend_xmin ,
  query_id ,
  query ,
  backend_type ,
  catalog_version ,
  allocated_mem_bytes ,
  rss_mem_bytes ,
  yb_backend_xid 
)
select 
  h.host, 
  h.smpltm,
  datid ,
  datname ,
  pid ,
  leader_pid , 
  usesysid ,
  usename ,
  application_name ,
  client_addr ,
  client_hostname ,
  client_port ,
  backend_start ,
  xact_start ,
  query_start ,
  state_change ,
  wait_event_type ,
  wait_event ,
  state ,
  backend_xid ,
  backend_xmin ,
  query_id ,
  query ,
  backend_type ,
  catalog_version ,
  allocated_mem_bytes ,
  rss_mem_bytes ,
  yb_backend_xid
from pg_stat_activity a, h h ;
-- no where clause at all ?

GET DIAGNOSTICS n_actvty := ROW_COUNT;
retval := retval + n_actvty ;
RAISE NOTICE 'ybx_get_ashy() pg_stat_activity : % ' , n_actvty ; 
    
duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ; 

RAISE NOTICE 'ybx_get_ashy() elapsed : % ms'     , duration_ms ; 

cmmnt_txt := 'ashy: ' || n_ashrecs || ', stmnts: ' || n_stmnts || ', actvty: ' || n_actvty || '.'; 

insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
       select clock_timestamp(), ybx_get_host(), 'ybx_get_ash', duration_ms, cmmnt_txt ; 

-- end of fucntion..
return retval ;

END; -- ybx_get_ashy, to incrementally populate table
$$
;


\! echo .
\! echo .
\! read -t 10 -p "10sec to check before testing, or hit enter  " abc
\! echo .
\! echo .

\set ECHO all 

select ybx_get_datb ();

select * from ybx_datb_mst ; 
select * from ybx_datb_log order by log_dt desc limit 1; 

select ybx_get_qury ();
select * from ybx_qury_mst order by log_dt desc limit 1; 

select ybx_get_sess ();
select * from ybx_sess_mst order by backend_start desc limit 3; 
select * from ybx_sess_log order by backend_start desc limit 3; 

select ybx_get_ashy ();
select * from ybx_ashy_log order by sample_time desc limit 3; 

select ybx_get_tblt() ;
select * from ybx_tblt_mst limit 4; 
select * from ybx_tblt_rep limit 4; 

\set ECHO none 


