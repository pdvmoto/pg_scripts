 
--  mk_quick_dm.sql quick diagrm wth : tserver, session, qury, table, tablet and ash
-- 
-- usage :  overview, thinking proe
-- 
-- NOTE: actual model differs, this one is Only for Thinking, Discussion, note-taking..... 
--
-- filling this one with data is not practical (yet), bcse of constraints. 
-- order in which data can be found would neccessitate a lot of "master-creation"
--

drop view ybx_rrqs_mvw ;
drop view ybx_wait_typ ;
drop view ybg_tsrv_cpu ; 
drop view ybg_tsrv_rwr ; 

drop table ybx_ashy_log ; 

-- drop table ybx_qurr_lnk ;
-- drop table ybx_rrqs_mst ;

drop table ybx_tblt_rep ; 
drop table ybx_tabl_log ; 

drop table ybx_tata_lnk ; 

drop table ybx_tblt_mst ; 
drop table ybx_tabl_mst ; 

drop table ybx_qury_log ; 

drop table ybx_qurr_lnk ; 
drop table ybx_rrqs_mst ; 

drop table ybx_sess_log ; 

drop table ybx_mast_log ; 
drop table ybx_tsrv_log ; 
drop table ybx_univ_log ; 

drop table ybx_datb_log ; 
-- drop table ybx_datb_mst ; 

drop table ybx_qury_pln ; 
drop table ybx_qury_mst ; 

drop table ybx_sess_mst ; 

drop table ybx_datb_mst ; 

drop table ybx_tsrv_mst ; 
drop table ybx_mast_mst ; 

drop table ybx_host_log ; 
drop table ybx_host_mst ; 
drop table ybx_univ_mst ; 

drop table ybx_snap_log ; 

\echo .
\echo drops done
\echo .

\! echo '-- -- -- -- HELPER FUNCTIONS -- -- -- -- '
    
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
-- need this function as placeholder. create real one when tables exist
CREATE OR REPLACE FUNCTION ybx_get_tsrv( p_host text )
RETURNS uuid AS $$
    SELECT /* old vrsn g_tsrv */ uuid::uuid
    FROM yb_servers ()
    WHERE host = p_host;
$$ LANGUAGE sql;

\! echo '-- -- -- -- UNIVERSE and SNAP -- -- -- -- '

-- the main snapshot table. parent-FK to some of the logs
-- consider : phase out.. snap_id of limited use bcse logging on many servers.
-- consider : do we need a mst ? => Yes, to detect "missing mast/tsrv from snpshot"
create table ybx_snap_log (
  id          bigint      generated always as identity primary key
, log_dt      timestamptz default now ()
, log_host    text        -- generated on which host
, duration_ms bigint      -- measure time it took to log
-- , FK to host ? not yet
) ;

-- universe.., the _log is more important.
-- drop table ybx_univ_mst
create table ybx_univ_mst (
  univ_uuid   uuid        not null              primary key
, log_dt      timestamptz not null  default now ()
, log_host    text        not null  default ybx_get_host ()
-- FK to host.. but what if host not yet known
) ; 

-- universe data, logged regularly by do_snap.sh
-- drop table ybx_univ_log ;
 create table ybx_univ_log (
  snap_id     bigint      not null                        -- fk to snapshot
, univ_uuid   uuid        not null
, log_dt      timestamptz not null    default now ()      -- can also come from snapshot
, log_host    text        not null    default ybx_get_host ()  -- can also come from snapshot
, clst_uuid   uuid
, version     int
, info        text -- just grab the json, can always filter later
, constraint ybx_univ_log_pk primary key ( snap_id, univ_uuid )
, constraint ybx_univ_log_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
, constraint ybx_univ_log_fk_univ foreign key ( univ_uuid ) references ybx_univ_mst ( univ_uuid )
-- log_host is FK to host, but not very relevant (yet) ? 
) ;

\! echo '-- -- -- -- HOST -- -- -- -- '

