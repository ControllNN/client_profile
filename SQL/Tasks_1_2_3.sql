CREATE DATABASE IF NOT EXISTS GalleyMini;
USE GalleyMini;
CREATE TABLE IF NOT EXISTS workers( id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key, first_name VARCHAR(30) NOT NULL, last_name VARCHAR(30) NOT NULL,position_id INT(2) NOT NULL, money INT(6) NOT NULL);
INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Petya', 'Petrov', 90000, 1);
INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Misha', 'Mishin', 70000, 4);
INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Vasya', 'Vasin', 50000, 3);

INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Ivan', 'Ivanov', 28000, 2);

INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Lena', 'Lenina', 29000, 2);

INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Tanya', 'Tanina', 27000, 5);

INSERT INTO workers ( id, first_name, last_name, money, position_id ) VALUES ( null, 'Artem', 'Artemov', 40000, 3);

CREATE TABLE IF NOT EXISTS positions( id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key, position_name VARCHAR(30) NOT NULL);

INSERT INTO positions ( id, position_name  ) VALUES ( null, 'Director');

INSERT INTO positions ( id, position_name  ) VALUES ( null, 'Designer');

INSERT INTO positions ( id, position_name  ) VALUES ( null, 'Developer');

INSERT INTO positions ( id, position_name  ) VALUES ( null, 'Team Leader');

INSERT INTO positions ( id, position_name  ) VALUES ( null, 'HR');

SELECT first_name, last_name, money FROM workers where money < 30000;

select person.first_name, person.last_name, person.money, job.position_name
 from workers person
 inner join positions job on person.position_id=job.id
 where money < 30000 and position_name = 'Designer';


 

CREATE TABLE IF NOT EXISTS employees_relations(
id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key, 
employee_id INT UNSIGNED, 
supervisor_id INT UNSIGNED,
foreign key (employee_id) references workers(id),
foreign key (supervisor_id) references workers(id)
);

INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 2, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 3, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 4, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 5, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 6, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 7, 1);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 3, 2);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 4, 2);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 5, 2);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 7, 2);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 4, 3);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 5, 3);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, null, 4);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, null, 5);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, null, 6);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 4, 7);
INSERT INTO employees_relations ( id, employee_id,supervisor_id ) VALUES ( null, 5, 6);


SELECT workers.first_name, workers.last_name FROM employees_relations INNER JOIN workers ON workers.id = employees_relations.employee_id WHERE employees_relations.supervisor_id=2;
