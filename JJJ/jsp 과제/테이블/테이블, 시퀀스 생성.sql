
create table movie(
	idx number primary key,
	title varchar2(50) not null,
	ofile varchar2(100),
	sfile varchar2(50),
	rate varchar2(10) not null,
	year varchar2(20) not null,
	runtime varchar2(20) not null,
	age varchar2(20) not null,
	director varchar2(30) not null,
	cast varchar2(500) not null,
	content varchar2(2000) not null,
	price varchar2(50) not null,
	youtube varchar2(2000) not null
);



create table moviereview (
	idx number primary key,
	title varchar2(50) not null,
	id varchar2(50) not null,
	content varchar2(2000) not null,
	postdate date default sysdate not null
);


create table drama(
	idx number primary key,
	title varchar2(50) not null,
	ofile varchar2(100),
	sfile varchar2(50),
	year varchar2(20) not null,
	episode varchar2(20) not null,
	age varchar2(20) not null,
	cast varchar2(500) not null,
	content varchar2(2000) not null,
	info varchar2(2000),
	price varchar2(50) not null,
	youtube varchar2(2000) not null
);


create table dramareview (
	idx number primary key,
	title varchar2(50) not null,
	episode varchar2(20),
	id  varchar2(50) not null,
	content varchar2(2000) not null,
	postdate date default sysdate not null
);


create table music(
	idx number primary key,
	album varchar2(200) not null,
	title varchar2(200) not null,
	ofile varchar2(100),
	sfile varchar2(50),
	artist varchar2(30) not null,
	year varchar2(20) not null,
	playtime varchar2(20) not null,
	lyrics varchar2(4000),
	price varchar2(50) not null,
	youtube varchar2(2000) not null
);

create table musicreview (
	idx number primary key,
	title varchar2(50) not null,
	id  varchar2(50) not null,
	content varchar2(2000) not null,
	postdate date default sysdate not null
);


create table pmember(
    idx number not null,
    id varchar2(30) primary key,
    pass varchar2(50) not null,
    name varchar2(30) not null,
    email varchar2(100) not null unique,
    postnumber varchar2(300) not null,
    address varchar2(300) not null,
    address1 varchar2(300) not null,
    birthday varchar2(300) not null,
    money varchar2(300),
    purchase varchar2(3000)
);


create table purchase (
	idx number not null,
	title varchar2(200) not null,
            episode varchar2(20),
	id varchar2(50) not null,
	postdate date default sysdate not null
);




create sequence seq_table_num
start with 1
increment by 1
minvalue 1
nomaxvalue
nocycle
nocache;
/

commit;


create sequence seq_drama_num
start with 1
increment by 1
minvalue 1
nomaxvalue
nocycle
nocache;
/

create sequence seq_music_num
start with 1
increment by 1
minvalue 1
nomaxvalue
nocycle
nocache;
/



create sequence seq_pmember_num
start with 1
increment by 1
minvalue 1
nomaxvalue
nocycle
nocache;
/



insert into pmember(idx, id, pass, name, email, postnumber, address, address1, birthday)
values(seq_pmember_num.nextval, 'admin', '1234', '°ü¸®ÀÚ', 'admin@gmail.com', '11111',
'¿ï»ê ³²±¸ »ï»êÁß·Î100¹ø±æ26 ÄÉÀÌ¿¥ºôµù','1Ãþ', '1980-01-01');

select * from pmember;

commit;


