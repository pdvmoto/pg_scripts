
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
order by loc_id  
limit 100 ; 

-- add the lines, start primitive
select '
<Placemark> 
 <LineString>
  <coordinates>
' as start_of_line;

-- list coordinates, limit to relevant set..
select  
  fr_lon_degr || ', ' ||  fr_lat_degr || ', 0.1' as coord
from fl_v_rtes
order by fr_loc_id -- use ordering from location.seq_id
limit 100 ;


-- end of line.
select ' 
  </coordinates>
 </LineString>
</Placemark>' as end_of_line ; 

-- end of kml file
select '</Document> </kml>' as end_of_kml_file; 

\o

\echo .
\echo check dat in file aalocs.kml
\echo .

\! ls -l aa*.kml

\echo .




