
-- check table t, ranges.


select range_id, table_id, table_name, trunc (range_size/(1024*1024))  mb
, lease_holder,  voting_replicas
--, rn.* 
from crdb_internal."ranges" rn
where rn.table_name = 't';

