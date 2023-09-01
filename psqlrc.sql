
-- .psqlrc
-- use this if a .psqlrc is allowed/needed
-- 
-- usage : initialize a session in psql

-- set prompt  to know "where we are"
-- \set PROMPT1 '%n @ %/%R> '
--
-- remember: if date/time is needed: \set PROMPT1 = ' `date +%H:%M:%S`  %n@%m:%/%R%# '
-- date +%H:%M:%S
-- select '\set PROMPT1 `date  +%H:%M:%S` '' @ %/ @ '
-- date is login-time, need to experiment with now() in prompt
--

-- experiment
\set PROMPT1 '%n @ %/ @ %m  %R> '


-- select 'Welcome to psql' as welcome;

\set PROMPT1 '%n @ %/%R > '

-- some yb specifics...

\set       x 'explain ( analyze, dist ) '
\set     cnt 'select count (*) from ' 
\set tblinfo 'select oid, num_tablets as tblts, is_colocated as col, relname from ybx_tblinfo '
\set servers 'select * from yb_servers () order by host ;'

\set     who '\\i who.sql ' 

-- make an extra effort for the prompt..
\t
\o a.out

select '\set PROMPT1 '' %n @ %/ @ '
|| setting
|| ' %R> '' '
FROM pg_settings
WHERE name='listen_addresses';

\o
\t

\i a.out

\echo  your dflt directiry is ; \! pwd 

select host, num_connections, zone, uuid from yb_servers () order by host;

select 'this was .psqlrc from ~pdvbv' as which_rc_was_this; 


\! echo . 


