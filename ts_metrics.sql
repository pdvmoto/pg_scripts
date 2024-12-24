
select 
  uuid
, status
, error
, metrics::json->>'cpu_usage_system'  cpu_usage_system 
, metrics::json->>'cpu_usage_system'  cpu_usage_user 
, metrics::json->>'cpu_usage_system'  memory_total 
, metrics::json->>'cpu_usage_system'  memory_free 
, metrics::json->>'cpu_usage_system'  memory_available 
, metrics::json->>'cpu_usage_system'  tserver_root_memory_limit 
, metrics::json->>'cpu_usage_system'  tserver_root_memory_soft_limit 
, metrics::json->>'cpu_usage_system'  tserver_root_memory_consumption 
, pg_catalog.yb_mem_usage () /* not per node, better per individual sample */
from yb_servers_metrics () ;

