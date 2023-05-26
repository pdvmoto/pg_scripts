
-- remote cluster
 ysqlsh  -h eu-central-1.abac8100-dbf8-48fa-bd0f-649187a45560.aws.ybdb.io  -p 5433 -U admin

b7q9zQfvKA-DkYc0rYNo2NMZtUrtvg


new cluster 23 Jan 2023.

ysqlsh -h eu-west-3.23468bfd-9881-4bcb-9f17-af7f0f9be24d.aws.ybdb.io -p 54343 -U admin

avAW_yU1dvrqENG3dKeZpoQ8GOBLNH

- doesnt work ?
ysqlsh host=eu-west-3.23468bfd-9881-4bcb-9f17-af7f0f9be24d.aws.ybdb.io \
user=admin \
dbname=yugabyte \
sslmode=verify-full \
sslrootcert=pdvbv_yb_cert.crt

but this works:
ysqlsh -h eu-west-3.23468bfd-9881-4bcb-9f17-af7f0f9be24d.aws.ybdb.io -p 5433 -U admin -d yugabyte 


