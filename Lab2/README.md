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
