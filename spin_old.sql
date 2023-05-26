
-- the pg, block version

DO $$
  DECLARE
   i_counter integer := 0 ;
   n_per_sec real ; 
   i_seconds integer := 10 ; 
   i_diff    integer := 0 ; 
   i_sleepval integer := 1 ;
   dt_starttime timestamp ; 
   dt_endtime   timestamp ; 
  BEGIN

    -- in shell script, use $1
    -- i_seconds := $1 ;

    RAISE NOTICE 'spin (pg, block): spinning for % seconds' , i_seconds ; 

    -- RAISE NOTICE 'spin value of star - current : %', clock_timestamp() - dt_starttime ; 

    dt_starttime := clock_timestamp()  ; 
    WHILE ( to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer < i_seconds ) LOOP 

      -- perform pg_sleep(1) ; -- when debugging
      -- i_diff := to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer ;   

      i_counter := i_counter + 1 ; 

      -- RAISE NOTICE 'spin: diff= % ; counter = % ', i_diff, i_counter ; 

    END LOOP ;  

    n_per_sec := i_counter::real  / i_seconds::real ;  -- need to do cast to get real nr.
    RAISE NOTICE 'spin (pg, block): seconds: % exec: %,  exec/sec :  % ' , i_seconds, i_counter , to_char ( n_per_sec, '999G999G999D999')  ; 

    -- just in case you want to make the point: current_timestamp is from time of submission, not clock.
    -- RAISE NOTICE 'spin: diff between clock() and curent : %' , clock_timestamp() - current_timestamp ; 

  END
$$;


