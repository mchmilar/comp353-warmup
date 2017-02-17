#1 List the information of all doctors grouped by their departments and specialties.
SELECT 		*			
FROM 		(department JOIN employee USING(did)) JOIN doctor USING(eid)
ORDER BY 	dep_name, specialty;

#2 List information about nurses from Montreal who started since Jan 01, 2012.        
SELECT 	* 
FROM 	employee JOIN nurse USING(eid) 
WHERE 	city='Montreal' AND start_date >= '2012-01-01';

#3 Given a patient’s Medicare ID, list the Medical Report of that patient.
SELECT 	date_time, first_name, last_name, admin_reason, diagnosis, treatment
FROM 	visit JOIN patient USING(med_num)
WHERE 	med_num = 1003;

#4 Given a patient’s Medicare ID, determine how much s/he has paid for the visits since the beginning of “this” year.
SELECT 		first_name, last_name, sum(fee) as total_paid
FROM 		(visit JOIN doctor USING(eid)) JOIN patient USING(med_num)
WHERE 		YEAR(discharged) = YEAR(CURDATE()) 
GROUP BY 	med_num;

#5 List heart patients admitted/visited at least twice.
SELECT 		first_name, last_name, count(diagnosis) as num_visits
FROM 		visit JOIN patient USING(med_num)
WHERE 		diagnosis='Heart-disease'
GROUP BY 	med_num
HAVING 		num_visits > 1

#6 List patient’s first name, last name, phone, date admitted, date discharged for all
#  admitted patients grouped by special disease, e.g., Cancer, Heart disease, HIV, SARS, etc.
SELECT 		diagnosis, first_name, last_name, phone, date_time, discharged 
FROM 		visit JOIN patient USING(med_num)
ORDER BY 	diagnosis;

#6b selecting a specific disease. I wasn't sure which one they want.
SELECT 	diagnosis, first_name, last_name, phone, date_time, discharged 
FROM 	visit JOIN patient USING(med_num)
WHERE 	diagnosis='SARS';


#7 Calculate the average age of all patients admitted into the Hospital.
SELECT 	avg(TIMESTAMPDIFF(YEAR, dob, CURDATE())) AS average_age
FROM 	patient;