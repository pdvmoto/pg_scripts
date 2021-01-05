
/*==============================================================================
 * Filename    : PostgreSQLInventory_ClusterStructure.sql
 * Type        :
 * Keywords    :
 *==============================================================================
 * Author      : Celia Muriel
 * Version     : 0.1
 * Date        : 2019-11-08
 *==============================================================================
 * Purpose     : List of databases and schemas
 *==============================================================================
 * Description of Workflow : As above
 * Logic :
 *  Comments  : https://celiamuriel.blogspot.com/2019/11/PostgreSQL-Database-Cluster-Inventory.html
 *==============================================================================
 * History
 *
 *  Date        Name                     Modifications
 *  ----------  -----------------------  ---------------------------------------
 *  2019-11-08  Celia Muriel             Initial Version
 *
 *============================================================================*/


\o PostgreSQLInventory_Databases.out
\qecho 'List of databases'
select oid
     , datname as database_name
     , pg_catalog.pg_get_userbyid (datdba) as database_owner
     , encoding as char_encoding
     , datcollate
     , datctype
     , datistemplate as is_database_template
     , datallowconn as can_connect
     , datconnlimit as max_number_concurrent_connections
     , dattablespace as default_tablespace
     , datacl as access_privileges
from pg_catalog.pg_database
order by 2;

\o


\o PostgreSQLInventory_Schemas.out
\qecho 'List of schemas'
select  oid
      , nspname as schema_name
   , pg_catalog.pg_get_userbyid (nspowner) as schema_owner
from pg_catalog.pg_namespace
order by 2;

\o


\o PostgreSQLInventory_ForeignServers.out
\qecho 'List of foreign servers'
\des+
\o
