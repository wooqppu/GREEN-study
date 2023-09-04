create table myfile(
	idx number primary key,
	name varchar2(50) not null,
	title varchar2(200) not null,
	cate varchar2(30),
	ofile varchar2(100) not null,
	sfile varchar2(50) not null,
	postdate date default sysdate not null
);


create sequence seq_myfile_num
increment by 1
start with 1
minvalue 1
maxvalue 9999
nocycle
nocache;
/

select * from myfile;

delete from myfile where idx = 2;


commit;







