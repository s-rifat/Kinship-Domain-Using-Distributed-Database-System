clear screen;
SELECT * FROM Parent1 NATURAL JOIN Parent2@site1;
select * from Female1 union select * from Female2@site1;
select * from Male1 union select * from Male2@site1;

select * from (select * from Female1 union select * from Female2@site1) where name = 'Jerin';
SELECT * FROM Parent1 NATURAL JOIN Parent2@site1 where id = 5;