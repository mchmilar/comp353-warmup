CREATE TABLE department(
did INT(1) NOT NULL PRIMARY KEY, 
dep_name VARCHAR(30), 
num_beds MEDIUMINT
); 
CREATE TABLE employs(
eid INT(4) NOT NULL PRIMARY KEY, 
did INT(1) NOT NULL,
FOREIGN KEY (did) REFERENCES department(did)
);
CREATE TABLE doctor(
eid INT(4) NOT NULL PRIMARY KEY, 
fees DECIMAL(7,2), 
specialty VARCHAR(30)
);
CREATE TABLE nurse(
eid INT(4) NOT NULL PRIMARY KEY, 
fee DECIMAL(7,2), 
specialty VARCHAR(30)
);
CREATE TABLE patient(
med_num INT(4) NOT NULL PRIMARY KEY, 
gender bool,
phone varchar(20),
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
postal_code VARCHAR(10),
country VARCHAR(52), 
civ_number VARCHAR(100),
city VARCHAR(58)
);
