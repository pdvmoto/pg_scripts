-- cr_init.sql: some code to initialize your cockroach..

/* 
note:
 - identify connected node: crx_nodeinfo ( id, name, sql-advert-port, cluster, ... ??)
 - identiy client? crx_clientinfo ( tool (psql), hostname )
 - relevant defines: \set (if not on .psqlrc )
 - 
*/

-- drop view crx_nodes ;
-- drop view crx_nodeinfo ; 

create or replace view crx_vnodes as ( 
select gn.node_id
, split_part ( advertise_sql_address, ':', 1 )   as ndname
, advertise_sql_address                          as sql_addr
, case when is_live then 'live' else '-out-' end as live
, ranges, leases
, draining, decommissioning
, membership
, updated_at              as up_since
, (now() - gl.updated_at) as uptime
from crdb_internal.gossip_nodes     gn
   , crdb_internal.gossip_liveness  gl
where gn.node_id = gl.node_id ) ;

create or replace view crx_vnodeinfo as (
select bi.node_id                       as node_id
     , split_part ( gn.address, ':', 1) as nodename
     , bi.value                         as build 
from crdb_internal.node_build_info bi
   , crdb_internal.gossip_nodes    gn
where bi.field   = 'Build' 
  and gn.node_id = bi.node_id ) ;

\set ECHO all

-- display info on node, possilby use for prompt ..
select * from crx_vnodeinfo; 

-- display info on Cluster, consider \set :crnodes
select * from crx_vnodes order by node_id ; 

select 'Totals' as totals, sum(ranges) ranges, sum(leases) leases
from crdb_internal.gossip_nodes 
group by totals ; 

\set ECHO none


