
select 
        to_char (dt, 'YYYYMMDD HH24:MI')  as day
      , count (*) cnt_p_min
from t 
where dt > ( current_date - 1::int  )  
group by to_char(dt, 'YYYYMMDD HH24:MI')
order by 1 ;

with t_seconds as ( select id
                       , dt 
                       , ( to_char ( dt, 'SSSS' ) )::bigint        as secs
                       , 1000 * ( to_char ( dt, 'SSSS' ) )::bigint 
                         + to_char ( dt, 'MS' )::int               as msecs
                       , substr ( filler, 1, 50 )                  as filler
                    from t
)
select id
     , to_char ( dt, 'HH24:MI:SS.MS' )  as timestmp
--   , secs, msecs
--   , secs -  LAG  (  secs, 1 ) OVER w as sec_diff
     , msecs - LAG  ( msecs, 1 ) OVER w as msec_diff
     , filler
from t_seconds
window w as ( order by id ) 
order by id desc ;

