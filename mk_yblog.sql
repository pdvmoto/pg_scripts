/* 
  file: mk_yblog.sql, deploy the logging system for ash++

  usage: deploy this sql to create all logging tables and functions.

  1. this file and subfiles, to 
    1a: _d to drop tables + fuctions (slow)
    1b: create tables (slow... and catalog-problems?)
    1b: _f create functions (faster to create-replace)
  2. do_ashloop, st_ashloop.sh and do_ash.sql
    2.a: Similar scripts for sadc to collect sar...but not in scope
  3. uname.sql + -.sh (call is included in ashloop.sh)
  4. do_snap.sh, only on 1 node
  5. cron, if still needed (had old code in get_tablogs... )

todo: 
 - include blacklisted nodes in get_tsrv, assume tsrv_mst is filled.
 - define views to clarify (join) data, for ex: tblt, session: join to show host
 - in do_snap: collect (scrape) mast_mst and tsrv_mst : done..
   manual workaround 
    insert into ybx_tsrv_mst  ( snap_id, host, tsrv_uuid )
    select snap_id, host, tsrv_uuid from ybx_tsrv_log 
    where snap_id = 1; -- any single valid snap_id..
 - qury_log, add logs records per run from pg_stat_stmnt: done, testing.
 - uncomment FKs:  but need ensure parent-records present...
 - replace host by tsrv_uuid in queries for tsrv, mast, sess, where host=..
 - get_ashy : stmnt and activity can move to qury + sess ? : done
 - tblt_mst : is per  tablet, so no link to node/tsrv.. ? 
    - tblt_rep : replica per node.. , should hve role (lead/follow) and state (tombst)
    - tablet repl can have gone-dt per node.. tablet_mst: gone_dt only when tble gone.
 - Table and Ta-Ta logging ? 


in case we need to insert tsrv_mst, use latest snap_id :
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

\! read -t 10 -p "droppings done, now to create helper-functions and tables :" 

\! echo '-- -- -- -- HELPER FUNCTIONS stay with tables.. -- -- -- --'
    
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

CREATE OR REPLACE FUNCTION ybx_get_tsrv( p_host text )
RETURNS uuid AS $$
with h as ( select ybx_get_host() as host )
select coalesce ( 
   (select s.uuid::uuid from yb_servers() s where s.host = h.host ) 
 , (select m.tsrv_uuid from ybx_tsrv_mst m where m.host = h.host )
) as tsrv_result
from h; 
$$ LANGUAGE sql;

\!echo .
\!echo '-- -- -- -- HELPER TABLES, may already exist... -- -- -- --'
\!echo .


/* generic logging..  */

-- drop table ybx_log ;
 create table ybx_log (
    id          bigint        generated always as identity
  , logged_dt   timestamptz   not null
  , host        text
  , component   text
  , ela_ms      double precision
  , info_txt   text
  , constraint ybx_log_pk primary key (logged_dt asc, id  asc)
  ) ;
   

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
-- drop table ybx_intf ;
 create table ybx_intf (
  id      bigint          generated always as identity primary key
, log_dt  timestamp       default now ()
, host    text            default ybx_get_host ()
, slurp   text
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
, mem_avail_mb           bigint
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

-- view to use in grafana..  ybG..
-- drop view ybg_tsrv_rwr; 
 create view ybg_tsrv_rwr as 
select sl.log_dt
, t2.rd_psec n2_rds
, t2.wr_psec n2_wrs
, t3.rd_psec n3_rds
, t3.wr_psec n3_wrs
, t4.rd_psec n4_rds
, t4.wr_psec n4_wrs
, t5.rd_psec n5_rds
, t5.wr_psec n5_wrs
from ybx_snap_log sl
   , ybx_tsrv_log t2
   , ybx_tsrv_log t3
   , ybx_tsrv_log t4
   , ybx_tsrv_log t5
where  1=1
 and sl.id = t2.snap_id 
 and sl.id = t3.snap_id
 and sl.id = t4.snap_id
 and sl.id = t5.snap_id
 and t2.host = 'node2'
 and t3.host = 'node3'
 and t4.host = 'node4'
 and t5.host = 'node5'
order by sl.log_dt  ; 


-- drop view ybg_tsrv_cpu; 
 create view ybg_tsrv_cpu as 
select sl.log_dt
, t2.cpu_user n2_usr
, t2.cpu_syst n2_sys
, t3.cpu_user n3_usr
, t3.cpu_syst n3_sys
, t4.cpu_user n4_usr
, t4.cpu_syst m4_sys
, t5.cpu_user m5_usr
, t5.cpu_syst m5_sys
from ybx_snap_log sl
   , ybx_tsrv_log t2
   , ybx_tsrv_log t3
   , ybx_tsrv_log t4
   , ybx_tsrv_log t5
where  1=1
 and sl.id = t2.snap_id 
 and sl.id = t3.snap_id
 and sl.id = t4.snap_id
 and sl.id = t5.snap_id
 and t2.host = 'node2'
 and t3.host = 'node3'
 and t4.host = 'node4'
 and t5.host = 'node5'
order by sl.log_dt  ; 


\echo .
\echo $0 : tables created. next is function (use separate file.. ) 
\echo .


-- use separate file to develop functions..faster
\i mk_yblog_f.sql

-- exit here, notes below.....
\q


-- to find delta-values for databases, for Grafana..
-- per node and per datid

select datid
, log_host
,    log_dt
, sessions 
,    sessions     - LAG(sessions)     OVER (PARTITION BY log_host ORDER BY log_dt) AS delta_sess
,    tup_returned - LAG(tup_returned) OVER (PARTITION BY log_host ORDER BY log_dt) AS delta_tup_ret
,    (temp_bytes  - LAG(temp_bytes)   OVER (PARTITION BY log_host ORDER BY log_dt))/1024/1024 AS delta_temp_mb
, tup_returned, temp_bytes
FROM
    ybx_datb_log l
WHERE
   log_host = 'node3'
   and datid = 13515
ORDER By
    log_dt  desc 
limit 100;


-- one way to provoke long running sql...

\timing on

with /* long1 */ 
  s1 as ( select id, substring ( payload from 100 for 3 )  as sub from t_rnd )
, s2 as ( select id, substring ( payload from 900 for 3 )  as sub from t_rnd )
, s3 as ( select id, substring ( payload from 500 for 3 )  as sub from t_rnd )
select s1.id, s2.id , s3.id 
from s1, s2, s3
where s1.sub = s2.sub
  and s2.sub = s3.sub
  and s3.id < 10000 
  and s2.id < 10000 
order by  s3.sub
 ;

\timing off




