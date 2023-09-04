
create table tbl_member_w (
    userId      varchar2(50)    not null,
    userPass    varchar2(100)   not null,
    userName    varchar2(30)    not null,
    userPhon    varchar2(20)    not null,
    userAddr1   varchar2(20)    null,
    userAddr2   varchar2(50)    null,
    userAddr3   varchar2(50)    null,
    regiDate    date            default sysdate,
    verify      number          default 0,
    primary key(userId)    
);

create table tbl_goods (
    gdsNum       number          not null,
    gdsName      varchar2(50)    not null,
    cateCode     varchar2(30)    not null,
    gdsPrice     number          not null,
    gdsStock     number          null,
    gdsDes       varchar(500)    null,
    gdsImg       varchar(200)    null,
    gdsDate      date            default sysdate,
    primary key(gdsNum)  
);

create table goods_category (
    cateName     varchar2(20)    not null,
    cateCode     varchar2(30)    not null,
    cateCodeRef  varchar2(30)    null,
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);

alter table tbl_goods add
    constraint fk_goods_category
    foreign key (cateCode)
    references goods_category(cateCode);
    

create sequence tbl_goods_seq;


--ȸ������ �׽�Ʈ
insert into tbl_member_w(userId, userPass, userName, userPhon)
    values ('���̵�', '��й�ȣ', '�г���', '��ȭ��ȣ');
    
select * from tbl_member_w;

update tbl_member_w 
    set 
        verify = 9
            where userId = 'admin@gmail.com';
            
            
commit;


--ī�װ� ���� 
-- ������� - ��������, �ؿܵ���
-- �������� - �Ҽ�, ��/������, �ι�
-- �ؿܵ��� - ����, ����/����, �ι�/��ȸ

