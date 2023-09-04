
drop table member;

create table member (
	id varchar2(10) not null,
	pass varchar2(20) not null,
	name varchar2(30) not null,
	regidate date default sysdate not null,
	primary key (id)
);

insert into member(id, pass, name) values ('green', '1234', '김그린');
select * from member;

create table board (
	num number primary key,
	title varchar2(200) not null,
	content varchar2(2000) not null,
	id varchar2(10) not null,
	postdate date default sysdate not null,
	visitcount number(6)
);

create sequence seq_board_num 
increment by 1 
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

insert into board(num, title, content, id, postdate, visitcount)
values(seq_board_num.nextval, '제목1', '내용1입니다.','green',sysdate,0); 

select * from board;
select * from member;













