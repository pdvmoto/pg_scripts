/* 

file: mk_ybcron.sql

purpose: install cron in yugabyte, and schedule 1 test job

dependency: ybx_log

todo: 
 - sleep for x seconds, dflt 1, consider wrapping function with arg1=sleep

 * ***************** */


-- activate cron if present (check ybflag settings)
create extension pg_cron ; 
grant usage on schema cron to yugabyte ;

CREATE OR REPLACE FUNCTION ybx_testcron( sleep_sec integer default 0  )
  RETURNS bigint
  LANGUAGE plpgsql
AS $$
DECLARE
  start_dt      timestamp         := clock_timestamp();
  end_dt        timestamp         := now() ;
  hostnm        text              := ybx_get_host() ;
  duration_ms   double precision  := 0.0 ;
  nr_rec_processed bigint         := 0 ;
  retval        bigint            := 0 ;
  cmmnt_txt     text              := 'Event found ' ;
  discard_txt   text              := '' ; -- needed a retval for pg_sleep
BEGIN

cmmnt_txt := 'tst cron on: ' || hostnm
                 || ', at: ' || start_dt::text ;

select pg_sleep ( sleep_sec ) into discard_txt ;

duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;

insert into ybx_log ( logged_dt, host,   component,      ela_ms,      info_txt )
       select clock_timestamp(), hostnm, 'ybx_testcron', duration_ms, cmmnt_txt ;

-- end of fucntion.., re-determine duration?

duration_ms := EXTRACT ( MILLISECONDS from ( clock_timestamp() - start_dt ) ) ;
return trunc ( duration_ms ) ;

END; -- ybx_testcron, to incrementally populate table
$$
;

-- check, find results in ybx_log
select ybx_testcron ( 1 )  ;

-- schedule a test job..
select cron.schedule ('* * * * *', $$ select ybx_testcron(); $$) ;

-- schedule the logging of tab-sizes
select cron.schedule ('*/4 * * * *', $$ select ybx_get_tablog(); $$) ;

select * from cron.job;

