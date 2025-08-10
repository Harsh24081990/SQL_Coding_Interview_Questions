--1. list down the employees id, name, total salary in a 2010 whose total salary (in 2010) is more than 30000 in the year 2010
create table emp_sal
(emp_id int,
emp_name varchar(20),
emp_sal decimal(10,2),
month_ varchar (10),
year_ int
);
 
insert into emp_sal values (1, 'aa', 10000, 'jan', 2010);
insert into emp_sal values (1, 'aa', 10000, 'feb', 2010);
insert into emp_sal values (1, 'aa', 9000, 'mar', 2010);
insert into emp_sal values (2, 'bb', 10000, 'jan', 2010);
insert into emp_sal values (2, 'bb', 10000, 'feb', 2010);
insert into emp_sal values (2, 'bb', 11000, 'mar', 2010);
insert into emp_sal values (3, 'cc', 10000, 'jan', 2010);
insert into emp_sal values (3, 'cc', 10000, 'feb', 2010);
insert into emp_sal values (3, 'cc', 10000, 'mar', 2010);
insert into emp_sal values (4, 'dd', 10000, 'jan', 2010);
insert into emp_sal values (4, 'dd', 11000, 'feb', 2010);
insert into emp_sal values (4, 'dd', 12000, 'mar', 2010);
insert into emp_sal values (2, 'bb', 10000, 'jan', 2011);
insert into emp_sal values (2, 'bb', 10000, 'feb', 2011);
insert into emp_sal values (2, 'bb', 11000, 'mar', 2011);
insert into emp_sal values (3, 'cc', 10000, 'jan', 2011);
insert into emp_sal values (3, 'cc', 10000, 'feb', 2011);
insert into emp_sal values (3, 'cc', 10000, 'mar', 2011);
insert into emp_sal values (4, 'dd', 10000, 'jan', 2011);
insert into emp_sal values (4, 'dd', 11000, 'feb', 2011);
insert into emp_sal values (4, 'dd', 12000, 'mar', 2011);
--=======================================================================

--2. how many rows will come in inner, left , right and full outer join ?
create table A1
(A int);
insert into A1 values (1);
insert into A1 values (1);
insert into A1 values (2);
insert into A1 values (0);
insert into A1 values (2);
insert into A1 values (NULL);
create table B1
(B int);
insert into B1 values (NULL);
insert into B1 values (NULL);
insert into B1 values (1);
insert into B1 values (1);
insert into B1 values (1);
insert into B1 values (2);
--======================================================

--3. how many rows will come in inner, left , right and full outer join ?
create table A
(A1 int);
insert into A values (1);
insert into A values (1);
insert into A values (1);
create table B
(B1 int);
insert into B values (1);
insert into B values (1);
insert into B values (1);
--===============================================

--4. how many rows will come in inner, left , right and full outer join ?
create table A
(A1 int);
insert into A values (1);
insert into A values (1);
insert into A values (1);
create table B
(B1 int);
insert into B values (2);
insert into B values (2);
insert into B values (2);
--===============================================

--5.Table A(1,1,1,1) and B(1,1,1). What is output of inner, left, right and full outer join?
--=====================================================================

--6. Output of UNION, UNION ALL, INTERSECT, MINUS and Joins ?
SELECT * FROM A;
--1,1,1,2,2,3,4,NULL,NULL
SELECT * FROM B;
--1,1,2,3,NULL
--=====================================================================

7. List down the duplicate rows along with the count of duplicate rows.
use harshdb;
CREATE TABLE empp
(EMP_NO numeric,
EMP_NM VARCHAR(20),
SALARY numeric
);

INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (102,'RAM',3000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (102,'RAM',3000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (103,'ROBERT',7000);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (104,'MARY',3600);
INSERT INTO empp (EMP_NO,EMP_NM,SALARY) VALUES (104,'MARY',7000);


--=====================================================================

8. Remove the duplicate rows from empp table.
--=====================================================================

9. How to find nth highest salary in a table?
CREATE TABLE empy
( "EMP_NO" int,
"EMP_NM" VARCHAR(20),
"SALARY" int
);
TRUNCATE TABLE empy;
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (101,'MOHIT',5000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (102,'RAM',3000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (102,'RAM',3000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (103,'ROBERT',7000);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (104,'MARY',3600);
INSERT INTO empy (EMP_NO,EMP_NM,SALARY) VALUES (104,'MARY',7000);
--=====================================================================

10.--How to find highest salary in a table based on dept_no (in each deparment)?
CREATE TABLE "EMPL"
( "EMP_NO" int,
"EMP_NM" VARCHAR(20),
"SALARY" int,
"DEPT_NO" int
);
TRUNCATE TABLE "EMPL";
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (101,'MOHIT',5000,1001);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (102,'RAM',3000,1001);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (103,'KRISHNA',2000,1001);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (104,'JOHN',3000,1002);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (105,'MARK',2000,1002);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (106,'STEVE',1000,1002);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (107,'MARY',4000,1003);
INSERT INTO empl (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (107,'MArrRY',10000,1003);
--=====================================================================

11. --find the second highest salary in each department without using row_number, rank, dense_rank functions.
--=====================================================================

12. How to find EMPNO which is working on multiple department?
DROP TABLE "EMPLOYEE";
CREATE TABLE "EMPLOYEE"
( "EMP_NO" int,
"EMP_NM" VARCHAR(20),
"SALARY" int,
"DEPT_NO" int
);
TRUNCATE TABLE EMPLOYEE;
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (101,'MOHIT',5000,1001);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (106,'RAM',3000,1002);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (106,'RAM',3000,1003);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (102,'KRISHNA',2000,1002);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (103,'JOHN',3000,1002);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (104,'MARK',2000,1003);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (105,'STEVE',1000,1002);
INSERT INTO EMPLOYEE (EMP_NO,EMP_NM,SALARY,DEPT_NO) VALUES (105,'STEVE',1000,1001);
--=====================================================================

13.Find out the employess whos salary is more than the compay average salary. 
--=====================================================================

14. Find top 2 salary of Male and Female from employee table?
DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE
( EMP_NO int,
EMP_NM VARCHAR(20),
GENDER VARCHAR(20),
SALARY int
);
TRUNCATE TABLE EMPLOYEE;
INSERT INTO EMPLOYEE VALUES (101,'A','M',8000);
INSERT INTO EMPLOYEE VALUES (102,'B','M',1000);
INSERT INTO EMPLOYEE VALUES (103,'C','M',4000);
INSERT INTO EMPLOYEE VALUES (104,'D','M',2000);
INSERT INTO EMPLOYEE VALUES (105,'W','F',1000);
INSERT INTO EMPLOYEE VALUES (106,'X','F',5000);
INSERT INTO EMPLOYEE VALUES (107,'Y','F',3000);
INSERT INTO EMPLOYEE VALUES (108,'Z','F',9000);
--=====================================================================
