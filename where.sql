
select datname from pg_database ; 

\! hostname 

select current_database() as current_db, version() as version; 

-- colocation ?
SELECT yb_is_database_colocated() as colocation;
