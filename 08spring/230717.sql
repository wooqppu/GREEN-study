
create user springex identified by green 
default tablespace users
temporary tablespace temp;

grant connect, dba to springex;

commit;