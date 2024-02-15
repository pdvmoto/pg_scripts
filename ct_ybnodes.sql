
-- create table and functions for ybnode-cehck

/* 
concept:  
have 1 parent table with "run" and timestamp, 
then link details to that parent.

function : f_chk_nodes: catch data from yb_servers(), return nr-detected
script: ybx_pingnodes : loop-over and ping nodes and check IP and up-status.

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
    || ' run_id    , host, num_connections, node_type, uuid '
    || ' ) select '  
    || n_runid || ', host, num_connections, node_type, uuid  from yb_servers () ; '  ;

  RAISE NOTICE 'f_chknodes : chking nodes , stmnt [%] ', sql_stmnt ;

  EXECUTE sql_stmnt ;

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
