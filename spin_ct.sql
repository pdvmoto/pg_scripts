

/*
   spin while creating tables, max sec, and max nr tables

*/ 

-- the pg, block version

DO $$
  DECLARE
   dt_starttime		timestamp ; 
   i_counter     	integer := 0 ;
   n_sec         	integer := 2 ; 
   n_per_sec 		  real ; 
   txt_tbl1       text := 'create table ' ; 
   txt_tbl2       text := ' ( id bigint, payload text ) ' ; 
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

    n_per_sec := i_counter::real  / n_sec::real ;  -- need to do cast to get real nr.
    RAISE NOTICE 'spin (ct) created tbs: seconds: % exec: %,  exec/sec :  % ' 
         , n_sec, i_counter , to_char ( n_per_sec, '999G999G999D999')  ; 

    -- when function: return
END
$$;