-- the host, equivalent of hostname, $HOSTNAME, "linux-server" or "machine", or "container".
-- drop table ybx_host_mst ;
-- host can be found or logged at other hosts, from yb-admin
create table ybx_host_mst (
  host              text        not null  primary key
, log_dt            timestamptz             default now()
, log_host          text        not null  default ybx_get_host()
, comment_txt       text        -- any comments, for ex how this host was "detected"
-- log_host is FK to... ? relevant ? 
);

-- drop table ybx_host_log ;
create table ybx_host_log (
  id                bigint generated always as identity primary key
, host              text        not null
, log_dt            timestamptz default now()
, nr_processes      int           -- possibly ps -ef | wc -l
, master_mem        bigint        -- from 7000/memz?raw
, tserver_mem       bigint        -- from 9000/memz?raw
, disk_usage_mb     bigint        -- from du -sm /root/var
, nr_local_tablets  bigint        -- possibly tsever-property
, top_info          text          -- 2nd line of top -n2
, constraint ybx_host_log_fk_mast foreign key ( host ) references ybx_host_mst ( host ) 
--, constraint to mst, when host_mst is filled
) ;


\! echo .
\! echo '-- -- -- -- DATABASE and LOG -- -- -- -- '
\! echo .

-- assuming datid is unique in universe ? 
-- info is mostly copy from pg_database + stat

-- drop table ybx_datb_mst ; 
 create table ybx_datb_mst (
  datid     oid         not null  primary key
, datname   text
, log_host  text                  default ybx_get_host()   
, log_dt    timestamptz           default now()  
-- log_host is purely informative, does it need and fk..
);        
-- key is oid, possibly take snap_id to point host+dt where found

-- datb_log.. id+host+log_dt are generated,
-- other fields from pg_stat_database
-- doesnt really need ID ?? datid, tsrv_uuid, log_dt are real key? 
-- note: no snap_id, bcse log is per host, and snap_id is global 

-- drop table ybx_datb_log ; 
 create table ybx_datb_log (
  id            bigint        generated always as identity primary key
, datid         oid     -- fk to mst
, tsrv_uuid     uuid not null
, log_dt        timestamptz   default now ()
, log_host      text          default ybx_get_host()
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
, checksum_last_failure   timestamptz
, blk_read_time           double precision
, blk_write_time          double precision
, session_time            double precision
, active_time             double precision
, idle_in_transaction_time  double precision
, sessions                bigint
, sessions_abandoned      bigint
, sessions_fatal          bigint
, sessions_killed         bigint
, stats_reset             timestamptz
  , constraint ybx_datb_log_fk_datb foreign key ( datid     ) references ybx_datb_mst ( datid    )
--, constraint ybx_datb_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
--, constraint ybx_datb_log_uk unique key ( datid, tsrv_uuid, log_dt ) -- purely info..
) ;
-- note: the FK to tsrv_uuid has to wait until tsrv_mst is created


\! echo .
\! echo '-- -- -- -- MASTER and T-SERVER and LOGs -- -- -- -- '
\! echo .

-- drop table ybx_mast_mst ;
 create table ybx_mast_mst (
  snap_id     bigint
, mast_uuid   uuid
, host        text
, log_dt      timestamptz   default now()
, log_host    text          default ybx_get_host () -- informational, Which host did logging
, constraint ybx_mast_mst_pk primary key ( mast_uuid )
, constraint ybx_mast_mst_fk_snap foreign key ( snap_id  ) references ybx_snap_log ( id   )
, constraint ybx_mast_mst_fk_host foreign key ( log_host ) references ybx_host_mst ( host )
) ;

-- drop table ybx_mast_log ;
create table ybx_mast_log (
  snap_id     bigint  not null              -- fk to snapshot
, mast_uuid   uuid  
, host        text
, log_dt      timestamptz default now()     -- info only, see snap_id from snap_log
, port        int
, role        text
, state       text
, bcasthp     text
, constraint ybx_mast_log_pk primary key ( snap_id, mast_uuid )
, constraint ybx_mast_log_fk_mast_fk foreign key ( mast_uuid ) references ybx_mast_mst ( mast_uuid )
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id   ) references ybx_snap_log ( id ) 
-- , constraint .. fk_host, or evident from mast_mst.
) ;

