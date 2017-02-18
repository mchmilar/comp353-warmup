SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE fsc353_4 ;

## #####################################################
## Table department
## #####################################################
DROP TABLE IF EXISTS department ;

CREATE TABLE IF NOT EXISTS department (
  did INT(11) NOT NULL,
  dep_name VARCHAR(45) NULL DEFAULT NULL,
  num_beds MEDIUMINT(9) NULL DEFAULT NULL,
  PRIMARY KEY (did))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table employee
## #####################################################
DROP TABLE IF EXISTS employee ;

CREATE TABLE IF NOT EXISTS employee (
  eid INT(3) NOT NULL,
  did INT(2) NULL,
  first_name VARCHAR(50) NULL DEFAULT NULL,
  last_name VARCHAR(50) NULL DEFAULT NULL,
  gender TINYINT(1) NULL DEFAULT NULL,
  dob DATE NULL DEFAULT NULL,
  phone VARCHAR(20) NULL DEFAULT NULL,
  email VARCHAR(100) NULL DEFAULT NULL,
  start_date DATE NULL DEFAULT NULL,
  end_date DATE NULL DEFAULT NULL,
  civic_num VARCHAR(100) NULL DEFAULT NULL,
  city VARCHAR(58) NULL DEFAULT NULL,
  country VARCHAR(52) NULL DEFAULT NULL,
  postal_code VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (eid),
  INDEX fk_employee_1_idx (did ASC),
  CONSTRAINT fk_employee_1
    FOREIGN KEY (did)
    REFERENCES department (did)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table dept_aministrator
## #####################################################
DROP TABLE IF EXISTS dept_aministrator ;

CREATE TABLE IF NOT EXISTS dept_aministrator (
  eid INT(3) NOT NULL,
  did INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (eid),
  INDEX fk_dept_aministrator_2_idx (did ASC),
  CONSTRAINT fk_dept_aministrator_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_dept_aministrator_2
    FOREIGN KEY (did)
    REFERENCES department (did)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table doctor
## #####################################################
DROP TABLE IF EXISTS doctor ;

CREATE TABLE IF NOT EXISTS doctor (
  eid INT(3) NOT NULL,
  fee DECIMAL(7,2) NULL DEFAULT NULL,
  specialty VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (eid),
  CONSTRAINT fk_doctor_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table nurse
## #####################################################
DROP TABLE IF EXISTS nurse ;

CREATE TABLE IF NOT EXISTS nurse (
  eid INT(3) NOT NULL,
  fee DECIMAL(7,2) NULL DEFAULT NULL,
  specialty VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (eid),
  CONSTRAINT fk_nurse_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

## #####################################################
## Table admin_staff
## #####################################################
DROP TABLE IF EXISTS admin_staff ;

CREATE TABLE IF NOT EXISTS admin_staff (
  eid INT(3) NOT NULL,
  PRIMARY KEY (eid),
  CONSTRAINT fk_admin_staff_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table patient
## #####################################################
DROP TABLE IF EXISTS patient ;

CREATE TABLE IF NOT EXISTS patient (
  med_num INT(4) NOT NULL,
  first_name VARCHAR(45) NULL DEFAULT NULL,
  last_name VARCHAR(45) NULL DEFAULT NULL,
  gender TINYINT(1) NULL DEFAULT NULL,
  dob DATE NULL DEFAULT NULL,
  phone VARCHAR(20) NULL DEFAULT NULL,
  civic_num VARCHAR(100) NULL DEFAULT NULL,
  city VARCHAR(45) NULL DEFAULT NULL,
  country VARCHAR(52) NULL DEFAULT NULL,
  postal_code VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (med_num))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


## #####################################################
## Table visit
## #####################################################
DROP TABLE IF EXISTS visit ;

CREATE TABLE IF NOT EXISTS visit (
  med_num INT(4) NOT NULL,
  eid INT(3) NOT NULL,
  admitted DATETIME NOT NULL,
  admin_reason VARCHAR(500) NULL DEFAULT NULL,
  diagnosis VARCHAR(500) NULL DEFAULT NULL,
  treatment VARCHAR(200) NULL DEFAULT NULL,
  discharged DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (med_num, eid, admitted),
  INDEX fk_visit_2_idx (eid ASC),
  CONSTRAINT fk_visit_1
    FOREIGN KEY (med_num)
    REFERENCES patient (med_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_visit_2
    FOREIGN KEY (eid)
    REFERENCES doctor (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



#########################################################
## Insert Employees
#########################################################

INSERT INTO employee VALUES
(100,1,'Kalia','Drake',0,'2000-07-08','1-110-175-5108','Maecenas@magnaa.net','1999-12-21',NULL,'100 bishop','Montreal','Canada','H3H1H6'),
(101,2,'Tatiana','Sykes',0,'2005-05-06','1-239-473-5797','pede@ipsumcursus.ca','2015-09-27',NULL,'200 bishop','Montreal','Canada','H2L9D2'),
(102,3,'Penelope','Scott',0,'2003-09-16','1-271-490-7841','et@justoProin.net','1997-03-29',NULL,'300 bishop','Montreal','Canada','H3H1H1'),
(103,4,'Kermit','Benson',1,'1965-01-15','1-357-180-4320','arcu@aliquam.org','2004-10-12',NULL,'400 bishop','Montreal','Canada','H3H1H1'),
(104,5,'Levi','Dejesus',1,'1963-11-20','1-292-427-3099','sem.Nulla@orciUt.ca','2000-11-29',NULL,'111 mckay','Montreal','Canada','H3H1H7'),
(105,1,'Hasad','Diaz',1,'1991-02-23','1-288-403-2282','lorems@aliquet.org','2016-02-26',NULL,'222 mckay','Montreal','Canada','H3L9S3'),
(106,2,'Cora','Pratt',0,'1990-02-15','1-619-264-8381','ac@tincidunt.edu','1999-06-08',NULL,'333 mckay','Montreal','Canada','H3H1H4'),
(107,3,'Evan','Richard',1,'1996-09-12','1-312-227-4544','consectetuer@ibulum.org','2002-12-29',NULL,'444 mckay','Montreal','Canada','H3H1H9'),
(108,4,'Erica','Newman',0,'1984-08-29','1-650-466-4812','placerat.orci@quis.com','2013-07-31',NULL,'555 mckay','Montreal','Canada','H2K1H1'),
(109,5,'Justin','Whatley',0,'1985-07-29','1-650-576-9912','justin@gmail.com','2011-11-29',NULL,'123 acme','Montreal','Canada','H9H1H1'),
(110,1,'Jaza','Piat',1,'1990-02-23','1-388-567-2282','jaza@gmail.com','2013-05-26','2014-07-07','234 acme','Montreal','Canada','H2S1H1'),
(111,2,'Laura','Leddy',0,'1987-02-15','1-555-264-8381','laura@tincidunt.edu','2009-06-08','2015-03-02','345 acme','Montreal','Canada','H6H1H1'),
(112,3,'Jon','Priar',1,'1992-09-12','1-666-227-4544','jon@stibulum.org','2002-12-29','2016-01-01','456 acme','Montreal','Canada','H2H1H1'),
(113,4,'Sophie','Gonzalez',0,'1989-08-29','1-786-166-4812','laura@quis.com','2014-06-30','2015-02-16','567 acme','Montreal','Canada','H5N1H1'),
(114,5,'Tarik','Coolguy',0,'1995-07-29','1-899-576-9912','tarik@gmail.com','2011-11-29','2014-07-08','678 acme','Montreal','Canada','H2J1H1'),
(115,1,'Edan','Weeks',1,'1962-08-05','1-382-124-7929','sollicitudin@lisiseget.edu','2014-02-21',NULL,'111 oiler','Edmonton','Canada','H2Y1H1'),
(116,2,'Ocean','Barlow',0,'1969-12-27','1-970-423-1665','euismod@doloregestasrhoncus.ca','1998-09-01',NULL,'987 queen','Montreal','Canada','H3H1H3'),
(117,3,'Raja','Mcdowell',0,'1982-03-13','1-280-666-5439','sit.amet.risus@purusinmolestie.co.uk','1998-09-01',NULL,'876 queen','Montreal','Canada','H3H1H2'),
(118,4,'Risa','Brady',1,'1960-04-21','1-697-706-1425','eros@amet.co.uk','2002-06-22',NULL,'765 queen','Montreal','Canada','H3H1H8'),
(119,5,'Celeste','Alvarez',0,'1998-03-10','1-478-266-4522','lacus@Aliquam.co.uk','2012-05-29',NULL,'654 queen','Montreal','Canada','H2R1H1'),
(120,1,'Aspen','Greer',0,'1962-04-09','1-141-317-6757','elit@velit.ca','2007-02-08','2001-07-18','543 queen','Montreal','Canada','H4H1H1'),
(121,2,'Ulric','Richard',1,'1964-08-12','1-445-841-0796','Nullam@adipiscing.net','2009-03-11',NULL,'432 queen','Montreal','Canada','H5H1H1'),
(122,3,'Jocelyn','Nielsen',0,'1988-02-03','1-785-707-6162','dictum.eu@fringillamilacinia.org','1999-06-08',NULL,'321 queen','Montreal','Canada','H3H1H5'),
(123,4,'Mark','Chmilar',1,'1984-07-14','1-514-812-9449','markchmilar@gmail.com','2010-01-01',NULL,'500 bryant','Montreal','Canada','H7H1H1'),
(124,5,'Jackie','Nuc',0,'1984-04-27','1-780-555-4344','jackienuc@gmail.com','2011-01-01',NULL,'600 bryant','Montreal','Canada','H8H1H1');


#########################################################
## Insert Patients
#########################################################

INSERT INTO patient (med_num,first_name,last_name,gender,dob,phone,civic_num,city,country,postal_code) VALUES 
(1000,"Howard","Palmer",1,"2004-02-01","1-389-575-6504","Ap #763-3346 Vitae Road","Whitehorse","Canada","S8P 5C8"),
(1001,"Alyssa","Newman",0,"1988-10-25","1-611-623-8963","Ap #317-9501 Inn St.","Pugwash","Canada","N2E 4K7"),
(1002,"Cheryl","Sandoval",1,"1979-11-07","1-751-844-7161","P.O. Box 990, 8429 Vulputate Avenue","Whitehorse","Canada","A5W 1X6"),
(1003,"Petra","Crosby",1,"1962-10-09","1-929-272-6164","403-971 Nec St.","Rigolet","Canada","H6Y 6R8"),
(1004,"Zeph","Dawson",0,"1979-07-03","1-970-695-3468","Ap #327-5220 Non Rd.","Brandon","Canada","K5V 1H7"),
(1005,"Portia","Conrad",1,"1997-04-17","1-324-810-3869","5332 Sed St.","Whitehorse","Canada","A5R 6H6"),
(1006,"Madeline","Jefferson",0,"1982-11-13","1-417-162-2565","P.O. Box 919, 1934 Vestibulum Road","Watson Lake","Canada","X6N 4G9"),
(1007,"Eve","Woodard",1,"1985-11-06","1-892-189-5427","P.O. Box 692, 5629 Sodales. Avenue","Coleville Lake","Canada","X5N 9G3"),
(1008,"Ashely","Casey",1,"1983-10-29","1-771-528-2056","823 Est. Avenue","Bonavista","Canada","E6A 2C4"),
(1009,"Blossom","Flores",1,"1962-04-11","1-506-810-3179","6569 Tortor, Rd.","Harbour Grace","Canada","E6Y 2W0"),
(1010,"Iola","Combs",0,"1961-12-22","1-733-107-7553","Ap #259-4885 A, St.","Delta","Canada","G4B 5Z1"),
(1011,"Honorato","Preston",0,"1979-03-31","1-860-382-0059","839-1732 Tellus St.","Smithers","Canada","M3N 6X4"),
(1012,"Jackson","Patel",0,"1963-08-13","1-144-117-2407","1493 Ornare, Avenue","Rouyn-Noranda","Canada","K0L 7W7"),
(1013,"Ivana","Hendricks",1,"1996-08-04","1-446-681-3986","3312 Nunc Av.","Bonnyville","Canada","N8B 4R6"),
(1014,"Upton","Turner",1,"1984-03-13","1-358-942-8005","P.O. Box 307, 2899 Sed Ave","Watson Lake","Canada","C7R 3R6"),
(1015,"Reuben","Burgess",1,"1992-09-23","1-836-553-6520","891-5339 Nullam Ave","Beausejour","Canada","A5Z 6L3"),
(1016,"Shaeleigh","Harvey",1,"1983-05-03","1-551-792-2986","Ap #829-4479 Eu, Rd.","Lourdes","Canada","A8Y 3K4");


#########################################################
## Insert Departments
#########################################################

INSERT INTO department (did,dep_name,num_beds) VALUES (1,"ER",16),(2,"Surgery",81),(3,"Oncology",97),(4,"Burn Unit",76),(5,"Radiology",37);


#########################################################
## Insert Doctors
#########################################################

INSERT INTO doctor (eid, fee, specialty) VALUES
(100, 999.50, "Flu"),
(101, 900, "Cardiologist"),
(102, 850, "Lung Cancer"),
(103, 10500, "Third Degree Burns"),
(104, 13000, "Skull Fractures"),
(105, 8374, "SARS"),
(106, 73930, "Brain Surgeon"),
(107, 1849, "Breast Cancer"),
(108, 4782, "Skin Grafts"),
(109, 2778, "Bone Setting"),
(110, 39399, "HIV"),
(111, 7898, "Knee Surgeon"),
(112, 1345, "Pancreatitis"),
(113, 3920, "Skin Grafts"),
(114, 245.50, "X-Rays");


#########################################################
## Insert Nurses
#########################################################

INSERT INTO nurse (eid, fee, specialty) VALUES
(115, 99.50, "Triage"),
(116, 200, "Surgery"),
(117, 250, "Cancer"),
(118, 209, "Burns"),
(119, 175, "X-Rays");

#########################################################
## Insert admin_staff
#########################################################

INSERT INTO admin_staff VALUES
(120), (121), (122), (123), (124);


#########################################################
## Insert dept_aministrator
#########################################################

INSERT INTO dept_aministrator (eid, did) VALUES
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5);

#########################################################
## Insert Visits
#########################################################

INSERT INTO visit (med_num,eid,admitted,admin_reason,diagnosis,treatment,discharged) VALUES 
(1016,109,"2015-02-08 03:30:08","Coughing","Influenza","Rest","2015-07-20 04:37:52"),
(1012,107,"2015-01-17 15:56:47","Broken leg","SARS","Rest","2015-03-31 16:44:12"),
(1004,107,"2016-08-28 11:17:46","Loss of eyesight","Heart-disease","Drink water","2016-09-03 08:21:10"),
(1011,103,"2015-11-12 18:49:40","Stiffness in joints","Cancer","Rest","2016-12-14 15:13:22"),
(1001,103,"2016-11-26 14:19:50","Stinging sensation","Voodoo doll.","Making amends with ex-wife","2016-12-10 18:51:28"),
(1013,101,"2016-05-14 07:20:12","Loud ringing in left ear","Tinnitus","Hearing Aid","2016-12-11 00:15:37"),
(1008,104,"2016-01-18 13:09:57","Swelling in feet","Fungus","Bandages","2016-04-18 13:27:45"),
(1001,104,"2016-08-16 10:25:33","Pain in the stomach","Cancer","Chemotherapy","2016-11-11 11:11:25"),
(1011,112,"2015-09-16 22:42:23","Feeling faint","Cancer","Nothing we can do, enjoy what little time you have left","2015-10-16 06:21:18"),
(1000,106,"2017-01-12 05:08:53","Melted skin","Third degree burns,","Bandages","2017-01-15 00:38:32"),
(1001,109,"2015-04-17 21:44:03","Severe chest pain","Heart-disease","Improve your diet!","2016-06-04 01:19:37"),
(1010,109,"2016-06-30 14:02:48","Pain in the stomach","Cancer","Chemotherapy","2016-07-22 18:15:41"),
(1013,107,"2015-12-03 06:34:51","Keep getting sick","HIV positive","Anti-virals","2016-07-30 10:55:48"),
(1016,102,"2016-03-10 01:40:31","Feeling weak","HIV positive","Anti-virals","2016-12-04 04:21:40"),
(1003,102,"2015-10-06 18:36:47","Loud ringing, hard to hear","Tinnitus","Hearing Aid","2016-01-24 01:50:35"),
(1012,107,"2015-11-12 16:32:43","Feeling faint","Heart-disease","Improve your diet","2016-05-30 05:26:10"),
(1015,102,"2016-02-05 17:33:04","Stiffness in the joints","Arthritis","Anti-inflammatory medication","2016-06-08 15:05:19"),
(1000,109,"2016-09-28 06:38:05","Skin pain","Third degree burns","Bandages","2016-10-20 15:59:07"),
(1003,106,"2016-05-01 05:28:49","Leg pain","SARS","Sleep it off","2016-07-18 07:45:53"),
(1005,103,"2015-07-27 00:13:59","Pain in the stomach","AIDS","Sleep it off","2016-10-19 07:23:14"),
(1002,104,"2016-02-15 22:39:16","Broken leg","HIV positive","Anti-inflammatory medication","2016-02-16 11:24:26"),
(1015,100,"2016-03-24 13:03:53","Stiffness","Fungus","Anti-fungal cream","2016-08-23 13:32:09"),
(1005,106,"2016-07-16 08:30:33","Feeling weak","Heart-disease","Improve your diet!","2016-09-20 14:44:03"),
(1001,102,"2016-02-09 16:38:47","Loud ringing in both ears","SARS","Drink more water","2016-07-30 14:46:25"),
(1008,104,"2015-12-18 04:38:05","Feeling low","AIDS","Nothin to do","2015-12-31 12:36:39"),
(1006,102,"2016-06-16 08:55:37","Feeling too good","SARS","Bandages","2017-01-01 15:27:09"),
(1004,101,"2016-08-29 04:46:01","Stinging pain","SARS","Bandages","2016-09-22 09:39:52"),
(1007,100,"2016-01-28 06:26:54","Feeling weak","HIV positive","Anti-inflammatory medication","2016-08-28 19:05:44"),
(1003,103,"2017-02-01 12:15:17","Fear of flying","Cancer","Anti-virals","2017-02-16 07:29:07"),
(1016,113,"2015-01-08 22:37:28","Can't see anything","Heart-disease","Got get a new heart","2015-01-09 22:25:38"),
(1009,101,"2017-02-09 17:30:29","Sharp pain across left arm", "Heart-disease", "Not much we can do, ma'am","2017-02-09 18:30:29"),
(1014,105,"2017-02-11 22:00:17","Coughing profusely", "SARS", "Get me a Coke, stat.", "2017-03-21 09:08:27"),
(1016,101,"2017-01-28 11:11:11","Heart attack","Heart-disease","Quadruple bypass surgery","2017-02-14 12:30:31"),
(1012,101,"2017-01-01 12:12:12","Chest pain","Heart-disease","Prescribed daily asprin usage","2017-01-02 08:13:12"),
(1012,101,"2017-02-01 12:12:12","Chest pain","Heart-disease","Prescribed daily asprin usage again","2017-02-02 08:13:12");
