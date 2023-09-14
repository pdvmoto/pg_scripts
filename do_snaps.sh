#!/bin/sh

# do_snaps.sh : collect snapshot data over nodes

# get snap_id 
# get nodelist, 
# and loop over nodes, making snapshot

# todo:
# - dynamic nodelist : get_nodelist => set nodelist='...'
# - use URI and haproxy: port 26250
# - add logging databases crx_database
# - tip: snap_id can also be current or max(snap_id);
# 

# hardcoded
nodelist='roach1 roach2 roach3 roach4 roach5 roach6 roach7 roach8 roach9'

# set the snap_id
`./get_snap.sh`

echo snap id is set to $snap_id

# first do the cluster-wide snap-work: get cluster + nodes

psql -X postgresql://root@localhost:26257,localhost:26258,localhost:26259/defaultdb?connect_timeout=2 <<EOF

  -- create the snapshot
  insert into crx_snap ( snap_id, dt, node_created, client_created )
  values ( $snap_id, now(), crdb_internal.node_id(), '$HOSTNAME' );
 
  -- nodes
  insert into crx_sn_nodes (
    snap_id
  , node_id
  , started_at
  , is_live
  , ranges, leases
  , draining, decommissioning, membership, updated_at )
  (select 
    $snap_id
  , gn.node_id
  , gn.started_at
  , gn.is_live
  , gn.ranges, gn.leases
  , gl.draining, gl.decommissioning, gl.membership, gl.updated_at 
  from crdb_internal.gossip_nodes    gn
     , crdb_internal.gossip_liveness gl
  where  gn.node_id = gl.node_id
  );

  -- tables
  insert into crx_sn_tables (
    snap_id
  , table_id
  , parent_id
  , parent_schema_id
  , table_name
  , database_name 
  , est_rows
  )
  (select 
    $snap_id
  , t.table_id
  , t.parent_id
  , t.parent_schema_id
  , t.name 
  , t.database_name
  , s.estimated_row_count
  from crdb_internal.tables t
     , crdb_internal.table_row_statistics s
  where s.table_id = t.table_id
  ) ; 

  -- ranges 
  insert into crx_sn_ranges ( 
    snap_id
  , range_id
  , lease_holder 
  , table_id
  , db_name
  , schema_name
  , table_name
  , index_name
  , replicas
  , voting_repl
  , non_vt_repl
  , learner_repl 
  , range_size
  ) (
  select
    $snap_id
  , range_id
  , lease_holder 
  , table_id
  , database_name
  , schema_name
  , table_name
  , index_name
  , replicas
  , voting_replicas
  , non_voting_replicas
  , learner_replicas 
  , range_size
  from crdb_internal.ranges
  ) ;

  -- ranges _no_lease
  insert into crx_sn_ranges_no_lse ( 
    snap_id
  , range_id
  , table_id
  , db_name
  , schema_name
  , table_name
  , index_name
  , replicas
  , voting_repl
  , non_vt_repl
  , learner_repl 
  ) (
  select
    $snap_id
  , range_id
  , table_id
  , database_name
  , schema_name
  , table_name
  , index_name
  , replicas
  , voting_replicas
  , non_voting_replicas
  , learner_replicas 
  from crdb_internal.ranges_no_leases
  ) ;

EOF

echo now go loop over nodes to find leases etc..

export portlist="26257 26258 26259 26260 26261 26262 26263 26264 26265"

for port in $portlist
do

  echo fetching leases... doing port $port

  psql -h localhost -p $port -U root -d defaultdb -X <<EOF
  
    insert into crx_sn_leases (
      snap_id
    , node_id
    , table_id
    , parent_id
    , name
    , expiration
    , deleted 
    )(
    select 
      $snap_id
    , node_id
    , table_id
    , parent_id
    , name
    , expiration
    , deleted
    from crdb_internal.leases 
    ) ;

EOF

done

