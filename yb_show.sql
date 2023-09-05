

\pset footer off
\set ECHO all

select host, uuid from yb_servers() order by host;

\d

select relname, relkind from pg_class where relname like 'ybx%' ;

select oid, relname , num_tablets tblts , is_colocated coloc 
from ybx_tblinfo where relname like 'pg_class';

\set ECHO none
\pset footer on

