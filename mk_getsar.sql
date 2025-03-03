
-- getsar.sql: table and script to hold sar-data, first just cpu. 

-- endless loop: collect 3min of sar, then insert it, and re-loop
-- temp table to slurp the data, with log_host as ID-field for the moment
-- then split, add date-part, and insert into real table


-- the slurp-table
create temporary table pg_sar ( 
  id          bigint primary key generated always as identity 
, log_dt      timestamptz default now()
, host    text    
, slurp       text -- just a line of sar-data, separated by |
) ;

-- drop table ybx_sarh_log ;
create  table ybx_sarh_log (
  id          bigint primary key generated always as identity 
, host        text            not null      default ybx_get_host()    -- do we need a fk?
, sar_dt      timestamptz     not null      -- must provide!
, cpu_user    float
, cpu_nice    float
, cpu_system  float
, cpu_iowait  float
, cpu_steal   float
, cpu_idle    float
) ; 





