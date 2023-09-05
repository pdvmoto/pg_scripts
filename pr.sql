
-- just show
select current_user ;

\t
\o a.out

select '\set PROMPT1 '' %n @ %/ @ ' 
|| setting 
|| ' %R> '' '
FROM pg_settings
WHERE name='listen_addresses';

\o
\t

\i a.out

