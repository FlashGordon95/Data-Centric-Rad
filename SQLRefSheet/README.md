# SQL Reference Sheet
This page encompasses the first 4 labs for my module and is intended to be a quick refernce to common commands.

##Lab 1

### Show all tables in a database

`show tables;`

### Show all the rows and columns in the a table

`SELECT * from tablename;`

### List all details of all entities whose name begins with S

`SELECT * from tablename
 WHERE name like 'S%;`
 
### List all superheroes whose Real Surname contains the letter n

`SELECT * from tablename
 WHERE name like '%n%;`

### List all the details of all superheroes in the superhero_2_pk table who are male (have man as part of their superhero name), and who are from Gotham City. The following column names should be displayed: HERO, city, First Name Alias, Last Name Alias.

`SELECT name as 'HERO', city,real_first_name as 'First Name Alias', real_surname as 'Last Name Alias' from superhero_2_pk where name like "%man%";` 

## Part 2: 

### List only the name of the Department d005.

`SELECT dept_name from departments where dept_no = 'd005';`

### List all salaries greater than or equal to 101,000, but use an alias called money to display the results.

`SELECT salary as 'Money' from salaries where salary >= 101000;` 

### List all employees who were hired in 1987

`SELECT * from employees where YEAR(hire_date)=1987;` 

### List all employees who were hired in 1987 but were born in the 1960s or later.

`SELECT * from employees where YEAR(hire_date)=1987 and YEAR(birth_date)>=1960;` 





## Lab 2 - SQL
### Insert the following information into the superhero_table:name = Penguin City = Gotham City Real First Name = Danny Real Surname = DeVitto dob = January 14th 1955 powers = 44.57

`INSERT into superhero_table values ('Penguin','Gotham City','Danny','Devito','1955-01-14','44.57');`
### Insert the following information into the superhero_table: name = Joker city = New York powers = 77.10

`INSERT into superhero_table (name,city,powers) values('Joker','New York','77.10');`

### Update the superhero_table so that everywhere a first name or surname is NULL, it is now UNKNOWN instead.  HINT: When checking for NULL, you can’t say = NULL, you should say is NULL.

`UPDATE superhero_table set real_first_name = 'UNKNOWN', real_surname = 'UNKNOWN' WHERE real_first_name IS NULL;`

### Display the number of superheroes, whose birthdays are known, as ‘Number of known Birthdays’.

`SELECT count(dob) as 'Number of known birthdays' from superhero_table`


### Change the birthday of Spiderman from Metropolis to January 28th 1980

`UPDATE superhero_table set dob = '1980-01-28' WHERE name = 'Spiderman';`


### Increase the powers by 1 for each ‘Bat’ related superhero in Gotham City

`UPDATE superhero_table set powers = powers + 1 WHERE name LIKE '%bat%' AND city = 'Gotham City';`

### Delete all superheroes whose dob is NULL.HINT: When checking for NULL, you can’t say = NULL, you should say is NULL.

`DELETE from superhero_table WHERE dob is NULL;`

### Increase the powers of all superheroes who were born in November by 1.

`UPDATE superhero_table set powers = powers + 1 WHERE MONTH(dob) = '11';`

### Display the name, real first name, real surname and dob (as Oldest DOB) of the oldest superhero.

`SELECT name, real_first_name, real_surname, MIN(dob) as 'Oldest DOB' from superhero_table;`

### Display the total powers (as Total Metropolis Powers) of all superheroes in Metropolis.

`SELECT sum(powers) from superhero_table WHERE city = 'Metropolis';`


### Display the city and the total powers (as Total Powers) of all superheroes in the city, for each city. 

`SELECT city, sum(powers) from superhero_table GROUP BY city;`

### Display the superhero name, and the number of cities a superhero of that name lives in.

`SELECT name, count(city) from superhero_table GROUP BY name;`

### Display the year and the number of superheroes born in that year.

`SELECT YEAR(dob), count(YEAR(dob)) as 'Number of heros born' from superhero_table GROUP BY YEAR(dob);`

### Display the city and the total powers of all superheroes in that city, only for cities whose total superhero powers is greater than 100.

`SELECT city, sum(powers) from superhero_table  GROUP BY city HAVING sum(powers) >100;`

### Show the minimum, maximum and average powers of the superheroes.
`SELECT MIN(powers) as 'Weakest', MAX(powers) as 'Strongest', AVG(powers) as 'Average' from superhero_table;`
### Show the city and the average powers of all superheroes in that city; for all cities.

`SELECT city, AVG(powers) from superhero_table GROUP by city;`
## Lab 3 - Multiple Tables
### Use the show create table <table name> command to find out the structure of the superhero_table, and list the Primary Key(s) and Foreign Key(s).

`SHOW CREATE table superhero_table;`

###	Delete Spiderman from the superhero_table.

` DELETE from superhero_table where name = 'Spiderman';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`superheroes`.`superhero_city_table`, CONSTRAINT `fk_name` FOREIGN KEY (`name`) REFERENCES `superhero_table` (`name`))`

### Insert a new superhero in the superhero_table as follows:Name = ‘Joker’real_first_name = ‘John’real_surname = ‘Jones’dob = 1966-07-12powers = 22

`INSERT into superhero_table (name,real_first_name,real_surname,dob,powers) values('Joker','John','Jones','1966-07-12','22');`

###	Delete the superhero Joker from the superhero_table.What happens and why?

`DELETE from superhero_table where name = 'Joker';`

### Delete the superhero_city_table as follows:

`drop table superhero_city_table;`

### •	Create a new table called city_table as follows:

