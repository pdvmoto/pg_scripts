#!/bin/sh
#
# do_fill.sh: fill the table t, and leave some info in filler-column
#
# set -v -x 

# pick up the host name...
export hostnm=`hostname`

# ysqlsh -X -h node2  <<EOF
ysqlsh -X postgresql://yugabyte@localhost:5432,localhost:5433,localhost:5434,localhost:5435 <<EOF
  
  -- \echo $hostnm 

  with s as ( select nextval('t_seq') as id
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

  select '$hostnm' as host, now() as datetime; 

EOF

