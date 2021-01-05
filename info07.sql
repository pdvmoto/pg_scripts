
-- list various settings of postgres

select 'show the pg_settings';

select name
     , left ( setting, 40) as setting 
     -- , left ( source, 5) as src
     , left ( CASE source WHEN 'default' THEN '.' WHEN 'client' THEN '-Clie' ELSE source END, 5 ) as src
from pg_settings 
order by name ; 

\prompt 'Press enter to continue...' petco

select 'show the pg_config';

select name, left ( setting, 60 ) as setting  
from pg_config  
order by name ; 

\prompt 'Press enter to continue...' petco

show all ;