`create table city_table(id integer(11) auto_increment, city_name varchar(200), country varchar(20),population Integer(11), primary key(id)) Engine=InnoDB;`

### 

`INSERT into city_table (city_name,country,population) values('Gotham City','USA','15000000');`

`INSERT into city_table (city_name,country,population) values('Galway','Ireland','75000');`

`INSERT into city_table (city_name,country,population) values('Gotham City','USA','15000000');`

` INSERT into city_table (city_name,country,population) values('Springfield','USA','20000');`

`INSERT into city_table (city_name,country,population) values('New York','USA','8500000');`

###	Recreate the superhero_city_table, this time with two columns: + name which is a Foreign Key referring to the name column in the superhero_table. + city which is a Foreign Key referring to the id column in the city_table.HINT: A Foreign Key is created using the following syntax:Foreign Key(column) References table_name (column_in_referenced_table).	Primary Key is (name, city)

`create table superhero_city_table(name varchar(200),city_id integer(11), primary key(name,city_id), Foreign Key(name) References superhero_table(name), Foreign Key(city_id) References city_table(id))CHARACTER SET latin1;`
#### Character set must match!!!!!

### Populate the superhero_city_table so that the following are associated:

`INSERT into superhero_city_table (name, city_id) values('Spiderman',4);`

`INSERT into superhero_city_table (name, city_id) values('Superman',3);`

`INSERT into superhero_city_table (name, city_id) values('Batgirl',2);`

`INSERT into superhero_city_table (name, city_id) values('Batman',3);`

### Delete Galway from city_table

`DELETE from city_table WHERE city_name = 'Galway';
`
`Query OK, 1 row affected (0.01 sec)`
### Alter the city_table as follows:

`alter table superhero_city_table drop foreign key superhero_city_table_ibfk_2;`

`alter table superhero_city_table add constraint fk_id foreign key (city_id) references city_table(id) ON DELETE CASCADE;`
### •	Delete Metropolis from city_table.What happens and why?

`DELETE from city_table where city_name = 'Metropolis';`
`Records delete accross the DB`

## Lab 4 - Joins

### 	Display the Employee Name and Next of Kin name of ALL employees.

`SELECT ename, NextOfKin from employee_table;`


###	Display the Employee Name and Next of Kin name only of employees who have a Next of Kin.

`SELECT ename, NextOfKin from employee_table WHERE NextOfKin IS NOT NULL;`


### Display the Employee ID as ‘Employee ID’, the Employee Name as ‘Employee Name’ and the Employee Salary as ‘Employee Salary’ for all employees

`SELECT e.eid as 'Employee ID', ename as 'Employee Name', salary as 'Employee Salary' from employee_table e INNER JOIN salary s ON e.eid =s.eid;`


###  Display the Employee Name as ‘Employee Name’ and the Next of Kin’s phone number as ‘Emergency Contact’ only for employees with a Next of Kin.
`SELECT e.eid as 'Employee ID', phone as 'Emergency Contact' from employee_table e INNER JOIN next_of_kin_table k ON e.NextOfKin = k.NOK_ID where e.NextOfKin IS NOT NULL;`


### Display the Next of Kin’s name as ‘NOK Name’ and the salary of the associated employee as ‘Associated Salary’ for next of kins.
`SELECT NOK_Name, salary as 'Assciated Salary' from next_of_kin_table k INNER JOIN employee_table e ON k.NOK_ID = e.NextOfKin INNER JOIN salary s ON e.eid = s.eid;`


### Display the Employee Name as ‘Employee’, his salary as ‘Salary’, and his next of Kin’s phone number as ‘Emergency Contact’ for ALL employees.

`SELECT ename as 'Employee', salary as 'Salary', phone as 'Emergency Contact' from employee_table e LEFT JOIN salary s ON e.eid = s.eid LEFT JOIN next_of_kin_table k ON e.NextOfKIn = k.NOK_ID;`


### Rewrite a query using Inner Joins as a subquery

``
## Part 2 

###	Display the employee name as ‘Name’ and department location as ‘Location’ of the employee 7566.

`select ename as 'Name', loc as 'Location' from emp e INNER JOIN dept d ON e.deptno = d.deptno;`


###	Display the name, job and hiredate of all employees in department 20.
`SELECT ename, job, hiredate from emp where deptno = 20;`


###	Display the employee number, employee name, job, department number and department location of all employees.

`SELECT empno, ename, job , e.deptno, loc from emp e INNER JOIN dept d ON e.deptno = d.deptno;`


### Display the Customer ID, Name, Address, City and State of all customers who bought the RH: "GUIDE TO TENNIS" product.
`SELECT c.custid, name, address, city, state from customer c INNER JOIN sales s ON s.custid = c.custid WHERE s.prodname LIKE "RH%";`
## Part 3

###	Show the Student Name, and whether or not he/she attends an NUI university.

`SELECT s.student_name, d.nui from student_table s INNER JOIN course_table cou ON s.course_id=cou.course_id INNER JOIN college_table d ON d.college_id = cou.college_id;`


### •	Show college name and the number of students attending each college as ‘Attending Students’.

``


### Show the college name and the population of the county where the college is.

`select col.college_name, coun.population from college_table col INNER JOIN county_table coun ON col.county = coun.county_name;`


### •	Show the Student name, the course he/she is doing, the name of the college they are attending, and the main town and population of the county in which the college is.
``


### •	Show the Names of the students doing the longest course:

`select s.student_name, MAX(duration) from student_table s INNER JOIN course_table cou ON s.course_id = cou.course_id INNER JOIN college_table col ON cou.college_id = col.college_id;`

