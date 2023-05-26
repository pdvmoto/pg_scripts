
CREATE or replace FUNCTION spinf( n_sec_2run integer ) RETURNS integer AS $$
<< outerblock >>
DECLARE
   dt_starttime         timestamp ;
   i_counter            integer := 0 ;
   n_sec                integer := 32 ;
   n_per_sec            real ;

BEGIN

    -- in shell script, use $1
    n_sec := n_sec_2run ;

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
    RETURN n_per_sec ;

END ;
$$ LANGUAGE plpgsql;

-- test it
select spinf( 1 ) ;
select spinf( 2 ) ;
select spinf( 4 ) ;
select spinf( 8 ) ;
--select spinf( 16 ) ;

