 
create table mvcboard(
	idx number primary key,
	name varchar2(50) not null,
	title varchar2(200) not null,
	content varchar2(2000) not null,
	postdate date default sysdate not null,
	ofile varchar2(200),
	sfile varchar2(100),
	pass varchar2(50) not null,
	visitcount number default 0 not null
);

create sequence seq_mvcboard_num
increment by 1
start with 1
minvalue 1
maxvalue 9999
nocycle
nocache;
/

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '��׸�', '����1', '���볻��', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '�̺��', '����2', '���볻��', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '�̱׸�', '����3', '���볻��', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '����', '����4', '���볻��', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '���׸�', '����5', '���볻��', '1234');

select * from mvcboard;

commit;


select count (*) from mvcboard;













