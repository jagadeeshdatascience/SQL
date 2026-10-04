-- BASED ON NULL VALUES
-- 1.NVL

select 
 employee_id,
 first_name,
 salary,
 nvl(commission_pct,0) as commission
from hr.employees;

select
 employee_id,
 first_name,
 nvl(department_id,0) as department
from hr.employees;

-- 2.NVL2

select 
 employee_id,
 first_name,
 commission_pct,
 nvl2(commission_pct,'commission given', 'no commission') as commission
from hr.employees;

select 
 employee_id,
 first_name,
 nvl2(department_id, 'department assigned', 'not assigned') as department
from hr.employees;

-- 3.CASE
-- based on salary
select 
 employee_id,
 first_name,
 salary,
 CASE
    when salary >= 10000 then 'high salary'
    when salary >= 50000 then 'medium salary'
    else 'low salary'
 end as salary_grade
from hr.employees;

select 
 employee_id,
 first_name,
 commission_pct,
 case 
    when commission_pct is null then 'no commission'
    when commission_pct = 0 then 'zero commission'
    else 'commission available' 
 end as commission_status
from hr.EMPLOYEES;

-- 4.NULLIF
select 
 employee_id,
 first_name,
 salary,
 nullif(salary,24000) as new_salary
from hr.employees;
 
select 
 employee_id,
 first_name,
 department_id,
 nullif(department_id,0) as new_department
from hr.employees;

-- 5.DECODE

select 
 employee_id,
 first_name,
 department_id,
 decode(department_id,
        10, 'admin',
        20, 'market',
        30, 'purchase',
        40, 'human reso',
        'other') as department_name
from hr.employees;


-- 6.COALESECE

select 
 employee_id,
 first_name,
 commission_pct,
 COALESCE(commission_pct,0) as commission
from hr.employees;

select 
 employee_id,
 first_name,
 coalesce(commission_pct, salary, 0) as VALUE
from hr.employees;