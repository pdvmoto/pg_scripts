

/*
   spin while dropping  tables called dsnn, max sec, and max nr tables


  mapped volue and no-colocated tables: 20 in 5 sec.
  mapped volue and colocated tables: 60 in 5 sec. (3x faster)
  container directory and no-colocated tables: .. in  5 sec.
*/ 

-- the pg, block version

DO $$
  DECLARE
   dt_starttime		timestamp ; 
   i_counter     	integer := 1 ;
   n_sec         	integer := 30 ; 
   n_per_sec 		  real ; 
   txt_tbl1       text := 'drop table if exists  ' ; 
   txt_tbl2       text := ' ';  
   txt_tbl3       text := ' ; ' ;
   txt_tblname    text ; 
   txt_sql        text ;
BEGIN

    -- in shell script, use $1
    -- n_sec := $1 ;

    RAISE NOTICE 'spin (ct): spinning ct for % seconds' , n_sec ; 

    dt_starttime := clock_timestamp()  ; 

   -- the actual loop
    WHILE ( to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer < n_sec ) LOOP 

      txt_tblname := 'ds' || lpad ( i_counter::text, 2, '0' )  ;

      txt_sql := txt_tbl1 || txt_tblname || txt_tbl2 || txt_tbl3 ; 

      RAISE NOTICE 'spin (ct): doing stmnt: % counter: % ' , txt_sql, i_counter ; 

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

\d 

\echo note the nr of tables and the timing...
