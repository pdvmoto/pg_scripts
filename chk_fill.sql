
select 
        to_char (dt, 'YYYYMMDD HH24:MI')  as day
      , count (*)
from t 
where dt > ( current_date - 1::int  )  
group by to_char(dt, 'YYYYMMDD HH24:MI')
order by 1 ;

