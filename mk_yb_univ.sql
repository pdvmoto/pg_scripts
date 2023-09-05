
-- mk_yb_universe: define tables + constraints for yugabyte entities
--
-- so far, I found the following entities in a yb-universe
--
-- Universe
--  Cluster
--    hostnode (hardware, vm or container)
--      master (meta-data and coordinating processes, running on node)
--      tserver (data-processing, running on node)
--    table : link the uuid to the pg-oid.
--    tablet : storage-object for table-data.
--      tablet_replica: on of the RF-nr of copies of a tablet, located on tserver
--    table_tablet_replica: n:m relation between tablets and tables.
--

-- universe
create table ybx_univrs  (
  clusteruuid text primary key
, version int
, numreplicas int
) ; 
-- pick up data from :
-- ybuniv='yb-admin -master_addresses $MASTERS get_universe_config '
-- note: cloud etc.. can be multiple-properties, check nodes

-- cluster: defined, but not detailed. relevant if xCluster is used
create table ybx_clustr ( 
  cluster_nm      text primary key
, univrs_uuid     text  /* fk */
, comments        text 
);

-- node, or host, or container, to hold mster, tsrvr or both
create table ybx_hstnde (
  uuid        text primary key /* from yb_servers() */
, hostname    text
, port        bigint
, node_type   text
, role        text             /* leader/follower, from yb-admin */
, cloud       text
, region      text
, zone        text
, public_ip   text
, constraint ybx_hostname_unq unique ( hostname )  
) ; 
-- pickup from "host" in yb_servers()? or from yb-admin .. ? 
-- question: can ip+hostname change over time? what impact?
-- question: can hosts be in cluster without running a master or tserver ?

-- master, running software to coordinate, and keep meta-data
create table ybx_master ( 
  uuid              text   primary key
, rpc_host          text,  rpc_port     int
, state             text
, bcst_host         text,  bcst_port    int
, role              text   /* leader, follower, dead, unknown, others.. */
) ; 
-- pick up from :
-- yb-admin -master_addresses $MASTERS list_all_masters

-- tserver, tablet-servers
create table ybx_tservr (
  uuid              text    primary key
, rpc_host          text
, rpc_port          int
, status            text    /* alive, unknown, dead, ... */
, memory            bigint
, reads_psec        numeric  
, writes_psec       numeric
, uptime_sec        bigint
);
-- pick up from:
-- yb-admin -master_addresses $MASTERS list_all_tablet_servers

create table ybx_table (
  uuid       text primary key  /* assume this is the yb-key ? */
, db_type    text   /* values: ycql, ysql - signify cassandra or postgres */
, database   text   /* values: postgres, system, system_platform, system_postgres, system_schema, template0, tempate1,  yugabyte */
, oid        bigint /* from pg_class */ 
, tablename  text   /* from pg_tables */
, schemaname text 
, tableowner text 
, table_type text /* values: catalog, index, table */
);
-- pick up data from yb-admin list_tables:
-- yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type | sed s'/\./\ /g' 
-- then join in data from ybx_tblinfo

 
create table ybx_tablet ( 
  uuid        text primary key  /* assume this is the yb-key for tablet */
, leader_uuid text              /* seems to relate to tserver ... */ 
, leader_ip   text              /* node:port of leader, defined by ldr_uuid */
, range       text              /* partition split info */
); 
-- pick up tablet info with:
-- yb-admin  -master_addresses $MASTERS list_tablets ysql.yugabyte t1   

-- tablet-tserver-replicat: the (RF, three) copies of a tablet
create table ybx_ttsrep ( 
  tservr_uuid   text    /* foreign key to tserver, the hosting node */
, tablet_uuid   text    /* parent tablet, also link to table */
, role          text    /* leader or follower */
, constraint ybx_ttsrv_pk primary key ( tservr_uuid, tablet_uuid ) 
); 
-- how to find.
-- yb-admin -master_addresses $MASTERS list_tablet_servers tablet_uuid 

-- tablet to table... m:n
create table ybx_tbltbt (
  table_uuid         text
, tblet_uuid         text
, constraint ybx_tbltbt_pk primary key ( table_uuid, tblet_uuid )
);
-- info to be derived from ... yb-admin list_tablets for all tables?
-- yb-admin  -master_addresses $MASTERS list_tablets ysql.yugabyte t1     
-- yb-admin  -master_addresses $MASTERS list_tablets ycql.system t1     


-- now define the foreign keys..

-- master and tserver are located on a host: 
alter table ybx_master add constraint ybx_master_host 
foreign key ( rpc_host ) 
references ybx_hstnde ( hostname ) ;

alter table ybx_tservr add constraint ybx_tservr_host 
foreign key ( rpc_host ) 
references ybx_hstnde ( hostname ) ;

-- Table - Tablet: linking, two fks
alter table ybx_tbltbt add constraint ybx_tt_tbl
foreign key ( table_uuid )
references ybx_tablet ( uuid ) ; 

alter table ybx_tbltbt add constraint ybx_tt_tbt
foreign key ( tblet_uuid )
references ybx_table ( uuid ) ; 

-- Tablet has.. a leader uuid (and several ttreplicas)
alter table ybx_tablet add constraint ybx_tbt_leader_tsrvr
foreign key ( leader_uuid )
references ybx_tservr ( uuid ) ; 

-- tablet-tserver 
alter table ybx_tbltbt add constraint ybx_tbt_tbl
foreign key ( table_uuid )
references ybx_table ( uuid ) ; 

alter table ybx_tbltbt add constraint ybx_tbt_tbt
foreign key ( tblet_uuid )
references ybx_tablet ( uuid ) ; 

-- replicas, connect to tablet and to host..
alter table ybx_ttsrep add constraint ybx_ttsrep_tablet
foreign key ( tablet_uuid )
references ybx_tablet ( uuid ) ; 

alter table ybx_ttsrep add constraint ybx_ttsrep_tservr
foreign key ( tservr_uuid )
references ybx_tservr ( uuid ) ; 

/* 
notes
mviews.. : also hold tablets.
replicats are the physical entieies.
*/



