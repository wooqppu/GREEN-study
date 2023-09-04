
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
		when 10 then dbms_output.put_line('10일 때 이름');
		when 20 then dbms_output.put_line('20일 때 이름');
		when 30 then dbms_output.put_line('30일 때 이름');
		when 40 then dbms_output.put_line('40일 때 이름');
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
        dname dept.dname%type,  --테이블의 열 타입 지정
        loc dept.loc%type       --테이블의 열 타입 지정
    );
    
    dept_rec rec_dept; --rec_dept(레코드)타입으로 변수 선언 

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

    update dept_record   --update 이용해서 데이터 변경, 수정
    set row = dept_rec
    where deptno = 30;
    
end;
/

select * from dept_record;


set serveroutput on;

declare
    --컬렉션 타입 생성
    type itab_ex is table of varchar2(20)
    index by pls_integer;     --정수 타입의 인덱스 지정
    
    --변수 선언 컬렉션 타입
    text_arr itab_ex;

begin
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(4) := '4th data';

    dbms_output.put_line('첫번째 값은 : ' || text_arr(1));
    dbms_output.put_line('두번째 값은 : ' || text_arr(2));
    dbms_output.put_line('세번째 값은 : ' || text_arr(3));
    dbms_output.put_line('네번째 값은 : ' || text_arr(4));

end;
/

set serveroutput on;

declare
    --레코드 타입 생성 
    type rec_dept is record(
        deptno dept.deptno%type,    --dept테이블의 deptno컬럼타입으로 지정
        dname dept.dname%type       --dept테이블의 dname컬럼타입으로 지정
    );
    
    --컬렉션 타입 생성
    type itab_dept is table of rec_dept 
    index by pls_integer;
    
    --컬렉션 타입 변수 생성 
    dept_arr itab_dept;
    --pls_integer(정수)타입 변수 생성 
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
    --컬렉션 타입 생성 
    type itab_dept is table of dept%rowtype     --dept테이블의 행 타입으로 지정
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
    --컬렉션 생성하기
    type itab_ex is table of varchar2(20)
    index by pls_integer;
    
    --변수 선언
    text_arr itab_ex;

begin
    text_arr(1) := '첫번째';
    text_arr(2) := '두번째';
    text_arr(3) := '세번째';
    text_arr(4) := '네번째';

    dbms_output.put_line('text_arr.count : ' || text_arr.count);
    dbms_output.put_line('text_arr.처음 : ' || text_arr.first);
    dbms_output.put_line('text_arr.마지막 : ' || text_arr.last);
    dbms_output.put_line('text_arr(3) 다음 인덱스 : ' || text_arr.next(3));
    dbms_output.put_line('text_arr(3) 이전 인덱스 : ' || text_arr.prior(3));

    
    dbms_output.put_line('text_arr(4) 다음 : ' || text_arr.next(4));
    -- 4가 마지막이어서 null 빈 값으로 출력됨
   

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

    --레코드 타입 변수 생성 
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
    --커서 데이터를 입력할 변수 선언 
    dept_row dept%rowtype;
    --커서 선언
    cursor c1 is 
    select * from dept where deptno = 30;

begin
    --커서 열기(실행)
    open c1;
    --커서로부터 읽어온 데이터 할당 
    fetch c1 into dept_row;
 
    --출력문 작성
    dbms_output.put_line(dept_row.deptno || + ' : ' || dept_row.dname 
    || ' : ' || dept_row.loc);
    
    --커서 닫기
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
--        --커서로부터 데이터 읽기
--        fetch c2 into v_dept_row;
--        exit when c2%notfound;
--        
--        dbms_output.put_line(v_dept_row.dname);
--    
--    end loop;
--    close c2;

    -- for loop 사용하기 
    for v_dept_row in c2 loop
        
        dbms_output.put_line(v_dept_row.dname);
        
    end loop;
end;
/


set serveroutput on;

declare
    --커서 데이터 입력할 변수 선언 
    v_dept_row dept%rowtype;
    --사용자가 입력하는 부서 번호를 저장할 변수 선언 
    v_deptno dept.deptno%type;
    
    cursor c3 (p_deptno dept.deptno%type) is
    select * from dept where deptno = p_deptno;
    
begin
    v_deptno := &input_deptno;
    open c3(v_deptno);
    
    --open c3(10);
    fetch c3 into v_dept_row;

    dbms_output.put_line(v_dept_row.deptno || '번 부서, 부서 이름 : ' 
    || v_dept_row.dname);
    
    close c3;
end;
/

set serveroutput on;

begin
    update dept set dname = 'DB'
    where deptno = 20;
    
    dbms_output.put_line('변경된 행의 수 : ' || sql%rowcount);

    if(sql%found) then
        dbms_output.put_line('변경 대상 행의 존재 여부 : true');
    else
        dbms_output.put_line('변경 대상 행의 존재 여부 : false');
    
    end if;
end;
/

set serveroutput on;

declare
	--커서 데이터가 입력될 변수 선언 
	empRow emp%rowtype;
	
	--커서 선언	
	cursor cursor1 is
	select *  from emp;	

begin
	--커서 열기
    --open cursor1;
    --loop
    
    for empRow in cursor1 loop

		--커서로부터 데이터 읽기
		--fetch cursor1 into empRow;
		
		--무한루프 끝내는 조건 
		--exit when cursor1%notfound;

		dbms_output.put_line('empno : ' || empRow.empno
		|| 'ename : ' || empRow.ename || 'job : ' || empRow.job
		|| 'sal : ' || empRow.sal || 'deptno : ' || empRow.deptno
		);

	end loop;
	
	--커서 닫기
	--close cursor1;
end;
/

declare
    v_number number;
    
begin
    --오류 발생 (문자 타입을 숫자형에 집어넣으려고 함)
    select dname into v_number
    from dept where deptno = 40;

--예외 처리
exception
    when value_error then
    dbms_output.put_line('예외처리  : 수치 오류값 오류 발생');

end;
/


set serveroutput on;

declare
    v_wrong number;

begin
    select dname into v_wrong from dept where deptno = 10;
    dbms_output.put_line('예외가 발생되면 다음 문장은 실행되지 않음'); 

exception
--    when too_many_rows then --각각의 오류에 예외처리를 주기 
--    dbms_output.put_line('요구보다 많은 행 추출 오류 발생');
--
--    when value_error then 
--    dbms_output.put_line('수치 또는 값 오류 발생');
--    
--    when others then 
--    dbms_output.put_line('사전 정의 외 오류 발생');
--
--    dbms_output.put_line('sqlcode : ' || to_char(sqlcode));
    
    when others then    --예외처리를 한 번에 주는 것도 가능 
    dbms_output.put_line('수치 또는 값 오류 발생');
    dbms_output.put_line('sqlcode : ' || to_char(sqlcode));
    dbms_output.put_line('sqlerrm : ' || sqlerrm);

end;
/
