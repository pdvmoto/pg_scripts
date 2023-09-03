
-- ld_yb_ent_0schema.sql: create the schema for loading entities

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
-- use output from yb-admin list_tables, and use 1-space separator

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


\echo .
\echo ld_yb_ent_0schema.sql: schema created, ready to load config-data.
\echo .
\echo next: run ld_yb_ent_0basic.sql: start loading.
\echo .

