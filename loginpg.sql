-- set prompt  to know "where we are"
\set PROMPT1 '%n @ %/%R > '

-- original above 

select format('%s.%s.%s',yb_server_cloud(),yb_server_region(),yb_server_zone()) as zone \gset \\ \set PROMPT1 :zone ' : %n @ %/%R% > '

-- \set PROMPT1 '%M %n @ %/%R%[%033[0m%]%# '

-- optinally: inet_server_addr()

select 'to psql' welcome ; 

\echo  your dflt directory is ; \! pwd 

\echo .

