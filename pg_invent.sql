
/*==============================================================================
 * Filename    : PostgreSQLInventory.psql
 * Type        :
 * Keywords    :
 *==============================================================================
 * Author      : Celia Muriel
 * Version     : 0.1
 * Date        : 2019-11-08
 *==============================================================================
 * Purpose     : psql script to trigger all other scripts to collect PostgreSQL
 *               data
 *==============================================================================
 * Description of Workflow : As above
 * Logic :
 *  Comments : To run this file execute next command
 *             psql -d your_database_here -U your_username_here -W -f PostgreSQLInventory.psql
 *             You must use an user with access to all databases in the cluster
 *             to get all the information
 *             https://celiamuriel.blogspot.com/2019/11/PostgreSQL-Database-Cluster-Inventory.html
 *==============================================================================
 * History
 *
 *  Date        Name                     Modifications
 *  ----------  -----------------------  ---------------------------------------
 *  2019-11-08  Celia Muriel             Initial Version
 *
 *============================================================================*/

\set QUIET 1

-- Turn on the expanded table formatting mode
\x auto

\set VERBOSITY verbose
\set ON_ERROR_ROLLBACK on

-- Show SQL statement execution time in milliseconds
\timing

-- Do not limit paging
\pset pager off

-- Sets the string to be printed in place of a null value. The default is to print nothing
\pset null '(null)'

-- \pset linestyle unicode

-- No border
\pset border 0

-- Writes all columns of a row on one line, separated by the currently active field separator |
-- --> To use the output as input to other program or application, as Excel
-- \pset format unaligned

-- Human-readable table
\pset format aligned


-- Logging

-- Use a separate history file per-database.
-- \set HISTFILE ~/.psql_history- :DBNAME

-- If a command is run more than once in a row, only store it once in the history
-- \set HISTCONTROL ignoredups


-- Autocomplete keywords (like select) in lower-case, even if you started typing them in lower case
\set COMP_KEYWORD_CASE lower

\ir pg_invent_space.sql
\ir pg_invent_cluster.sql
\ir pg_invent_rights.sql



\unset QUIET

