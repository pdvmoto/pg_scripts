-- #!/bin/sh
--
--# ld_yb_ent_1basic.sh: load basic yb-entities into table.
--
-- note: anomaly at "sys catalog" find out, remove..
--

\echo ----- about to load yb-entities, metadata --- 

\echo ----- some information to verify ----- 
\echo .
\echo You are on host : 
\! hostname
\echo         on pwd  : 
\! pwd
\echo environment has MASTERS : 
\! set | grep MASTERS
\echo environment has tools : 
\! `which yb-admin'  and `which yugatool`


\! read -p "hit enter if ready to continue... " abc

\echo ----- loading master data from yugatool -----

-- masters are top-lines, assuming RF=3..
delete from ybx_intf ;
\copy ybx_intf from program 'yugatool  -m $MASTERS cluster_info |head -n8|  tail -n +6 | tail -n4 ' ;

-- verify
select 
  '['|| substr ( slurp,   2,  32 ) || ']' as tsuuid
, '['|| substr ( slurp,  37,  10 ) || ']' as host
, '['|| trim ( substr ( slurp,  50,   5 ) ) || ']' as port
, '['|| substr ( slurp,  79,   8 ) || ']' as role
from ybx_intf
where length ( trim(slurp))  > 0 ;

delete from ybx_mast ; 

insert into ybx_mast ( ms_uuid, host, port, role )
select 
  substr ( slurp,   2,  32 )               as ms_uuid
, substr ( slurp,  37,  10 )               as host
, trim ( substr ( slurp,  50,   5 ))::int  as port
, trim ( substr ( slurp,  79,   8 ))       as role
from ybx_intf
where length ( trim(slurp) ) > 0 ;

select ms_uuid, host, port, role from ybx_mast order by host;

\echo ----- loading tserver data from yugatool -----

delete from ybx_intf ;

\copy ybx_intf from program 'yugatool  -m $MASTERS cluster_info | tail  -n +12 ' ;

-- verify
select
  '['|| substr ( slurp,   2,  32 ) || ']' as tsuuid
, '['|| substr ( slurp,  37,  10 ) || ']' as host
, '['|| trim ( substr ( slurp,  50,   5 ) ) || ']' as port
, '['|| trim ( substr ( slurp,  79,   8 ) ) || ']' as alive
from ybx_intf
where length ( trim(slurp))  > 0 ;

delete from ybx_tsrv ;

insert into ybx_tsrv ( ts_uuid, host, port, alive )
select
  substr ( slurp,   2,  32 )  as ts_uuid
, substr ( slurp,  37,  10 )  as host
, trim ( substr ( slurp,  50,   5 ) )::int  as port
, trim ( substr ( slurp,  79,   8 ) )       as alive
from ybx_intf
where length ( trim(slurp))  > 0 ;

select * from ybx_tsrv ;


\echo ----- loading table data from yb-admin -----

-- now read table-data
delete from ybx_intf ;
delete from ybx_tabl ;

\copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type | sed "s/\./ /g" '  ;

-- try this later, yb-admin and sed ccan give table-data already csv separated...
-- \copy ybx_tabl ( db_type, database, tablename, tb_uuid, tabletype ) from program 'yb-admin -master_addresses $MASTERS list_tables  include_db_type include_table_id include_table_type | sed "s/\./ /g" | sed "s/ /,/g " ' WITH ( format csv ) ;

/*
-- verify tables...
select
  '['|| split_part ( slurp, ' ', 4 ) || ']' as tb_uuid
, '['|| split_part ( slurp, ' ', 1 ) || ']' as db_type
, '['|| split_part ( slurp, ' ', 2 ) || ']' as database
, '['|| split_part ( slurp, ' ', 3 ) || ']' as tablename
, '['|| split_part ( slurp, ' ', 5 ) || ']' as tabletype
from ybx_intf
where length ( trim(slurp))  > 0 ;
*/

insert into ybx_tabl  ( tb_uuid, db_type, database, tablename, tabletype )
select
  split_part ( slurp, ' ', 4 )  as tb_uuid
, split_part ( slurp, ' ', 1 )  as db_type
, split_part ( slurp, ' ', 2 )  as database
, split_part ( slurp, ' ', 3 )  as tablename
, split_part ( slurp, ' ', 5 )  as tabletype
from ybx_intf
where length ( trim(slurp))  > 0 ;

select * from ybx_tabl order by tablename ;

\echo ----- 
\echo .
\echo Verify data.. 
\echo note: Verify anomaly at sys-catalog?
\echo .
\echo ----- simple loading done, -----------
\echo .
\echo next : calls to scripts ld_yb_ent_2tt and .._3ttrep, loop over table-data and tablet-data ----- 
\echo .

-- generate calls: (spool to \t \o ld2.out )
--  => select '\! ./ld_yb_ent_2tt.sh ' || tb_uuid || ' ' || db_type||'.'||database|| ' ' || tablename
--       from ybx_tabl;
-- call:  \i ld2.out
--

\! echo ----- some information to verify -----
\! echo .
\! echo "You are on host            : " `hostname`
\! echo "        on pwd             : " `pwd`
\! echo .
\! echo environment has MASTERS ? 
\! echo ` set | grep MASTERS `
\! echo .
\! echo environment has tools ?
\! echo "    yb-admin               : " `which yb-admin`  
\! echo "    yugatool               : " `which yugatool` 
\! echo .
\! echo .....
\! read -p "hit enter to continue, control-C to stop" abc


\t on
\o ld2.out
select '\! ./ld_yb_ent_2tt.sh ' || tb_uuid || ' ' || db_type||'.'||database|| ' ' || tablename  from ybx_tabl ;

\i ld2.out

\! echo .
\! echo ld2 done, tablets are in, hit enter to read details on repicas: ybx_ttrp..
\! echo .
\! read -p "hit enter to continue, control-C to stop" abc

-- generate calls: (spool to \t \o ld3.out )
\t on
\o ld3.out
select '\! ./ld_yb_ent_3ttrep.sh ' || tt_uuid from ybx_tblt;

\i ld3.out

\echo .
\echo ---------- loading from ld2 nd ld3 done... next run some verifications -------