-- tsever
-- serves as FK to several, notably tsrv_log, sess_mst, host, root_req, and ash?
-- drop table ybx_tsrv_mst ;
 create table ybx_tsrv_mst (
  tsrv_uuid   uuid      primary key
, snap_id     bigint    not null
, host        text
, log_dt      timestamp with time zone default now()
, constraint ybx_tsrv_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id   )
, constraint ybx_tsrv_mst_fk_host foreign key ( host    ) references ybx_host_mst ( host )
) ;

-- tsrv_log: mainly scraped from yb-admin and yb_server_metrics()
-- drop table ybx_tsrv_log ;
create table ybx_tsrv_log (
  snap_id     bigint      not null
, tsrv_uuid   uuid        not null
, host        text
, log_dt      timestamptz     default now()
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
, cpu_user               real
, cpu_syst               real
, ts_status              text
, ts_error               text
, constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid )
, constraint ybx_tsrv_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
, constraint ybx_tsrv_log_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
, constraint ybx_tsrv_log_fk_host foreign key ( host      ) references ybx_host_mst ( host )
) ;
-- there are no evident futher dependents, hence no id needed as key?

\! echo .
\! echo '-- -- -- -- SESSION and LOG -- -- -- -- '
\! echo .

-- session info comes from pg_stat_activity 
-- (and others.. can an ash-line discover a session  ? ) 
-- drop table ybx_sess_mst ; 
 create table ybx_sess_mst (
  id                bigint  generated always as identity  primary key
, tsrv_uuid         uuid  not null 
, pid               int   not null
, backend_start     timestamptz   default now() -- try to catch from act or from lowest ash.sample_date
, host              text                        -- for the record, prefer readable host instead of ts-uuid
, client_addr       text                        -- or inet
, client_port       int
, client_hostname   text
, gone_dt           timestamptz                 -- null, until gone.
, datid             oid
, usesysid          oid
, leader_pid        int
, app_name          text    -- from pg_stat_activity
, constraint ybx_sess_mst_uk_pid unique   ( tsrv_uuid, pid, backend_start ) 
-- , constrt ybx_sess_mst_uk_clt unique   ( client_addr, client_port, backend_start ) 
, constraint ybx_sess_tsrv_fk foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_sess_datb_fk foreign key ( datid     ) references ybx_datb_mst ( datid ) 
) ;

-- session log info comes from pg_stat_activity 
-- (and others  ? ) 
-- pk can be sess_id + log_dt ? we dont expect (many) dependents of sess-log,
-- some/many data-items can go to sess_mst
-- and ts_uuid not needed, bcse session (sess_mst) is already linked to tsrv_uuid
-- drop table ybx_sess_log ; 
 create table ybx_sess_log (
  sess_id           bigint 
, log_dt            timestamptz default now() 
, tsrv_uuid         uuid not null ,
  datid           oid         NULL,
  datname         name        NULL,
  pid             int4        NULL,
  leader_pid      int4        NULL,
  usesysid        oid         NULL,
  usename         name        NULL,
  application_name text       NULL,
  client_addr     inet        NULL,
  client_hostname text        NULL,
  client_port     int4        NULL,
  backend_start   timestamptz NULL,
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
  rss_mem_bytes           int8 NULL,
  yb_backend_xid          uuid NULL
, constraint ybx_sess_log_pk      primary key ( sess_id, log_dt ) 
, constraint ybx_sess_log_fk_sess foreign key ( sess_id ) references ybx_sess_mst ( id ) 
-- constr: qry_id, yb_backend_xid ? 
-- datid: and other info already in mst, 
-- and qry-link is better kept in root-req.
); 

\! echo .
\! echo '-- -- -- -- QUERY and LOG -- -- -- -- '
\! echo .


-- just the query-id, 
-- linking pin to qury_log ( from pg_stat_stmnts)
-- linking pin to ASH, and to 
-- Question: should a Q_mst contain datid e.g. specific to 1 datid? 
create table ybx_qury_mst (
  queryid     bigint          not null        primary key
, log_dt      timestamptz     default now()
, log_tsrv    uuid          -- consider FK, but no real need..
, log_host    text          -- just for curiousity sake
, query       text
-- constratins to tsrv and host ? would be purely "informative" 
) ;

