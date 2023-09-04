
select * from dept;

set serveroutput on;

declare
    v_dept_row dept%rowtype;

begin
    select deptno, dname, loc into v_dept_row 
    from dept where deptno = 40;
    dbms_output.put_line('deptno : ' || v_dept_row.deptno);
    dbms_output.put_line('deptno : ' || v_dept_row.dname);
    dbms_output.put_line('deptno : ' || v_dept_row.loc);

end;
/

set serveroutput on;

declare
	v_deptno dept.deptno%type := 10;	
begin
	case v_deptno
		when 10 then dbms_output.put_line('10�� �� �̸�');
		when 20 then dbms_output.put_line('20�� �� �̸�');
		when 30 then dbms_output.put_line('30�� �� �̸�');
		when 40 then dbms_output.put_line('40�� �� �̸�');
		else dbms_output.put_line('dname : N/A');
	end case;
end;
/

set serveroutput on;

begin
	for i in 1..10 loop
		continue when mod(i,2) = 0;
		dbms_output.put_line(i);
	end loop;
end;
/


set serveroutput on;

declare 
    type rec_dept is record (
        deptno number(2) not null := 99,
        dname dept.dname%type,
        loc dept.loc%type
        );
    
    dept_rec rec_dept;

begin
    dept_rec.dname := 'GREEN';
    dept_rec.loc := 'ULSAN';
    dept_rec.deptno := 60;
    
    dbms_output.put_line('dname : ' || dept_rec.dname);
    dbms_output.put_line('loc : ' || dept_rec.loc);
    dbms_output.put_line('deptno : ' || dept_rec.deptno);

end;
/

create table dept_record
as select * from dept;

set serveroutput on;

declare
    type rec_dept is record(
        deptno number(2) not null := 99,
        dname dept.dname%type,  --���̺��� �� Ÿ�� ����
        loc dept.loc%type       --���̺��� �� Ÿ�� ����
    );
    
    dept_rec rec_dept; --rec_dept(���ڵ�)Ÿ������ ���� ���� 

--begin
--  dept_rec.dname := 'blue';
--  dept_rec.loc := 'ulsan';
--  dept_rec.deptno := 70;
--
--  insert into dept_record
--  values dept_rec;
    
    begin
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    dept_rec.deptno := 99;

    update dept_record   --update �̿��ؼ� ������ ����, ����
    set row = dept_rec
    where deptno = 30;
    
end;
/

select * from dept_record;


set serveroutput on;

declare
    --�÷��� Ÿ�� ����
    type itab_ex is table of varchar2(20)
    index by pls_integer;     --���� Ÿ���� �ε��� ����
    
    --���� ���� �÷��� Ÿ��
    text_arr itab_ex;

begin
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(4) := '4th data';

    dbms_output.put_line('ù��° ���� : ' || text_arr(1));
    dbms_output.put_line('�ι�° ���� : ' || text_arr(2));
    dbms_output.put_line('����° ���� : ' || text_arr(3));
    dbms_output.put_line('�׹�° ���� : ' || text_arr(4));

end;
/

set serveroutput on;

declare
    --���ڵ� Ÿ�� ���� 
    type rec_dept is record(
        deptno dept.deptno%type,    --dept���̺��� deptno�÷�Ÿ������ ����
        dname dept.dname%type       --dept���̺��� dname�÷�Ÿ������ ����
    );
    
    --�÷��� Ÿ�� ����
    type itab_dept is table of rec_dept 
    index by pls_integer;
    
    --�÷��� Ÿ�� ���� ���� 
    dept_arr itab_dept;
    --pls_integer(����)Ÿ�� ���� ���� 
    idx pls_integer := 0;

begin
    for i in (select deptno, dname from dept) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        
        dbms_output.put_line(dept_arr(idx).deptno 
        || ' : ' || dept_arr(idx).dname);
        
    end loop;
end;
/

set serveroutput on;

