
create or replace function wd ( w_like text ) 
  returns text 
as $$
declare
  wrd text ; 
begin

  for wrd in select word as wrd from wl_de where word like w_like order by word
  loop
    RAISE NOTICE ' wrd : % ', wrd ;
  end loop ;

  return '0' ; 

END;
$$ language plpgsql ;

select wd ( 'ab___' ) ; 


create or replace function wf ( w_like text ) 
  returns text 
as $$
declare
  wrd text ; 
begin

  for wrd in select word as wrd from wl_fr where word like w_like order by word
  loop
    RAISE NOTICE ' wrd : % ', wrd ;
  end loop ;

  return '0' ; 

END;
$$ language plpgsql ;

select wf ( 'ste__' ) ; 

\echo "select wf ( 'ste__' ) ; "


