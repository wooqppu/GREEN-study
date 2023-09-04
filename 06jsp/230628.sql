
create table book (
	num number(10) not null,
	title varchar2(50) not null,
	name varchar2(20) not null,
    company varchar2(30),
    price number(10) not null,
	regidate date default sysdate not null,
	primary key (title)
);

insert into book(num, title, name, company, price, regidate) 
values ('1', '세이노의 가르침', '세이노', '데이원', '7200', '2023.03.02');

insert into book(num, title, name, company, price, regidate) 
values ('2', '메리골드 마음 세탁소', '윤정은', '북로망스', '15000', '2023.03.06');

insert into book(num, title, name, company, price, regidate) 
values ('3', '최소한의 한국사', '최태성', '프런트페이지', '18000', '2023.06.21');

insert into book(num, title, name, company, price, regidate) 
values ('4', '도둑맞은 집중력', '요한 하리', '어크로스', '18800', '2023.04.28');

insert into book(num, title, name, company, price, regidate) 
values ('5', '하늘과 바람과 별과 인간', '김상욱', '바다출판사', '17800', '2023.05.26');


select * from book;


create table board (
    num number primary key,
	title varchar2(50) not null,
	name varchar2(30) not null,
    company varchar2(30),
    price number(10) not null,
	regidate date default sysdate not null
);

create sequence seq_board_book 
increment by 1 
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

insert into board(num, title, name, company, price, regidate)
values(seq_board_book.nextval, '아버지의 해방일지', '정지아','창비', '15000', sysdate); 

select * from board;
select * from book;