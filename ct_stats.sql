
CREATE OR REPLACE FUNCTION get_listen_addresses()
RETURNS TEXT AS $$
DECLARE
    listen_addresses TEXT;
BEGIN
    SELECT setting INTO listen_addresses
    FROM pg_settings
    WHERE name = 'listen_addresses';
    
    RETURN listen_addresses;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_host()
RETURNS TEXT AS $$
    SELECT setting
    FROM pg_settings
    WHERE name = 'listen_addresses';
$$ LANGUAGE sql;

-- DROP TABLE public.ybx_statements;

CREATE TABLE ybx_statements (
    host  text  not null
	userid oid NULL,
	dbid oid NULL,
	queryid int8 NULL,
	query text NULL,
	calls int8 NULL,
	total_time float8 NULL,
	min_time float8 NULL,
	max_time float8 NULL,
	mean_time float8 NULL,
	stddev_time float8 NULL,
	"rows" int8 NULL,
	shared_blks_hit int8 NULL,
	shared_blks_read int8 NULL,
	shared_blks_dirtied int8 NULL,
	shared_blks_written int8 NULL,
	local_blks_hit int8 NULL,
	local_blks_read int8 NULL,
	local_blks_dirtied int8 NULL,
	local_blks_written int8 NULL,
	temp_blks_read int8 NULL,
	temp_blks_written int8 NULL,
	blk_read_time float8 NULL,
	blk_write_time float8 NULL,
	yb_latency_histogram jsonb NULL
);
