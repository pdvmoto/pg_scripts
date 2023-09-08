
/*  ---------- yb_init -------

usage: run this on a new db, to get some tooling

 ---------------  
*/

\echo to generate spoken numbers
\i n2words.sql

CREATE OR REPLACE FUNCTION public.fnNumberToWords (n BIGINT) RETURNS TEXT AS
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


\echo functions to count 
\i mk_fcnt.sql

-- create functions to count contents of tables and views

CREATE OR REPLACE FUNCTION public.cnt(txt_table text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
  sql_stmnt TEXT;
  n_cnt BIGINT := 0 ;
  txt_out TEXT := '';
BEGIN

  txt_table := trim ( txt_table ) ;
  sql_stmnt := 'select count (*) as "cnt of ' || txt_table || '" from ' || txt_table || ';' ;

  -- RAISE NOTICE 'fn_cnt : counting [%], % , stmnt [%] ', txt_table, n_cnt, sql_stmnt ; 

  EXECUTE sql_stmnt INTO n_cnt ;

  txt_out := ' ' || txt_table || ' : ' || n_cnt ;
  
  RETURN txt_out ;

END;
$function$
;

CREATE OR REPLACE FUNCTION public.cnt_rows(schema text, tablename text)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
  result integer;
  query varchar;
begin
  query := 'SELECT count(1) FROM ' || schema || '.' || tablename;
  execute query into result;
  return result;
end;
$function$
;



CREATE OR REPLACE FUNCTION public.fn_cnt_i(txt_table text)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
DECLARE
  e TEXT;
  sql_stmnt TEXT;
  n_cnt BIGINT := 0 ;
BEGIN

  txt_table := trim ( txt_table ) ;
  sql_stmnt := 'select count (*) as "cnt of ' || txt_table || '" from ' || txt_table || ';' ;

  -- RAISE NOTICE 'fn_cnt : counting [%], % , stmnt [%] ', txt_table, n_cnt, sql_stmnt ; 

  EXECUTE sql_stmnt INTO n_cnt ;

  RETURN n_cnt ;

END;
$function$
;


\echo random generator
\i random.sql


-- examples to generate random stuff.

-- string of any lenght ?  (can probably be faster with md5..?)
Create or replace function public.f_rndmstr (length integer) returns text as
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
  result text := '';
  i integer := 0;
begin
  if length < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;


/* */ 

\echo view to inspect yb-properties of tables
create or replace view ybx_tblinfo as (
select c.oid, c.relname
--, yb_table_properties(c.oid) as props
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid 
, tp.colocation_id
, yb_is_local_table ( c.oid) islocal
from pg_class c
, yb_table_properties(c.oid) tp 
where 1=1
and c.relkind in ( 'r', 'i' )
);

\echo finally, report the database, and show if it is colocated
\echo .
\c 
\echo .

select yb_is_database_colocated () ; 

