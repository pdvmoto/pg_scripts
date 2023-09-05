
/* 
 drop table ybx_mast ; 
 drop table ybx_tsrv ;
 drop table ybx_tabl ;
 drop table ybx_tblt ;
 drop table ybx_tbtt ;
 drop table ybx_ttrp ;
 drop table ybx_intf ;
*/

\set ECHO all

create table ybx_mast (
  ms_uuid  text primary key 
, host     text
, port     int
, role     text
, state    text  
, bcasthp  text  
) split into 1 tablets ;

create table ybx_tsrv (
  ts_uuid text primary key
, host   text
, port   int
, alive  text  
) split into 1 tablets ;
-- note on master and tserver: the properties cloud, region and zone come from yb_server()

create table ybx_tabl (
  tb_uuid text primary key 
, db_type text
, database text
, tablename text
, tabletype text
) split into 1 tablets ;
-- use output from yb-admin list_tables, and use 1space separator

create table ybx_tblt (
  tt_uuid text primary key 
, ts_uuid text   /* leader-ts for this tablet) */
, range   text   /* later.. */
, tt_more text   /* store more info later */
) split into 1 tablets ; 
-- fill from list_tablets ysql.yugabute t , mind doubles when colocated

-- the m:n relation between tables and tablets.
create table ybx_tbtt ( 
  tb_uuid text
, tt_uuid text
, constraint ybx_tbtt_pk primary key ( tb_uuid, tt_uuid ) 
) split into 1 tablets ;
-- fill from list_tablets 

-- the replicas of tablets, per tsever
create table ybx_ttrp (
  tt_uuid text
, ts_uuid text
, role    text  /* leader / follower / ... */
) split into 1 tablets ;
-- fill from yb-admin list_tablet_servers per tt_uuid


/* keep constraints away during dev-test-debug, but test them 

-- add constraints, just in case
alter table ybx_tbtt add constraint ybx_tbtt_fk_tb
foreign key ( tb_uuid ) references ybx_tabl ( tb_uuid ); 

alter table ybx_tbtt add constraint ybx_tbtt_fk_tt
foreign key ( tt_uuid ) references ybx_tblt ( tt_uuid ); 
 
alter table ybx_tblt add constraint ybx_tblt_fk_ts_ldr
foreign key ( ts_uuid ) references ybx_tsrv ( ts_uuid ); 

alter table ybx_ttrp add constraint ybx_ttrp_fk_tt
foreign key ( tt_uuid ) references ybx_tblt ( tt_uuid ); 

alter table ybx_ttrp add constraint ybx_ttrp_fk_ts
foreign key ( ts_uuid ) references ybx_tsrv ( ts_uuid ); 

*/

-- interface-table, not even a pk... dont want constraints, just passthough
create table ybx_intf ( slurp text ) split into 1 tablets ;

-- use yugatool: output seems more regular than yb-admin

-- masters are top-lines, assuming RF=3..
delete from ybx_intf ; 
\copy ybx_intf from program 'yugatool  -m $MASTERS cluster_info |head -n8|  tail -n +6 | tail -n4 ' ; 

-- verify
select 
  '['|| substr ( slurp,   2,  32 ) || ']' as tsuuid
, '['|| substr ( slurp,  37,  10 ) || ']' as host
, '['|| trim ( substr ( slurp,  50,   5 ) ) || ']' as port
, '['|| substr ( slurp,  79,   8 ) || ']' as role
from ybx_intf
where length ( trim(slurp))  > 0 ;

delete from ybx_mast ;

insert into ybx_mast ( ms_uuid, host, port, role )
select 
  substr ( slurp,   2,  32 )  as ms_uuid
, substr ( slurp,  37,  10 )  as host
, trim ( substr ( slurp,  50,   5 ))::int  as port
, substr ( slurp,  79,   8 ) as role
from ybx_intf
where length ( trim(slurp) ) > 0 ;

-- now find the tservers..list

delete from ybx_intf ; 

\copy ybx_intf from program 'yugatool  -m $MASTERS cluster_info |tail  -n +12 ' ; 

-- verify
select 
  '['|| substr ( slurp,   2,  32 ) || ']' as tsuuid
, '['|| substr ( slurp,  37,  10 ) || ']' as host
, '['|| trim ( substr ( slurp,  50,   5 ) ) || ']' as port
, '['|| trim ( substr ( slurp,  79,   8 ) ) || ']' as alive
from ybx_intf
where length ( trim(slurp))  > 0 ;
 
