/** 
with points as (
  select 
    --  '(1,1)'::point as p1
    --  ,'(2,2)'::point as p2
      point (1,1) as p1
    , point (2,2) as p2
)
select 
  ((p1 <@> p2) * 1609.34::double precision) as d1
  ,(earth_distance(ll_to_earth(p1[1], p1[0]), ll_to_earth(p2[1], p2[0]))) as d2
from points
*/

-- kiekkaste: 53.237010, 7.207045
-- zw vl : 51.276782, 3.377383 
 
select 
   (   point( 53.2370, 7.207)
   <@> point (51.2767, 3.3773) ) / 1000                     as d1_kiek_zwvl
 , earth_distance ( ll_to_earth( 53.2370, 7.207)
                   , ll_to_earth(51.2767, 3.3773) ) / 1000  as d2_kiek_zwvl
;

select 
   (   point( 51.0, 5.0)
   <@> point (52.0, 5.0) ) / 1000                     as d1_1degrn
 , earth_distance ( ll_to_earth( 51.0, 5.0)
                   , ll_to_earth(52.0, 5.0) ) / 1000  as d2_1degrn
;

with ll as ( 
select 51.0 as lon1, 5.0 as lat1
     , 51.0 as lon2, 6.0 as lat2 
)
select ll.*
, (    point ( lon1, lat1 )
   <@> point ( lon2, lat2 ) ) / 1000                     as d1_1degr_east
 , earth_distance (  ll_to_earth ( lon1, lat1 )
                   , ll_to_earth ( lon2, lat2 ) ) / 1000  as d2_1degr_east
from ll;

-- compare some known distances, halfway round.
-- check on what is N-S (lat, 0-90) and what is EW (long, 0-180)
select 
     (    point (   0.0,  0.0 )
     <@>  point ( 180.0,  0.0 ) ) * 1609.34 / 1000          as d1_half_earth
   , earth_distance (  ll_to_earth(   0.0,  0.0 )
                     , ll_to_earth( 180.0,  0.0 ) ) / 1000 as d2_half_earth
;


-- combine coordinates for a route.
select r.rte_id 
  -- , f.loc_id, t.loc_id
  -- , f.lat_degr, f.lon_degr
  -- , t.lat_degr, t.lon_degr
     , f.city, t.city
--     , ((p1 <@> p2) * 1609.34::double precision) as d1
  ,    (   point (f.lon_degr, f.lat_degr) 
       <@> point (t.lon_degr, t.lat_degr) 
       )  as d1
  , earth_distance ( ll_to_earth(f.lat_degr, f.lon_degr)
                   , ll_to_earth(t.lat_degr, t.lon_degr)
                   ) / 1000  as d2
from fl_rtes r
   , fl_lctn f
   , fl_lctn t
where r.fr_loc_id = f.loc_id
  and r.to_loc_id = t.loc_id
  and f.city is not null
order by r.rte_id desc
limit 10
 ;
