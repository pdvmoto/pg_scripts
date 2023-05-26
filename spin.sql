
/*
   how fast can an empty loop spin ?
   keep values in XLS, but 1-2-4-8-16 sec fairly consistent

   later: 
	- select 1 record over an index, how many per sec ?
	- delete  1 record over an index
	- update  1 record over an index, how many per sec ?

   also: 
 	- how to measure/eliminate overhead of while-loop ? use a for..  ?

*/ 

-- the pg, block version

DO $$
  DECLARE
   dt_starttime		timestamp ; 
   i_counter     	integer := 0 ;
   n_sec         	integer := 120 ; 
   n_per_sec 		real ; 
BEGIN

    -- in shell script, use $1
    -- n_sec := $1 ;

    RAISE NOTICE 'spin (pg, block): spinning for % seconds' , n_sec ; 

    dt_starttime := clock_timestamp()  ; 

   -- the actual loop
    WHILE ( to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer < n_sec ) LOOP 

      i_counter := i_counter + 1 ; 

    END LOOP ;  

    n_per_sec := i_counter::real  / n_sec::real ;  -- need to do cast to get real nr.
    RAISE NOTICE 'spin (pg, block): seconds: % exec: %,  exec/sec :  % ' 
         , n_sec, i_counter , to_char ( n_per_sec, '999G999G999D999')  ; 

    -- when function: return
END
$$;


