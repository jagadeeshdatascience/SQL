-- CREATE EMPLOYEE TABLE

CREATE TABLE employee
(
    emp_id       NUMBER PRIMARY KEY,
    emp_name     VARCHAR2(50),
    department   VARCHAR2(30),
    manager_id   NUMBER,
    salary       NUMBER(10,2),
    city         VARCHAR2(30)
);

-- CREATE EMPLOYEE_PROJECT TABLE

CREATE TABLE employee_project
(
    assignment_id NUMBER PRIMARY KEY,
    emp_id        NUMBER,
    project_name  VARCHAR2(50),
    project_role  VARCHAR2(30),
    hours_worked  NUMBER,
    status        VARCHAR2(20)
);

-- INSERT EMPLOYEE DATA
INSERT INTO employee
VALUES (101, 'Arun', 'IT', NULL, 90000, 'Bangalore');

INSERT INTO employee
VALUES (102, 'Priya', 'IT', 101, 65000, 'Hyderabad');

INSERT INTO employee
VALUES (103, 'Rahul', 'HR', NULL, 55000, 'Chennai');

INSERT INTO employee
VALUES (104, 'Sneha', 'Finance', 106, 70000, NULL);

INSERT INTO employee
VALUES (105, 'Kiran', 'IT', 101, NULL, 'Bangalore');

INSERT INTO employee
VALUES (106, 'Meena', 'Finance', NULL, 95000, 'Mumbai');

INSERT INTO employee
VALUES (107, 'Ravi', NULL, 101, 60000, 'Pune');

INSERT INTO employee
VALUES (108, 'Anjali', 'HR', 103, 50000, 'Bangalore');

INSERT INTO employee
VALUES (109, 'Vijay', 'Sales', NULL, 75000, 'Delhi');

INSERT INTO employee
VALUES (110, 'Deepa', 'Sales', 109, 58000, NULL);

COMMIT;

-- INSERT PROJECT DATA
INSERT INTO employee_project
VALUES (1, 101, 'ERP Migration', 'Manager', 120, 'Active');

INSERT INTO employee_project
VALUES (2, 101, 'Cloud Migration', 'Architect', 80, 'Active');

INSERT INTO employee_project
VALUES (3, 102, 'ERP Migration', 'Developer', 150, 'Active');

INSERT INTO employee_project
VALUES (4, 102, 'AI Platform', 'Developer', 100, 'Completed');

INSERT INTO employee_project
VALUES (5, 103, 'HR Automation', 'Lead', 90, 'Active');

INSERT INTO employee_project
VALUES (6, 104, 'Finance Portal', 'Analyst', 110, 'Active');

INSERT INTO employee_project
VALUES (7, 104, 'Audit System', NULL, 60, 'Completed');

INSERT INTO employee_project
VALUES (8, 106, 'Finance Portal', 'Manager', 130, 'Active');

INSERT INTO employee_project
VALUES (9, 108, 'HR Automation', 'Analyst', NULL, 'Active');

INSERT INTO employee_project
VALUES (10, 999, 'External Project', 'Consultant', 50, 'Active');

INSERT INTO employee_project
VALUES (11, NULL, 'Unassigned Project', 'Developer', 40, 'Pending');

COMMIT;

--  DISPLAY ORIGINAL TABLES

SELECT *
FROM employee
ORDER BY emp_id;


SELECT *
FROM employee_project
ORDER BY assignment_id;

--  JOIN 1: BASIC INNER JOIN
select 
 e.emp_id,
 e.emp_name,
 e.department,
 p.project_name
from employee e
inner join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

--  JOIN 2: INNER JOIN WITH MORE COLUMNS
select 
 e.emp_id,
 e.emp_name,
 e.department,
 e.salary,
 p.project_name,
 p.project_role,
 p.hours_worked,
 p.status
from employee e
inner join EMPLOYEE_PROJECT p
 on e.emp_id = p.emp_id
order by e.emp_id = p.emp_id;

--  JOIN 3: ONE-TO-MANY JOIN
select 
 e.emp_id,
 e.emp_name,
 p.project_name,
 p.project_role
from employee e
join employee_project p
 on e.emp_id = p.emp_id
where e.emp_id = 101;

--  JOIN 4: INNER JOIN WITH WHERE CONDITION
select 
e.emp_name,
e.department,
p.project_name
from employee e
join employee_project p
 on e.emp_id = p.emp_id
where e.department = 'IT';

--  JOIN 5: INNER JOIN FOR ACTIVE PROJECTS
select 
 e.emp_name,
 p.project_name,
 p.status
