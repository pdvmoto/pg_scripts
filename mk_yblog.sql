/* 
  file: mk_yblog.sql, deploy the logging system for ash++

  usage: deploy this sql to create all logging tables and functions.

  1. this file
  2. do_ashloop + st_ashloop.sh
  3. uname.sql + sh (can include in ashloop?)
  4. do_snap.sh on 1 node
  5. cron, if still needed


todo: 
 - in do_snap: also collect missing mast_mst and tsrv_mst 
   manual workaround 
    insert into ybx_tsrv_mst  ( snap_id, host, tsrv_uuid )
    select snap_id, host, tsrv_uuid from ybx_tsrv_log 
    where snap_id = 1;
 - qury_log, add logs records per run from pg_stat_stmnt
 - uncomment FKs
 - replace host by tsrv_uuid in queries for tsrv, mast, sess, where host=..
 - get_ashy : use dflts host, tsrv, and use function to get tblt_uuid
 - get_ashy : stmnt and activity can move to qury + sess ? 
n

*/

/* 
drop stmts in case needed

the order of drop is important..
-- - */

drop table ybx_kvlog ; 
drop table ybx_intf ; 

drop table ybx_datb_log ; 
drop table ybx_datb_mst ; 

drop table ybx_tabl_log ; 
drop table ybx_tabl_mst ; 

drop table ybx_tblt_log ; 
drop table ybx_tblt_mst ; 

drop table ybx_ashy_log ; 

drop table ybx_sess_log ; 
drop table ybx_sess_mst ; 

drop table ybx_qury_log ; 
drop table ybx_qury_mst ; 

drop table ybx_tsrv_log ;
drop table ybx_tsrv_mst ;

drop table ybx_mast_log ;
drop table ybx_mast_mst ;

drop table ybx_host_log ;
drop table ybx_host_mst ;

drop table ybx_univ_log ;
drop table ybx_univ_mst ; 

drop table ybx_snap_log ; 
drop table ybx_snap_mst ; 

-- functions have replace, redefine will work
-- drop function ybx_get_datb () ; 
-- drop function ybx_get_host() ; 
-- drop function ybx_get_tsrv() ; 

 */

-- -- -- -- HELPER FUNCTIONS -- -- -- --
    
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
--, constraint to univ_mst..
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
--, constraint to mst, when host_mst is filled
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
-- , constraint ybx_mast_log_fk_mast_fk foreign key ( mast_uuid ) references ybx_mast_mst ( mast_uuid )
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
-- add fields for server_metrics
   , constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid )
-- , constraint ybx_tsrv_log_fk_tsrv foreign key ( tsrv_uuid ) references ybx_tsrv_mst ( tsrv_uuid )
   , constraint ybx_tsrv_log_fk_snap foreign key ( snap_id   ) references ybx_snap_log ( id )
-- , constraint yb_tsrv_log_fk_host foreign key ( host      ) references ybx_host_mst ( host ) 
) ;
-- note: add tserver_metrics(), to this record
-- there are no evident futher dependetns, hence no id neede as key?

-- -- -- -- DATABASE -- -- -- 

-- drop table ybx_datb_mst ; 
 create table ybx_datb_mst (
  datid     oid not null primary key
, datname   text
, host      text                      default ybx_get_host()   -- logged at host
, log_dt    timestamp with time zone  default now()  
);
-- key is oid, snap_id just host+dt where it was found

-- drop table ybx_data_log ; 
-- id+host+log_dt are generated, 
-- other fields from pg_stat_database
-- doesnt really need ID ?? datid, tsrv/host, log_dt are real key? 
-- note: no snap_id, bcse log is per host, and snap_id is global
-- drop table ybx_datb_log ; 
 create table ybx_datb_log (
  id          bigint        generated always as identity primary key
, tsrv_uuid   uuid          default ybx_get_tsrv( ybx_get_host () ) 
, host        text          default ybx_get_host() 
, log_dt      timestamp with time zone    default now ()
, datid         oid         -- fk to mst
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
-- unique: tsrv + datid + log_dt 
) ; 

alter table ybx_datb_log 
  add constraint ybx_datb_log_fk_mst foreign key ( datid ) 
                         references ybx_datb_mst ( datid ) ; 

-- with skip-scan, only one of the indexes would suffice ? 
create unique index ybx_datb_log_dh on ybx_datb_log ( datid, host,  log_dt ); 
create        index ybx_datb_log_hd on ybx_datb_log ( host,  datid, log_dt ); 


-- -- -- -- SESSIONS -- -- --

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
-- , constraint ybx_sess_log_fk_trsr foreign key (tsrv_uuid) references ybx_tsrv_mst ( tsrv_uuid ) 
-- unique: tsrv_uuid + pid + backend_start
-- also: client+adr+port + start backend
-- Q: is usesysid same as user-id ?
-- if FK to ash or roor_req, need to insert based on ash...
-- polling: how frequent... sessions can be <1sec.
-- some provision to catch the ones not found via pg_stat_activity.. merge some from  ash ?
) ;


-- Queries... mst is just lookup, bcse Ash only has query-id, not usr, dbid...

