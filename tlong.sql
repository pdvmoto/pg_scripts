
\timing on

with /* long1 */ 
  s1 as ( select id, substring ( payload from 100 for 3 )  as sub from t_rnd )
, s2 as ( select id, substring ( payload from 900 for 3 )  as sub from t_rnd )
, s3 as ( select id, substring ( payload from 500 for 3 )  as sub from t_rnd )
select s1.id, s2.id , s3.id 
from s1, s2, s3
where s1.sub = s2.sub
  and s2.sub = s3.sub
  and s3.id < 10000 
  and s2.id < 10000 
order by  s3.sub
 ;

\timing off


