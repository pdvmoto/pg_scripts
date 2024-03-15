/* 

file : demo_yb_tables.sql: how how multiple tables with same name cause confusion

Situation: multiple schemas with same tablename, how to find tableid and tablets.

I have several schemas in a database, e.g schema1 and schema2
with each schema containing similar test-tables, schema1.t01 and schema2.t01

Question to YB: how do I link the combination of a database(namespace) + schema + table 
to the yugabyte properties of table-id and the tablets belonging to that table? 

When using yb-admin, I have two options: list_tables and list_tables_with_db_types,
and I can see there are several tables named t01 in yugabyte and other databases, but no info about the schemax

How can I link the table from a given schema (schema1.t01, schema2.t01) to a particular tableid (and to tablets) ?

note: my current workaround is to put each schema in a separate database, but that way a single connection can never work with two schemas (when identical tablenames are involved)?


how:
 - create extra databases: yb_coloc, yb_scott (plus existing yugabyte, that makes 3 databases)
 - create extra schemas: scott, demo_schema (plus existing yugabyte, public)
 - create table t01 in each schema in each database
 - query pg_tables
 - list table info form yb-admin
 - list tablets for each table using yb-admin

*/


\echo connect to various databases and list tables t01

\c db_scott1 

select current_database();
select * from pg_tables where tablename like 't01%' order by schemaname, tablename, tableowner;

\c yb_coloc

select current_database();
select * from pg_tables where tablename like 't01%' order by schemaname, tablename, tableowner;

\c yugabyte

select current_database();
select * from pg_tables where tablename like 't01%' order by schemaname, tablename, tableowner;

\echo now use yb-admin to list tables and tablets...

\! yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type  | grep t01  | sort

\! yb-admin -master_addresses $MASTERS list_tables_with_db_types | grep t01 | sort

