
#1.
select * 
from doctor doc, employee e, department dep
where doc.eid = e.eid and e.did = dep.did
order by dep.dep_name, doc.specialty;

#2. 
select * 
from nurse n, employee e 
where e.city = 'Montreal' and n.eid = e.eid and e.start_date > '2012-01-01';

#3. 
select *
from patient p, visit v
where p.med_num = 1001 and p.med_num = v.med_num;

#4. 
select sum(d.fee) as FeesThisYear
from doctor d, patient p, visit v
where p.med_num = v.med_num and v.eid = d.eid and v.date_time > '2017-01-01';

#5.
select *
from patient p, visit v
where p.med_num = v.med_num and v.diagnosis = 'Heart-disease'
group by p.med_num
having count(*)>1;

#6. 
select v.diagnosis, p.first_name, p.last_name, p.phone, v.date_time, v.discharged
from patient p, visit v
where p.med_num = v.med_num
order by v.diagnosis;

#7. 
select avg(date_format(now(), '%Y') - date_format(p.dob, '%Y') - (date_format(now(), '00-%m-%d') < date_format(p.dob, '00-%m-%d'))) as age 
from patient p;




