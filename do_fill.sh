#!/bin/sh
#
# do_fill.sh: fill the table t, and leave some info in filler-column
#
# set -v -x 

# sleep, defult is 1, otherwise $1
n_sec_sleep=1
n_sec_sleep="${1:-$n_sec_sleep}"

echo do_fill.sh: sleep value is $n_sec_sleep

# pick up the host name...
export hostnm=`hostname`

while true 
do

# ysqlsh -X -h node2  <<EOF
# psql -X <<EOF
  psql -X postgresql://yugabyte@localhost:5437,localhost:5435,localhost:5436?application_name=fill_sh <<EOF
--  ysqlsh -X postgresql://yugabyte@localhost:5433,localhost:5432,localhost:5434?application_name=fill_sh<<EOF
  
    \set QUIET on
    \timing off
    \pset footer off
    \t

    with /* do_fill.sh Insert */ s as ( select nextval('t_seq') as id
                     , pgs.setting      as hostadr
                  from ( select generate_series ( 1, 1 ) ) as sub
                     , pg_settings pgs
                  where pgs.name = 'listen_addresses'
              )
    insert into t
    select
      s.id                                     as id
    , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
    , mod ( s.id, 10000 ) / 100                as amount
    , now ()                                   as dt   /* timestamp, ms  */
    , rpad ( fnNumberToWords ( s.id ), 198)    as payload
    ,     '{ "client" :"$hostnm",' 
      ||  '  "host"   :"'	|| s.hostadr || '"}' as  filler
    from s
    ;

    with /* do_fill.sh Qry */ t_seconds as ( select id
               , dt
               , ( to_char ( dt, 'SSSS' ) )::bigint        as secs
               , 1000 * ( to_char ( dt, 'SSSS' ) )::bigint
                  + to_char ( dt, 'MS' )::int              as msecs
               , substr ( filler, 1, 70 )                  as filler
            from t
    )
    select
           msecs - LAG  ( msecs, 1 ) OVER w as msec_diff
    --   , id
         , to_char ( dt, 'HH24:MI:SS.MS' )  as timestmp
         , filler
    from t_seconds
    window w as ( order by id )
    order by id desc
    limit 1;

EOF

  sleep $n_sec_sleep

done
# end while loop
