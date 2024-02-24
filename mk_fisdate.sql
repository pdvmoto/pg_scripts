
create or replace function f_isdate(s varchar) returns boolean as $$
begin
  perform s::date;
  return true;
exception when others then
  return false;
end;
$$ language plpgsql;

