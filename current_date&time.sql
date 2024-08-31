CREATE TABLE test(
my_date DATE,
my_time TIME,
my_date_time  DATETIME

);
--here we just create temporary table name test

insert into test 
values(curdate(), current_date(),now());
select * FROM test
--In return it will give current time
