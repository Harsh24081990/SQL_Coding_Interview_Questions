--Answer 1:-
select emp_id, emp_name, sum(emp_sal) as totalsal
from emp_sal 
where year_ = 2010
group by emp_id, emp_name
having sum(emp_sal) > 30000
--==============================================

--Answers 2:-
--Inner join ---> 8 rows
--left outer ---> 10 rows
--right outer ---> 10 rows
--full outer ---> 12 rows

select A1.A, B1.B 
from A1 inner join B1
on A1.A = B1.B;
--================================================

--Answer 3 --> 9 rows
select A.A1, B.B1
from A full outer join B
on A.A1 = B.B1;

--drop table A;
--drop table B;
--===============================================

--Answer 4 :-
--inner join --> 0
--left --> 3
--right --> 3
--full --> 6
select A.A1, B.B1
from A inner join B
on A.A1 = B.B1;
--===============================================

--Answer 5: 12 rows
WITH temp_1 AS
(
SELECT 1 AS A_1
UNION ALL
SELECT 1 
UNION ALL
SELECT 1
UNION ALL
SELECT 1
),
temp_2 AS
(
SELECT 1 AS A_2
UNION ALL
SELECT 1
UNION ALL
SELECT 1
)
SELECT * FROM TEMP_1 full JOIN TEMP_2 ON TEMP_1.A_1 = TEMP_2.A_2;
--=====================================================================

--Answer 6. 
Union: 1,2,3,4,NULL
Union ALL: 1,1,1,2,2,3,4,NULL,NULL,1,1,2,3,NULL
INTERSECT: 1,2,3,NULL
MINUS: 4
INNER JOIN: 1,1,1,1,1,1,2,2,3
LEFT JOIN:  1,1,1,1,1,1,2,2,3,4,NULL,NULL
RIGHT JOIN: 1,1,1,1,1,1,2,2,3,NULL
FULL OUTER: 1,1,1,1,1,1,2,2,3,4,NULL,NULL,NULL
--=====================================================================

--Answer 7.
select EMP_NO, EMP_NM, SALARY, count(*) from empp
group by EMP_NO, EMP_NM, SALARY
having count(*) > 1;

--=====================================================================

--Answer 8.
-- we can do it using UNION clause and using ROW_NUMBER() function. 
--way1 using UNION clause. 
WITH CTE AS
(select EMP_NO, EMP_NM, SALARY from empp
)
select * from empp
UNION
select * from CTE

SELECT * FROM empp WHERE ROWID NOT IN
(SELECT MAX(ROWID) FROM empp GROUP BY EMP_NO,EMP_NM,SALARY);

--way2 -- using row_number() function using sub query.
select * from 
(select emp_no, emp_nm, salary,
row_number() over(partition by emp_no, emp_nm, salary order by emp_no) AS RN
from empp) AA
where RN=1
--for deleting the duplicate rows. 
delete from
(select emp_no, emp_nm, salary,
row_number() over(partition by emp_no, emp_nm, salary order by emp_no) AS RN
from empp) AA
where RN > 1

--way3 -- using row_number() function using CTE.
WITH CTE AS
(select emp_no, emp_nm, salary,
row_number() over(partition by emp_no, emp_nm, salary order by emp_no) AS RN
from empp)
select * from CTE where RN=1;
--deleting duplicate rows.
WITH CTE AS
(select emp_no, emp_nm, salary,
row_number() over(partition by emp_no, emp_nm, salary order by emp_no) AS RN
from empp)
DELETE from CTE where RN>1;
--***************************************
--Logic --> partition by makes the group of column(s) values by keeping the similar (duplicate) values in a separate partition. and row_number function applies to each partition where it do the numbering of rows.
--If we don't give partition by clause to row_number function, the whole table will be treated as a single partition and numbering of rows will be donw for complete table instead of partitions of similar (duplicate) rows. 
--=====================================================================

--Answer 9.
SELECT * FROM empy ORDER BY SALARY DESC;
--find the employee with nth highest salary.
select * from (select EMP_NO, emp_nm, salary, DENSE_RANK() over(order by salary desc) RANK_ from empy) AA
where RANK_ =2
---------------------------
with AA AS
(select EMP_NO, emp_nm, salary, DENSE_RANK() over(order by salary desc) RANK_ from empy)
select * from AA where RANK_ = 2
--=====================================================================

--Answer 10. 
find highest salary in a table based on dept_no
select * from empl;
with CTE AS
(select *, rank() over(partition by Dept_No order by salary desc) AS RANKING from empl)
select distinct Emp_no, Emp_nm , Dept_no, salary from CTE where ranking = 1
----------
select distinct Emp_no, Emp_nm , Dept_no, salary from(
(select *, rank() over(partition by Dept_No order by salary desc) AS RANKING from empl)
) AA where AA.ranking = 1
--------------------
--Find max salary in each department.
--without using row_number, rank, dense_rank functions. 
select * from empl;
select dept_no, max(salary) max_sal from empl group by dept_no
----------------------------------
select * from empl A, (select dept_no, max(salary) max_sal from empl group by dept_no) B
where A.dept_no = B.dept_no and A.salary = B.max_sal
----------------------------------
select * from empl A inner join (select dept_no, max(salary) max_sal from empl group by dept_no) B
on A.dept_no = B.dept_no and A.salary = B.max_sal
------------------------------------
--=====================================================================

--Answer 11.
--find the second highest salary in each department without using row_number, rank, dense_rank functions.
select DN, max(sl) from (
select A.EMP_NO, A.EMP_NM, A.dept_no as DN, A.salary as sl from empl A inner join (select B.dept_no, max(B.salary) max_sal from empl B group by B.dept_no) B1
on A.dept_no = B1.dept_no and A.salary = B1.max_sal) cc group by DN

--=====================================================================

--Answer 12.
--find EMPNO which is working on multiple department?
select A.emp_nm, A.dept_no, 'Working in Multiple department' as comments from employee A 
Inner join
(select EMP_NM, count(Dept_no) CNT from employee 
group by emp_nm 
having count(Dept_no) > 1) B
ON A. emp_nm = B.emp_nm
--=====================================================================

--Answer 13.
Find out the employess whos salary is more than the compay average salary. 
select a.emp_no, a.emp_nm, a.salary from employee a
where a.salary > (select avg(salary) as avg_sal from employee)
--=====================================================================

--Answer 14. -- top 2 salary of males and femals. 
select * from (
select *, DENSE_RANK() over(partition by gender order by salary desc) as RANK_SAL
from employee) E
where RANK_SAL <3
-----------------------------------
with CTE AS (
select *, DENSE_RANK() over(partition by gender order by salary desc) as RANK_SAL
from employee)
select * from CTE where RANK_SAL <3

--=====================================================================
