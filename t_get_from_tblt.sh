
ysqlsh -h localhost -p 5433 -U yugabyte -X <<EOF

select namespace_name, ysql_schema_name, table_name 
from ybx_tblt_mst 
where tblt_uuid = '$1'::uuid ;

EOF

