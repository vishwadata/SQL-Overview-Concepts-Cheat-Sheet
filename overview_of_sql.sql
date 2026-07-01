

/*creating table*/
drop table employee ;
create table employee
(Emp_id int,
Emp_name varchar(10),
Dept varchar(10),
Sal int);

/*inserting values into the existing table structure*/

insert /*+direct*/ into employee values
(101,'Rahul','IT',50000),
(102,'Priya','HR',40000),
(103,'Amit','IT',60000),
(104,'Neha','Finance',55000),
(105,'John','HR',45000),
(106,'Arya','IT',45000);

select * from employee;--is used to retreive the table data
alter table employee add Age int;--to add new column into the existing table
update employee set Age=50 where Emp_id=103;--adding values into the column
alter table employee drop column age;--to remove the existing column
delete from employee where Emp_id is null-- delete rows where emp-id is null
alter table employee alter column  emp_name set data type varchar(20)--to change the size of a column
alter table employee rename to employees--to rename the table name
alter table employee rename column dept to depts--to rename the column name

alter table employee add DOJ date;
update employee
set DOJ=
(case when emp_id=101 then date '2022-06-15'
     when emp_id=102 then date '2022-05-31'
     when emp_id=103 then date '2021-10-25'
     when emp_id=104 then date '2020-02-11'
     when emp_id=105 then date '2021-12-20'
     end)
 where emp_id in(101,102,103,104,105);
 
alter table employee add Curr_day date default current_date;--to create the new column into the existing table and adding values into the that new column
/*how to find the dept wise avg sal and compare sal with dept avg sal and create a new status column*/
select a.*,dep_avg_sal,
         case when sal>dep_avg_sal then 'GT'
              when sal<dep_avg_sal then 'LT'
              when sal=dep_avg_sal then 'EQ' end as avg_sal_stus from employee a
              left join (select dept,avg(sal) dep_avg_sal from employee group by dept)b
              on a.dept=b.dept;
 

 /*sub query*/
select * from  employee where sal>(select avg(sal) from employee);
 
/*multi row subquery*/
/*find employees in department having HR*/

select * from employee where dept =(select distinct Dept from employee where dept like '%HR%');
select max(sal) from employee where sal<(select max(sal) from employee);/*find 2nd highest salary*/
 

/****************OPERATORS***********************/
 
select * from employee where Dept='IT' and sal>55000;--AND operator both the conditions must be true
select * from employee where Dept='IT' or sal>55000--OR operator Either condition True
select * from employee where Dept in('IT','HR');--In operator Instead of multiple OR operators
select * from employee where Sal between 40000 and 50000; --Between operator
select * from employee where Emp_name like 'R%';--Like operator name starts with letter R pattern matching
select * from employee where Emp_name like '%a';--Like operator name ends with letter a pattern matching
select * from employee where Emp_name like '%a%';--Like operator name contains letter a pattern matching


/*ORDER BY NOTHING BUT SORTING*/

select * from employee order by sal;--by default order by sorting in Ascending order
select * from employee order by sal desc;--order by sorting in descending order


/*Aggregate functions*/

select count(*) from employee;--count function is used to count the records
select sum(sal) from employee;--SUM function is used to calculate the sum for numeric variables
select avg(sal) from employee;--AVG function is used to calculate the avg for numeric variables
select min(sal) from employee;--MIN function is used to find the minimum value from the numeric variables
select max(sal) from employee;--Max function is used to find the maximum value from the numeric variables


/****************GROUP BY **********************/

/*Common interview topic */
select dept,sum(sal) from employee group by dept;--Find the total salary by department
select dept,sum(sal) as dep_sal  from employee group by dept having dep_sal>100000;--dept whose total sal exceeds 1l
select dept,count(*) as dep_emp_cnt from employee group by dept;--dept wise employees count
select * from employee limit 2;--to retrive only limited no of rows

/********************************date functions***************************************/

