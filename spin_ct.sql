

/*
   spin while creating tables, max sec, and max nr tables


  mapped volue and no-colocated tables: 20 in 5 sec.
  mapped volue and colocated tables: 60 in 5 sec. (3x faster)
  container directory and no-colocated tables: .. in  5 sec.
*/ 

-- the pg, block version

DO $$
  DECLARE
   dt_starttime		timestamp ; 
   i_counter     	integer := 1 ;
   n_sec         	integer := 5 ; 
   n_per_sec 		  real ; 
   txt_tbl1       text := 'create table ' ; 
   txt_tbl2       text := ' ( id bigint primary key, payload text ) ;' ; 
   txt_tblname    text ; 
   txt_sql        text ;
BEGIN

    -- in shell script, use $1
    -- n_sec := $1 ;

    RAISE NOTICE 'spin (ct): spinning ct for % seconds' , n_sec ; 

    dt_starttime := clock_timestamp()  ; 

   -- the actual loop
    WHILE ( to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer < n_sec ) LOOP 

      txt_sql := txt_tbl1 || 'ds' || trim ( i_counter::text ) || txt_tbl2 ; 

      RAISE NOTICE 'spin (ct): create stmnt: % counter: % ' , txt_sql, i_counter ; 

      execute txt_sql ; 

      i_counter := i_counter + 1 ; 

    END LOOP ;  

    n_per_sec := i_counter::real  / n_sec::real ;  -- pg, need cast.
    RAISE NOTICE 'spin (ct) created tbs: seconds: % exec: %,  exec/sec :  % ' 
         , n_sec, i_counter , to_char ( n_per_sec, '999G999G999D999')  ; 

    -- when function: return
END
$$;

-- assume at least 1-5 are created.. 
-- assume t (from demo_fill) exist, 
-- and put some data in

\timing on

insert into ds1 select id, payload from t limit 1000;
insert into ds2 select id, payload from t limit 1000;
insert into ds3 select id, payload from t limit 1000;
insert into ds4 select id, payload from t limit 1000;
insert into ds5 select id, payload from t limit 1000;
insert into ds6 select id, payload from t limit 1000;
insert into ds7 select id, payload from t limit 1000;
insert into ds8 select id, payload from t limit 1000;
insert into ds9 select id, payload from t limit 1000;

\timing off

\echo note the nr of tables and the timing...

