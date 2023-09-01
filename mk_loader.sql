
/* 
 drop table mast ; 
 drop table tsrv ;
 drop table ybx_intf ;
*/

create table ybx_mast (
  muuid    text primary key 
, host     text
, port     int
, role     text
, state    text  
, bcasthp  text  
) split into 1 tablets ;

create table ybx_tsrv (
  tsuuid text primary key
, host   text
, port   int
, alive  text  
) split into 1 tablets ;
-- note on master and tserver: the properties cloud, region and zone come from yb_server()

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

insert into ybx_mast ( muuid, host, port, role )
select 
  substr ( slurp,   2,  32 )  as muuid
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
 
insert into ybx_tsrv ( tsuuid, host, port, alive )
select 
  substr ( slurp,   2,  32 )  as tsuuid
, substr ( slurp,  37,  10 )  as host
, trim ( substr ( slurp,  50,   5 ) )::int  as port
, trim ( substr ( slurp,  79,   8 ) )       as alive
from ybx_intf
where length ( trim(slurp))  > 0 ;

-- now joint master + tservers to the yb_servers():



