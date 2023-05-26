

--
-- create a table to hold seqence info

create table fix_2061 as 
select sequence_name::text
, start_value::integer
, increment::integer 
, start_value::integer as last_value 
from information_schema.sequences ;


\o abc.out

-- generate the updates to fill last_value
-- either use \o or paus script + copy
select 'update fix_2061 set last_value = ' 
|| ' ( select last_value from ' || sequence_name || ')'
|| ' where sequence_name = '''  || sequence_name || ''' ; '
from  fix_2061 
order by sequence_name;

\o

\! vi abc.out

-- 
-- fetch the last_values..
select ' copy paste from abc.out to update last values...' ; 

-- compare last_values to max_integer
select sequence_name, last_value 
, to_char ( 100.0 * last_value / ( 2147483647.0 ), '999.00')  as perc_maxint
from fix_2061 order by sequence_name; 

-- cleanup
drop table fix_2061 ; 





/*

-- upd_seq 675769413
select * from event_history
where  userid = 332
and    update_seq > 675769413  ; 


*/



