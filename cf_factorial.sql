CREATE OR REPLACE FUNCTION factorial(i integer) RETURNS numeric  AS $$
DECLARE x NUMERIC;
BEGIN
    -- RAISE NOTICE 'factorial: %', i ; 
    IF ( i < 1) THEN
	x = 1; 
        -- RAISE NOTICE 'factorial x=1, %', i;
    ELSE 
    	x = factorial ( i-1 ) * i ;
    END IF ;

    RETURN x;

EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

select factorial ( 3 ) as fact_3 ; 
select factorial ( 6 ) as fact_6 ; 
