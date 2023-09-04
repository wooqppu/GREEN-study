select * from board;

select * from member;

select * from board where num=1;
select * from board;
select title, name, rownum from board;
select * from board order by num desc;

select * from (
    select Tb.*, rownum aa from
    (select * from board order by num desc) Tb
) 
where aa between 1 and 10;

select * from board;



