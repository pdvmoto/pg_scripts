/*==============================================================================
 * Filename    : PostgreSQLInventory_DDLs.psql
 * Type        :
 * Keywords    :
 *==============================================================================
 * Author      : Celia Muriel
 * Version     : 0.1
 * Date        : 2019-11-08
 *==============================================================================
 * Purpose     : Extract objects DDLs
 *==============================================================================
 * Description of Workflow : As above
 * Logic :
  *  Comments : To run this file execute next command
 *             psql -d your_database_here -U your_username_here -W -f PostgreSQLInventory_DDLs.psql
 *             You must use an user with access to all databases in the cluster
 *             Connect to each database in the cluster and run the code below
 *             Change the name of the output file with to add the name of the corresponding database
 *             https://celiamuriel.blogspot.com/2019/11/PostgreSQL-Database-Cluster-Inventory.html
 *==============================================================================
 * History
 *
 *  Date        Name                     Modifications
 *  ----------  -----------------------  ---------------------------------------
 *  2019-11-08  Celia Muriel             Initial Version
 *
 *============================================================================*/


\o PostgreSQLInventory_CreateDDLsQuery.sql
select '\d+ ' || n.nspname || '.' || c.relname as " "
from pg_catalog.pg_class c
            left join pg_catalog.pg_namespace n
                 on n.oid = c.relnamespace
order by 1;
\o


\o PostgreSQLInventory_DDLs.out
\ir PostgreSQLInventory_CreateDDLsQuery.sql
\o

