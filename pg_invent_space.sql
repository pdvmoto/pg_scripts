/*==============================================================================
 * Filename    : PostgreSQLInventory_Space.psql
 * Type        :
 * Keywords    :
 *==============================================================================
 * Author      : Celia Muriel
 * Version     : 0.1
 * Date        : 2019-11-08
 *==============================================================================
 * Purpose     : List database, schemas and objects, and calculate space
 *==============================================================================
 * Description of Workflow : As above
 * Logic :
 *  Comments : To run this file execute next command
 *             psql -d your_database_here -U your_username_here -W -f PostgreSQLInventory_Space.psql
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


\o PostgreSQLInventory_SpacePerDatabase.out
\qecho 'Total space per database. Databases to which the user cannot connect are sorted as if they were infinite size. This report shows them as No Access'
select d.datname as database_name
     , pg_catalog.pg_get_userbyid (d.datdba) as database_owner
     , case
        when pg_catalog.has_database_privilege(d.datname, 'CONNECT') then pg_catalog.pg_database_size(d.datname)
           else null
       end as space_bytes
  , case
        when pg_catalog.has_database_privilege(d.datname, 'CONNECT') then pg_catalog.pg_size_pretty(pg_catalog.pg_database_size(d.datname))
           else 'No Access'
       end as pretty_space
from pg_catalog.pg_database d
order by 3 desc;
\o


\o PostgreSQLInventory_TableSpace_DatabaseName.out
\qecho 'Detailed space per table. Space is shown for the table with all relations on it (toast and index), the space for indexes and toast tables, and just the table'
select oid
     , table_schema
     , table_name
     , total_bytes as total_table_bytes
     , pg_size_pretty(total_bytes) as pretty_total_table_space
     , index_bytes
     , pg_size_pretty(index_bytes) as pretty_index
     , toast_bytes
     , pg_size_pretty(toast_bytes) as pretty_toast
     , table_bytes
     , pg_size_pretty(table_bytes) as pretty_table
     , row_estimate
from (
          select *
               , (total_bytes - index_bytes - coalesce(toast_bytes, 0)) as table_bytes
          from (
                   select c.oid
                        , nspname as table_schema
                        , relname as table_name
                        , c.reltuples as row_estimate
                        , pg_total_relation_size(c.oid) as total_bytes
                        , pg_indexes_size(c.oid) as index_bytes
                        , pg_total_relation_size(reltoastrelid) as toast_bytes
                   from pg_catalog.pg_class c
                                left join pg_catalog.pg_namespace n
                                     on n.oid = c.relnamespace
                   where relkind = 'r'
               ) a
     ) a
order by 2 asc, 4 desc;
\o