select current_date;
select current_timestamp;
select current_date+10;
select datediff('day',date '2024-01-01',date '2024-01-10');
select datediff('month',date '2024-01-01',date '2024-06-10');
select doj,curr_day,datediff('year',doj,curr_day)as experience from employee;
select extract(year from date '2024-01-01');--2024
select extract(month from date '2024-11-01');--11
select extract(day from date '2024-01-15');--15
select extract(quarter from date '2026-06-15');--2
select extract(week from date '2026-06-03');--23rd week of the year
select extract(doy from date '2026-01-01');--1 day of the year
select extract(doy from date '2026-06-03');--154 day of the year
select extract(doy from date '2026-12-31');--365 day of the year
select extract(dow from date '2026-05-31');--(for sunday  0)
select extract(dow from date '2026-06-01');--(for monday  1)
select extract(dow from date '2026-06-02');--(for tuesday  2)
select extract(dow from date '2026-06-03');--(for wednesday  3)
select extract(dow from date '2026-06-04');--(for thursday  4)
select extract(dow from date '2026-06-05');--(for friday  5)
select extract(dow from date '2026-06-06');--(for saturday  6)
select to_char( date '2026-06-03','dy');--wed
select to_char( date '2026-05-31','day');--sunday
select to_char( date '2026-06-01','day');--monday
select to_char( date '2026-06-02','day');--tuesday
select to_char( date '2026-06-03','day');--wednesday
select to_char( date '2026-06-04','day');--thursday
select to_char( date '2026-06-05','day');--friday
select to_char( date '2026-06-06','day');--saturday
select to_char( date '2026-01-31','mon');--jan
select to_char( date '2026-01-31','month');--january
select to_char( date '2026-06-01','month');--june
select to_char( date '2026-12-01','month');--december
select month(date '2024-11-01');--11
select year(date '2024-11-01');--2024
select day(date '2024-11-15');--15
select date_trunc('month',current_date);--2026-06-01 00:00:00 month start date
select date_trunc('year',current_date);--2026-01-01 00:00:00 year start date
select round(current_date,'MONTH');--2026-06-01 00:00:00 month start date
select round(current_date,'year');--2026-01-01 00:00:00 year start date
select date(current_timestamp);--2026-06-03 extract only date from the date time
select add_months('2026-06-03',6);--2026-12-03 adding months to the date
select months_between('2026-12-03','2026-06-03');--(6)
select months_between('2026-06-03','2026-12-03');--(-6)
select datediff('month',date '2026-06-01',date '2026-12-10');--(6)
select datediff('month',date '2026-12-01',date '2026-06-10');--(-6)
select to_date('15-05-1999','DD-MM-YYYY');--1999-05-15 converts charater data to date
select to_char(current_date,'DD-MON-YYYY');--03-JUN-2026 converts date to character format
select * from employee where year(doj)=2020;
select * from employee where extract(year from doj)=2022
select *,to_char(doj,'day')as weekday  from employee;

/******************************************string functions******************************/

select upper('Vishwa Bharath');--VISHWA BHARATH
select lower('Vishwa Bharath');--vishwa bharath
select initcap('vishwa bharath');--Vishwa Bharath
select length('Vishwa Bharath');--14
select substr('Alluarjun',1,4);--Allu
select split_part('rahul|sharma|mumbai','|',2);--sharma
select position('a' in 'Alluarjun');--5 it returns the position of the charcter
select instr('Alluarjun','arjun');--5 it returns the position of the word
select concat('Allu','arjun');--Alluarjun it combines two strings
select emp_name ||'-'|| dept from employee;--Rahul-IT
select rpad(Emp_name,7,'*') from employee;--Arya***
select lpad(Emp_name,7,'*') from employee;--***Arya
select lpad('123',5,'0');--00123
select left('vishwabharath',6);--vishwa
select right('vishwabharath',7);--bharath
select replace('SAS Developer','SAS','SQL');--SQL Developer
select trim(' vishwa ');--vishwa trim removes leading and trailing blanks
select ltrim(' vishwa');--vishwa removes left side spaces
select rtrim('vishwa ');--vishwa removes right side spaces
select regexp_replace('ABC123XYZ','[0-9]');--ABCXYZ it removes the digits from the string
select regexp_replace('ABC123XYZ456','[^0-9]');--123456 ^ inside  the [] will not be removed
select regexp_replace('ABC123XYZ','[A-Z]');--123 it removes the alphabets from the string
select regexp_replace('ABC123XYZ','[^A-Z]');--ABCXYZ ^ inside  the [] will not be removed
select regexp_replace('Rahul@#$%','[^A-Za-z0-9]');--Rahul ^ inside  the [] will not be removed
select regexp_replace('Rahul@#$%','[^@#$%&!]');--@#$% ^ inside  the [] will not be removed
select regexp_substr('ABC123XYZ456','[0-9]+');--123 it extracts first digits from the string + means one or more occurrences
select regexp_substr('Acnt No:1234567890','[0-9]+');--1234567890 it extracts the digits from the string
select regexp_substr('Acnt No:1234567890','[A-Za-z]+');--Acnt it extracts the first occurances of characters from the string
select regexp_substr('hi this is ABCDE1234F','[A-Z]{5}[0-9]{4}[A-Z]{1}');--ABCDE1234F extract pattern matching
select regexp_substr('hi this is rahul@gmail.com','[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}');--rahul@gmail.com
select regexp_substr('vishwa bharath allu','^[A-Za-z]+');--vishwa
select regexp_substr('vishwa bharath allu','[A-Za-z]+$');--allu
select regexp_substr('acnt opened on 15-06-2022','[0-9]{2}-[0-9]{2}-[0-9]{4}');--15-06-2022
select regexp_substr('acnt opened on 15/06/2022','[0-9]{2}/[0-9]{2}/[0-9]{4}');--15/06/2022
select regexp_substr('Amt Rs. 123454.75 credited','[0-9]+.[0-9]+')--123454.75
select regexp_substr('rahul@gmail.com','@[A-Za-z]+\.[A-Za-z]+');--@gmail.com
select regexp_count('ABC123XY456','[0-9]');--6 there are 6 digits in the string
select regexp_count('ABC123XY456','[A-Z]');--5 there are 5 charcters in the string
select * from employee where regexp_like(emp_name,'^A');--^ means names starts with A
select * from employee where regexp_like(emp_name,'a$');--$ means names ends with a
select regexp_like('ABCDE1234F','^[A-Z]{5}[0-9]{4}[A-Z]{1}$');--true
select regexp_like('ABC123XYZ','^[A-Z]{5}[0-9]{4}[A-Z]{1}$');--false
/*^ starts
[A-Z]{5} 5 LETTERS
[0-9]{4} 4 DIGITS
[A-Z]{1} 1 LETTER
$ END*/


