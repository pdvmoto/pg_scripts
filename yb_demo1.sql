
-- demonstrate very simple sql, timing and explain:

\timing
\set ECHO all

select * from region;
select * from region where region_id = 2;
select * from region where region_description like 'We%';

\set ECHO none

\timing 

\! read -p "Three selects, check timing, and let me Explain..." abc

\set ECHO all

--                      select * from region;
explain (analyze, dist) select * from region;

--                      select * from region where region_id = 2;
explain (analyze, dist) select * from region where region_id = 2;

--                      select * from region where region_description like 'We%';
explain (analyze, dist) select * from region where region_description like 'We%';

-- show tablets...
select relname, num_tablets from ybx_tblinfo where relname like 'regio%';

\set ECHO none

\! read -p "check the storage-read calls..." abc





