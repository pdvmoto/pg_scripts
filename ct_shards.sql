

drop table sh_shard ;
drop table sh_node ;

create table sh_shard 
( id bigint primary key
, shardname text
, node_id bigint 
, elapsed_sec float );

create table sh_node 
( id bigint primary key
, nodename text
 );

alter table sh_shard add constraint 
sh_node_fk foreign key (node_id) references sh_node ( id ) ; 

insert into sh_node values ( 42,  'node 42' ); 
insert into sh_node values ( 666, 'node 3xsix' ); 

insert into sh_shard values ( 1, 'shard1',  42,   12 );
insert into sh_shard values ( 2, 'shard2', 666, 1300 );
insert into sh_shard values ( 3, 'shard3',  42,    1 );
insert into sh_shard values ( 4, 'shard4', 666,   13 );

-- the demo sql
select 
  n.nodename              node_name
, sum   ( s.elapsed_sec ) scnds_ela
, count (*)               nr_shards
from sh_shard s 
join sh_node n on ( n.id = s.node_id ) 
group by n.nodename
order by 2 ;

