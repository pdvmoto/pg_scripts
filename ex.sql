-- pre-req: 
--   cu_scott.sql
-- logon as scott, and run:
--   n2words.sql
--   mk_empdept.sql
--   pg_demo_part.sql

select * from emp where empno = 7788 ;

explain (analyze, verbose, costs on) 
select * from emp where empno = 7788;

\! echo .
\! echo selected on PK, check the explain, cost
\! read abc

select * from emp where ename = 'KING' ;

explain ( analyze, dist, verbose, costs on ) 
select * from emp where ename = 'KING' ;

\! echo .
\! echo selected on name, 1 row, check the explain, cost
\! read abc

select id, payload from  t where id = 1111 ; 

explain ( analyze, dist, verbose, costs on )
select id, payload from  t where id = 1111 ; 

\! echo .
\! echo selected from large tbl, on pk check the explain, cost
\! read abc

select id, payload from t where payload like 'One     %' ;

explain ( analyze, dist, verbose, costs on ) 
select id, payload from t where payload like 'One     %' ;

\! echo .
\! echo selected from large tbl, on 2nd index, range
\! read abc

select 'end of ex.sql'; 

