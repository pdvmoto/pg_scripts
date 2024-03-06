
-- create table and functions for ybnode-cehck

/* 
concept:  
have 1 parent table with "run" and timestamp, 
then link details to that parent.

function : f_chk_nodes: catch data from yb_servers(), return nr-detected
script: ybx_pingnodes : loop-over and ping nodes and check IP and up-status.

here is how to update the ip, plse improve...
docker exec node7 ysqlsh -h node7 -X -c  'update ybx_chknode set public_ip =  inet_server_addr() where host='\''node7'\'' and run_id = 1  ; '


*/

/*

drop table ybx_chknode ;
drop table ybx_chkrun ;
drop sequence ybx_chkrun_seq ;

*/

create sequence ybx_chkrun_seq  ;

create table ybx_chkrun ( 
  id bigint primary key
, run_dt    timestamp  not null
, run_from  text   /* from which node was run initiated */
, run_status text  /* suggest: current, done, error */
) split into 1 tablets ;

create table ybx_chknode ( 
  run_id           bigint   not null
, host             text     not null
, port             bigint 
, num_connections  bigint
, node_type        text
, cloud            text
, region           text
, zone             text
, public_ip        text
, uuid             text
, constraint ybx_chknode_pk primary key ( run_id, host )
) split into 1 tablets  ;

-- the function to catch node-info
CREATE OR REPLACE FUNCTION f_chknodes( )
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
DECLARE
  sql_stmnt   TEXT;
  n_runid     BIGINT := null ;
  dt_chrun    timestamp ; 
  n_cnt       BIGINT := 0 ;
  txt_out     TEXT := '';
BEGIN

  select max ( id ) from ybx_chkrun /* check for current !  */ INTO n_runid ;

  sql_stmnt := 'insert into ybx_chknode ( '
    || ' run_id    , host, num_connections, node_type, uuid, public_ip '
    || ' ) select '  
    || n_runid || ', host, num_connections, node_type, uuid,  ''' ||  /* inet_server_addr() */ 'upd-IP-here' || ''''
    || ' from yb_servers () ; '  ;

  RAISE NOTICE 'f_chknodes : chking nodes , stmnt [%] ', sql_stmnt ;

  EXECUTE sql_stmnt ;

  RAISE NOTICE 'f_chknodes : make sure every node gets updated IP.'  ;

  select count (*) from ybx_chknode where run_id = n_runid into n_cnt ; 

  RETURN n_cnt ;  /* later: find count */

END;
$function$
;

-- test
insert into ybx_chkrun values ( nextval ('ybx_chkrun_seq' ) , current_timestamp, 'testhost' , 'current' );

select * from ybx_chkrun order by run_dt ;;
 
select f_chknodes () ; 

select * from  ybx_chknode 
where run_id = ( select max (id) from ybx_chkrun )
order by run_id, host;
