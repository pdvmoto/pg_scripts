drop table emp ; 
drop table jobdesc ; 
drop table dept ; 

CREATE TABLE DEPT 
   (DEPTNO integer , 
	DNAME VARCHAR(14 ), 
	LOC VARCHAR(13 ), 
	 CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)  
) ; 

CREATE TABLE JOBDESC 
   (	JOB VARCHAR(9 ), 
	JOB_DESC VARCHAR(32 ), 
	 CONSTRAINT JOBDESC_PK PRIMARY KEY (JOB)
); 

CREATE TABLE EMP 
   (EMPNO integer , 
	ENAME varchar  (10), 
	JOB varchar (9 ), 
	MGR integer, 
	HIREDATE timestamp, 
	SAL real, 
	COMM real, 
	DEPTNO integer, 
	 CONSTRAINT PK_EMP PRIMARY KEY (EMPNO) 
); 

alter table emp add 
	 CONSTRAINT FK_EMP_DEPT FOREIGN KEY (DEPTNO)
	  REFERENCES DEPT ( DEPTNO) ;

alter table emp add 
	 CONSTRAINT EMP_JOB_FK FOREIGN KEY (JOB)
	  REFERENCES JOBDESC (JOB)  ;


Insert into JOBDESC (JOB,JOB_DESC) values ('PRESIDENT','presidentdescript');
Insert into JOBDESC (JOB,JOB_DESC) values ('SALESMAN','salesmandescript');
Insert into JOBDESC (JOB,JOB_DESC) values ('MANAGER','managerdescript');
Insert into JOBDESC (JOB,JOB_DESC) values ('CLERK','clerkdescript');
Insert into JOBDESC (JOB,JOB_DESC) values ('ANALYST','analystdescript');
-- commit ;

Insert into DEPT (DEPTNO,DNAME,LOC) values ('10','ACCOUNTING','NEW YORK');
Insert into DEPT (DEPTNO,DNAME,LOC) values ('20','RESEARCH','DALLAS');
Insert into DEPT (DEPTNO,DNAME,LOC) values ('30','SALES','CHICAGO');
Insert into DEPT (DEPTNO,DNAME,LOC) values ('40','OPERATIONS','BOSTON');
-- commit ;

Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7369','SMITH','CLERK','7902',to_date('17-12-1980','DD-MM-YYYY'),'800',null,'20');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7499','ALLEN','SALESMAN','7698',to_date('20-02-1981','DD-MM-YYYY'),'1600','300','30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7521','WARD','SALESMAN','7698',to_date('22-02-1981','DD-MM-YYYY'),'1250','500','30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7566','JONES','MANAGER','7839',to_date('02-04-1981','DD-MM-YYYY'),'2975',null,'20');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7654','MARTIN','SALESMAN','7698',to_date('28-09-1981','DD-MM-YYYY'),'1250','1400','30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7698','BLAKE','MANAGER','7839',to_date('01-05-1981','DD-MM-YYYY'),'2850',null,'30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7782','CLARK','MANAGER','7839',to_date('09-06-1981','DD-MM-YYYY'),'2450',null,'10');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7788','SCOTT','ANALYST','7566',to_date('09-12-1982','DD-MM-YYYY'),'3000',null,'20');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7839','KING','PRESIDENT',null,to_date('17-11-1981','DD-MM-YYYY'),'5000',null,'10');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7844','TURNER','SALESMAN','7698',to_date('08-09-1981','DD-MM-YYYY'),'1500','0','30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7876','ADAMS','CLERK','7788',to_date('12-01-1983','DD-MM-YYYY'),'1100',null,'20');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7900','JAMES','CLERK','7698',to_date('03-12-1981','DD-MM-YYYY'),'950',null,'30');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7902','FORD','ANALYST','7566',to_date('03-12-1981','DD-MM-YYYY'),'3000',null,'20');
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
values ('7934','MILLER','CLERK','7782',to_date('23-01-1982','DD-MM-YYYY'),'1300',null,'40');

