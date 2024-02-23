
-- demo
-- \copy l ( payload ) from 'abc.txt' ; 

-- tips 
-- put only relevant data in csv
-- put heading on top of csv: 
-- hiding_date_vc,hiding_blz,hiding_rider,finder_date_vc,finder_blz,finder_rider,lat_degr,lon_degr,loc_desc,loc_city,loc_prov,distance

-- use import from dbeaver.. check mappings, and do Not Tranfer new columns.

-- later use copy command..

-- into staging
\copy fl_stag (
  hiding_date_vc
, hiding_blz 
, hiding_rider
, finder_date_vc
, finder_blz 
, finder_rider
, lat_degr   
, lon_degr  
, loc_desc 
, city    
, prov   
, distance 
) from 'fl_data.csv' 
with format csv
;
