
select * from tbl_attach;

create table tbl_gallery (
    gno int primary key, 
    title varchar2(200) not null,
    writer varchar2(100) not null,
    filename varchar2(500) default 'default_img.jpg' not null,
    uploadpath varchar2(500) not null,
    fullname varchar2(500),
    category varchar2(100) default 'all',
    content varchar2(1000) not null
);

create sequence gal_seq;

select * from tbl_gallery;

commit;
