
create table tbl_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100) not null,
	regidate date default sysdate,
	updatedate date default sysdate,
    enabled char(1) default '1'    
);

create table tbl_member_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_member_auth foreign key(userid) 
	references tbl_member(userid)
);

commit;

select * from tbl_member;

select * from tbl_member_auth;

drop table tbl_member_auth;

drop table tbl_member;

delete from tbl_member_auth;

