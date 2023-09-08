#!/bin/sh
#
# do_fill.sh: fill the table t, and leave some info in filler-column cockraoch variety
#
# set -v -x 

# pick up the host name...
export hostnm=`hostname`
export hostnm=clienthost

while true 
do

# ysqlsh -X -h node2  <<EOF
  psql -X -h localhost -p 26257 -U root -d defaultdb <<EOF
  
    \set QUIET on
    \timing off
    \pset footer off
    \t

    with s as ( select nextval('t_seq') as id
                     , '$hostnm'        as hostadr 
              )
    insert into t
    select
      s.id                                     as id
    , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
    , mod ( s.id, 10000 ) / 100                as amount
    , now ()                                   as dt   /* timestamp, ms  */
    , rpad ( format ( 'id: %s' , s.id ), 198)    as payload
    ,     '{ "client" :"$hostnm",' 
      ||  '  "host"   :"'	|| s.hostadr || '"}' as  filler
    from s
    ;

    with t_seconds as ( select id
               , dt
               , ( to_char ( dt, 'SSSS' ) )::bigint        as secs
               ,  1000 * to_char ( dt, 'ssss.ms'  )::numeric          as msecs
               , substr ( filler, 1, 50 )                  as filler
            from t
    )
    select
           msecs - LAG  ( msecs, 1 ) OVER w as msec_diff
         , id
         , secs, msecs
         , to_char ( dt, 'HH24:MI:SS.MS' )  as timestmp
         , filler
    from t_seconds
    window w as ( order by id )
    order by id desc
    limit 1;

EOF

  sleep 1

done
# end while loop