from employee e
inner join employee_project p
 on e.emp_id = p.emp_id
where p.status = 'Active';

--  JOIN 6: LEFT OUTER JOIN
select
 e.emp_id,
 e.emp_name,
 p.project_name,
 p.status
from employee e
left outer join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

--  JOIN 7: FIND EMPLOYEES WITHOUT PROJECTS
select 
 e.emp_id,
 e.emp_name,
 e.department
from employee e
left join employee_project p
  on e.emp_id = p.emp_id
where p.emp_id is null;

-- JOIN 8: LEFT JOIN + NVL
select 
 e.emp_id,
 e.emp_name,
 nvl(p.project_name, 'no project') as project_name
from employee e
left join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

--  JOIN 9: RIGHT OUTER JOIN
select 
 e.emp_id,
 e.emp_name,
 p.assignment_id,
 p.emp_id as project_em_id,
 p.project_name
from employee e
right join employee_project p
 on e.emp_id = p.emp_id
order by p.assignment_id;

-- JOIN 10: FIND PROJECTS WITHOUT VALID EMPLOYEE
select 
 e.emp_id,
 p.assignment_id,
 p.project_name
from employee e
right join employee_project p
 on e.emp_id = p.emp_id
where e.emp_id is null;

-- JOIN 11: FULL OUTER JOIN
select 
 e.emp_id,
 e.emp_name,
 p.emp_id,
 p.project_name
from employee e
full outer join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

--  JOIN 12: FULL JOIN WITH NVL
select 
    NVL(TO_CHAR(e.emp_id), 'NO EMPLOYEE'),
    NVL(e.emp_name, 'UNKNOWN EMPLOYEE'),
    NVL(p.project_name, 'NO PROJECT')
from employee e
full outer join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

--  JOIN 13: CROSS JOIN
select 
 e.emp_name,
 p.project_name
from employee e
cross join employee_project p;

--  JOIN 14: COUNT CROSS JOIN RECORDS
select 
 count(*) as total_count
from employee e
cross join employee_project p;

--  JOIN 15: SELF JOIN - EMPLOYEE AND MANAGER
select 
 e.emp_id,
 m.emp_id,
 e.emp_name
from employee e
left join employee m
 on e.emp_id = m.emp_id
order by e.emp_id;

--  JOIN 16: FIND EMPLOYEES HAVING MANAGERS
select 
 e.emp_id,
 nvl(m.manager_id, 0) as new_one
from employee e
left join employee m
 on e.emp_id = m.manager_id
order by e.emp_id;

--  JOIN 17: FIND EMPLOYEES WITHOUT MANAGERS
select 
 e.emp_id,
 e.emp_name
from employee e
left join employee m
 on e.manager_id = m.emp_id
where m.emp_id is null;

--  JOIN 18: JOIN WITH MULTIPLE CONDITIONS

SELECT
    e.emp_name,
    p.project_name,
    p.status
FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
   AND p.status = 'Active';

--  JOIN 19: IMPORTANT LEFT JOIN CONDITION EXAMPLE
SELECT
    e.emp_name,
    p.project_name,
    p.status
FROM employee e
LEFT JOIN employee_project p
    ON e.emp_id = p.emp_id
   AND p.status = 'Active'
ORDER BY e.emp_id;

--  JOIN 20: LEFT JOIN CONDITION IN WHERE
SELECT
    e.emp_name,
    p.project_name,
    p.status
FROM employee e
LEFT JOIN employee_project p
    ON e.emp_id = p.emp_id
WHERE p.status = 'Active';

--  JOIN 21: COUNT PROJECTS PER EMPLOYEE
select 
 e.emp_id,
 e.emp_name,
 count(p.assignment_id) as total_projects
from employee e
left join employee_project p
 on e.emp_id = p.emp_id
group BY
e.emp_id,
e.emp_name
order by e.emp_id;

--  JOIN 22: TOTAL HOURS WORKED BY EACH EMPLOYEE
select 
 e.emp_id,
 e.emp_name,
 sum(p.hours_worked) as total_hours
from employee e
left join EMPLOYEE_PROJECT p
 on e.emp_id = p.emp_id
group by 
e.emp_id,
e.emp_name
order by e.emp_id;

-- JOIN 23: HANDLE NULL HOURS USING NVL
SELECT
    e.emp_id,
    e.emp_name,
    NVL(SUM(p.hours_worked), 0) AS total_hours
FROM employee e
LEFT JOIN employee_project p
    ON e.emp_id = p.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
ORDER BY e.emp_id;

