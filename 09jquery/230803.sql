
create table member (
    userid varchar2(20) primary key,
    password varchar2(20) not null,
    birthyear number(4) not null
);

select * from member;