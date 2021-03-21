--server
clear screen;

drop table Parent1;

create table Parent1(id number, parentName varchar2(50));

insert into Parent1 values(1,'Manjur');
insert into Parent1 values(2,'Manjur');
insert into Parent1 values(3,'Manjur');
insert into Parent1 values(4,'Manjur');
insert into Parent1 values(5,'Tufel');

commit;
select * from Parent1;


drop table Male1;

create table Male1(name varchar2(50));

insert into Male1 values('Manjur');
insert into Male1 values('Tufel');

commit;
select * from Male1;


drop table Female1;

create table Female1(name varchar2(50));

insert into Female1 values('Najnin');

commit;
select * from Female1;