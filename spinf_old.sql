
CREATE or replace FUNCTION spinf( n_sec integer ) RETURNS integer AS $$
<< outerblock >>
DECLARE

   -- select current_timestamp; 

   i_counter integer := 0 ;
   n_per_sec real ; 
   i_seconds integer := 5 ; 
   i_diff    integer := 0 ; 
   i_sleepval integer := 1 ;
   dt_starttime timestamp ; 
   dt_endtime   timestamp ; 
BEGIN

    RAISE NOTICE 'spinf: spinning for % seconds, starting at %' , i_seconds, dt_starttime ; 

    dt_starttime := clock_timestamp()  ; 
    -- select current_timestamp into dt_starttime ; 

    RAISE NOTICE 'spinf value of star - current : %', clock_timestamp() - dt_starttime ; 

    dt_starttime := clock_timestamp()  ; 
    WHILE ( to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer < i_seconds ) LOOP 

      -- perform pg_sleep(1) ; -- when debugging

      -- i_diff := to_char ( clock_timestamp() - dt_starttime , 'SSSS' )::integer ;   

      i_counter := i_counter + 1 ; 

      -- RAISE NOTICE 'spinf: diff= % ; counter = % ', i_diff, i_counter ; 

    END LOOP ;  

    n_per_sec := i_counter::real  / i_seconds::real ;  -- need to do cast to get real nr.
    RAISE NOTICE 'spinf: seconds: % exec: %,  exec/sec :  % ' , i_seconds, i_counter , to_char ( n_per_sec, '999G999G999D999')  ; 

    -- just in case you want to make the point: current_timestamp is from time of submission, not clock.
    RAISE NOTICE 'spin: diff between clock() and curent : %' , clock_timestamp() - current_timestamp ; 

  RETURN 0 ;
END ;
$$ LANGUAGE plpgsql;

select spinf( 5 ) ;



-- select current_timestamp ; 

