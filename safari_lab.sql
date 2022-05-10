DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE enclosures;
DROP TABLE employees;

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);


CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR (255),
    type VARCHAR (255),
    age INT,
   enclosure_id INT REFERENCES enclosures(id)
);


CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees (id),
    enclosure_id INT REFERENCES enclosures (id),
    weekday VARCHAR (255)
);

INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Elephants', 10, TRUE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Lions', 5, FALSE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Monkeys', 15, FALSE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Pandas', 20, FALSE);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Nelly', 'Elephant', 5, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Elly', 'Elephant', 7, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Simba', 'Lion', 2, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('George', 'Monkey', 5, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Po', 'Panda', 8, 4);

INSERT INTO employees (name, employeeNumber) VALUES ('Steve Irwin', 25);
INSERT INTO employees (name, employeeNumber) VALUES ('John Doe', 41);
INSERT INTO employees (name, employeeNumber) VALUES ('Bob Mccan', 23);
INSERT INTO employees (name, employeeNumber) VALUES ('James Backshaw', 31);

INSERT INTO assignments (weekday, employee_id, enclosure_id) VALUES ('MONDAY', 1, 1);
INSERT INTO assignments (weekday, employee_id, enclosure_id) VALUES ('WEDNESDAY', 2, 2);
INSERT INTO assignments (weekday, employee_id, enclosure_id) VALUES ('FRIDAY', 3, 3);
INSERT INTO assignments (weekday, employee_id, enclosure_id) VALUES ('SATURDAY', 4, 4);


INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Nelly', 'Elephant', 5, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Elly', 'Elephant', 7, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Simba', 'Lion', 2, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('George', 'Monkey', 5, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Po', 'Panda', 8, 4);



--------------------------
--QUERIES
-- 1.The names of the animals in a given enclosure

SELECT (name) FROM animals WHERE enclosure_id = 1;

-- 2.The names of the staff working in a given enclosure

-- 3. find the name of 

SELECT (name) FROM assignments INNER JOIN employees ON assignments.employee_id = employees.id WHERE enclosure_id = 1;


--EXTENSION: 
SELECT employees.name 
FROM employees 
INNER JOIN assignments 
ON assignments.employee_id = employees.id
INNER JOIN enclosures
ON enclosures.closedformaintenance = enclosures.closedformaintenance IS TRUE;