-- 
-- mk_osdata.sql: tables to collect os-data, univers, masters, tservers.
--
-- first goal: Queries + activity non-attributable to SQL
--  to this end: 
--    - log qury, 
--    - collect qury_log (per host, per qry)
--    - collect sess + rr + ash, and report per qry, per sess..
--    - find non-SQL activity, if possibly
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
--      - re-consider: most logging os per-host, and snaphost has little meaning..
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
--  todo-process:
--    - find sessions with most work done (add up the ASH?)
--    - long running job for testing
--    - start with collection ash + act + stmts (on local node)
--      then create qry (capture msg), and sess (capture + verify mst)
--
--  Questions:
--  - keys for mast_mst, -log and tsrv_mst, -log: consider uuid or ID
--  - add to snpshot + tsrv_log: fields from select * from yb_servers_metrics () ;
--  - query: are dbid + userid part of qry-mst ? : no, bcse ash only has qry_id
--  - does a query-log link to a top-level-id or to a root_req?
-- 
--
--  - sessions ybx_sess_mst :
--      - client_addr : as inet, in ybx_ash and ybx_sess and add FK
--      - artificial key: id
--      - unique: tsrv_uuid/host + pid + backend-start: key to ash-data
--      - unique: client_addr + port + lowest of (backend-start or log_dt) : key to pg_stat_activity
--      - gone_dt: only detect via pgs_act, or when node has re-started..? 
--      - every new tsrv_uuid (tsrv_mst) automatically has an entry for top-000 and rr-000 
--
--  - root_request:
--      rr_uuid: key.. descendent of session (top -level), or descendent of 000
--      rr_uid only has 1 top-level_id (except for 000)
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

drop table ybx_data_log ; 
drop table ybx_data_mst ; 

drop table ybx_sess_log ;
drop table ybx_sess_mst ; 
  
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
-- consider mst ?
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
-- serves as FK to several, notably tsrv_log, sess_mst, host, root_req, and ash? 

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
-- add server_metrics
, constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid ) 
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ;
-- note: add tserver_metrics(), to this record
-- there are no evident futher dependetns, hence no id neede as key?


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


-------- functions... ----

/* *****************************************************************

function : ybx_get_ash();

collect ash + pg_stat_stmnts + pg_stat_activity for current node
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

  -- consider a mege.. 
  update /*qury_4_upd */ ybx_qury_mst m
    set query = ( select min ( query ) 
                  from pg_stat_statements s 
                  where m.queryid = s.queryid )
  where coalesce (  ( trim ( m.query)), '' ) = ''  -- pg funny way to detect empty or null..  
  ; 

  GET DIAGNOSTICS n_qrys_upd := ROW_COUNT;
  retval := retval + n_qrys_upd ;

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

-- below: additions session

-- drop table ybx_sess_log ;
create table ybx_sess_log ( 
  id            bigint generated always as identity primary key
, par_id        bigint not null -- link to parent
, log_dt        timestamp with time zone not null default now()
, data          text 
);
-- needs index on par_id + log_dt

-- drop table ybx_sess_mst ; 
create table ybx_sess_mst ( 
  id                bigint  generated always as identity  primary key
, host              text   -- prefer host instead of ts-uuid
, pid               int
, backend_start     timestamp with time zone default now() -- try to catch from act or from lowest ash.sample_date
, client_addr       text   -- or inet
, client_port       int
, client_hostname   text
, gone_dt           timestamp with time zone -- null, until gone.
, datid             oid
, usesysid          oid
, leader_pid        int
, app_name          text    -- from pg_stat_activity
-- unique: host + pid + backend_start 
-- also: client+adr+port + start backend
-- Q: no user-id ?
-- polling: how frequent... sessions can be <1sec.
-- some provision to catch the ones not found via pg_stat_activity.. merge some from  ash ? 
) ; 



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
  retval        bigint            := 0 ;
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  duration_ms   double precision  := 0.0 ;
  cmmnt_txt      text              := 'comment ' ;
BEGIN

  RAISE NOTICE 'ybx_get_sess() : starting..' ;

  -- get from pg_stat_activity., the easiest one bcse usually not too many lines (less than ash)
  insert /* get_sess_1 */ into ybx_sess_mst 
        ( host,     pid, backend_start, client_addr,       client_port, client_hostname 
       , datid,   usesysid, leader_pid, app_name ) 
  select this_host, pid, backend_start, host ( client_addr) ::text, client_port, client_hostname
       , datid,   usesysid, leader_pid, application_name
    -- add some non-log-data here: datid, usesysid, app_name, cl_hostname, backend_type?  
    -- save log-data for a log-table with time-dependent data
    from pg_stat_activity a 
    where not exists ( select 'X' from ybx_sess_mst m 
                        where this_host             = m.host
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
        ( host,       pid, backend_start,      client_addr
                                             , client_port ) 
  select this_host, a.pid, min(a.sample_time), split_part ( client_node_ip, ':', 1 ) as client_addr
                                             , split_part ( client_node_ip, ':', 2 )::int as client_port
    from yb_active_session_history a 
    where 1=0 -- disable for the moment
      and not exists ( select 'X' from ybx_sess_mst m 
                        where this_host         = m.host
                          and a.pid             = m.pid
                          and m.gone_dt is null -- e.g. session was not terminated 
                      ) 
     group by this_host, a.pid, 4, 5 ;

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
                    || ', from upd: '  || n_sess_upd || '.';

  insert into ybx_log ( logged_dt, host,       component,     ela_ms,      info_txt )
         select clock_timestamp(), ybx_get_host(), 'ybx_get_sess', duration_ms, cmmnt_txt ;

  -- end of fucntion..
  return retval ;   

END; -- ybx_get_sess, to incrementally populate table
$$
; 

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
-- doesnt really need ID ?? datid, host, log_dt are real key? 
-- note: no snap_id, bcse log is per host, and snap_id is global
create table ybx_datb_log (
  id      bigint        generated always as identity primary key
, host    text          default ybx_get_host() 
, log_dt  timestamp with time zone    default now ()
, datid         oid     -- fk to mst
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
) ; 

alter table ybx_datb_log 
  add constraint ybx_datb_log_fk_mst foreign key ( datid ) 
                         references ybx_datb_mst ( datid ) ; 

-- with skip-scan, only one of the indexes would suffice ? 
create unique index ybx_datb_log_dh on ybx_datb_log ( datid, host,  log_dt ); 
create        index ybx_datb_log_hd on ybx_datb_log ( host,  datid, log_dt ); 

/* ****

function to insert databases and logging

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
  
END; -- ybx_get_sess, to incrementally populate table
$$
; 

--- now test the functions...


\set timing on

-- testing
select ybx_get_qury () ; 

select ybx_get_sess () ;

select ybx_get_datb () ;

\set timing off

