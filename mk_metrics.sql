
/* 

mk_metrics.sql: scrape metrics from yugatool - just a PoC

background:
  This thingy enables storing some primitive etrics from t-server processes. 
  Having a (primitive) history can help troubleshooting. 
  some example queries at bottom

run: 
 - must run from a server or node where working yugatool is in PATH.
 - hardcoded MASTERS!  try using $MASTERS or define at top
 - default 10sec insert, dont let it run un-attended

Note, WARNINGS: 
 - this is a PoC, nothing more, BEWARE when running in prod
 - masterlist hardcoded, preferably use $MASTERS
 - BEWARE: ybx_intf is deleted + used.  (should fix later)

 -- snapshot mechanism for metrics, start with tserver

 -- drop stmnts if needed

 drop sequence ybx_snap_seq ;
 drop table ybx_snap ;
 drop table ybx_node ; 

 drop table ybx_mast_mtrc ; 
 drop table ybx_tsrv_mtrc ; 

 drop table ybx_intf_mtrc ;

*/

-- need table to ingest, no pk, just read the txt...
create table ybx_intf_mtrc ( slurp text ) split into 1 tablets ;

-- parent table for nodes : 
-- (not much info yet .. just parent-entity for masters, tserver, cpu, mem, storage... )

create table ybx_node (
  nd_host     text primary key 
, num_cpu     integer
, mem_mb      numeric
, disk_mb     numeric
) split into 1 tablets ;
-- fill from ... yb-server and possibly some program-scraping..? 

-- snapshot tbl: the combi of "entity" and "measurment-point" at a given dt.
-- to act as parent-tbl to snap-metrics in ts, ms, and other entities.

create sequence ybx_snap_seq ;

create table ybx_snap (
  sn_id  bigint primary key
, sn_dt  timestamp default now() 
-- add more columns later
)  split into 1 tablets ;

-- metrics for master-porcesses.. mast_metrics: 
-- master + timestamp + metrics.. : leader, 
-- later: consider including some cpu-per, mem-perc..?

create table ybx_mast_mtrc (
  ms_uuid     text not null
, sn_id       bigint      /* fk to snap-table, really needed ? */
, sn_dt       timestamp default now()
, mm_leader   text        /* can be boolean later? */
, constraint ybx_mm_pkey primary key ( ms_uuid, sn_id ) 
) split into 1 tablets ; 

-- tsrv_metrics: tserver + timestamp + metrics.. : leader, 
-- later: consider including some cpu-per, mem-perc..?

create table ybx_tsrv_mtrc (
  ts_uuid    text not null
, sn_id      bigint  /* fk to snap-table, really needed ? */
, sn_dt      timestamp default now()
, ts_alive   text    /* boolean?  but txt has multiple-values */
, ts_reads   bigint  /* seems like integer */
, ts_writes  bigint  /*  */
, ts_hrtb_sec  numeric  /* float, seems 3-decimal seconds */
, constraint ybx_tm primary key ( ts_uuid, sn_id ) 
) split into 3 tablets ; 

-- add constraints: Later. FKs to mast, tsrv, snap.



-- fill.. each metric-table needs pl-pgsl block ...:
-- do-declare-begin-end...
--  - needs transaction to have interface-table private during session
--  - define snapshot, find snap_id and dt
--  - call to ybtool to scrape data: master + ts.
-- 
-- put the below in separate sql or sh file, and call in loop, 1min, 10min...

DO $$
DECLARE 
  txt_in    text ;
  i_sn_id   bigint ;

BEGIN

  select  nextval ( 'ybx_snap_seq' ) into i_sn_id ; 

  -- create parent records snap, dt is dflt now():
  insert into ybx_snap ( sn_id ) select i_sn_id as sn_id ; 

  -- copy the metrics into ybx_intf_mtrc - Needs Transaction!
  delete from ybx_intf_mtrc ;
  copy ybx_intf_mtrc from program 'yugatool -m node2:7100,node3:7100,node4:7100 cluster_info | tail -n +12' ;

  insert into ybx_tsrv_mtrc ( ts_uuid, sn_id, sn_dt, ts_alive, ts_reads, ts_writes, ts_hrtb_sec )
  select
    substr ( slurp,   2,  32 )                as ts_uuid
  , i_sn_id                                   as sn_id
  , now ()                                    as dt
  , trim ( substr ( slurp,  79,   8 ) )       as alive
  , trim ( substr ( slurp,  87,   7 ) )::int  as reads
  , trim ( substr ( slurp,  95,   7 ) )::int  as writes
  , trim ( substr ( slurp, 104,   9 ) )::numeric  as hrtb_sec
  from ybx_intf_mtrc
  where length ( trim(slurp))  > 0 ;

END
$$;

\watch 10

-- verify, if needed
-- select * from ybx_intf_mtrc ;
-- select * from ybx_tsrv_mtrc order by sn_id, ts_uuid ; 

/* 
insert into ybx_tsrv_mtrc ( ts_uuid, sn_id, sn_dt, ts_alive, ts_reads, ts_writes, ts_hrtb_sec )
select
  substr ( slurp,   2,  32 )  as ts_uuid
, -1
, now ()                      as dt
, trim ( substr ( slurp,  79,   8 ) )       as alive
, trim ( substr ( slurp,  87,   7 ) )::int  as reads
, trim ( substr ( slurp,  95,   7 ) )::int  as writes
, trim ( substr ( slurp, 104,   9 ) )::numeric  as hrtb_sec
from ybx_intf
where length ( trim(slurp))  > 0 ;
*/


-- ------- example: TS with anomaly-heartbeat.. --------
select ts_uuid, sn_dt, ts_hrtb_sec from ybx_tsrv_mtrc 
where ts_hrtb_sec > 5
order by sn_id; 

-- ------- example: nr of TS at given time, anomalies in last column --------- 
select sn_id, sn_dt date_time, count (*)  chk_anomalies
from ybx_tsrv_mtrc 
group by sn_id, sn_dt
order by 1, 2 ; 


