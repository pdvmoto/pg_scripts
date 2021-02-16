

select current_database()

-- max values ev_history
select 
  current_database() as databse
,  max( id )  as max_id
, to_char ( max (id) * 50.0 / ( 1024 * 1024 * 1024 ), '999,00' )  perc_int_id
, max (update_seq) max_upd_seq  
, to_char ( max (update_seq) * 50.0 / ( 1024 * 1024 * 1024 ), '999,99' )  perc_int_upd_seq  
from event_history ; 

-- last 5 events, optimizer doesnt do >= well, so enumerated... 
with mx as ( select max (id) as id from event_history ) 
select ev.id, update_seq, event_date, userid, event_type
from event_history ev, mx
where ev.id in  ( mx.id, mx.id-1, mx.id-2, mx.id-3, mx.id-4 ) 
order by ev.id
;

-- tk-portal, batch job execution
with mx as ( select max ( job_execution_id )  as id from batch_job_execution )
select bj.job_execution_id, bj.end_time, bj.status 
from batch_job_execution bj, mx
where job_execution_id in  ( mx.id, mx.id-1, mx.id-2, mx.id-3, mx.id-4 ) ; 

-- select ( 1024 * 1024 * 1024 ) as maxinteger ; 

/* 
-- perc of max integer value
 select id
, (1024 * 1024 * 1024) as maxint_half
, to_char ( id * 50.0 / (1024 * 1024 * 1024), '999.99' ) as perc_int
, update_seq
, event_date, userid, event_type
from event_history
where id =  (select max (id)    from event_history )
;

/*** 

sudo su - postgres
cd /tmp
psql -c '\l'
pg_dump -d sourcebox -s > /tmp/sourcebox.dmp ; sum /tmp/sourcebox.dmp
pg_dump -d carerix -s > /tmp/carerix.dmp ; sum /tmp/carerix.dmp
pg_dump -d connexys -s > /tmp/connexys.dmp ; sum /tmp/connexys.dmp
pg_dump -d match -s > /tmp/match.dmp ; sum /tmp/match.dmp
pg_dump -d smartrecruiters_sourcebox -s > /tmp/smartrecruiters_sourcebox.dmp ; sum /tmp/smartrecruiters_sourcebox.dmp
pg_dump -d tangram -s > /tmp/tangram.dmp ; sum /tmp/tangram.dmp
pg_dump -d tkportal_production -s > /tmp/tkportal_production.dmp ; sum /tmp/tkportal_production.dmp

-- select all databases, 
-- and try to list ouput..

***/


-- generate commands to output listing to /tmp/<dbname>.*
with n as ( 
select datname                           as dn
     , '/tmp/' || datname || '_info.txt' as fn
     , '/tmp/' || datname || '.dmp'      as dmpnm
from pg_database where datistemplate = false
)
SELECT 
-- datname , 
 '\c ' || dn || '; \o ' || fn || ' \d ; \du ; ' as cmd
FROM n
order by dn;

-- generate dmp, and checksum

with n as ( 
select datname                           as dn
     , '/tmp/' || datname || '_info.txt' as fn
     , '/tmp/' || datname || '.dmp'      as dmpnm
from pg_database where datistemplate = false
)
select 
 ' pg_dump -d '|| dn || ' -s > ' || dmpnm  || ' ; sum ' || dmpnm || ' ; '  as cmd
from n
order by dn; 

*/


