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
# psql -X -h localhost -p 26257 -U root -d defaultdb <<EOF
# ysqlsh -X postgresql://yugabyte@node5:5433,node6:5433,node7:5433?connect_timeout=2 <<EOF

  psql -X postgresql://root@localhost:26257,localhost:26258,localhost:26259,localhost:26260,localhost:26263/defaultdb?connect_timeout=2 <<EOF

    \set QUIET on
    \timing off
    \pset footer off
    \t

    with s as ( select nextval('t_seq') as id
                     , '$HOSTNAME'      as clientnm
                     , nodename         as hostnm
                     , pg_sleep ( 1.0)  as sleep_sec
                 from crx_vnodeinfo
              )
    insert into t
    select
      s.id                                     as id
    , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
    , mod ( s.id, 10000 ) / 100                as amount
    , now ()                                   as dt   /* timestamp, ms  */
    , rpad ( format ( 'id: %s' , s.id ), 198)    as payload
    ,     '{ "client" :"' || substr ( s.clientnm, 1, 15 ) || '",' 
      ||  '  "host"   :"'	|| s.hostnm || '"}' as  filler
    from s
    ;

    with t_seconds as ( select id
               , dt
               , ( to_char ( dt, 'SSSS' ) )::bigint        as secs
               ,  1000 * to_char ( dt, 'ssss.ms'  )::numeric          as msecs
               , substr ( filler, 1, 50 )                  as filler
            from t
            where t.dt > ( now() - interval '1 hour' )
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

  # sleep 1

done
# end while loop
