
create sequence seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regidate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key(bno);

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');

select * from tbl_board;ommit;

delete tbl_board where bno = 19;
select *  from tbl_board;