--  JOIN 24: EMPLOYEES WORKING ON MORE THAN ONE PROJECT
SELECT
    e.emp_id,
    e.emp_name,
    COUNT(p.assignment_id) AS total_projects
FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
HAVING COUNT(p.assignment_id) > 1;

--  JOIN 25: PROJECT-WISE EMPLOYEE COUNT
select 
 p.project_name,
 count(e.emp_id) as employee_count
from employee_project p
left join employee e
 on p.emp_id = e.emp_id
group by p.project_name
order by employee_count desc;

--  JOIN 26: JOIN + CASE
select 
 e.emp_name,
 p.project_name,
 p.hours_worked,
 case 
    WHEN p.hours_worked >= 120 THEN 'High Workload'
        WHEN p.hours_worked >= 80 THEN 'Medium Workload'
        WHEN p.hours_worked IS NULL THEN 'Hours Not Available'
        ELSE 'Low Workload'
    END AS workload
FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
order by p.hours_worked desc;

--  JOIN 27: JOIN + SALARY CONDITION
SELECT
    e.emp_name,
    e.salary,
    p.project_name
FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
WHERE e.salary > 60000;

-- JOIN 28: JOIN + SUBQUERY
SELECT
    e.emp_name,
    p.project_name,
    p.hours_worked
FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
WHERE p.hours_worked >
(
    SELECT AVG(hours_worked)
    FROM employee_project
);

--  JOIN 29: JOIN + ANALYTIC FUNCTION
select
 e.emp_name,
 p.project_name,
 p.hours_worked,
 rank() over(
    order by p.hours_worked desc nulls last
 ) as hours_rank
from employee e
join employee_project p
 on e.emp_id = p.emp_id;

--  JOIN 30: RANK PROJECTS WITHIN EACH EMPLOYEE
SELECT
    e.emp_id,
    e.emp_name,
    p.project_name,
    p.hours_worked,

    ROW_NUMBER() OVER
    (
        PARTITION BY e.emp_id
        ORDER BY p.hours_worked DESC NULLS LAST
    ) AS project_rank

FROM employee e
JOIN employee_project p
    ON e.emp_id = p.emp_id
ORDER BY e.emp_id, project_rank;



-- JOIN 31: HIGHEST-HOURS PROJECT FOR EACH EMPLOYEE
select 
 emp_id,
 emp_name,
 project_name,
 hours_worked
from
(
    select
        e.emp_id,
        e.emp_name,
        p.project_name,
        p.hours_worked,
    row_number() over(
        partition by e.emp_id
        order by p.hours_worked desc nulls LAST
    ) as rn
    from employee e
    join employee_project p
     on e.emp_id = p.emp_id
)
where rn = 1;

-- JOIN 32: EMPLOYEE + MANAGER + PROJECT
select 
 e.emp_name as employee_name,
 m.emp_name as manager_name,
 p.project_name
from employeee e
left join employee m
 on e.manager_id = m.emp_id
left join employee_project p
 on e.emp_id = p.emp_id
order by e.emp_id;

-- JOIN 33: FIND NULL VALUES AFTER JOIN
select 
 e.emp_name,
 e.salary,
 e.city,
 p.project_name,
 p.project_role
from employee e
left join employee_project p
 on e.emp_id = p.emp_id
where e.salary is null or e.city is null or p.project_name is null ;

-- JOIN 34: NVL FOR MULTIPLE NULL COLUMNS

SELECT
    e.emp_name,

    NVL(e.department, 'Department Not Assigned')
        AS department,

    NVL(e.city, 'City Not Available')
        AS city,

    NVL(p.project_name, 'No Project')
        AS project_name,

    NVL(p.project_role, 'Role Not Assigned')
        AS project_role,

    NVL(p.hours_worked, 0)
        AS hours_worked

FROM employee e
LEFT JOIN employee_project p
    ON e.emp_id = p.emp_id;

-- JOIN 35: DEPARTMENT-WISE PROJECT ASSIGNMENTS
SELECT
    e.department,
    COUNT(p.assignment_id) AS project_assignments,
    SUM(NVL(p.hours_worked,0)) AS total_hours
FROM employee e
LEFT JOIN employee_project p
    ON e.emp_id = p.emp_id
GROUP BY e.department
ORDER BY project_assignments DESC;

-- JOIN 36: PROJECTS HAVING MORE THAN ONE EMPLOYEE
select 
 p.project_name,
 count(distinct p.emp_id) as employee_count
from employee_project p
join employee e
 on e.emp_id = p.emp_id
group by p.project_name;