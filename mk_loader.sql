
/* 
 drop table mast ; 
 drop table tsrv ;
 drop table tabl ;
 drop table tblt ;
 drop table tbtt ;
 drop table ttrp ;
 drop table ybx_intf ;
*/

\set ECHO all

create table if not exists ybx_mast (
  ms_uuid    text primary key 
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

-- interface-table, not even a pk... dont want constraints, just passthough
create table if not exists 
  ybx_intf ( slurp text ) split into 1 tablets ;

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

0. create all the ybx_tables for this data:  mk_yb_ent_schema
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

1. read the easy parts: ld_yb_ent_1_basic.sh
   mast, tsrv, tbls : straight forward copy-from-programs

2. read all tablets: 
    script to loop tables, call ld_yb_ent_2_tt $1=tb_uuid
      get tables for the table
      insert into tblt (colocate=doubles, where not exist), 
      and into tbtt (n:m)
	
3. read ttrp: 
    script to loop over tablets, call ld_yb_ent_3_ttrp $1=tt_uuid
      call script to fetch tablet-replicas.

*/

