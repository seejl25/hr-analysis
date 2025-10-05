-- Creating table to import data
create table hrdata (
	emp_no int8 primary key,
	gender varchar(50) not null,
	marital_status varchar(50),
	age_band varchar(50),
	age int8,
	department varchar(50),
	education varchar(50),
	education_field varchar(50),
	job_role varchar(50),
	business_travel varchar(50),
	employee_count int8,
	attrition varchar(50),
	attrition_label varchar(50),
	job_satisfaction int8,
	active_employee int8
);

-- Ensuring data successfully imported
select *
from hrdata;

-- Finding total number of employees
select sum(employee_count)
from hrdata;

-- Finding total attrition count
select count(attrition) 
from hrdata
where attrition = 'Yes';

-- Finding attrition rate
select ((select count(attrition) 
		from hrdata
		where attrition = 'Yes') / sum(employee_count)) * 100
from hrdata;

-- Finding number of active employee
select count(active_employee)
from hrdata
where active_employee = 1
and gender = 'Male';

-- Finding average age of employees
select round(avg(age),0) as Avg_age
from hrdata;

-- Finding attrition by gender
select gender, count(attrition) as Attrition_rate
from hrdata
where attrition = 'Yes'
group by gender
order by Attrition_rate desc;

-- Finding attrition by department
select department, count(attrition) as Attrition_rate, 
	round((cast(count(attrition) as numeric)/ (select count(attrition) 
								from hrdata
								where attrition = 'Yes'))*100, 2) as attrition_percentage
from hrdata
where attrition = 'Yes'
group by department
order by Attrition_rate desc;

-- Finding number of employees by age group
select age, sum(employee_count)
from hrdata
group by age
order by age;

-- Finding attrition rate by education field
select education_field, count(attrition) as attrition_rate
from hrdata
where attrition = 'Yes'
group by education_field
order by education_field;

-- Finding attrition rate by gender for age group
select age_band, gender, count(attrition) as attrition_rate,
	round((count(attrition)::numeric / (select count(attrition) 
												from hrdata 
												where attrition = 'Yes')) * 100, 2) as attr_pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender;

-- Finding job satisfaction rating
-- first, create an extension
create extension if not exists tablefunc;
-- then create the table
select *
from crosstab(
	'select job_role, job_satisfaction, sum(employee_count)
	from hrdata
	group by job_role, job_satisfaction
	order by job_role, job_satisfaction'
	) as ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
order by job_role;
