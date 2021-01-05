
-- this is more like it
select 'overview of databases';

SELECT d.datname AS Name
    ,  pg_catalog.pg_get_userbyid(d.datdba) AS Owner
    ,  CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
        THEN pg_catalog.pg_size_pretty(pg_catalog.pg_database_size(d.datname))
        ELSE 'No Access'
    END AS SIZE
FROM pg_catalog.pg_database d
    ORDER BY
    CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
        THEN pg_catalog.pg_database_size(d.datname)
        ELSE NULL
    END DESC -- nulls first
    -- LIMIT 20
;

-- and simple variety..
select d.datname 
    , pg_catalog.pg_database_size ( d.datname ) / 1024 as kb  
from  pg_catalog.pg_database d;

-- total size on disk
select 'total Mb ' as total_mb 
    , sum ( pg_catalog.pg_database_size ( datname ) / ( 1024 * 1024 )  ) as mb  
from  pg_catalog.pg_database
;


-- total size on disk


-- list per object..
-- note this was some copy paste of some www sql..
SELECT  table_schema, table_name 
    , pg_size_pretty(total_bytes) AS total
    , pg_size_pretty(index_bytes) AS INDEX
    , pg_size_pretty(toast_bytes) AS toast
    , pg_size_pretty(table_bytes) AS TABLE
  FROM (
  SELECT *, total_bytes-index_bytes-COALESCE(toast_bytes,0) AS table_bytes FROM (
      SELECT c.oid,nspname AS table_schema, relname AS TABLE_NAME
              , c.reltuples AS row_estimate
              , pg_total_relation_size(c.oid) AS total_bytes
              , pg_indexes_size(c.oid) AS index_bytes
              , pg_total_relation_size(reltoastrelid) AS toast_bytes
          FROM pg_class c
          LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
          WHERE relkind = 'r'
  ) a
) a;

