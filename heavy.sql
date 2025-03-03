
\set ECHO all

SET application_name = 'heavy.sql'
SET ApplicationName = 'Heavy.sql'

select pg_backend_pid();
select pg_backend_pid() as this_pid \gset

select :this_pid as thispid ;

\timing on

-- does it need a dual (nope) or a sleep (yes) to register the query in ash ?
-- without the sleep, it does not seem to "stay visible" long enough to get ash-ed
-- but the queries die appear in pg_stat_statements (verify!)
select /* slow03 fnctns */ 
  fn_cnt_i ( 't_xxl' ) as t_xxl_cnt
, fn_cnt_i ( 't_lll' ) as t_lll_cnt  
, fn_cnt_i ( 't_fff' ) as t_fff_cnt  
, fn_cnt_i ( 't' ) as t_cnt 
, pg_sleep ( 2)  ; 

select /* show log info */ * from ybx_logg_inf ;

select /* cnt masters */ relname tblname
, fn_cnt_i ( relname ) num_recs
, num_tablets, size_bytes /(1024*1024) mb
from ybx_tblinfo
where relname like 'ybx%mst'
order by size_bytes ;

select /* just pause */ pg_sleep ( 10 ) ;

-- make sure this session is logged: call sess-logging function for this node
select ybx_get_sess();

select /* payld 01 */ count (*), substr ( payload, 800, 1 ) 
from t_rnd 
group by 2
order by 1 desc;

select /* payld 02 */ count (*), substr ( payload, 2, 2 ) 
from t_rnd 
group by 2
order by 1 desc;

select /* ash cnts 01 */ sm.pid, substr ( sm.app_name, 1, 10 ) as app_name
, count (*) nr_ashrecs
, substr ( replace ( qm.query, chr(10), ' ' ), 1, 40 ) as qry
from ybx_ashy_log al
   , ybx_sess_mst sm
   , ybx_qury_mst qm
where al.query_id = qm.queryid
  and al.pid = sm.pid
  and al.top_level_node_id = sm.tsrv_uuid
group by 1, 2, 4
having count (*) > 10
order by 3 desc
limit 20
;

select :this_pid as this_was_pid 
, 'Dont forget to run collect_ash.sh' as msg;