delete from ybx_tsrv ;

insert into ybx_tsrv ( ts_uuid, host, port, alive )
select 
  substr ( slurp,   2,  32 )  as ts_uuid
, substr ( slurp,  37,  10 )  as host
, trim ( substr ( slurp,  50,   5 ) )::int  as port
, trim ( substr ( slurp,  79,   8 ) )       as alive
from ybx_intf
where length ( trim(slurp))  > 0 ;

-- now read table-data
delete from ybx_intf ;
delete from ybx_tbls ;

\copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type | sed "s/\./ /g" '  ;

-- later, if data already separated...
-- \copy ybx_tbls ( db_type, database, tablename, tbl_uuid, tabletype ) from program 'yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type | sed "s/\./ /g" | sed "s/ /,/g " ' WITH ( format csv ) ;

/* 
-- verify tables...
select 
  '['|| split_part ( slurp, ' ', 4 ) || ']' as tb_uuid
, '['|| split_part ( slurp, ' ', 1 ) || ']' as db_type
, '['|| split_part ( slurp, ' ', 2 ) || ']' as database
, '['|| split_part ( slurp, ' ', 3 ) || ']' as tablename
, '['|| split_part ( slurp, ' ', 5 ) || ']' as tabletype
from ybx_intf
where length ( trim(slurp))  > 0 ;
*/

insert into ybx_tabl  ( tb_uuid, db_type, database, tablename, tabletype )
select 
  split_part ( slurp, ' ', 4 )  as tb_uuid
, split_part ( slurp, ' ', 1 )  as db_type
, split_part ( slurp, ' ', 2 )  as database
, split_part ( slurp, ' ', 3 )  as tablename
, split_part ( slurp, ' ', 5 )  as tabletype
from ybx_intf
where length ( trim(slurp))  > 0 ;

-- now joint master + tservers to the yb_servers():
-- assume ybx_tables are "compmlete", and show empty for missing servers..

select  m.host 
     ,  s.uuid as ts_uuid
     ,  m.ms_uuid as ms_uuid
     ,  m.role
from ybx_mast m
left join yb_servers () s on ( s.host = m.host ) 
order by m.host ;

select  
       t.host
     , s.uuid as ts_uuid
     , t.alive
from ybx_tsrv t
left join yb_servers () s on ( s.host = t.host ) 
order by t.host ;

-- -- -- use tables (via tb_uuid?) to find tablets:

delete from ybx_intf ;
--  \copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tablets ysql.yugabyte t | head -n +2 '  ;
\copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tablets ysql.yugabyte t  | tail -n +2 | cut -f1,4 | expand ' ;

insert into ybx_tblt ( tt_uuid, ts_uuid )
select substr ( slurp,  1, 32 )  as tt_uuid
     , substr ( slurp, 41, 72 )  as ts_uuid
     , slurp
from ybx_intf
where length ( trim(slurp))  > 0 ;


-- -- -- the replicas, link the tablets to the tservers
delete from ybx_intf ;

\copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tablet_servers  c1a07cd006f94d2794010fc60853ce62 | tail -n +2| expand '  ;

-- verify the tabletreplica to tserver  and the role of the tsrvr
select
  '['|| substr ( slurp,  1, 32 ) || ']' as ts_uuid
, '['|| substr ( slurp, 65, 20 ) || ']' as role
from ybx_intf
where length ( trim ( slurp ) ) > 0  ;



-- list some tables
select *
from ybx_tbls
where ( tablename like 't%' or tablename like 'ybx%' ) 
order by database, tablename; 


/* 

proof of concept given above..

program structure for getting the data:

0. create all the ybx_tables for this data:  mk_yb_ent_0schema
    mast
    tsrv
    tbls
    script to loop tables:
    	tblt  (script loop over tables, potential doubles for co-located)
        tbtt  (n:m for tables:tablets) 
    script to loop tablets:
        ttrp  (1:n for tablets + replicats-tsrv)

    intf : the interface table, just holds text, delete, (Risky!)

    Add constraints if possible.

1. read the easy parts: ld_yb_ent_1basic.sql
   mast, tsrv, tbls : straight forward copy-from-programs

2. read all tablets: 
    script to loop tables, call ld_yb_ent_2tt.sh $1=tb_uuid
      get tables for the table
      insert into tblt (colocate=doubles, where not exist), 
      and into tbtt (n:m)
	
3. read ttrp: 
    script to loop over tablets, call ld_yb_ent_3ttrp.sh $1=tt_uuid
      call script to fetch tablet-replicas.

4. report data on cluster:
  - placement of a table: nr-of-tablets, leaders, followers
  - busiest tserver + leaders + followers
  - state of a node or server: which leaders affected, which followers..

*/

