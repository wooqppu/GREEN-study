
select * from emp;

select empno, rpad(substr(empno, 1, 2), 4, '*') as masking_empno,
ename, rpad(substr(ename, 1, 1), length(ename), '*') as masking_ename 
from emp
where length(ename) >= 5 and length(ename) < 6;

select empno, ename,  sal,
trunc(sal/21.5, 2) as day_pay,
round(sal/21.5/8, 1) as time_pay
from emp;

select empno, ename, hiredate,
to_char(next_day(add_months(hiredate, 3), '월요일'), 'YYYY-MM-DD')
as r_job,
nvl(to_char(comm), 'N/A') as comm
from emp;

select empno, ename, mgr,
case 
when mgr is null then '0000'
when substr(mgr, 1, 2) = '78' then '8888'
when substr(mgr, 1, 2) = '77' then '7777'
when substr(mgr, 1, 2) = '76' then '6666'
when substr(mgr, 1, 2) = '75' then '5555'
else to_char(mgr)
end as chg_mgr
from emp;

select sum(sal) from emp;
select sum(sal), sum(distinct sal) from emp;

select count(sal) from emp;

select count (*) from emp;
select * from emp;

select count (comm) from emp;


select max(sal) from emp
where deptno = 10;

select min(sal), max(sal) from emp
where deptno = 10;

select min(sal), max(sal), trunc(avg(sal)) from emp
where deptno = 10;

select min(hiredate), max(hiredate) from emp
where deptno = 20;

select trunc(avg(sal)), trunc(avg(DISTINCT sal)) from emp;

select trunc(avg(sal)) as deptno10 from emp
where deptno = 10;

select trunc(avg(sal)) as deptno10 from emp
where deptno = 10
union all
select trunc(avg(sal)) as deptno20 from emp
where deptno = 20
union all
select trunc(avg(sal)) as deptno30 from emp
where deptno = 30;

select avg(sal), deptno
from emp
group by deptno;

select avg(sal), deptno, job
from emp
group by deptno, job
having avg(sal)>=2000
order by deptno, job;

select deptno, job, avg(sal)
from emp
where sal >= 2000
group by deptno, job
having avg(sal) >= 1000
order by deptno, job;


desc employee;
select * from employee;

select * from employee
where pname like '김%';

select pname, hiredate, sal
from employee
where hiredate between '2010-01-01' and '2010-12-31';

select avg(sal) as 과장평균급여 from employee
where job='과장';

select count(distinct job) as 직급수 from employee;

select deptno, avg(sal) from employee
group by deptno
order by deptno;

select count(*) as 퇴사자수 from employee
where firedate is not null;

select pname, job, sal from employee
where sal > (select avg(sal) from employee)
order by sal desc; 

select count(*) as 보너스가없는사원수 from employee
where bonus is not null;

select avg(sal) from employee
where deptno = 30;

select pname, sal, deptno from employee
where sal = (select min(sal) from employee);

select deptno, sum(sal) from employee
group by deptno
having deptno=10 or deptno=20; 

from member, product
select * from emp, dept;

select * from emp, dept
where emp.deptno = dept.deptno;

select * from emp e, dept d
where e.deptno = d.deptno;

select e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and sal >= 3000; 

select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and sal <= 2500 
and empno <=9999;

select * from emp e, salgrade s
where e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, c.empno as mgr_no, c.ename as mgr_name 
from emp e, emp c
where e.mgr = c.empno; 

select e1.empno, e1.ename, e1.mgr,
e2.empno as mgr_empno, e2.ename as mgr_name
from emp e1, emp e2
where e1.mgr = e2.empno(+)
order by e1.empno;

select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d 
where e.deptno = d.deptno
and e.sal > 2000
order by d.deptno;


select d.deptno, d.dname, trunc(avg(e.sal)) as AVG_SAL,
max(e.sal) as MAX_SAL, min(e.sal) as MIN_SAL,
count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, d.dname;

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e, dept d
where e.deptno(+) = d.deptno 
order by d.deptno, e.ename;

select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, 
e1.sal, e1.deptno as deptno_1, s.losal, s.hisal, s.grade, 
e2.empno as mgr_ename, e2.ename as mgr_ename
from emp e1, dept d, salgrade s, emp e2
where e1.deptno(+) = d.deptno
and e1.sal between s.losal(+) and s.hisal(+)
and e1.mgr = e2.empno(+)
order by d.deptno, e1.empno;

select deptno, d.dname, trunc(avg(e.sal)) as AVG_SAL,
max(e.sal) as MAX_SAL, min(e.sal) as MIN_SAL,
count(*) as cnt
from emp e join dept d using(deptno)
group by deptno, d.dname;
select e.empno, e.ename, e.mgr, c.empno as mgr_no, c.ename as mgr_name 
from emp e, emp c
where e.mgr = c.empno;


select d.deptno, d.dname, e.empno, e.ename, e.mgr, e.sal, e.deptno,
s.losal, s.hisal, s.grade,
e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e right outer join dept d on (e.deptno = d.deptno)
left outer join salgrade s on (e.sal between s.losal and s.hisal)
left outer join emp e2 on (e.mgr = e2.empno);


select d.deptno, d.dname, trunc(avg(e.sal)) as AVG_SAL,
max(e.sal) as MAX_SAL, min(e.sal) as MIN_SAL,
count(*) as cnt
from emp e join dept d on(d.deptno = e.deptno)
group by d.deptno, d.dname;


select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.deptno = 20
and e.sal > (select avg(sal) from emp);

