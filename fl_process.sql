/*

  fl_process: 
    1) run data-checks and 
    2) copy data from fl_stag to riders, locations, and routes.
    3) generate output (previous k.sql)

*/

-- create rider-records.. 
-- maybe add info later: earliers.. and nr-routes
-- optional: try ordering by earliers..
insert into fl_rdrs (rider_id, rider_name)
select nextval ( 'fl_rdrs_seq' ), rider_name from fl_v_rider_names
where rider_name not in ( select rider_name from fl_rdrs ) ;


-- update date-fields in fl_stag, mind the errors
update fl_stag 
set hiding_date = hiding_date_vc::date
  , finder_date = finder_date_vc::date
where  f_isdate ( hiding_date_vc ) 
  and  f_isdate ( finder_date_vc ); 


-- insert routes
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



-- -- -- k.sql -- -- 


-- suppress informational output (quiet), use unaligned mode, output tuples only, suppress psqlrc reading.
--
-- notes: KML is case sensitive ????

\o aalocs.kml

\pset tuples_only on
\pset format unaligned
\set QUIET on
\set ROW_COUNT off

-- top of kml file
select '<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.0"> <Document>
' as top_of_kml_file ; 

With cr as (select /*chr(13)||*/ chr(10) lf ) 
 select 
    '<Placemark>' || cr.lf
 || '  <name>loc: ' || l.loc_id || ', ' || city || '  </name>' || cr.lf 
 || '  <description> ' || l.loc_desc  || cr.lf
 ||                     ' hid: (' || hiding_id || ')' || cr.lf
 ||                     ' dd: '   || to_char (hiding_date, 'YYYY-Mon-DD' ) || cr.lf
 || '  </description>'  || cr.lf
 || '  <Point>'   || cr.lf
 || '    <coordinates>' || l.lon_degr || ', '||  l.lat_degr || ',0.1 ' || '</coordinates>' || cr.lf
 || '  </Point>' || cr.lf
 || '</Placemark>' as location_placemarks
--,  l.* 
from fl_lctn l
, cr 
order by loc_id  
limit 100 ; 

-- end of kml file
select '</Document> </kml>' as end_of_kml_file; 

\o

\echo .
\echo check dat in file aalocs.kml
\echo .

\! ls -l aa*.kml

\echo .