declare
    --�÷��� Ÿ�� ���� 
    type itab_dept is table of dept%rowtype     --dept���̺��� �� Ÿ������ ����
    index by pls_integer;
    dept_arr itab_dept;
    idx pls_integer := 0;

begin
    for i in (select * from dept) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        dept_arr(idx).loc := i.loc;
        
        dbms_output.put_line(
        dept_arr(idx).deptno || ' : ' ||
        dept_arr(idx).dname || ' : ' ||
        dept_arr(idx).loc
        );
        
    end loop;
end;
/


set serveroutput on;

declare 
    --�÷��� �����ϱ�
    type itab_ex is table of varchar2(20)
    index by pls_integer;
    
    --���� ����
    text_arr itab_ex;

begin
    text_arr(1) := 'ù��°';
    text_arr(2) := '�ι�°';
    text_arr(3) := '����°';
    text_arr(4) := '�׹�°';

    dbms_output.put_line('text_arr.count : ' || text_arr.count);
    dbms_output.put_line('text_arr.ó�� : ' || text_arr.first);
    dbms_output.put_line('text_arr.������ : ' || text_arr.last);
    dbms_output.put_line('text_arr(3) ���� �ε��� : ' || text_arr.next(3));
    dbms_output.put_line('text_arr(3) ���� �ε��� : ' || text_arr.prior(3));

    
    dbms_output.put_line('text_arr(4) ���� : ' || text_arr.next(4));
    -- 4�� �������̾ null �� ������ ��µ�
   

end;
/

set serveroutput on;


create table emp_record
as select * from emp
where 1 <> 1;


declare
	type rec_emp is record (
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        mgr emp.mgr%type,
        hiredate emp.hiredate%type,
        sal emp.sal%type,
        comm emp.comm%type,
        deptno emp.deptno%type
    );

    --���ڵ� Ÿ�� ���� ���� 
	emp_rec rec_emp;
    
begin
	emp_rec.empno := 1111;
	emp_rec.ename := 'TEST_USER';
	emp_rec.job := 'TEST_JOB';
	emp_rec.mgr := null;
	emp_rec.hiredate := to_date('20180301', 'YYYYMMDD');
	emp_rec.sal := 3000;
	emp_rec.comm := null; 
	emp_rec.deptno := 40;

	insert into emp_record
    values emp_rec;
    
end;
/

declare 

	type itab_emp is table of emp%rowtype
	index by pls_integer;
	emp_arr itab_emp;
	idx pls_integer := 0;

begin 
	for i in (select * from emp) loop
		idx := idx + 1;
		emp_arr(idx).empno := i.empno;
		emp_arr(idx).ename := i.ename;
		emp_arr(idx).job := i.job;
		emp_arr(idx).mgr := i.mgr;
		emp_arr(idx).sal := i.sal;
		emp_arr(idx).hiredate := i.hiredate;
		emp_arr(idx).comm := i.comm;
		emp_arr(idx).deptno := i.deptno;


		dbms_output.put_line (
		emp_arr(idx).empno || ':' ||
		emp_arr(idx).ename || ':' ||
		emp_arr(idx).job || ':' ||
		emp_arr(idx).mgr || ':' ||
		emp_arr(idx).sal || ':' ||
		emp_arr(idx).hiredate || ':' ||
		emp_arr(idx).comm || ':' ||
		emp_arr(idx).deptno
		);

	end loop;	
end;
/



set serveroutput on;

declare
    --Ŀ�� �����͸� �Է��� ���� ���� 
    dept_row dept%rowtype;
    --Ŀ�� ����
    cursor c1 is 
    select * from dept where deptno = 30;

begin
    --Ŀ�� ����(����)
    open c1;
    --Ŀ���κ��� �о�� ������ �Ҵ� 
    fetch c1 into dept_row;
 
    --��¹� �ۼ�
    dbms_output.put_line(dept_row.deptno || + ' : ' || dept_row.dname 
    || ' : ' || dept_row.loc);
    
    --Ŀ�� �ݱ�
    close c1;
