/*==============================================================================
 * Filename    : PostgreSQLInventory_Rights.sql
 * Type        :
 * Keywords    :
 *==============================================================================
 * Author      : Celia Muriel
 * Version     : 0.1
 * Date        : 2019-11-08
 *==============================================================================
 * Purpose     : List users, roles and permissions
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


\o PostgreSQLInventory_Users.out
\qecho 'Users'
select usename
     , usesysid as user_id
     , case when usesuper and usecreatedb then cast('superuser, create database' as pg_catalog.text)
            when usesuper then cast ('superuser' as pg_catalog.text)
            when usecreatedb then cast ('create database' as pg_catalog.text)
            else cast('' as pg_catalog.text)
       end as "attributes"
from pg_catalog.pg_user
order by 1;
\o


\o PostgreSQLInventory_Roles.out

-- select r.rolname as role_name
--      , r.oid as roleid
--   , m.member
--   , m.grantor
--   , m.admin_option as can_grant_role_membership
--      , r.rolsuper as role_superuser
--   , r.rolinherit
--   , r.rolcreaterole
--   , r.rolcreatedb
--   , r.rolcanlogin
--   , r.rolconnlimit as max_number_concurrent_connections
--   , r.rolreplication as role_for_backups
-- from pg_catalog.pg_roles as r
--      left join pg_catalog.pg_auth_members as m on r.oid = m.roleid
-- order by 1;

\qecho 'Roles'
select r.rolname as role_name
     , r.oid as roleid
  , rm.rolname as member_name
  , rg.rolname as grantor_name
  , m.admin_option as can_grant_role_membership
     , r.rolsuper as role_superuser
  , r.rolinherit
  , r.rolcreaterole
  , r.rolcreatedb
  , r.rolcanlogin
  , r.rolconnlimit as max_number_concurrent_connections
  , r.rolreplication as role_for_backups
from pg_catalog.pg_roles as r
     left join pg_catalog.pg_auth_members as m on r.oid = m.roleid
  left join pg_catalog.pg_roles as rm on rm.oid = m.member
  left join pg_catalog.pg_roles as rg on rg.oid = m.grantor
order by 1;
\o



\o PostgreSQLInventory_RoleSettings.out
\qecho 'Role Settings'
select r.rolname as role_name
     , r.rolsuper as role_superuser
  , r.rolinherit
  , r.rolcreaterole
  , r.rolcreatedb
  , r.rolcanlogin
  , r.rolconnlimit as max_number_concurrent_connections
  , r.rolreplication as role_for_backups
  , d.datname as database_name
  , rs.setconfig
from pg_catalog.pg_db_role_setting rs
     left join pg_catalog.pg_roles      r on r.oid = rs.setrole
     left join pg_catalog.pg_database   d on d.oid = rs.setdatabase
order by 1;
\o