-- create some tables with diff sharding, use those in demo later...
create table t01 ( id bigint primary key, payload text ) split into  1 tablets ;
create table t02 ( id bigint primary key, payload text ) split into  2 tablets ;
create table t04 ( id bigint primary key, payload text ) split into  4 tablets ;
create table t16 ( id bigint primary key, payload text ) split into 16 tablets ;

-- link table to host-ldrs
-- use this to show :
--  - tables on a host, e.g. when host is in trouble
--  - host under a table, e.g. show geo-location of a table, or impact of removing host
create view ybx_tb_ts as
select tb.tablename, ts.host, ts.ts_uuid
     , count (ts.ts_uuid )  nr_ldr_tablets
from ybx_tabl tb
   , ybx_tbtt tbtt
   , ybx_tblt tt
   , ybx_tsrv ts
where tb.tb_uuid = tbtt.tb_uuid
  and tbtt.tt_uuid = tt.tt_uuid
  and tt.ts_uuid = ts.ts_uuid
  group by tb.tablename, ts.host, ts.ts_uuid
order by tb.tablename, ts.host;

-- overall status of TS: leaders + followers..
select ts.host, ts.ts_uuid 
, sum ( case when rp.role = 'LEADER'    then 1 else 0 end ) as ldrs
, sum ( case when rp.role = 'FOLLOWER'  then 1 else 0 end ) as fllwrs
from ybx_tsrv ts
   , ybx_ttrp rp
where ts.ts_uuid = rp.ts_uuid
group by ts.host, ts.ts_uuid; 

-- view to combine tables with tservers (best one so far?)
-- use this to show :
--  - tables on a host, e.g. when host is in trouble
--  - host under a table, e.g. show geo-location of a table, or impact of removing host
create or replace view ybx_tb_to_ts as 
select tb.db_type, tb.database, tb.tablename, tb.tabletype
     , ts.host, ts.port, ts.ts_uuid 
, sum ( case when rp.role = 'LEADER'    then 1 else 0 end ) as ldrs
, sum ( case when rp.role = 'FOLLOWER'  then 1 else 0 end ) as fllwrs
from ybx_tsrv ts
   , ybx_ttrp rp
   , ybx_tabl tb
where ts.ts_uuid = rp.ts_uuid
  and rp.tt_uuid in ( /* collect all tts for tb from the n:m */ 
                    select tbtt.tt_uuid from ybx_tbtt tbtt 
                    where tbtt.tb_uuid = tb.tb_uuid  
                    )
group by tb.db_type, tb.database, tb.tablename, tb.tabletype
       , ts.host, ts.ts_uuid, ts.port ;

order by tb.tablename, ldrs desc, fllwrs ;

-- original table to host for tt-leaders
select tb.tablename, ts.host, ts.ts_uuid
, count (distinct ts.ts_uuid )  nr_ldr_tablets
/* , (select count (*) from ybx_ttrp rp 
    where rp.ts_uuid = ts.ts_uuid
      and rp.tt_uuid = tt.tt_uuid
      and rp.role = 'FOLLOWER'
  ) as replc_fllwrs */
from ybx_tabl tb
   , ybx_tbtt tbtt
   , ybx_tblt tt
   , ybx_tsrv ts
where tb.tb_uuid = tbtt.tb_uuid
  and tbtt.tt_uuid = tt.tt_uuid
  and tt.ts_uuid = ts.ts_uuid
  group by tb.tablename, ts.host, ts.ts_uuid
order by tb.tablename, ts.host;


-- -- --  from host: which tables and which roles are affected -- -- -
-- find tables per tserver..
-- tserver => leading for...
-- tserver => following for...
-- todo: show follower-count, rather than lis followers
select ts.host
--, ts.ts_uuid
, tb.tablename for_tabl
, rp.role 
, rp.tt_uuid via_tablet
from ybx_tsrv ts
   , ybx_ttrp rp
   , ybx_tabl tb
   , ybx_tbtt tbt
where ts.ts_uuid = rp.ts_uuid
  and rp.tt_uuid = tbt.tt_uuid
  and tb.tb_uuid = tbt.tb_uuid 
order by ts.host, tb.tablename, rp.role desc, ts.ts_uuid;

-- for table, show tservers, with nr of leaders + followers..
-- note: already done above ?


