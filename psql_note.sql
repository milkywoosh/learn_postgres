


-- NOTE: A client connection to the server can only access data in a single database

-- good playground
https://extendsclass.com/postgresql-online.html#
https://www.tutorialspoint.com/postgresql/postgresql_insert_query.htm

-- create table
create table student (
			id integer primary key, 
			firstname varchar(100), 
			lastname varchar(100)
			);

-- insert values using COLUMNS INFO
insert into student (id, firstname, lastname) values (1, 'albert', 'einstein');
insert into student (id, firstname, lastname) values (2, 'isaac', 'newton');
insert into student (id, firstname, lastname) values (3, 'marie', 'curie');
insert into student (id, firstname, lastname) values (4, 'nicolas', 'tesla');


-- insert many values multiple rows
INSERT INTO table_name (column_list)
VALUES
    (value_list_1),
    (value_list_2),
    ...
    (value_list_n);

-- insert into directly the values --> makesure the values is suitable
insert into student values(5, 'rudi', 'voller');
insert into student values(6, 'ben', 'kasava');

select * from student;


select id, concat(firstname, ' ' , lastname) as fullname from student
where id = 2;




-- CREATING SCHEMA
CREATE SCHEMA myschema;
CREATE TABLE myschema.mytable_name (
 ...
);
DROP SCHEMA myschema;