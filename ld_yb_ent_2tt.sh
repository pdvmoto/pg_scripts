#!/bin/sh

# fetch tablets for 1 table ($1, $2, $3)=(tb_uuid, dbt.db, tname)  
# into ybx_infc, then 
# - insert ybx_tblt: tb_uuid, tt_uuid, this will designate leader for tt
# - insert into ybx_tbtt: t
# 
# generate calls: (spool to \t \o ld2.out )
#  => select '\! ./ld_yb_ent_2tt.sh ' || tb_uuid || ' ' || db_type||'.'||database|| ' ' || tablename
#       from ybx_tabl;
#
# call:  \i ld2.out
# note: the generated lines are meant to be called from inside psql.
# 
# notes:
# - RISK: running multiple processes will corrupt data, 
#   remedy: need to include session-id, and proper tx.
# - hardcode connect-string
#

export tb_id=$1
export tb_db=$2
export tb_nm=$3


# do insert inside psql
ysqlsh -X postgresql://yugabyte@node5:5433,node6:5433,node7:5433?connect_timeout=2 <<EOF

  delete from ybx_intf ;
  \copy ybx_intf from program 'yb-admin -master_addresses $MASTERS list_tablets $tb_db $tb_nm  | tail -n +2 | cut -f1,4 | expand ' ;


  \echo replacing data for $tb_id $tb_db $tb_nm

  delete from ybx_tblt where tt_uuid = '$db_id' ;
 
  \echo .
  \echo inserting tablets for $tb_nm
  -- tablets, mind : doubles at colocated
  -- also: consider a merge-stmnt
  insert into ybx_tblt ( tt_uuid, ts_uuid )
  select substr ( slurp,  1, 32 )  as tt_uuid
       , substr ( slurp, 41, 72 )  as ts_uuid
  from ybx_intf
  where length ( trim(slurp) )  > 0 
  and not exists ( select 1 
                    from ybx_tblt tt 
                    where tt.tt_uuid = substr ( slurp,  1, 32 ) 
                 ); 

  --select * from ybx_tblt ;

  \echo .
  \echo combining table and tablets for $tb_nm

  -- combine table+tablet, replace values to prevent doubles
  -- consider merge in future?? better not leave old data..
  delete from ybx_tbtt where tb_uuid = '$tb_id' ;
  insert into ybx_tbtt ( tb_uuid, tt_uuid )
  select '$tb_id' as tb_uuid
       , substr ( slurp,  1, 32 )  as tt_uuid
  from ybx_intf
  where length ( trim(slurp) )  > 0

EOF