-- drop table ybx_qury_mst ;
 create table ybx_qury_mst (  
  queryid     bigint not null primary key
, log_dt      timestamp with time zone  default now()  
, found_at_host text                    default ybx_get_host()    -- consider FK, but no real need..
, query       text
) ;     
-- serves as fk to many.
-- note that identical syntax can appear for diff users and in diff dbid
-- hence dbid and userid not in qury_mst, but may be needed in _log or others

-- add defaults for 0-6, find desc
insert into ybx_qury_mst (queryid, found_at_host, query ) values
  ( 0, ybx_get_host(), '0 zero')
, ( 1, ybx_get_host(), '1 one')
, ( 2, ybx_get_host(), '2 flush')
, ( 3, ybx_get_host(), '3 compaction')
, ( 4, ybx_get_host(), '4 four')
, ( 5, ybx_get_host(), '5 five')
, ( 6, ybx_get_host(), '6 six') ;

-- qury_log: is for the moment yb_pgs_stmt
-- later provide more complete stats by saving every x seconds

-- drop table ybx_qury_log ;
 create table ybx_qury_log ( 
  queryid     bigint    not null
, tsrv_uuid   uuid      not null
, log_dt      timestamp with time zone not null default now()
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
, constraint ybx_qury_log_fk_query foreign key ( queryid ) references ybx_qury_mst ( queryid ) 
) ; 
-- qury_log is copy of pg_stat_statements


  
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


-- now the functions, start with some simple ones,
-- then do the ASH and qury as the most complicated oneso
-- to start with ASH, we need to disable constrints, 
-- as parent-records may no be there


-- logging of universe: do_snap.sh/sql..
-- logging of host_mst, mast_m/l + tsrv_m/l: do_snap
-- logging of hosts: unames...

-- logging of databases: get_datb
-- logging session: get_sess() : both mst + log

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

todo: qury_log not done yet...

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

  insert /*qury_1 from ash */ into ybx_qury_mst ( queryid, found_at_host, log_dt )
    select a.query_id, this_host, min ( a.sample_time ) 
    from yb_active_session_history a            -- consider select from table after gathering data ?
    where a.sample_time > ( start_dt - make_interval ( secs=>900 ) )
      and not exists ( select 'x' from ybx_qury_mst m where m.queryid = a.query_id ) 
    group by a.query_id, this_host ; 

  GET DIAGNOSTICS n_qrys_ash := ROW_COUNT;
  retval := retval + n_qrys_ash ;

  RAISE NOTICE 'ybx_get_qury() from ash : % '     , n_qrys_ash ;

  insert /*qury_2 from act */ into ybx_qury_mst ( queryid, found_at_host, log_dt, query )
    select a.query_id, this_host, min ( coalesce ( a.query_start, clock_timestamp() ) ), min ( a.query)
      from pg_stat_activity a
     where not exists ( select 'x' from ybx_qury_mst m where m.queryid = a.query_id ) 
       and a.query_id is not null
    group by a.query_id, this_host, query ;  -- note the min-query : bcse multiple texts can exist?

  GET DIAGNOSTICS n_qrys_act := ROW_COUNT;
  retval := retval + n_qrys_act ;

  RAISE NOTICE 'ybx_get_qury() from act : % '     , n_qrys_act ;

  -- consider a merge with 4.. 
  insert /*qury_3 from stmt */ into ybx_qury_mst ( queryid, found_at_host, query )
    select s.queryid, min ( this_host ) , min ( s.query ) -- explain appears with same queryid 
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

  cmmnt_txt := 'get_qury: from_ash: '  || n_qrys_ash 
                    || ', from_act: '  || n_qrys_act 
                    || ', from_stmt: ' || n_qrys_stmt 
                    || ', from upd: '  || n_qrys_upd || '.';

  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_qury', duration_ms, cmmnt_txt ;

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
  insert /* get_sess_1 */ into ybx_sess_mst 
        ( tsrv_uuid, host,     pid, backend_start,        client_addr,         client_port, client_hostname 
       , datid,   usesysid, leader_pid, app_name ) 
  select this_tsrv, this_host, pid, backend_start, host ( client_addr) ::text, client_port, client_hostname
       , datid,   usesysid, leader_pid, application_name
    -- add some non-log-data here: datid, usesysid, app_name, cl_hostname, backend_type?  
    -- save log-data for a log-table with time-dependent data
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

  RAISE NOTICE 'ybx_get_sess() elapsed : % ms'     , duration_ms ;

  cmmnt_txt := 'get_sess: from_ash: '  || n_sess_ash
                    || ', from_act: '  || n_sess_act 
                    ||   ', closed: '  || n_sess_upd || '.';

  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_sess', duration_ms, cmmnt_txt ;

  -- end of fucntion..
  return retval ;   

END; -- ybx_get_sess, to incrementally populate table
$$
; 


/* *****************************************************************

function : ybx_get_ashy();

new version, for table ybx_ashy..

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


\! read -t 10 -p "check before testing " abc

\set ECHO all 

select ybx_get_datb ();

select * from ybx_datb_mst ; 
select * from ybx_datb_log order by log_dt desc limit 3; 

select ybx_get_qury ();
select * from ybx_qury_mst order by log_dt desc limit 1; 

select ybx_get_sess ();
select * from ybx_sess_mst order by backend_start desc limit 3; 

select ybx_get_ashy ();
select * from ybx_ashy_log order by sample_time desc limit 3; 

\set ECHO none 


