
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
values ('1', '���̳��� ����ħ', '���̳�', '���̿�', '7200', '2023.03.02');

insert into book(num, title, name, company, price, regidate) 
values ('2', '�޸���� ���� ��Ź��', '������', '�Ϸθ���', '15000', '2023.03.06');

insert into book(num, title, name, company, price, regidate) 
values ('3', '�ּ����� �ѱ���', '���¼�', '����Ʈ������', '18000', '2023.06.21');

insert into book(num, title, name, company, price, regidate) 
values ('4', '���ϸ��� ���߷�', '���� �ϸ�', '��ũ�ν�', '18800', '2023.04.28');

insert into book(num, title, name, company, price, regidate) 
values ('5', '�ϴð� �ٶ��� ���� �ΰ�', '����', '�ٴ����ǻ�', '17800', '2023.05.26');


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
values(seq_board_book.nextval, '�ƹ����� �ع�����', '������','â��', '15000', sysdate); 

select * from board;
select * from book;