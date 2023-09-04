
create table dept_tcl
as select * from dept;

insert into dept_tcl
values (50, 'DATABASE', 'SEOUL');

select * from dept_tcl;

update dept_tcl
set loc = 'BUSAN'
where deptno = 10;

rollback;

insert into dept_tcl
values (50, 'DATABASE', 'SEOUL');

update dept_tcl
set loc = 'BUSAN'
where deptno = 10;

select * from dept_tcl;

commit;

delete from dept_tcl
where deptno = 40;
select * from dept_tcl;

commit;

update dept_tcl
set loc = 'GREEN'
where deptno = 30;
select * from dept_tcl;
commit;

select * from dict;

select * from dept;

select table_name from user_tables;

select owner, table_name from all_tables;

select * from user_indexes;

--emp테이블의 sal열에 인덱스 생성하기
create index inx_emp_sal
on emp(sal);

select * from user_indexes;

select * from user_ind_columns;

drop index inx_emp_sal;

create view vw_emp20
as (select empno, ename, job, deptno
from emp
where deptno = 20);

select * from vw_emp20;

create table empidx
as select * from emp; 

create index idx_empidx_empno 
on empidx(empno);

select * from user_indexes;

drop view vw_emp20;
select * from user_views; 

select rownum, e.* from (
    select * from emp e order by sal desc) e
where rownum <= 5;

create table dept_sequence 
as select * from dept
where 1 <> 1;

create sequence seq_dept_sequence
increment by 10
start with 10
maxvalue 90
minvalue 0 
nocycle
cache 2;

select * from user_sequences;

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

select * from dept_sequence;

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

select * from dept_sequence;

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

select * from dept_sequence;

-- max값인 90이 넘어서 데이터 더 안들어가고 오류 발생
insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

alter sequence seq_dept_sequence
increment by 3
maxvalue 99
cycle;

select * from user_sequences;

insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'GREEN');

select * from dept_sequence;

drop sequence seq_dept_sequence;

create synonym E
for emp;

select * from E;

drop synonym E;


