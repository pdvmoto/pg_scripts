
select empno
, case empno when 7788 then 1
             when 7789 then 2
       else empno
  end as output
, case when comm is null then  0
            else comm 
  end as corr
, case comm when null then  0
            else comm 
  end as corr_2
, coalesce ( comm, -1 ) as corr_3
, ename from emp 
order by empno ;
