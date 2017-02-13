USE fsc353_4 ;

-- -----------------------------------------------------
-- Table employee
-- -----------------------------------------------------
DROP TABLE IF EXISTS employee ;

CREATE TABLE IF NOT EXISTS employee (
  eid INT(3) NOT NULL,
  first_name VARCHAR(50) NULL,
  last_name VARCHAR(50) NULL,
  gender TINYINT(1) NULL,
  dob DATE NULL,
  phone VARCHAR(20) NULL,
  email VARCHAR(100) NULL,
  start_date DATE NULL,
  end_date DATE NULL,
  job_title VARCHAR(45) NULL,
  civic_num VARCHAR(100) NULL,
  city VARCHAR(58) NULL,
  country VARCHAR(52) NULL,
  postal_code VARCHAR(7) NULL,
  PRIMARY KEY (eid))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table patient
-- -----------------------------------------------------
DROP TABLE IF EXISTS patient ;

CREATE TABLE IF NOT EXISTS patient (
  med_num INT(4) NOT NULL,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  gender TINYINT(1) NULL,
  dob DATE NULL,
  phone VARCHAR(20) NULL,
  civic_num VARCHAR(100) NULL,
  city VARCHAR(45) NULL,
  country VARCHAR(52) NULL,
  postal_code VARCHAR(7) NULL,
  PRIMARY KEY (med_num))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table doctor
-- -----------------------------------------------------
DROP TABLE IF EXISTS doctor ;

CREATE TABLE IF NOT EXISTS doctor (
  eid INT(3) NOT NULL,
  fee DECIMAL(7,2) NULL,
  specialty VARCHAR(45) NULL,
  PRIMARY KEY (eid),
  CONSTRAINT fk_doctor_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table visit
-- -----------------------------------------------------
DROP TABLE IF EXISTS visit ;

CREATE TABLE IF NOT EXISTS visit (
  med_num INT(4) NOT NULL,
  eid INT(3) NOT NULL,
  date_time DATETIME NOT NULL,
  admin_reason VARCHAR(500) NULL,
  diagnosis VARCHAR(500) NULL,
  treatment VARCHAR(200) NULL,
  discharged DATETIME NULL,
  PRIMARY KEY (med_num, eid, date_time),
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table department
-- -----------------------------------------------------
DROP TABLE IF EXISTS department ;

CREATE TABLE IF NOT EXISTS department (
  did INT NOT NULL,
  dep_name VARCHAR(45) NULL,
  num_beds MEDIUMINT NULL,
  PRIMARY KEY (did))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table administrator
-- -----------------------------------------------------
DROP TABLE IF EXISTS administrator ;

CREATE TABLE IF NOT EXISTS administrator (
  eid INT(3) NOT NULL,
  did INT(2) NULL,
  PRIMARY KEY (eid),
  INDEX fk_administrator_2_idx (did ASC),
  CONSTRAINT fk_administrator_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_administrator_2
    FOREIGN KEY (did)
    REFERENCES department (did)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table employs
-- -----------------------------------------------------
DROP TABLE IF EXISTS employs ;

CREATE TABLE IF NOT EXISTS employs (
  eid INT(3) NOT NULL,
  did INT(2) NULL,
  PRIMARY KEY (eid),
  INDEX fk_employs_2_idx (did ASC),
  CONSTRAINT fk_employs_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_employs_2
    FOREIGN KEY (did)
    REFERENCES department (did)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nurse
-- -----------------------------------------------------
DROP TABLE IF EXISTS nurse ;

CREATE TABLE IF NOT EXISTS nurse (
  eid INT(3) NOT NULL,
  fee DECIMAL(7,2) NULL,
  specialty VARCHAR(45) NULL,
  PRIMARY KEY (eid),
  CONSTRAINT fk_nurse_1
    FOREIGN KEY (eid)
    REFERENCES employee (eid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;