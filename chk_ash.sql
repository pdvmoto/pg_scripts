
\pset footer off

\! echo .
\! echo counting logged info...
\! echo .

\! echo universe
select count (*) mst from ybx_univ_mst ; 
select count (*) log from ybx_univ_log ; 

\! echo .
\! echo hosts, masters, tservers
select count (*) nr_host_mst                         from ybx_host_mst ; 
select count (*) nr_host_log , max ( log_dt ) latest from ybx_host_log ; 

select count (*) nr_mast_mst                         from ybx_mast_mst ; 
select count (*) nr_mast_log , max ( log_dt ) latest from ybx_mast_log ; 

select count (*) nr_tsrv_mst                         from ybx_tsrv_mst ; 
select count (*) nr_tsrv_log , max ( log_dt ) latest from ybx_tsrv_log ; 


\! echo .
\! echo databases
select count (*) nr_datb_mst                         from ybx_datb_mst ; 
select count (*) nr_datb_log , max ( log_dt ) latest from ybx_datb_log ; 
select * from ybx_datb_mst ; 

\! echo .
\! echo sessions..
select count (*) nr_sess_mst                         from ybx_sess_mst ; 
select count (*) nr_sess_log , max ( log_dt ) latest from ybx_sess_log ; 

select host, datid, usesysid, left ( app_name, 30) app_name      
from ybx_sess_mst 
where gone_dt is null  
order by host, datid, usesysid ; 

\! echo .
\! echo queries..
select count (*) nr_qury_mst                         from ybx_qury_mst ; 
select count (*) nr_qury_log , max ( log_dt ) latest from ybx_qury_log ; 

\! echo .
\! echo tablets..
select count (*) nr_tblt_mst                         from ybx_tblt_mst ; 
select count (*) nr_tblt_rep , max ( log_dt ) latest from ybx_tblt_rep ; 

\! echo .
\! echo ash records..
select tsrv_uuid, host, count (*) cnt,  max ( sample_time ) 
from ybx_ashy_log                         
group by 1, 2
order by host; 

\pset footer on

