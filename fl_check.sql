/*
  fl_check.sql: run checs on fl-data, preferably report and correct in source data

*/

-- find empty fields...
select s.seq_id line_with_possible_error
-- , '['|| s.hiding_date_vc || ']', length ( hiding_date_vc)
-- ,  s.* 
from fl_stag s
where ( length ( hiding_date_vc) < 9 
     or length ( finder_date_vc) < 9 
     or length ( hiding_rider) < 1 
     or length ( finder_rider) < 1 
     or false)
order by seq_id ; 

-- find outliers in coord.
select seq_id line_w_poss_vc_error
, hiding_date, hiding_rider, lat_degr, lon_degr
from fl_stag
where lat_degr > 55
   or lon_degr > 7.3
   or lat_degr < 50
   or lon_degr < 3  
   or lat_degr is null or lon_degr is null ;



-- insert riders, for next check
insert into fl_rdrs (rider_id, rider_name)
select nextval ( 'fl_rdrs_seq' ), rider_name from fl_v_rider_names
where rider_name not in ( select rider_name from fl_rdrs ) ;

-- list all riders, check for doubles.
select rider_id, rider_name  from fl_rdrs order by upper ( rider_name) ;

select * from fl_v_rdrs_problems ; 

-- convert + update dates, chk errors, if correct date fmt..
update fl_stag set
  hiding_date = to_date ( hiding_date_vc, 'dd-mm-yyyy' )
, finder_date = to_date ( finder_date_vc, 'dd-mm-yyyy' ) 
where  1=1 
  and length ( hiding_date_vc ) > 8
  and length ( finder_date_vc ) > 8
;

-- create the locations.
-- note that the seq_id from soure data is the key for loc_id, and contains implicit ordering.
insert into fl_lctn
     ( loc_id, fles_id
     , hiding_id, hiding_date
     , finder_id, finder_date
     , lat_degr, lon_degr, loc_desc, city, prov )
select seq_id, 1                                      -- dflt fles =>1
     , h.rider_id, s.hiding_date 
     , f.rider_id, s.finder_date
     , s.lat_degr, s.lon_degr, s.loc_desc, s.city, s.prov
from fl_stag s
   , fl_rdrs h
   , fl_rdrs f
where 1=1
  and h.rider_name = s.hiding_rider
  and f.rider_name = s.finder_rider
  and s.hiding_date is not null
  and s.lat_degr    is not null ;

-- create the routes .. might be better way to do this?
insert into fl_rtes ( rte_id, fr_loc_id, to_loc_id ,fles_id
                    , rider_id, fr_earth, to_earth
)
select nextval ( 'fl_rtes_seq' ) as rte_id
, rv.fr_loc_id
, rv.to_loc_id
, tl.fles_id
, tl.hiding_id  -- rider that went to hide it at destination...
-- , tl.distance   -- consider fetching distance from fl_stag stageing table
, ll_to_earth (fl.lat_degr, fl.lon_degr )
, ll_to_earth (tl.lat_degr, tl.lon_degr )
from fl_view_mk_routes rv
   , fl_lctn fl
   , fl_lctn tl
where 1=1
  and rv.fr_loc_id = fl.loc_id
  and rv.to_loc_id = tl.loc_id ;


