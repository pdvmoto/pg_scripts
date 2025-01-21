
ysqlsh -h localhost -p 5433 -U yugabyte -X <<EOF

select query from ybx_qury_mst where queryid = $1 ;

EOF

