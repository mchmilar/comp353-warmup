CREATE TABLE department(did INT(1) primary key, name VARCHAR(30), num_beds MEDIUMINT); 
CREATE TABLE employs(eid INT(4) primary key, did);
CREATE TABLE doctor(eid INT(4) primary key, fees DECIMAL(7,2), specialty VARCHAR(30));
CREATE TABLE nurse(eid INT(4) primary key, fee DECIMAL(7,2), specialty VARCHAR(30));
CREATE TABLE patient(med_num INT(4) primary key, first_name VARCHAR(15), last_name VARCHAR(10))

