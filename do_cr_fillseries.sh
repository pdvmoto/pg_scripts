#!/bin/sh
#
# do_cr_fill_series.sh: fill the table t, with $1 records, of about 1k long
#
# usage: do_cr_fillseries.sh <num_to_add>
#
# set -v -x 

# pick up the host name...

export nr_recs=$1 

# ysqlsh -X -h node2  <<EOF
# psql -X -h localhost -p 26257 -U root -d defaultdb <<EOF
# ysqlsh -X postgresql://yugabyte@node5:5433,node6:5433,node7:5433?connect_timeout=2 <<EOF

psql -X postgresql://root@localhost:26257,localhost:26258,localhost:26259/defaultdb?connect_timeout=2 <<EOF

    select count (*) nr_records_before from t; 

    \echo inserting...

    \set QUIET on
    \timing on
    \pset footer off
    \t

    with s as ( select nextval('t_seq') as id
                     , '$HOSTNAME'      as clientnm
                     , nodename         as hostnm
                 from crx_vnodeinfo
                    , generate_series (1, $1::int ) 
              )
         , rd as ( SELECT string_agg (substr('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
                                   , ceil (random() * 62)::integer, 1), '') rndmstr
                   FROM   generate_series(1, 600 ) 
              )
    insert into t
    select
      s.id                                     as id
    , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
    , mod ( s.id, 10000 ) / 100                as amount
    , now ()                                   as dt   /* timestamp, ms  */
    , rpad ( format ( 'id: %s' , s.id ), 198)    as payload
    ,     '{ "client" :"' || substr ( s.clientnm, 1, 15 ) || '",' 
      ||  '  "host"   :"'	|| s.hostnm || '"} == ' 
      ||  rd.rndmstr
     as  filler
    from s, rd
    ;

    \t
    select count (*) nr_records_after from t; 

    -- show info on table...
    \echo .
    \echo  show info on table...
    \echo .

    \set ECHO all

    select t.table_id, t.database_name, t.schema_name, t.name, s.estimated_row_count 
    from crdb_internal.tables t
       , crdb_internal.table_row_statistics s
    where t.table_id = s.table_id
      and name = 't' ;

    /*****
    select t.name, t.table_id, r.range_id, r.lease_holder
    , r.replicas, round (r.range_size / (1024*1024))  as MB
    from crdb_internal.ranges r
       , crdb_internal.tables t
    where r.table_id = t.table_id
      and t.name = 't'
    order by t.name, range_id ;
    ****/

EOF

# end while loop
