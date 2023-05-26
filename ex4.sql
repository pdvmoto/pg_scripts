
-- show diff between index-only and index+table scan

-- if we look for an ename, there is no index.. hence table scan
explain (analyze, costs)  select empno, ename from emp where ename='SCOTT'; 

-- but if we look for an empno, we know there is an index, 
-- and it show in plan.
-- but.. the explain tells you in 1 line that you have accessed both 
--an index + table, both
explain (analyze, costs)  select empno, ename from emp where empno=7788; 

-- the diff becomes visib le when you query data taht is only in teh index
-- and "index only" appears 
explain (analyze, costs)  select empno from emp where empno=7788; 



