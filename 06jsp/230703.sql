
select * from (
select Tb.*, rownum rnum from ( 
select * from board order by num desc) Tb)
where rnum between 1 and 10;

select count(*) from board; 