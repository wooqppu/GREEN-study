 
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
values(seq_mvcboard_num.nextval, '김그린', '제목1', '내용내용', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '이블루', '제목2', '내용내용', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '이그린', '제목3', '내용내용', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '김블루', '제목4', '내용내용', '1234');

insert into mvcboard(idx, name, title, content, pass)
values(seq_mvcboard_num.nextval, '정그린', '제목5', '내용내용', '1234');

select * from mvcboard;

commit;


select count (*) from mvcboard;













