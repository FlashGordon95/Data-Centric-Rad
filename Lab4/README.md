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