insert into goods_category (cateName, cateCode) values ('��������', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('�Ҽ�', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('��/������', '102', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('�ι�', '103', '100');

insert into goods_category (cateName, cateCode) values ('�ؿܵ���', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('����', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('����/����', '202', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) 
values ('�ι�/��ȸ', '203', '200');

select * from goods_category;

commit;

select level, cateName, cateCode, cateCodeRef from goods_category
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;

commit;


insert into tbl_goods (gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes)
    values (tbl_goods_seq.nextval, '��ǰ �̸�', 100, 1000, 30, '��ǰ ����');
    
select * from tbl_goods;

select gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes, gdsImg, gdsDate
    from tbl_goods order by gdsNum desc;
    
select gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes, gdsImg, gdsDate
    from tbl_goods where gdsnum = 2;

select 
    g.gdsNum, g.gdsName, g.cateCode, c.cateCodeRef, c.cateName, gdsPrice, 
    gdsStock, gdsDes, gdsImg, gdsDate
        from tbl_goods g
            inner join goods_category c
                on g.cateCode = c.cateCode
            where g.gdsnum = 5;
            
commit;

update tbl_goods
    set 
        gdsName = '���� ����',
        cateCode = '200',
        gdsPrice = '9999',
        gdsStock = '999',
        gdsDes = '������ ����',
        gdsImg = ''
    where gdsNum = 2;        

select * from tbl_goods;

commit;

delete 
    tbl_goods where gdsNum = 1;
    
commit;

alter table tbl_goods add (gdsThumbImg varchar2(200));

select * from tbl_goods;

select gdsImg, gdsThumbImg from tbl_goods;

select 
    g.gdsNum, g.gdsName, g.cateCode, c.cateCodeRef, c.cateName, gdsPrice, 
    gdsStock, gdsDes, gdsImg, gdsDate, g.gdsImg, g.gdsThumbImg
        from tbl_goods g
            inner join goods_category c
                on g.cateCode = c.cateCode
            where g.cateCode = 100 or c.cateCodeRef = 100;
            
create table tbl_reply (
    gdsNum      number          not null,
    userId      varchar2(50)    not null,
    repNum      number          not null,
    repCon      varchar2(2000)  not null,
    repDate     date            default sysdate,
    primary key(gdsNum, repNum) 
);

drop sequence tbl_reply_seq;

create sequence tbl_reply_seq;

alter table tbl_reply
    add constraint tbl_reply_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
alter table tbl_reply
    add constraint tbl_reply_userId foreign key(userId)
    references tbl_member_w(userId);
    
commit;

insert into tbl_reply (gdsNum, userId, repNum, repCon)
    values(21, 'user1@gmail.com', tbl_reply_seq.nextval, '�׽�Ʈ ����2');
    
select * from tbl_reply;

select 
    r.gdsNum, r.userId, r.repNum, r.repCon, r.repDate, m.userName
from tbl_reply r
    inner join tbl_member_w m
        on r.userId = m.userId
    where gdsNum = 21;
    
delete tbl_reply 
    where repNum = 1
        and userId = 'user1@gmail.com';
        
select userId from tbl_reply
    where repNum = 2;
    
update tbl_reply 
    set
        repCon = '������ ����'
    where repNum = 4
        and userId = 'user1@gmail.com';

commit;

create table tbl_cart (
    cartNum     number          not null,
    userId      varchar2(50)    not null,
    gdsNum      number          not null,
    cartStock   number          not null,
    addDate     date            default sysdate,
    primary key(cartNum, userId) 
);

create sequence tbl_cart_seq;

alter table tbl_cart
    add constraint tbl_cart_userId foreign key(userId)
    references tbl_member_w(userId);
    
alter table tbl_cart
    add constraint tbl_cart_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
insert into tbl_cart (cartNum, userId, gdsNum, cartStock)
    values (tbl_cart_seq.nextval, 'user1@gmail.com', 21, 99);
    
select * from tbl_cart;

commit;

select 
    row_number() over(order by c.cartNum desc) as num,
    c.cartNum, c.userId, c.gdsNum, c.cartStock, c.addDate,
    g.gdsName, g.gdsPrice, g.gdsthumbimg
from tbl_cart c
    inner join tbl_goods g
        on c.gdsNum = g.gdsNum
    where c.userId = 'user1@gmail.com';    
    

delete tbl_cart 
    where cartNum = 2
        and userId = 'user1@gmail.com';
        
select * from tbl_cart;

commit;

create table tbl_order (
    orderId     varchar2(50) not null,
    userId      varchar2(50) not null,
    orderRec    varchar2(50) not null,
    userAddr1   varchar2(20) not null,
    userAddr2   varchar2(50) not null,
    userAddr3   varchar2(50) not null,
    orderPhon   varchar2(30) not null,
    amount      number       not null,
    orderDate   Date         default sysdate,   
    primary key(orderId)
);

alter table tbl_order
    add constraint tbl_order_userId foreign key(userId)
    references tbl_member_w(userId);
    
    
create table tbl_order_details (
    orderDetailsNum number       not null,
    orderId         varchar2(50) not null,
    gdsNum          number          not null,
    cartStock       number          not null,
    primary key(orderDetailsNum)
);

create sequence tbl_order_details_seq;

alter table tbl_order_details
    add constraint tbl_order_details_orderId foreign key(orderId)
    references tbl_order(orderId);

commit;

select 
    o.orderId, o.userId, o.orderRec, o.userAddr1, o.userAddr2, o.userAddr3,
    o.orderPhon, o.amount, o.orderDate, d.orderDetailsNum, d.gdsNum, d.cartStock,
    g.gdsName, g.gdsthumbimg, g.gdsPrice
from tbl_order o
        inner join tbl_order_details d
            on o.orderId = d.orderId
        inner join tbl_goods g 
            on d.gdsNum = g.gdsNum
    where userId = 'user1@gmail.com'
        and o.orderId = '20233318_593268';
    
select * from tbl_cart;

select 
    orderId, userId, orderRec, userAddr1, userAddr2, userAddr3, orderPhon,
    amount, orderDate 
from tbl_order
    where userId = 'user1@gmail.com';
    
select 
    orderId, userId, orderRec, userAddr1, userAddr2, userAddr3, orderPhon, 
    amount, orderDate
from tbl_order;    

select 
    o.orderId, o.userId, o.orderRec, o.userAddr1, o.userAddr2, o.userAddr3,
    o.orderPhon, o.amount, o.orderDate, d.orderDetailsNum, d.gdsNum, d.cartStock,
    g.gdsName, g.gdsthumbimg, g.gdsPrice
from tbl_order o
        inner join tbl_order_details d
            on o.orderId = d.orderId
        inner join tbl_goods g 
            on d.gdsNum = g.gdsNum
    where o.orderId = '20233318_593268'; 
    
alter table tbl_order
    add(
        delivery    varchar2(20)    default '����غ�'
    );
    
select 
    orderId, userId, orderRec, userAddr1, userAddr2, userAddr3, orderPhon, 
    amount, orderDate, delivery 
from tbl_order
    where userId = 'user1@gmail.com'; 
    
commit;    

update tbl_order
    set delivery = '��� ��'
where orderId = '20233318_593268';  

select * from tbl_order;


    commit;
    
update tbl_goods 
    set gdsStock = gdsStock - 2
where gdsNum = 21; 

select * from tbl_goods;

select * from tbl_order_details
    where orderId = '20233318_593268';
    
select orderId, gdsNum, cartStock from tbl_order_details
    where orderId = '20233318_593268';
    
commit;   

select
    r.gdsNum, r.userId, r.repNum, r.repCon, r.repDate,
    m.userName
from tbl_reply r
    inner join tbl_member_w m 
        on r.userId = m.userId;
        
alter table tbl_order
    modify(userAddr1 varchar2(100));

alter table tbl_order
    modify(userAddr2 varchar2(100));
   
alter table tbl_order
    modify(userAddr3 varchar2(100));
    
commit;

select * from tbl_member_w;

select * from tbl_goods;    

delete from tbl_goods where gdsNum = 21;