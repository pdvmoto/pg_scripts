CREATE OR REPLACE FUNCTION fnNumberToWords (n BIGINT) RETURNS TEXT AS
$$
DECLARE
  e TEXT;
BEGIN

  WITH Below20(Word, Id) AS
  (
    VALUES
      ('Zero', 0), ('One', 1),( 'Two', 2 ), ( 'Three', 3),
      ( 'Four', 4 ), ( 'Five', 5 ), ( 'Six', 6 ), ( 'Seven', 7 ),
      ( 'Eight', 8), ( 'Nine', 9), ( 'Ten', 10), ( 'Eleven', 11 ),
      ( 'Twelve', 12 ), ( 'Thirteen', 13 ), ( 'Fourteen', 14),
      ( 'Fifteen', 15 ), ('Sixteen', 16 ), ( 'Seventeen', 17),
      ('Eighteen', 18 ), ( 'Nineteen', 19 )
   ),
   Below100(Word, Id) AS
   (
      VALUES
       ('Twenty', 2), ('Thirty', 3),('Forty', 4), ('Fifty', 5),
       ('Sixty', 6), ('Seventy', 7), ('Eighty', 8), ('Ninety', 9)
   )
   SELECT
     CASE
      WHEN n = 0 THEN  ''
      WHEN n BETWEEN 1 AND 19
        THEN (SELECT Word FROM Below20 WHERE ID=n)
     WHEN n BETWEEN 20 AND 99
       THEN  (SELECT Word FROM Below100 WHERE ID=n/10) ||  '-'  ||
             fnNumberToWords( n % 10)
     WHEN n BETWEEN 100 AND 999
       THEN  (fnNumberToWords( n / 100)) || ' Hundred ' ||
           fnNumberToWords( n % 100)
     WHEN n BETWEEN 1000 AND 999999
       THEN  (fnNumberToWords( n / 1000)) || ' Thousand ' ||
           fnNumberToWords( n % 1000)
     WHEN n BETWEEN 1000000 AND 999999999
       THEN  (fnNumberToWords( n / 1000000)) || ' Million ' ||
           fnNumberToWords( n % 1000000)
     WHEN n BETWEEN 1000000000 AND 999999999999
       THEN  (fnNumberToWords( n / 1000000000)) || ' Billion ' ||
           fnNumberToWords( n % 1000000000)
     WHEN n BETWEEN 1000000000000 AND 999999999999999
       THEN  (fnNumberToWords( n / 1000000000000)) || ' Trillion ' ||
           fnNumberToWords( n % 1000000000000)
    WHEN n BETWEEN 1000000000000000 AND 999999999999999999
       THEN  (fnNumberToWords( n / 1000000000000000)) || ' Quadrillion ' ||
           fnNumberToWords( n % 1000000000000000)
    WHEN n BETWEEN 1000000000000000000 AND 999999999999999999999
       THEN  (fnNumberToWords( n / 1000000000000000000)) || ' Quintillion ' ||
           fnNumberToWords( n % 1000000000000000000)
          ELSE ' INVALID INPUT' END INTO e;

  e := RTRIM(e);

  IF RIGHT(e,1)='-' THEN
    e := RTRIM(LEFT(e,length(e)-1));
  END IF;

  RETURN e;
END;
$$ LANGUAGE PLPGSQL;

select i as the_nr
, fnNumberToWords ( i ) as in_wording 
from ( select generate_series ( 220, 300, 13 ) as i ) as set_of_nrs ; 

