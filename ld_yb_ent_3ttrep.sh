#!/bin/sh

# fetch tablet-replica-info for 1 tablet ($1)=(tt_uuid)  
# into ybx_infc, then 
# - insert ybx_ttrp: tb_uuid, ts_uuid, role - this will generate placement info for all tablets
# 
# generate calls: (spool to \t \o ld3.out )
# => select '\! ./ld_yb_ent_3ttrep.sh ' || tt_uuid from ybx_tblt;
#
# then call:  \i ld3.out
# 
# notes:
# - RISK: running multiple processes will corrupt data, 
#   remedy: need to include session-id, and proper tx.
# - hardcode connect-string
#

export tt_id=$1

# do actual work inside psql
ysqlsh -X postgresql://yugabyte@node5:5433,node6:5433,node7:5433?connect_timeout=2 <<EOF

  \echo .
  \echo replacing placement and replica data in ybx_ttrp for tablet $tt_id

  delete from ybx_intf ;

  \copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tablet_servers  $tt_id | tail -n +2| expand '  ;

  -- any old data for this tablet: remove
  delete from ybx_ttrp where tt_uuid = '$tt_id' ;
 
  -- tablets, mind : doubles at colocated
  -- also: consider a merge-stmnt
  insert into ybx_ttrp ( ts_uuid, tt_uuid, role )
  select substr ( slurp,  1, 32 )  as ts_uuid
       , '$tt_id'                  as tt_id
       , substr ( slurp, 65, 20 )  as role
  from ybx_intf
  where length ( trim(slurp) )  > 0 
  and not exists ( select 1 
                    from ybx_ttrp rp 
                    where rp.ts_uuid = substr ( slurp,  1, 32 ) 
                      and rp.tt_uuid = '$tt_uuid'  
                 ); 

  select * from ybx_ttrp where tt_uuid = '$tt_id' ;

EOF

