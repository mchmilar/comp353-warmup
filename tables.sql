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
-- Missing Patient --