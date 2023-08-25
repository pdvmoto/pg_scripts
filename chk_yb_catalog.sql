
-- collect yb-views and calls.


select * from yb_servers ();

select yb_server_zone ();

-- generate function calls:
select 'select ' || proname || '() ; ' as fcall
, ' as ' || proname || ' ;'  as more
from pg_catalog.pg_proc 
where proname like '%yb%'
order by 1  ;    

-- show yb-properties of 1 table, must be valid oid
select yb_table_properties(16393) ;

-- generate for all tables:
select   yb_table_properties ( c.oid ) ybprops 
, yb_is_local_table(c.oid) islocal
, yb_hash_code(c.oid) yb_hash_code
, yb_get_range_split_clause(c.oid) range_split_clause
, c.oid, t.tableowner, t.schemaname, c.relname 
from pg_class c
   , pg_tables t
where c.relname = t.tablename
and 1=1 -- join owner or schema
order by c.relname;

-- generate some code to fethc properties
    
select 'select ' || proname || '() ; ' as fcall
, 'SELECT * FROM yb_table_properties(''' || proname || ''':regclass);'
, ' as ' || proname || ' ;'  as more
from pg_catalog.pg_proc 
where proname like '%yb%'
order by 1 desc ;    


-- try for tablet count
SELECT t.schemaname, t.tablename
, tp.num_tablets 
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id  
FROM yb_table_properties(c.oid) tp
   , pg_tables t
   , pg_class c
where   t.tablename = c.relam
and t.tablename like 't%';

-- this has worked..
drop view yb_tabinfo;
create view yb_tableinfo as (
select c.oid, c.relname  
--, yb_table_properties(c.oid) as props
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id
from pg_class c
, yb_table_properties(c.oid) tp 
where 1=1
--and c.reltype = 'r'
); 

-- better

drop view ybx_tblinfo;
create or replace view ybx_tblinfo as (
select c.oid, c.relname  
--, yb_table_properties(c.oid) as props
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id
, yb_is_local_table ( c.oid) islocal
from pg_class c
, yb_table_properties(c.oid) tp 
where 1=1
and c.relkind in ( 'r', 'i' ) 
); 

select oid, relname, num_tablets from ybx_tblinfo order by relname;

--more.., not worked..
with c as ( select c.oid as oid
from pg_class c) 
select c.oid, c.relname -- , yb_table_properties(c.oid) as props
-- , tp.num_tablets
from pg_class c, yb_table_properties(c.oid) tp ;

drop table ybx_tt ;
create table ybx_tt (
  id        uuid primary key
, node_id   uuid
, master_id uuid
, table_oid oid
, moreinfo text 
);

create view ybx_tablet
as ( select * from ybx_tt) ;

-- lm: load-monitor: snapshot, nodes, tables, tablets, leaders..
-- concept: take-copy, we worry about diff later (as does prometheus, nagios etc..)
-- also, seemingly: mem-usage, bcse functios available

drop table ybx_nodes ;
drop table ybx_lm_memusage ;
drop table ybx_lm_snapshot ;

create table ybx_nodes as select * from yb_servers() ;

#  the parent of them all, just a snap_id
create table ybx_lm_snapshot ( 
  snap_id bigint primary key  
, dt timestamp 
, payload text 
);

create table ybx_lm_nodes (
  snap_id bigint 
, node_id bigint 
, node_uuid

create table ybx_lm_memusage (
  snap_id bigint
, node_id
create table 
 
-- when timing is needed:
create table x_timing ( 
  id bigint primary key
, time_ms bigint
, stor_calls bigint
, descr text
, comment text )
;

insert into x_timing values ( 1, 8, 6, 'qry desc' ) ;


create table region1 ( region_id smallint primary key, region_description bpchar ) split into 1 tablets ;


-- define logical entities for ybx, use real keys for the moment --

create table ybx_universe  (
  clusteruuid text primary key
, version int
, numreplicas int
) ; 
-- pick up data from :
-- ybuniv='yb-admin -master_addresses $MASTERS get_universe_config '
-- note: cloud etc.. can be multiple-properties, check nodes

create table ybx_host (
-- node = master or tserver, or both..
  uuid        text primary key /* from yb_servers() */
, hostname    text
, port        bigint
, node_type   text
, cloud       text, region text, zone text
, public_ip   text
, num_connections bigint  /* bcse yb_servers() has this */
, constraint ybx_hostname_unq unique ( hostname ) 
) ; 

-- pickup from "host" in yb_servers() ? or from yb-admin some-list.. ? 
-- question: can ip+hostname change over time? what impact?
-- question: can hosts be in cluster without running a master or tserver ?

create table ybx_master ( 
  uuid              text   primary key
, rpc_host          text,  rpc_port     int
, state             text
, bcst_host         text,  bcst_port    int
, role              text   /* leader, follower, dead, unknown, others.. */
) ; 
-- pick up from :
-- yb-admin -master_addresses $MASTERS list_all_masters
-- yb-admin -master_addresses $MASTERS list_all_tablets_servers

create table ybx_tservr (
  uuid              text    primary key
, rpc_host          text,   rpc_port    int
, status            text      /* alive, dead, ... */
, memory            bigint
, reads_psec        float,  writes_psec  float
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

 
create table ybx_tblet ( 
  uuid        text primary key  /* assume this is the yb-key for tablet */
, leader_ip   text              /* node + port where leader is located */
, range       text              /* partition split info */
, leader_uuid text              /* seems to relate to tserver ... */ 
); 
-- pick up tablet info with:
-- yb-admin  -master_addresses node1:7100 list_tablets ysql.yugabyte t1   

create table ybx_ttsrep ( 
  tsrvr_uuid    text    /* foreign key to tserver, the hosting node */
, tablet_uuid   text    /* parent tablet, also link to table */
, role          text    /* leader or follower */
, constraint ybx_ttsrv_pk primary key ( tsrvr_uuid, tablet_uuid ) 
); 
-- how to find.
-- yb-admin -master_addresses $MASTERS list_tablet_servers tablet_uuid 

-- now define the foreign keys..

-- master is located on a host: 
alter table ybx_master add constraint ybx_master_host 
foreign key ( rpc_host ) 
references ybx_host ( hostname ) ;




notes
mviews.. : also hold tablets.
replicats are the physical entieies.
