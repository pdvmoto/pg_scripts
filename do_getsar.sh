
# do_getsar.sh: get sar into table, loop forever..

N_CNT=3
N_SECS_INTV=2

while true
do

  # collect 
  sar $N_SECS_INTV $N_CNT | expand | tail -n +4  | head -n -1 | sed 's/ \+/\|/g' > /tmp/getsar.out

  ysqlsh -h $HOSTNAME -p 5433 -U yugabyte -X <<EOF

  -- temp table.. 
  -- the slurp-table
  create temporary table tmp_pg_sar (
    log_dt      timestamptz     default now()
  , host        text            default ybx_get_host() 
  , slurp       text -- just a line of sar-data, separated by |
  ) ;

  COPY tmp_pg_sar ( slurp )
  from  '/tmp/getsar.out'
  WitH ( format text, HEADER false, NULL '' ) ;

  select * from tmp_pg_sar order by log_dt, slurp ; 

  select now()::DATE  + split_part ( slurp, '|', 1 )::interval  as sar_dt 
  , split_part ( slurp, '|', 3 )::float                         as cpu_usr
  , split_part ( slurp, '|', 4 )::float                         as cpu_nice
  , split_part ( slurp, '|', 5 )::float                         as cpu_system
  , split_part ( slurp, '|', 6 )::float                         as cpu_iowait
  , split_part ( slurp, '|', 7 )::float                         as cpu_steal
  , split_part ( slurp, '|', 8 )::float                         as cpu_idle
  from tmp_pg_sar order by log_dt, slurp ; 

  insert into ybx_sarh_log (sar_dt, cpu_user, cpu_nice, cpu_system, cpu_iowait, cpu_steal, cpu_idle )
  select now()::DATE  + split_part ( slurp, '|', 1 )::interval  as sar_dt 
  , split_part ( slurp, '|', 3 )::float                         as cpu_usr
  , split_part ( slurp, '|', 4 )::float                         as cpu_nice
  , split_part ( slurp, '|', 5 )::float                         as cpu_system
  , split_part ( slurp, '|', 6 )::float                         as cpu_iowait
  , split_part ( slurp, '|', 7 )::float                         as cpu_steal
  , split_part ( slurp, '|', 8 )::float                         as cpu_idle
  from tmp_pg_sar 
  returning sar_dt, cpu_user, cpu_system, cpu_iowait, cpu_idle


EOF


done

echo .
echo Should never get here.
