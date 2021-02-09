
-- ==Postgresql data validation==


--Create the function in every database
create function
cnt_rows(schema text, tablename text) returns integer
as
$body$
declare
  result integer;
  query varchar;
begin
  query := 'SELECT count(1) FROM ' || schema || '.' || tablename;
  execute query into result;
  return result;
end;
$body$
language plpgsql;

--Run the copy select statement queries against those databases
COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/tkportal_de.csv' DELIMITER ',' CSV HEADER;

COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/match_de.csv' DELIMITER ',' CSV HEADER;

COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/search3match_de.csv' DELIMITER ',' CSV HEADER;


COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/tkportal_dedr.csv' DELIMITER ',' CSV HEADER;

COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/match_dedr.csv' DELIMITER ',' CSV HEADER;

COPY (select table_schema, table_name,
cnt_rows(table_schema, table_name)
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema') and table_name not in ('routing_SYNC_bckup')
and table_type='BASE TABLE' order by 3 desc) TO '/tmp/search3match_dedr.csv' DELIMITER ',' CSV HEADER;


