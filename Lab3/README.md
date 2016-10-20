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

