create table employees(
 emp_id SERIAL PRIMARY KEY,
 fname VARCHAR(100) NOT NULL,
 lname VARCHAR(100) NOT NULL,
 email_id VARCHAR(100) NOT NULL,
 salary DECIMAL(10,2) Default 30000.00,
 dept VARCHAR(100),
 hire_date DATE NOT NULL default current_date
);

insert into employees(emp_id, fname, lname, email_id, salary, dept, hire_date) Values
(1000, 'Mukesh','Bajpayee', 'mukesh01@gmail.com', 35000, 'IT', '2009-12-12'),
(1001, 'Mahesh','Mohita', 'mahesh02@gmail.com', 39000, 'Finance', '2008-12-02'),
(1002, 'Mohini','Bajaj', 'm03@gmail.com', 40000, 'Analyst', '2012-12-05'),
INSERT INTO employees (emp_id, fname, lname, email_id, dept, salary, hire_date) 
      VALUES
(1003, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(1004, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(1005, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(1006, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(1007, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(1008, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(1009, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(1010, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(1011, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(1012, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');
select * from employees;
select * from employees where emp_id=1005;
select fname, lname from employees;
select Count(Distinct dept) from employees;
select * from employees where fname='Mukesh';
select * from employees where dept='HR';
select * from employees where emp_id=1010;
select * from employees where dept='HR' or dept='Finance';
select * from employees where dept='Finance' AND salary > 50000.00

select * from employees where dept NOT IN('HR','IT');
select * from employees where dept IN('HR','IT');

select * from employees where salary > 40000.00 and salary < 65000.00;
select * from employees where salary between 40000 and 65000;

select distinct dept from employees ;

select * from employees order by lname;
select * from employees order by fname desc;

select * from employees limit 5;

select * from employees where fname like '%i%';
select * from employees where fname like '%a';
select * from employees where dept like '__';
select * from employees where fname like '_a%';

select COUNT(emp_id) from employees;
select sum(salary) from employees;
select avg(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;

#GroupBY
select dept from employees GROUP BY dept;
select dept, COUNT(emp_id) from employees GROUP BY dept;
select dept, sum(salary) from employees GROUP BY dept;

#Q. Top 5 highest paid salary
select * from employees order by salary  desc limit 5;

#Q. last-name ends with ma and the salary greater than 45000
select * from employees where lname like '%ma' and salary > 45000;

# Q. employees order by asc in department and desc by salary
select * from employees order by dept desc, salary asc;

# emps whose name starts with M
select * from employees where fname like 'M%';

# emps who are not in finance 
select * from employees where dept != 'Finance';
select * from employees where dept not in ('Finance');

emps who are hired in 2012
select * from employees where YEAR(hire_date) = 2012;  [Not Working :(]

emps where the lname is oreders alphabetically limit 10
select * from employees order by lname asc limit 10;



select emp_id, concat(fname, lname) as fullname, dept from employees;
select emp_id, concat(fname,' ',lname) as fullname, dept from employees;
select emp_id, concat_ws('-',fname, lname) as Fullname, dept from employees;
select concat_ws(':', 'one','two','three'); (ws seperates each one with :)

select substr('Hello world!', 2,8); 
select substr('How are you?', 1,0);

select replace('abcdef','abc','pqr');
select replace(dept, 'IT','Tech') from employees;

select reverse('hello');

select length('Hello world!');
select * from employees where length(fname) >5;

select UPPER(fname) from employees;
select lower(fname) from employees;

select left('Mayuri',1);
select right('hello world',5);

select length('    alright    ');
select length(trim('   alright   '));
select position('om' in 'thomas');


#task("1003:Raj:Sharma:IT")
select concat_ws(':',emp_id,fname,lname,dept) from employees;
select concat_ws(':',emp_id,fname,lname,dept) from employees where fname='Raj';

#taskTask2:
#(1:Raju Sharma:IT:50000)

select concat_ws(':',emp_id, concat_ws(' ', fname,lname),salary) from employees where fname='Raj';

#Task3 #4:Suman:FINANCE
select concat_ws(':', emp_id, fname, Upper(dept)) from employees where fname='Suman';

#Tas﻿k4 #I1 Raju #H2 Priya
select concat_ws(' ',concat(left(dept,1),emp_id),fname) from employees where fname='Raj' or fname='Priya';

#exercise
1:  Find Different type of departments in database?

2: Display records with High-low salary

3: How to see only top 3 records from a table?

4: Show records where first name start with letter 'A'

5: Show records where length of the lname is 4 characters

1.
select distinct dept from employees;

2.
select max(salary), min(salary) from employees;

3.
select * from employees limit 3;

4. 
select fname from employees where fname like 'A%';

5.
select lname from employees where length(lname)=4;


#Exercise
1:  Find Total no. of employees in database?

2: Find no. of employees in each department.

3: Find lowest salary paying

4: Find highest salary paying

5: Find total salary paying in Loan department?

6: Average salary paying in each department?

1.
select count(emp_id) from employees;

2.
select count(distinct(dept)) from employees;

3.
select min(salary) from employees;

4.
select max(salary) from employees;

5.


6.
select dept,avg(salary) from employees group by distinct(dept);


#Query k andar Query
select * from employees where salary=(select max(salary) from employees);
select * from employees wher salary=(select min(salary) from employees)


#(when we have to add the category in the column use this)
select fname, salary,
case
 WHEN salary>=50000 then 'High'
 else 'Low'
End as Sal_cat
 from employees;

select 
case
 WHEN salary>=50000 then 'High'
 when salary>=40000 and salary<50000 then 'Mid'
 else 'Low' 
End as Sal_cat, count(emp_id)
 from employees group by Sal_cat;


select salary, 
case 
when salary>0 then round(salary*.10)
end
as bonus from employees;



select * from employees;











