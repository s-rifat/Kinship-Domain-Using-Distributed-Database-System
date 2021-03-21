--server
clear screen;

drop table Parent2;

create table Parent2(id number, childName varchar2(50));

insert into Parent2 values(1,'Tufel');
insert into Parent2 values(2,'Sohel');
insert into Parent2 values(3,'Jerin');
insert into Parent2 values(4,'Najnin');
insert into Parent2 values(5,'Rifat');

commit;
select * from Parent2;


drop table Male2;

create table Male2(name varchar2(50));

insert into Male2 values('Sohel');
insert into Male2 values('Rifat');

commit;
select * from Male2;


drop table Female2;

create table Female2(name varchar2(50));

insert into Female2 values('Jerin');

commit;
select * from Female2;