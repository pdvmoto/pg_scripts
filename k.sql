
-- suppress informational output (quiet), use unaligned mode, output tuples only, suppress psqlrc reading.
--
-- notes: KML is case sensitive ????

\echo creating fl_f_loc_pmk, placemark for location

CREATE OR REPLACE FUNCTION fl_f_loc_pmk ( p_loc_id integer )
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
  sql_stmnt TEXT;
  n_cnt BIGINT := 0 ;
  txt_out TEXT := '';
BEGIN

  With cr as (select /*chr(13)||*/ chr(10) lf )
   select
      '<Placemark>' || cr.lf
   || '  <name>loc: ' || l.loc_id || ', ' || city || '  </name>' || cr.lf
   || '  <description> ' || l.loc_desc  || cr.lf
   ||                     ' hid: ' || l.hiding_name || ' ('|| l.hiding_id || ')' || cr.lf
   ||                     ' dd: '  || to_char (hiding_date, 'YYYY-Mon-DD' )     || cr.lf
   ||                     ' fnd: ' || l.finder_name || ' ('|| l.finder_id || ')' || cr.lf
   ||                     ' dd: '  || to_char (l.finder_date, 'YYYY-Mon-DD' )   || cr.lf
   || '  </description>'  || cr.lf
   || '  <Point>'   || cr.lf
   || '    <coordinates>' || l.lon_degr || ', '||  l.lat_degr || ',0.1 ' || '</coordinates>' || cr.lf
   || '  </Point>' || cr.lf
   || '</Placemark>' as location_placemark
  --,  l.*
  into txt_out
  from fl_v_lctn_info l
     , cr
  where 1=1 /* add criteria later */
    and l.loc_id = p_loc_id ;

  -- RAISE NOTICE 'fl_f_plcmrk_loc : error creating placemark for loc_id [%] ', p_loc_id ;

  RETURN txt_out ;

END;
$function$
;

\echo creating fl_f_lin_pmk, placemark for line

-- placemark for line: include rider, distance, date, destination
-- later: more elaborate function to display 1 line + 2 locations, 
-- or just draw extra plcmmrks.
CREATE OR REPLACE FUNCTION fl_f_lin_pmk ( p_lin_id integer )
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
  sql_stmnt TEXT;
  n_cnt BIGINT := 0 ;
  txt_out TEXT := '';
BEGIN

  -- note: we can remove a lot of cr-lf once syntax is OK

  With cr as (select /*chr(13)||*/ chr(10) lf )
   select
      '<Placemark>' || cr.lf
   || '  <name> ' || rd.rider_name || ', to: ' || city || '  </name>' || cr.lf
   || '  <description> '                          || cr.lf
   ||       'dist: ' || r.dist_sdo || ' km'       || cr.lf
   ||       '  dd: ' || l.hiding_date             || cr.lf
   ||       'r_id: ' || r.rte_id                  || cr.lf
   || '  </description> '                         || cr.lf
   || '  <LineString> <coordinates> '                         || cr.lf
   ||      r.fr_lon_degr || ', ' ||  r.fr_lat_degr || ', 0.1' || cr.lf 
   ||      r.to_lon_degr || ', ' ||  r.to_lat_degr || ', 0.1' || cr.lf 
   || '  </coordinates> </LineString>'                        || cr.lf
   || '</Placemark>' as location_placemark
   --,  r.*
  into txt_out
  from fl_v_rte_info r
     , fl_rdrs       rd
     , fl_lctn       l
     , cr
  where 1=1
    and r.rider_id    = rd.rider_id
    and r.loc_to_id   = l.loc_id
    and r.rte_id      = p_lin_id
  order by r.loc_to_id ; 
  -- in case of muliple, the loc-id is implicit ordering! 

  -- RAISE NOTICE 'fl_f_lin_pmk : error creating placemark for line_id [%] ', p_lin_id ;

  RETURN txt_out ;

END;
$function$
;

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
 ||                     ' hid: ' || l.hiding_name || ' ('|| l.hiding_id || ')' || cr.lf
 ||                     ' dd: '  || to_char (hiding_date, 'YYYY-Mon-DD' )     || cr.lf
 ||                     ' fnd: ' || l.finder_name || ' ('|| l.finder_id || ')' || cr.lf
 ||                     ' dd: '  || to_char (l.finder_date, 'YYYY-Mon-DD' )   || cr.lf
 || '  </description>'  || cr.lf
 || '  <Point>'   || cr.lf
 || '    <coordinates>' || l.lon_degr || ', '||  l.lat_degr || ',0.1 ' || '</coordinates>' || cr.lf
 || '  </Point>' || cr.lf
 || '</Placemark>' as location_placemarks
--,  l.* 
from fl_v_lctn_info l
   , cr 
where 1=1 /* add criteria later */
order by l.loc_id  
limit 5 ; 

-- add the lines, start primitive
select '
<Placemark> 
 <LineString>
  <coordinates>
' as start_of_line;

-- list coordinates, limit to relevant set..
select  
  r.fr_lon_degr || ', ' ||  r.fr_lat_degr || ', 0.1' as coord
from fl_v_rtes r
where 1=1 /* add criteria later */
order by r.fr_loc_id -- use ordering from location.seq_id
limit 5 ;

-- end of line.
select ' 
  </coordinates>
 </LineString>
</Placemark>' as end_of_line ; 


-- now locations via function
select fl_f_loc_pmk ( loc_id )
from fl_lctn 
where loc_id between 10 and 20  ;

-- also add lines  for 10-15, as a single line

-- add the 2nd lines, start primitive
select '
<Placemark> 
 <LineString>
  <coordinates>
' as start_of_line;

-- list coordinates, limit to relevant set..
select  
  r.fr_lon_degr || ', ' ||  r.fr_lat_degr || ', 0.1' as coord
from fl_v_rtes r
where 1=1 /* add criteria later */
  and r.fr_loc_id between 10 and 15 
order by r.fr_loc_id ;

-- end of 2nd line.
select ' 
  </coordinates>
 </LineString>
</Placemark>' as end_of_line ; 

-- now add drawing lines for 15-20, as individual lines.
select fl_f_lin_pmk ( r.rte_id )  as line_plecemarks
from fl_rtes r 
where 1=1
  and r.to_loc_id between 15 and 20
order by  r.to_loc_id ;
-- note: ordering not strictly needed..


-- end of kml file
select '</Document> </kml>' as end_of_kml_file; 

\o

\echo .
\echo check dat in file aalocs.kml
\echo .

\! ls -l aa*.kml

\echo .


