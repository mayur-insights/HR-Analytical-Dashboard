select * from hrdata

--KPI employeeCount
select sum(employee_count) from hrdata

-- KPI employee count by education
select sum(employee_count) from hrdata where education = 'High School'
select sum(employee_count) from hrdata where education = 'Associates Degree'
select sum(employee_count) from hrdata where education like 'Bachelor% Degree'
select sum(employee_count) from hrdata where education = 'Doctoral Degree'
select sum(employee_count) from hrdata where education = 'High School'
select sum(employee_count) from hrdata where education like 'Master% Degree'

-- KPI employee Count by department Wise
select sum(employee_count) from hrdata where department = 'HR'
select sum(employee_count) from hrdata where department = 'R&D'
select sum(employee_count) from hrdata where department = 'Sales'

-- KPI employee Count by Education Field
select sum(employee_count) from hrdata where education_field = 'Life Sciences'
select sum(employee_count) from hrdata where education_field = 'Medical'
select sum(employee_count) from hrdata where education_field = 'Marketing'
select sum(employee_count) from hrdata where education_field = 'Technical Degree'
select sum(employee_count) from hrdata where education_field = 'Other'
select sum(employee_count) from hrdata where education_field = 'Human Resources'

--KPI Atrrition Count
select count(attrition) from hrdata where attrition = 'Yes'

-- KPI Attrition Count by Education
select count(attrition) from hrdata where attrition = 'Yes' and education = 'Associates Degree'
select count(attrition) from hrdata where attrition = 'Yes' and education Like 'Bachelor% Degree'
select count(attrition) from hrdata where attrition = 'Yes' and education = 'Doctoral Degree'
select count(attrition) from hrdata where attrition = 'Yes' and education = 'High School'
select count(attrition) from hrdata where attrition = 'Yes' and education Like 'Master% Degree'

-- KPI Attrition Count by Department
select count(attrition) from hrdata where attrition = 'Yes' and department = 'HR'
select count(attrition) from hrdata where attrition = 'Yes' and department = 'Sales'
select count(attrition) from hrdata where attrition = 'Yes' and department = 'R&D'

-- KPI Attrition Count by education Field
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Life Sciences'
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Medical'
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Marketing'
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Technical Degree'
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Other'
select count(attrition) from hrdata where attrition = 'Yes' and education_field = 'Human Resources'

--KPI Attrition rate 
select (select count (attrition) from hrdata where attrition = 'Yes') / sum(employee_count) from hrdata
-- for adiing %
select ((select count (attrition) from hrdata where attrition = 'Yes') / sum(employee_count)) * 100 from hrdata
-- for round function
select round (((select count (attrition) from hrdata where attrition = 'Yes') / sum(employee_count))* 100,  2) from hrdata

--KPI Attrition rate by department Wise
select round (((select count (attrition) from hrdata where attrition = 'Yes' and department = 'HR') / sum(employee_count))* 100,  2) from hrdata
where department = 'HR'

select round (((select count (attrition) from hrdata where attrition = 'Yes' and department = 'Sales') / sum(employee_count))* 100,  2) from hrdata
where department = 'Sales'

select round (((select count (attrition) from hrdata where attrition = 'Yes' and department = 'R&D') / sum(employee_count))* 100,  2) from hrdata
where department = 'R&D'

--KPI Active Empolyees
select sum(employee_count) - (select count(attrition) from hrdata where attrition = 'Yes') from hrdata

--KPI Active Empolyees by Gender
select sum(employee_count) - (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Male') from hrdata where gender = 'Male'
select sum(employee_count) - (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Female') from hrdata where gender = 'Female'

-- KPI Avg Age
select Avg(age)from hrdata
-- for making it round
select round (Avg(age),0) from hrdata

-- KPI Attrition Rate by Gender 
select gender, count(attrition) from hrdata where attrition = 'Yes' group by gender 
-- for male first and female second
select gender, count(attrition) from hrdata 
where attrition = 'Yes' 
group by gender 
order by count(attrition) desc

-- KPI Attrition Rate by Gender by education
select gender, count(attrition) from hrdata 
where attrition = 'Yes' and education = 'Associates Degree'
group by gender 
order by count(attrition) desc

select gender, count(attrition) from hrdata 
where attrition = 'Yes' and education like 'B%'
group by gender 
order by count(attrition) desc

select gender, count(attrition) from hrdata 
where attrition = 'Yes' and education = 'Doctoral Degree'
group by gender 
order by count(attrition) desc

select gender, count(attrition) from hrdata 
where attrition = 'Yes' and education = 'High School'
group by gender 
order by count(attrition) desc

select gender, count(attrition) from hrdata 
where attrition = 'Yes' and education like 'M%'
group by gender 
order by count(attrition) desc

-- Visual Department Wise attrition
select department, count(attrition) from hrdata where attrition = 'Yes' group by department 
-- for department in desc order 
select department, count(attrition) from hrdata where attrition = 'Yes' group by department 
order by count(attrition) desc
-- for seeing % for department values
select department, count(attrition),
round((cast(count(attrition) as numeric)/ (select count(attrition) from hrdata where attrition = 'Yes'))*100,  2)
from hrdata where attrition = 'Yes' group by department 
order by count(attrition) desc

-- Visual Department Wise attrition by gender
select department, count(attrition),
round((cast(count(attrition) as numeric)
/ (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Female'))*100,  2)
from hrdata where attrition = 'Yes'  and gender = 'Female' 
group by department 
order by count(attrition) desc

select department, count(attrition),
round((cast(count(attrition) as numeric)
/ (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Male'))*100,  2)
from hrdata where attrition = 'Yes'  and gender = 'Male' 
group by department 
order by count(attrition) desc

--Visual No of Employees by Age Group
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;

-- Visual No of Employees by Age Group by dept wise
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
where department = 'HR'
GROUP BY age

SELECT age,  sum(employee_count) AS employee_count FROM hrdata
where department = 'Sales'
GROUP BY age
order by age;

SELECT age,  sum(employee_count) AS employee_count FROM hrdata
where department = 'R&D'
GROUP BY age

-- Visual Education Wise attrition
select education_field, count(attrition) from hrdata where attrition = 'Yes'
group by education_field
order by count(attrition) desc

-- Visual Education Wise attrition by department wise
select education_field, count(attrition) from hrdata 
where attrition = 'Yes' and department = 'Sales'
group by education_field 
order by count(attrition) desc

select education_field, count(attrition) from hrdata 
where attrition = 'Yes' and department = 'HR'
group by education_field 
order by count(attrition) desc

select education_field, count(attrition) from hrdata 
where attrition = 'Yes' and department = 'R&D'
group by education_field 
order by count(attrition) desc

-- Visual Attrition rate by gender
select age_band, gender, count(attrition), 
round((Cast(count(attrition) as numeric)/ 
(select Count(attrition) from hrdata where attrition = 'Yes' ))*100,2) as pct
from hrdata
where attrition = 'Yes' 
group by age_band, gender
order by age_band, gender

--Visual Job Satisfaction Rating
CREATE EXTENSION IF NOT EXISTS tablefunc;
SELECT *
FROM crosstab(
  'SELECT job_role, job_satisfaction, sum(employee_count)
   FROM hrdata
   GROUP BY job_role, job_satisfaction
   ORDER BY job_role, job_satisfaction'
	) AS ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
ORDER BY job_role;

-- Visual of No of Employye by Age Group in Power BI
select age_band, gender, sum(employee_count) from hrdata 
group by age_band, gender
order by age_band, gender desc