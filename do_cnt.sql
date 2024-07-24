

-- do_cnt.sql: count all tables you can find...
-- and generate some io in doing it


select format('
 select count (*) as %1s from %1s
 ', tablename, tablename ) 
from pg_tables ; 
\gexec 

