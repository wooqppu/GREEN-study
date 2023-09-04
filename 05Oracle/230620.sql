
set serveroutput on;

declare 
    v_wrong number;
    
begin
    select dname into v_wrong
    from dept
    where deptno = 10;
    dbms_output.put_line('������� ����');
    
exception
    when value_error then
            dbms_output.put_line('���� ó�� : ���� ���� �� ���� �߻�');
            dbms_output.put_line('sqlcode : ' || to_char(sqlcode));
            dbms_output.put_line('sqlerrm : ' || sqlerrm);
end;
/


create or replace procedure pro_noparam

is
    v_empno number(4) := 7788;
    v_ename varchar2(10);

begin
    v_ename := 'scott';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
    
end;
/

set serveroutput on;
execute pro_noparam;


select * from user_source;

begin 
    pro_noparam;
end;
/

drop procedure pro_noparam;


create or replace procedure pro_param_in
(
    param1 in number,
    param2 number,
    param3 number := 3,
    param4 number default 4
)

is

begin
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
    
end;
/

set serveroutput on;
execute pro_param_in(1,2,3,4);
--execute pro_param_in(1,2); 
-- 3,4���� ����Ʈ ���� ��� ������ �� ���� �Ⱥҷ��� ���� �߻����� ������ 
--  1,2�� ���� ���� ������ �Ⱥθ��� ���� �߻� -> ������ �ҷ������
-- ���ϴ� param ���� ȣ���ؼ� ���� �����ϴ� �͵� ���� 


create or replace procedure pro_param_out (
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)
is 

begin
    select ename, sal into out_ename, out_sal
    from emp
    where empno=in_empno;

end pro_param_out;
/

set serveroutput on;

declare
    v_ename emp.ename%type;
    v_sal emp.sal%type;

begin 
    pro_param_out(7369, v_ename, v_sal);
    dbms_output.put_line('v_ename : ' || v_ename);
    dbms_output.put_line('v_sal : ' || v_sal);

end;
/


select * from emp;

create or replace procedure pro_param_inout (
    inout_no in out number
)

is

begin
    inout_no := inout_no * 2;

end pro_param_inout;
/

declare
    num number;
    
begin
    num := 5;
    pro_param_inout(num);
    dbms_output.put_line('num�� : ' || num);

end;
/

create or replace function func_aftertax(
    sal in number
)

return number

is
    tax number := 0.05;
    
begin
    return (round(sal-(sal*tax)));

end func_aftertax;
/


declare
    aftertax number;

begin
    aftertax := func_aftertax(3000);
    dbms_output.put_line('after-tax : ' || aftertax);

end;
/


select empno, ename, sal, func_aftertax(sal) aftertax
from emp;

drop function func_aftertax;


create or replace package pkg_example
is 
    spec_no number := 10;
    function func_aftertax(sal number) return number;
    procedure pro_emp(in_empno in emp.empno%type);
    procedure pro_dept(in_deptno in dept.deptno%type);

end;
/

select text from user_source
where type='PACKAGE';

create or replace package body pkg_example
is
    body_no number := 10;
    
    function func_aftertax(sal number) return number
    is 
        tax number := 0.05;
    begin 
        return (round(sal-(sal*tax)));
    end func_aftertax;
    
    procedure pro_emp(in_empno in emp.empno%type)
    is 
        out_ename emp.ename%type;
        out_sal emp.sal%type;
    begin
        select ename, sal into out_ename, out_sal
        from emp
        where empno = in_empno;
        dbms_output.put_line('ename : ' || out_ename);
        dbms_output.put_line('sal : ' || out_sal);
    end pro_emp;
    
    procedure pro_dept(in_deptno in dept.deptno%type)
    is
        out_dname dept.dname%type;
        out_loc dept.loc%type;
    begin
        select dname, loc into out_dname, out_loc
        from dept
        where deptno = in_deptno;
        dbms_output.put_line('dname : ' || out_dname);
        dbms_output.put_line('loc : ' || out_loc);
    end pro_dept;
end;
/