-- qury_log: is for the moment copy of yb_pgs_stmt
-- provide more complete stats by saving every x seconds

-- drop table ybx_qury_log ;
 create table ybx_qury_log ( 
  id          bigint generated always as identity 
, queryid     bigint      not null
, tsrv_uuid   uuid        not null
, log_dt      timestamptz not null default now()
, placeholder             text
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
, constraint ybx_qury_log_pk primary key ( queryid, tsrv_uuid, log_dt ) 
, constraint ybx_qury_log_fk_qury foreign key ( queryid   ) references ybx_qury_mst ( queryid   ) 
, constraint ybx_qury_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
) ; 
-- ID for practical reasons, but UK = qry + tsrv + logdt
-- qury_log is copy of pg_stat_statements
-- probably local to datid or dbid (database oid)

-- drop table ybx_qury_pln ;
 create table ybx_qury_pln ( 
  id          bigint generated always as identity
, queryid     bigint        not null
, tsrv_uuid   uuid          not null
, log_dt      timestamptz   not null default now()
, plan_info   text
, constraint ybx_qury_pln_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_qury_pln_fk_qury foreign key ( queryid   ) references ybx_qury_mst ( queryid ) 
) ; 
-- note: may be local to datid ? 
-- note: no usage yet.. 

\! echo .
\! echo '-- -- -- -- TABLE and TABLET and LOGs -- -- -- -- '
\! echo .

-- assume table_ID is unique inside a cluster or universe ? 
-- note: a log_dt and gond_dt would be nice
-- drop table ybx_tabl_mst ;
 create table ybx_tabl_mst (
  tabl_uuid       uuid      primary key
, oid             oid
, datid           oid     -- fk to database
, schemaname      text
, tableowner      text
, relkind         text
, constraint ybx_tabl_mst_fk_datb foreign key ( datid ) references ybx_datb_mst ( datid ) 
);

-- for future use...
-- note: this tble would benefit from an ID ? 
-- drop table ybx_tabl_log ;
 create table ybx_tabl_log (
  tabl_uuid         uuid 
, tsrv_uuid         uuid          default ybx_get_tsrv ( ybx_get_host() )
, log_dt            timestamptz   default now() 
, table_info        text -- log/save time-dependent info from pg_stats or pg_tables
, constraint ybx_tabl_log_pk primary key ( tabl_uuid, tsrv_uuid, log_dt ) 
, constraint ybx_tabl_log_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid ) 
, constraint ybx_tabl_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
) ; 

-- tablet master is rather abstract, but needed to link to tata and tables/indexs/etc
-- drop table ybx_tblt_mst ; 
 create table ybx_tblt_mst ( 
  tblt_uuid       uuid      primary key
, tabl_uuid       uuid      NULL   -- does NOT apply to CoLocated objects
, tsrv_uuid       uuid  -- information only, e.g. tsrv where this tablet is detected
, log_dt          timestamp with time zone not null default  now () 
, log_host        text  -- just or info
, constraint ybx_tblt_mst_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
-- link or constraint to datb oid or datid? no bcse tablet not know to postgres
) ; 
 
-- tablet replica: one of the copies of a tablet..
-- this is a physical item (file) kept on a tsrv , and can move/change over time..
-- drop table ybx_tblt_rep ; 
 create table ybx_tblt_rep ( 
  tblt_uuid         uuid          not null
, tsrv_uuid         uuid          not null
, log_dt            timestamptz   not null    default now ()
, gone_dt           timestamptz   null        -- null signifies: still Active, in useoo
, role              text          not null    default '-undetected-'
, state             text          not null    default '-undetected-'
, constraint ybx_tblt_rep_fk_tblt foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid ) 
, constraint ybx_tblt_rep_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
-- link or constraint to datb oid or datid? no bcse tablet not know to postgres
) ; 
 
