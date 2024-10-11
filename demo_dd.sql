
-- show nodes

select host, port, uuid from yb_servers () order by host ;

\! read -p "nr of nodes in this cluster" abc 

-- show nr tablets
\echo all
select count (*) nr_local_tablets from yb_local_tablets ;
\echo off

\! echo .
\! echo .
\! read -p "chk nr LOCAL tablets on This node" abc 
\! echo .
\! echo .
\! read -p "before createing t128, also show activity from sar or from docker" abc
\! echo .
\! echo .

\! echo "create table ( id bigint primary key, payload text ) split into 128 tablets ; " 
\echo  all
create table t128 ( id bigint primary key, payload text ) split into 128 tablets ; 
\echo off

\! echo .
\! echo .
\! read -p "with 128 new tablets, what do you expect tabletcount?" abc
\! echo .
\! echo .

\echo all
select count (*) nr_local_tablets from yb_local_tablets ;
\echo off

\! read -p "with 128 new tablets, spread over 3 servers, But 3 replicas each...." abc   
\! echo .
\! echo .
\! read -p "now show additional ativity in sar and docker" abc
\! echo .
\! echo .
\! echo The additional components, tablets, and their RAFT-communication are visible.
\! echo On a sizable system this counts..
\! echo .
\! echo Engineering-tip: minimize NR of components.
\! echo .
\! echo and if you start with 42 nodes, try not to create 42 tablets for each table...
\! echo .

