
-- tupels only
\pset footer=off
\t
\o dblist
select datname from pg_catalog.pg_database
where datname not like 'template%'
order by 1
\q

