
-- create functions to count contents of tables and views

CREATE OR REPLACE FUNCTION cnt(txt_table text)
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

