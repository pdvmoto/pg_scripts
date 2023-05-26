
-- use this if a .psqlrc is allowed/needed

-- set prompt  to know "where we are"
-- \set PROMPT1 '%n @ %/%R> '

-- experiment
\set PROMPT1 '%n @ %/ @ %m  %R> '

\! echo . 

-- optinally: inet_server_addr()

select 'welcome to psql' ; 

\! echo . 

\echo  your dflt directiry is ; \! pwd 

\echo .

