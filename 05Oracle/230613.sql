select max(sal) from emp
group by deptno;

select * from emp
where sal in (select max(sal) from emp
group by deptno);

select * from emp 
where sal = any (select max(sal) from emp
group by deptno);

select * from emp 
where sal = some (select max(sal) from emp
group by deptno);

select sal from emp
where deptno = 30;

select * from emp
where sal < any (select sal from emp where deptno = 30);

select * from emp
where sal < (select max(sal) from emp where deptno = 30);

select * from emp
where sal < all (select sal from emp where deptno = 30);

select * from emp
where exists (select dname from dept where deptno = 10);

select * from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);

select e10.empno, e10.ename, d.loc, d.dname
from (select * from emp) e10, 
(select * from dept) d
where e10.deptno = d.deptno;

with 
e10 as (select * from emp where deptno = 10),
d as (select * from dept)
select e10.empno, e10.ename, e10.deptno, d.loc, d.dname 
from e10, d 
where e10.deptno = d.deptno;


select empno, ename, job, sal,
(select grade from salgrade
where e.sal between losal and hisal) as salgrade,
deptno, 
(select dname from dept where e.deptno = deptno) as dname from emp e;

select e.job, e.ename, e.sal, d.deptno, d.dname
from emp e join dept d on (e.deptno = d.deptno)
where job = (select job from emp where ename = 'ALLEN');


select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
from emp e join dept d on (e.deptno = d.deptno)
join salgrade s on (e.sal between s.losal and s.hisal)
where sal > (select avg(sal) from emp)
order by e.sal desc, e.empno;

select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal
and sal > (select avg(sal) from emp)
order by e.sal desc, e.empno;

select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e join dept d on (e.deptno = d.deptno)
where e.deptno = 10
and job not in (select job from emp where deptno = 30); 

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s on (e.sal between s.losal and s.hisal)
where sal > (select max(sal) from emp where job = 'SALESMAN')
order by e.empno;


select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s on (e.sal between s.losal and s.hisal)
where sal > all (select sal from emp where job = 'SALESMAN')
order by e.empno;


create table dept_temp
as select * from dept;

select * from dept_temp;

insert into dept_temp(deptno, dname, loc)
values(50, 'DATABASE', 'SEOUL');

insert into dept_temp(deptno, dname, loc)
values(60, 'WEB', null);

select * from dept_temp;

insert into dept_temp(deptno, dname, loc)
values(70, 'NETWORK', '');

select * from dept_temp;

insert into dept_temp(deptno, loc)
values(80, 'SEOUL');

select * from dept_temp;

create table emp_temp
as select * from emp where 1 <> 1;

desc emp_temp;
select * from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, '김그린', 'MANAGER', 8888, '2022-01-15', 5000, 1000, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (2222, '박그린', 'MANAGER', 8888, to_date('02/15/2022', 'MM/DD/YYYY'), 3000, 2000, 20);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1111, '이블루', 'MANAGER', 8888, sysdate, 4000, null, 30);


insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
from emp e join salgrade s on (e.sal between s.losal and s.hisal)
where s.grade = 1;

select * from emp_temp;

update emp_temp
set comm = 50
where sal <= 2500;

select * from emp_temp;

rollback;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
from emp e join salgrade s on (e.sal between s.losal and s.hisal) 
where s.grade = 1;

commit;

insert into emp_temp
values (9999, '김그린', 'MANAGER', 7565, '2023-01-24', 5000, 50, 10);

select * from emp_temp;

update emp_temp
set ename = '이그린';

select * from dept_temp;

update dept_temp
set dname = 'GREEN', loc = 'BUSAN'
where deptno = 40;

update dept_temp
set (dname, loc) = (select dname, loc from dept where deptno = 10)
where deptno = 40;

select * from emp_temp;
delete from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select * from emp;

select * from emp_temp;

delete from emp_temp
where job = 'MANAGER';


select empno from emp_temp e join salgrade s
on (e.sal between s.losal and s.hisal)
where e.deptno = 30
and s.grade = 3; 


delete from emp_temp
where empno in (
select e.empno 
from emp_temp e join salgrade s
on (e.sal between s.losal and s.hisal)
where e.deptno = 30 and s.grade = 3);

select * from emp_temp;

create table chap10hw_emp as select * from emp;
create table chap10hw_dept as select * from dept;
create table chap10hw_salgrade as select * from salgrade;

insert into chap10hw_dept(deptno, dname, loc) 
values (50, 'ORACLE', 'BUSAN');

insert into chap10hw_dept(deptno, dname, loc) 
values (60, 'SQL', 'ILSAN');

insert into chap10hw_dept(deptno, dname, loc) 
values (70, 'SELECT', 'INCHEON');

insert into chap10hw_dept(deptno, dname, loc) 
values (80, 'DML', 'BUNDANG');

update chap10hw_emp
set deptno = 70
where sal > (select avg(sal) from chap10hw_emp where deptno = 50);

update chap10hw_emp
set deptno = 80, sal = sal * 1.1
where hiredate > (select min(hiredate) from chap10hw_emp where deptno = 60);

delete from chap10hw_emp
where empno in (
select e.empno from chap10hw_emp e join chap10hw_salgrade s 
on (e.sal between s.losal and s.hisal)
where s.grade = 5
)

