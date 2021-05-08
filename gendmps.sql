-- generate pg_dmp commands, checksum, and an info.txt file for each db.

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


