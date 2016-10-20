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





