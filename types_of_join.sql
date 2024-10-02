create table employee
(
empID int primary key,
eName varchar(30),
empDept varchar(20),
salary int
);
insert into employee values (101, "Amanda", "Development", 50000),
(102, "Diana", "HR", 40000),
(103, "Bruce", "Designing", 30000),
(104, "Steve", "Testing", 35000),
(105, "Roger", "Analyst", 10000);

select * from employee;

create table department
(
deptID int primary key,
deptName varchar(20),
location varchar(20)
);

insert into department values (10, "Development", "New York"),
(11, "Designing", "New York"),
(12, "Testing", "Washington"),
(13, "Help Desk", "Los Angeles");

select * from department;

select empID, eName, deptID, deptName from employee
left outer join department
ON employee.empDept = department.deptName;

select empID, eName, deptID, deptName from employee
right outer join department
ON employee.empDept = department.deptName;