/*******************************************window functions*************************************/

select emp_id,sal,row_number() over(order by sal desc) as row_num from employee;--Row_number() assigns a unique number
select emp_id,sal,rank() over(order by sal desc) as rnk from employee;--RANK() Ties receive the same rank and gaps appear.
select emp_id,sal,dense_rank() over(order by sal desc) as dense_rnk from employee;--DENSE_RANK() No gaps appears.
select emp_id,sal,lag(sal) over(order by emp_id ) as prev_sal from employee;--LAG() get previous row value.
select emp_id,sal,lead(sal) over(order by emp_id ) as prev_sal from employee;--LEAD() get next row value.
select emp_id,sal,row_number() over(order by sal desc) as row_rnk,
rank() over(order by sal desc) as rnk,
dense_rank() over(order by sal desc) as den_rnk from employee;--comparison of row_number, rank, dense_rank.

/*running total*/
select emp_id,dept,sal,sum(sal) over(order by emp_id) as Running_total from employee;

/*partition by*/
select emp_id,dept,sal,sum(sal) over(partition  by dept) as dept_total from employee;
select * from (select *,dense_rank() over(order by sal desc)rnk from employee) x where rnk<=3;--top 3 salaries
select dept,count(*) from employee group by dept having count(*)>1;--how to find duplicate records
select *,datediff('year',doj,curr_day) as exp from employee;
select * from employee;
alter table employee add experience int;
update employee a
set experience=b.experience_0 from (select emp_id,datediff('year',doj,curr_day) as experience_0 from employee) b
where a.emp_id=b.emp_id;


/*common table expression*/
/*top 3 salaries*/
with salary_rnk as
(select *,dense_rank() over(order by sal desc) dr from employee)
select * from salary_rnk where dr<=3;
/*correlated subquery*/
select * from employee e1 where sal>(select avg(sal) from employee e2 where e1.dept=e2.dept);


/********************exists & IN**********************************/
select * from employee where emp_id in(select emp_id from employee where sal>50000);
select * from employee a where exists (select 1 from employee b where a.emp_id=b.emp_id);
/*which is fast
for small datasets-->IN
for large datasets-->Exists*/

/*EMPLOYEE TABLE*/
drop table if exists employees;
create local temp table employees
(emp_id int,
emp_name varchar(6),
dept_id int) on commit preserve rows ;
select * from employees;
insert /*direct*/ into employees values
(101,'Rahul',1),
(102,'Priya',2),
(103,'Amit',3),
(104,'Neha',5);

/*DEPARTMENT TABLE*/
drop table if exists department ;
create local temp table department
(dept_id int,
dept_name varchar(10)
) on commit preserve rows ;
select * from department;
insert /*direct*/ into department values
(1,'IT'),
(2,'HR'),
(3,'Finance');


/*SELF JOIN EMPLOYEE AND MANAGER RELATION TABLE*/
drop table if exists selfemployees ;
create local temp table selfemployees
(emp_id int,
emp_name varchar(6),
Mang_id int) on commit preserve rows ;

select * from selfemployees;

insert /*direct*/ into selfemployees values
(1,'Rahul',null),
(2,'Priya',1),
(3,'Amit',1),
(4,'Neha',2);

select * from employees where dept_id in(select dept_id from department);
select * from employees e where exists (select 1 from department d where e.dept_id=d.dept_id);


/**************************************JOINS****************************/

/*INNER JOIN returns only matching records from both table*/
select e.*,dept_name from employees e inner join department d on e.dept_id=d.dept_id;--for matching records

/*LEFT JOIN returns all records from left table and matching records from right table if no match exists NULL is returned*/
select e.*,dept_name from employees e left join department d on e.dept_id=d.dept_id;--matched records
select e.*,dept_name from employees e left join department d on e.dept_id=d.dept_id where d.dept_name is null;--non matched records

/*RIGHT JOIN returns all records from right table and matching records from left table if no match exists NULL is returned*/
select e.*,dept_name from employees e right join department d on e.dept_id=d.dept_id;--matched records
select e.*,dept_name from employees e right join department d on e.dept_id=d.dept_id where d.dept_name is null;--non matched records

/*FULL OUTER JOIN returns everything matching records, left only records, right only records*/
select * from employees e full outer join department d on e.dept_id=d.dept_id;

/*SELF JOIN joining a table itself*/
select e.emp_name,m.emp_name as mang_name from selfemployees e left join selfemployees m on e.mang_id=m.emp_id;

/*CROSS JOIN*/
select * from employees a cross join department b;--a table has 4rows b table has 3rows 4*3=12