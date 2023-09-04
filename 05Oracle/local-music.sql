
--create table album (
--albumno varchar2(3) not null primary key,
--title varchar2(3) not null,
--artist varchar2(30),
--price member,
--released date, 
--supply varchar2(20),
--star_p number(3,1) 
--);
--
--create table song (
--albumno2 varchar2(3) not null,
--diskk varchar2(3) not null primary key,
--songno varchar2(3) not null,
--songname varchar2(50),
--assort varchar2(10)
--);



select * from album;

select * from song;

select a.title, a.artist from album a, song s
where a.albumno = s.albumno2
and songname = '해변의 여인'; 

select a.artist
from album a join song s on (a.albumno = s.albumno2)
where songname = '그대 내 품에';

select s.songname
from album a join song s on (a.albumno = s.albumno2)
where title = 'Break Up 2 Make Up';

select title, count(s.albumno2) 
from album a join song s on (a.albumno = s.albumno2)
group by title;

select title, count(s.albumno2) 
from album a join song s on (a.albumno = s.albumno2)
where songname like '%사랑%'
group by title;

select title
from album a join song s on (a.albumno = s.albumno2)
where album.title = song.songname;

select title from album
where title = artist;

select songname, count(albumno2)
from song
group by songname
having count(songname) >= 2; 

commit;