set serveroutput on;

begin 
    pkg_example.pro_emp(7369);
end;
/

create or replace procedure pro_dept_in (
	inout_deptno in out dept.deptno%type,
	out_dname out dept.dname%type,
	out_loc out dept.loc%type
)

is

begin
	select deptno, dname, loc into inout_deptno, out_dname, out_loc
	from dept
	where deptno = inout_deptno;

end pro_dept_in;
/

set serveroutput on;

declare 
	v_deptno dept.deptno%type;
	v_dname dept.dname%type;
	v_loc dept.loc%type;

begin 
	v_deptno := 10;
	pro_dept_in(v_deptno, v_dname, v_loc);
	dbms_output.put_line('�μ���ȣ : ' || v_deptno);
	dbms_output.put_line('�μ��̸� : ' || v_dname);	
	dbms_output.put_line('���� : ' || v_loc);
end;
/

create or replace function func_date_kor(
	in_date in date

)
return varchar2

is

begin
	return (to_char(in_date, 'YYYY"��"MM"��"DD"��"'));

end func_date_kor;
/

select ename, func_date_kor(hiredate) as hiredate
from emp
where empno = 7369;

create table emp_trg
as select * from emp;

create or replace trigger trg_emp_nodml_weekedn

before 
insert or update or delete on emp_trg

begin
--    if to_char(sysdate, 'DY') in ('��', '��') then
--
--        if inserting then 
--            dbms_output.put_line('�ָ��� insert �ȵ˴ϴ�');
--        elsif updating then
--            dbms_output.put_line('�ָ��� update �ȵ˴ϴ�');
--        elsif deleting then
--            dbms_output.put_line('�ָ��� delete �ȵ˴ϴ�');    
--        else
--            dbms_output.put_line('�ָ��� ���� �ȵ˴ϴ�'); 
--        end if; 
--        
--    else
--        dbms_output.put_line('�ָ��� �ƴմϴ�');
--    end if;    
    
        if to_char(sysdate, 'DY') in ('ȭ') then

        if inserting then 
            dbms_output.put_line('insert �˴ϴ�');
        elsif updating then
            dbms_output.put_line('update �˴ϴ�');
        elsif deleting then
            dbms_output.put_line('delete �˴ϴ�');    
        else
            dbms_output.put_line('ȭ���� �ܿ��� ���� �ȵ˴ϴ�'); 
        end if; 
        
    else
        dbms_output.put_line('ȭ������ �ƴմϴ�');
    end if;
end;
/

update emp_trg set sal = 3600 where empno = 7369;
delete from emp_trg where empno = 7369;



create table dept_trg 
as select * from dept;


create table dept_trg_log(
	tablename varchar2(10),
	dml_type varchar2(10),
	deptno number(2),
	user_name varchar2(30),
    change_date date
);

create or replace trigger trg_dept_log

after
insert or update or delete on dept_trg
for each row 

begin
	if inserting then
	insert into dept_trg_log
	values('dept_trg', 'insert', :new.deptno, 
    sys_context('userenv', 'session_user'), sysdate);

	elsif updating then
	insert into dept_trg_log
	values('dept_trg', 'update', :old.deptno, 
    sys_context('userenv', 'session_user'), sysdate);	

	elsif deleting then 
	insert into dept_trg_log
	values('dept_trg', 'delete', :old.deptno, 
    sys_context('userenv', 'session_user'), sysdate);	

	end if; 

end;
/

insert into dept_trg values(99, 'test_dname', 'seoul');
select * from dept_trg_log;

update dept_trg set loc='test' where deptno = 99;
select * from dept_trg_log;

update dept_trg set loc='test' where deptno = 99;
select * from dept_trg_log;

delete from dept_trg where deptno = 99;
select * from dept_trg_log;


insert into dept_trg values(80, 'test_dname', 'seoul');
select * from dept_trg_log;

update dept_trg set loc='test' where deptno = 80;
select * from dept_trg_log;

delete from dept_trg where deptno = 80;
select * from dept_trg_log;

