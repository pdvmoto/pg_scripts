

create table crx_leases (
  node_id integer
, table_id integer
, name text
, parent_id integer
, expiration timestamp
, deleted boolean
, constraint crx_leases_pk primary key ( table_id, node_id )
) ;

create index crx_leases_name on crx_leases ( name, node_id, table_id ) ;

-- also note: the crdb_internal.ranges probably indicates where leaders+follwers are
create table tmp as select * from crdb_internal.ranges limit 1 ; 