-- in case of COLOCATED: taable - tablet is an n:n..  
-- link-table
-- drop table ybx_tata_lnk
 create table ybx_tata_lnk (
  tabl_uuid         uuid        not null
, tblt_uuid         uuid        not null
, log_dt            timestamptz           default now ()
, constraint ybx_tata_lnk_fk_tabl foreign key ( tabl_uuid ) references ybx_tabl_mst ( tabl_uuid ) 
, constraint ybx_tata_lnk_fk_tblt foreign key ( tblt_uuid ) references ybx_tblt_mst ( tblt_uuid ) 
) ; 

\! echo .
\! echo '-- -- -- -- RR, QURY_RR  and ASHY_LOG -- -- -- -- '
\! echo .

-- smaller version of rr, needs views to join stuff
-- if using this: needs a view to join relevant sess and duration-ms..
-- drop table ybx_rrqs_mst ;
 create table ybx_rrqs_mst (
  id          bigint        generated always as identity primary key  -- id bcse used in FKs
, sess_id     bigint        not null    -- sess_id, bcse tsrv+pid not unique over time
, rr_uuid     uuid          not null
, rr_min_dt   timestamptz
, rr_max_dt   timestamptz
, constraint ybx_rrqs_mst_fk_sess foreign key ( sess_id ) references ybx_sess_mst ( id ) 
, constraint ybx_rrqs_mst_ui      unique      ( rr_uuid )
-- client-info, app, ..
-- fk to tsrv_uuid,
-- fk to sess_id, (implies fk to tsrv, as session is linked to tsrv?)
-- fk to qury_mst
-- Do Not Forget: ASH needs FK to RR to make diagram complete
--
);

-- drop table ybx_qurr_lnk ;
 create table ybx_qurr_lnk (
  queryid         bigint
, rr_id           bigint
, qurr_start_dt   timestamptz
, dur_ms          bigint        -- if we can find it
, constraint ybx_qurr_lnk_pk primary key ( queryid, rr_id )
, constraint ybx_qurr_lnk_fk_qury foreign key ( queryid ) references ybx_qury_mst ( queryid ) 
, constraint ybx_qurr_lnk_fk_rrqs foreign key ( rr_id   ) references ybx_rrqs_mst ( id      ) 
-- fk to rr,
-- fk to qry
) ;



-- Do Not Forget: ASH needs FK to RR to make diagram complete
-- drop table ybx_ashy_log ; 
 create table ybx_ashy_log (
    id                    bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tsrv_uuid               uuid not null,
  host                  text NULL,
  sample_time           timestamptz  NULL,
  sess_id               bigint not null,
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
, constraint ybx_ashy_log_qury_fk foreign key ( query_id  ) references ybx_qury_mst ( queryid ) 
, constraint ybx_ashy_log_tsrv_fk foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid ) 
, constraint ybx_ashy_log_sess_fk foreign key ( sess_id   ) references ybx_sess_mst ( id ) 
-- , constraint ybx_ashy_log_sess_fk foreign key ( client_addr, client_port ) references ybx_sess_mst ( client_addr,client_port ) 
-- , constraint ybx_ashy_log_rrqs_fk: ASH needs FK to RR to make diagram complete
, constraint ybx_ashy_log_rrqs_fk foreign key ( root_request_id ) references ybx_rrqs_mst ( rr_uuid) 
) ;


\! echo .
\! echo '-- -- -- -- [ optional ] Some Views to help join stuff together -- -- -- -- '
\! echo .

-- also consider joining: database, username

-- 
create or replace view ybx_rrqs_mvw as
select
  sm.id           as sess_id
, sm.tsrv_uuid
, sm.pid
, sm.backend_start
, sm.host         as host  -- should really be a join
, rm.id
, rm.rr_uuid
, rm.rr_min_dt
, rm.rr_max_dt
, extract ( epoch from ( rm.rr_max_dt - rm.rr_min_dt ) ) * 1000 as dur_ms
, sm.app_name
from ybx_rrqs_mst rm
   , ybx_sess_mst sm
where rm.sess_id = sm.id
;