end;
/

set serveroutput on;

declare
    v_dept_row dept%rowtype;
    cursor c2 is
    select * from dept;

begin
--    open c2;
--    loop
--        --Ŀ���κ��� ������ �б�
--        fetch c2 into v_dept_row;
--        exit when c2%notfound;
--        
--        dbms_output.put_line(v_dept_row.dname);
--    
--    end loop;
--    close c2;

    -- for loop ����ϱ� 
    for v_dept_row in c2 loop
        
        dbms_output.put_line(v_dept_row.dname);
        
    end loop;
end;
/


set serveroutput on;

declare
    --Ŀ�� ������ �Է��� ���� ���� 
    v_dept_row dept%rowtype;
    --����ڰ� �Է��ϴ� �μ� ��ȣ�� ������ ���� ���� 
    v_deptno dept.deptno%type;
    
    cursor c3 (p_deptno dept.deptno%type) is
    select * from dept where deptno = p_deptno;
    
begin
    v_deptno := &input_deptno;
    open c3(v_deptno);
    
    --open c3(10);
    fetch c3 into v_dept_row;

    dbms_output.put_line(v_dept_row.deptno || '�� �μ�, �μ� �̸� : ' 
    || v_dept_row.dname);
    
    close c3;
end;
/

set serveroutput on;

begin
    update dept set dname = 'DB'
    where deptno = 20;
    
    dbms_output.put_line('����� ���� �� : ' || sql%rowcount);

    if(sql%found) then
        dbms_output.put_line('���� ��� ���� ���� ���� : true');
    else
        dbms_output.put_line('���� ��� ���� ���� ���� : false');
    
    end if;
end;
/

set serveroutput on;

declare
	--Ŀ�� �����Ͱ� �Էµ� ���� ���� 
	empRow emp%rowtype;
	
	--Ŀ�� ����	
	cursor cursor1 is
	select *  from emp;	

begin
	--Ŀ�� ����
    --open cursor1;
    --loop
    
    for empRow in cursor1 loop

		--Ŀ���κ��� ������ �б�
		--fetch cursor1 into empRow;
		
		--���ѷ��� ������ ���� 
		--exit when cursor1%notfound;

		dbms_output.put_line('empno : ' || empRow.empno
		|| 'ename : ' || empRow.ename || 'job : ' || empRow.job
		|| 'sal : ' || empRow.sal || 'deptno : ' || empRow.deptno
		);

	end loop;
	
	--Ŀ�� �ݱ�
	--close cursor1;
end;
/

declare
    v_number number;
    
begin
    --���� �߻� (���� Ÿ���� �������� ����������� ��)
    select dname into v_number
    from dept where deptno = 40;

--���� ó��
exception
    when value_error then
    dbms_output.put_line('����ó��  : ��ġ ������ ���� �߻�');

end;
/


set serveroutput on;

declare
    v_wrong number;

begin
    select dname into v_wrong from dept where deptno = 10;
    dbms_output.put_line('���ܰ� �߻��Ǹ� ���� ������ ������� ����'); 

exception
--    when too_many_rows then --������ ������ ����ó���� �ֱ� 
--    dbms_output.put_line('�䱸���� ���� �� ���� ���� �߻�');
--
--    when value_error then 
--    dbms_output.put_line('��ġ �Ǵ� �� ���� �߻�');
--    
--    when others then 
--    dbms_output.put_line('���� ���� �� ���� �߻�');
--
--    dbms_output.put_line('sqlcode : ' || to_char(sqlcode));
    
    when others then    --����ó���� �� ���� �ִ� �͵� ���� 
    dbms_output.put_line('��ġ �Ǵ� �� ���� �߻�');
    dbms_output.put_line('sqlcode : ' || to_char(sqlcode));
    dbms_output.put_line('sqlerrm : ' || sqlerrm);

end;
/
