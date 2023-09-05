
select datname from pg_database ; 

\! hostname 

select current_database() as current_db, version() as version; 

-- colocation ?
SELECT yb_is_database_colocated() as colocation;

-- where am i
 SELECT boot_val,reset_val listen_addresses
FROM pg_settings
WHERE name='listen_addresses';

select host, num_connections, zone, uuid from yb_servers () order by host; 

