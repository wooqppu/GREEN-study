
set serveroutput on;

declare 
    v_empno number(4) := 10;
    v_empno2 number(4) := null;
    v_ename varchar2(10);
    v_color varchar2(20) default 'blue';

    s_name constant varchar2(10) := 'aaa';

begin
    v_ename := 'green';
    --s_name := 'bbbb';

    dbms_output.put_line('empno2은 : ' || v_empno2 || '이다');
    dbms_output.put_line('name은 : ' || v_ename || '이다');
    dbms_output.put_line('color는 : ' || v_color || '이다');
    
    dbms_output.put_line('hello');
    dbms_output.put_line('PL/SQL');
end;
/
-- 한줄주석 /**/ 여러줄주석



set serveroutput on;

declare 
    v_dept_row dept%rowtype;

begin
    select deptno, dname, loc into v_dept_row
    from dept
    where deptno = 10;
    
    dbms_output.put_line('deptno : ' || v_dept_row.deptno);
    dbms_output.put_line('dname : ' || v_dept_row.dname);
    dbms_output.put_line('loc : ' || v_dept_row.loc);

end;
/

set serveroutput on;

declare
    v_score number := 85;

begin
    if v_score >= 90 then
        dbms_output.put_line('A');
    
    elsif v_score >= 80 then
        dbms_output.put_line('B');
    
    elsif v_score >= 70 then
        dbms_output.put_line('C');
    
    else 
        dbms_output.put_line('D');
   
    end if;
end;
/

set serveroutput on;

declare
    v_score2 number := 87; 

begin
	case trunc(v_score2 / 10)
		when 10 then dbms_output.put_line('A');
		when 9 then dbms_output.put_line('B');
        when 8 then dbms_output.put_line('C');
        when 7 then dbms_output.put_line('D');
        when 6 then dbms_output.put_line('E');
        
        else dbms_output.put_line('F');

    end case;
end;
/

set serveroutput on;

declare
    v_num number := 0;
    
begin
    loop
        dbms_output.put_line('현재 v_num : ' || v_num);
        v_num := v_num + 1;
        if v_num > 4 then
            exit;
        end if;    
        --exit when v_num > 4;
    end loop;
end;
/


set serveroutput on;

declare
    num2 number := 0; 

begin
    while num2 < 4 loop
        dbms_output.put_line(num2);
        num2 := num2 + 1;
    end loop;
end;
/

set serveroutput on;

begin
    for i in 0..4 loop
        dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/

set serveroutput on;

begin
    for i in reverse 0..4 loop
        dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/

set serveroutput on;

begin
    for i in 0..4 loop
        continue when mod(i, 2) = 0;
        dbms_output.put_line('현재 i의 값 : ' || i);   
    end loop;
end;
/



