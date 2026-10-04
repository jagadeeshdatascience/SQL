-- Display all employee records
select * from 
hr.employees

-- Display employee first name
select first_name
from hr.employees;

-- Display firstname and lastname
select first_name,last_name
from hr.employees;

-- Display salary greater than 5000
select *
from hr.employees
where salary > 5000;

-- Display salary less than 6000
select * 
from hr.employees
where salary < 6000;

-- Display salary equal to 6000
select * 
from hr.employees
where salary = 6000;

-- Display eemployees from department 50
select *
from hr.eemployees
where department_id = 50;

-- Display employees wiuth job Id SA_REP
select *
from hr.employees
where job_id = 'SA_REP';

-- Display employees whose furst_name is steven
select *
from hr.employees
where first_name = 'steven';

-- count employees in each department
select
 department_id, count(*) as employee_count
from hr.employees
group by department_id;

-- Find average salary in each department
select
 department_id, avg(salary) as average_salary
from hr.employees
group by department_id;

-- Find maximum salary in each department
select
 department_id,
 max(salary) as maximum_salary
from hr.employees
group by department_id;

-- Find minimum salary in each department
select 
 department_id,
 min(salary) as minimum_salary
from hr.employees
group by department_id;

-- Find total salary paid by each department
select
 department_id,
 sum(salary) as sum_salary
from hr.employees
group by department_id;

-- Count employees for each job
select 
 job_id,
 count(*) as JOB_COUNT
from hr.employees
group by job_id;

-- Count employees by department and job
select
 department_id,
 job_id,
 count(*) as employee_count
from hr.employees
group by department_id, job_id;

-- Average salary by department and job
select 
 department_id,
 job_id,
 avg(salary) as AVERAGE_SALARY
from hr.employees
group by department_id, job_id;

-- Total salary by department and job
select 
 department_id,
 job_id,
 sum(salary) as TOTAL_SALARY
from hr.employees
group by depattment_id, job_id;

-- minimum salary by department
select 
 department_id,
 min(salary) as minimum_salary
from hr.employees
group by department_id
having min(salary) < 5000;

select
 department_id,
 count(*) as COUNTING
from hr.employees
group by department_id
having count(*) <5;

-- FROM SH.customers,display customerID, first_name,last_name, gender, and marital status for all female customers
select 
 cust_id,
 cust_first_name,
 cust_last_name,
 cust_gender,
 cust_marital_status
from sh.customers
where cust_gender = 'F';

-- FROM sh.customers,find customers whose lastname starts with s and whose year of birth is greater than 1970
select 
 cust_last_name,
 cust_year_of_birth
from sh.customers
where cust_last_name like 'S%' and cust_year_of_birth >1970;

-- From sh.products display product id,product name,categeory and list price for products whose list price is between 100 and 500
select
 prod_id,
 prod_name,
 prod_category,
 prod_list_price
from sh.products
where prod_list_price between 100 and 500;

From sh products find products whose minimum price less than 50 and whose status is available
select *
from sh.products
where prod_list_price <50 and prod_status = 'available';

-- from sh.sales
select
 prod_id,
 cust_id,
 quantity_sold
 amount_sold
from sh.sales
where amount_sold > 1000;

select *
from sh.sales
where quantity_sold > 2 and channel_id =3;

select *
from sh.channels
where channel_desc like '%Direct%';

select 
 promo_id,
 promo_name,
 promo_cost,
 promo_category
from sh.promotions
where promo_cost > 1000;

select * 
from sh.promotions
where promo_end_date > promo_begin_date and promo_cost > 500;

select 
 country_id,
 country_name,
 country_region_id
from sh.countries
where country_region_id = 52790;

select 
 time_id,
 day_name,
 calender_month_name,
 calender_year
from sh.times
where calender_year = 2000;

select * 
from sh.times
where calender_month_name like 'December' and calender_year = 2001;

select
 prod_id,
 time_id,
 unit_cost,
 unit_price
from sh.costs
where unit_price > unit_cost;

select * 
from sh.costs
where unit_cost > 100 and unit_price < 1000;

select 
 cust_id,
 cust_education,
 cust_occupation,
 cust_household_size
from sh.supplementary_demographics
where cust_household_size > 3;

-- GROUP BY
select
 cust_marital_status,
 count(*) as NO_OF_CUST
from sh.customers
group by cust_marital_status;

select
 cust_gender,
 avg(cust_year_of_birth) as birth
from sh.customers
group by cust_gender;

select 
 prod_category
 avg(prod_list_price) as PRICE

select
 prod_subcategory,
 max(PROD_MIN_PRICE) as MIN_PRICE
from sh.products
group by prod_subcategory;

select 
 CHANNEL_ID,
 sum(AMOUNT_SOLD) as total_sales
from sh.sales
group by channel_id;

select
 prod_id,
 sum(quantity_sold) as total_qunatity
from sh.sales
group by prod_id;

select
 promo_id,
 avg(AMOUNT_SOLD) as AMOUNT_SOLD
from sh.sales
group by promo_id;

select 
 promo_category,
 sum(promo_cost) as PROMOTION_COST
from sh.promotions
group by promo_category;

select
 country_region,
 count(*) as each_country
from sh.countries
group by country_region;

select 
 prod_id,
 avg(unit_cost) as UNIT_COST_AVERAGE
from sh.costs
group by prod_id;

select 
 cust_gender,
 cust_marital_status,
 count(*) as CUSTOMER_COUNT
from sh.customers
group by cust_gender,cust_marital_status;

select 
 prod_category,
 prod_subcategory,
 count(*) as XYZ
from sh.products
group by prod_category,prod_subcategory;

select 
 prod_id,
 channel_id,
 sum(AMOUNT_SOLD) as TOTSAL_SALES
from sh.sales
group by prod_id,channel_id;

select 
 channel_id,
 promo_id,
 sum(quantity_sold) as quantity_sold1
from sh.sales
group by channel_id,promo_id;

select 
 prod_id,
 promo_id,
 avg(unit_cost) as UNIT_COST1
from sh.costs
group by prod_id,promo_id;

select
 channel_id,
 sum(amount_sold) as XYZ
from sh.sales
where amount_sold > 500
group by channel_id;

select 
 prod_category,
 avg(prod_list_price) as PRICES
from sh.products
where prod_list_price > 100 
group by prod_category;

select 
 cust_marital_status,
 count(*) as LIST_OF_MARITAL
from sh.customers
where cust_year_of_birth > 1970
group by cust_marital_status;

select 
 promo_category,
 avg(promo_cost) as PROMOTION_COST
from sh.promotions
where promo_cost > 500
group by promo_category;

select 
 prod_id,
 max(unit_price) as MAXIMUM_UNIT_PRICE
from sh.costs
where unit_cost > 50
group by prod_id;

-- GROUP BY + HAVING
select 
 cust_marital_status,
 count(*) as marital_status
from sh.customers
group by cust_marital_status
having count(*) > 100;

select 
 prod_category,
 avg(prod_list_price) as PRODUCT_PRICE
from sh.products
group by prod_category
having avg(prod_list_price) > 500;

select 
 channel_id,
 sum(amount_sold) as TOTAL_AMOUNT_SOLD
from sh.sales
group by channel_id
having sum(amount_sold) > 100000;

select 
 promo_category,
 avg(promo_cost) as PROMOTION_COST
from sh.promotions
group by promo_category
having avg(promo_cost) > 1000;

select
 prod_id,
 avg(unit_price) as PRODUCT_AVERAGE
from sh.costs
group by prod_id
having avg(unit_price) > 500;