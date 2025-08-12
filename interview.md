############### Altimetrik ################ 
--https://nextleap.app/online-compiler/sql-programming

#Q1: Name of all employees who earn more than their manager.
Ans:
with CTE AS 
    (
SELECT
    e.name as emp_name,
    e.salary as emp_salary,
    m.name as manager_name,
    m.salary  as manager_salary
FROM
employees e join employees m 
ON e.id = m.manager
    )
select * from CTE 
where emp_salary > manager_salary;
----===============================================================

#Q2. Name of all employees and their manager who are not in same department. 
#Ans:
with CTE AS 
    (
SELECT
    e.name as emp_name,
    e.salary as emp_salary,
    m.name as manager_name,
    m.salary  as manager_salary,
    e.dept as emp_dept,
    m.dept as manager_dept
FROM
employees m join employees e
ON m.id = e.manager
    )
select * from CTE 
where emp_dept != manager_dept;
----===============================================================

#Q3: Name of employee having third highest salary in each department
#ANS:
with CTE AS
(SELECT
    name, 
    salary,
    dept,
    dense_rank() over(partition by dept order by salary desc) as sal_rnk
from employees
    )
select name, dept from CTE where sal_rnk =3;
----===============================================================

#Q4: Bucket employee into salary range.
Above 50,000	
Below 20,000	
Between 20,000-50,000
Output:
salary_range	employee_count

#Ans:

with CTE AS(
    select 
    id,
    case 
    when salary > 50000 then 'above'
    when salary < 20000 then 'Below'
    when salary > 20000 and salary < 50000 then 'Between'
    end as salary_range
from employees
    )
select id, count(*) from CTE group by id;
----===============================================================





    
