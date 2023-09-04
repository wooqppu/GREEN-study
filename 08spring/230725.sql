
insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

select * from 
( select Tb.*, rownum rNum from
    ( select * from tbl_board order by bno desc ) Tb
) where rNum between 1 and 10;

commit;