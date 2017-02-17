# Queries for Warm-Up Project

# Query 1: List the information of all doctors grouped by their departments and specialties. 

SELECT *
FROM doctor
	INNER JOIN employee
		ON employee.eid = doctor.eid
	INNER JOIN department 
		ON department.did = employee.did; 

# Query 2: List information about nurses from Montreal who started since Jan 01, 2012. 
SELECT *
FROM nurse
INNER JOIN employee
	ON nurse.eid = employee.eid AND start_date >= '2012-01-01' AND city = "Montreal";

# Query 3: Given a patient’s Medicare ID, list the Medical Report of that patient.
# Assume you are given a medical number for the patient (e.g. 1000). 
SELECT patient.med_num, first_name,last_name, admin_reason, diagnosis, treatment
FROM visit
INNER JOIN patient
	ON visit.med_num = patient.med_num
WHERE patient.med_num = 1000;


# Query 4: Given a patient’s Medicare ID, determine how much s/he has paid for the visits since
#the beginning of “this” year.
# Assume you are given a medical number for the patient (e.g. 1000).

SELECT patient.med_num, first_name, last_name, total_bills
FROM patient
INNER JOIN
	(SELECT med_num, SUM(fee) AS total_bills 
		FROM visit
		INNER JOIN doctor
			ON doctor.eid = visit.eid
		WHERE date_time >= '2017-01-01 00:00:00'
		GROUP BY med_num ) 
AS DoctorVisit ON patient.med_num = DoctorVisit.med_num;


# Query 5: List heart patients admitted/visited at least twice.

SELECT patient.med_num, first_name, last_name
FROM patient
INNER JOIN
	(
		SELECT visit.med_num, count(diagnosis) AS visits
        FROM visit
        WHERE diagnosis = 'Heart-disease'
        GROUP BY visit.med_num
	) AS numVisits ON numVisits.med_num = patient.med_num
WHERE numVisits.visits >= 2;


# Query 6: List patient’s first name, last name, phone, date admitted, date discharged for all
#admitted patients grouped by special disease, e.g., Cancer, Heart disease, HIV, SARS,
#etc.

SELECT first_name, last_name, phone, date_time, discharged, diagnosis
FROM patient
INNER JOIN visit
	ON patient.med_num = visit.med_num
ORDER BY diagnosis;

# Query 7: Calculate the average age of all patients admitted into the Hospital.
SELECT ROUND(avg(DATEDIFF(DATE(CURDATE()), dob)/365.25),1) AS AvgAge
FROM patient;
