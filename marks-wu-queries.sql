#1 List the information of all doctors grouped by their departments and specialties.
SELECT 		*			
FROM 		departments NATURAL JOIN doctor NATURAL JOIN employee
ORDER BY 	dep_name, specialty;

#2 List information about nurses from Montreal who started since Jan 01, 2012.        
SELECT 	* 
FROM 	employee NATURAL JOIN nurse 
WHERE 	city='Montreal' AND start_date >= '2012-01-01';

#3 Given a patient’s Medicare ID, list the Medical Report of that patient.
SELECT 	date_time, first_name, last_name, admin_reason, diagnosis, treatment
FROM 	visit NATURAL JOIN patient
WHERE 	med_num = 1003;

#4 Given a patient’s Medicare ID, determine how much s/he has paid for the visits since the beginning of “this” year.
SELECT first_name, last_name, total_paid
FROM patient
	NATURAL JOIN
		(SELECT med_num, sum(fee) as total_paid
		FROM 		visit NATURAL JOIN doctor
		WHERE 		YEAR(discharged) = YEAR(CURDATE()) 
		GROUP BY 	med_num
		) AS visit_fee;

#5 List heart patients admitted/visited at least twice.
SELECT first_name, last_name, num_visits
FROM patient
	NATURAL JOIN (
		SELECT 		med_num, count(diagnosis) as num_visits
        FROM 		visit
        WHERE 		diagnosis='Heart-disease'
        GROUP BY 	med_num
        HAVING 		num_visits >= 2
        ) AS visit_count;

#6 List patient’s first name, last name, phone, date admitted, date discharged for all
#  admitted patients grouped by special disease, e.g., Cancer, Heart disease, HIV, SARS, etc.
SELECT 		diagnosis, first_name, last_name, phone, date_time, discharged 
FROM 		visit NATURAL JOIN patient 
ORDER BY 	diagnosis;

#6b selecting a specific disease. I wasn't sure which one they want.
SELECT 	diagnosis, first_name, last_name, phone, date_time, discharged 
FROM 	visit NATURAL JOIN patient 
WHERE 	diagnosis='SARS';


#7 Calculate the average age of all patients admitted into the Hospital.
SELECT 	avg(TIMESTAMPDIFF(YEAR, dob, CURDATE())) AS average_age
FROM 	patient;
