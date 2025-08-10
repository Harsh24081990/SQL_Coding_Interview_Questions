QUE: customers, orders tables are there as following: --> 
1. Find out the top 2 customer's name who placed maximum number of orders in last 3 months ? 
2. Find out the top 2 customer's name who placed maximum amount of orders in last 3 months ?

create table customers
(cust_id int,
cust_name varchar,
city varchar);

-- Insert into customers
INSERT INTO customers (cust_id, cust_name, city) VALUES
(1, 'Amit Sharma', 'Delhi'),
(2, 'Priya Singh', 'Mumbai'),
(3, 'Rahul Verma', 'Bangalore'),
(4, 'Sneha Gupta', 'Pune'),
(5, 'Arjun Mehta', 'Indore');

create table orders
(order_id int,
cust_id int,
order_date date,
order_amount decimal);

-- Insert into orders
INSERT INTO orders (order_id, cust_id, order_date, order_amount) VALUES
(101, 1, '2025-07-05', 1200),
(102, 1, '2025-06-20', 800),
(103, 2, '2025-07-10', 500),
(104, 2, '2025-05-15', 1500),
(105, 3, '2025-07-25', 900),
(106, 3, '2025-06-28', 700),
(107, 3, '2025-04-18', 2000),
(108, 4, '2025-07-30', 2500),
(109, 4, '2025-06-15', 1800),
(110, 5, '2022-07-12', 400);


select * from customers;
select * from orders;

-- Solution: Top customers based on number of orders placed. 
with CTE AS
(
select
	cust_id, count(*) as No_of_order
from orders
where order_date > (current_date - interval '90 days')
group by cust_id
),
CTE2 AS
(
select cust_id, No_of_order, dense_rank() over(order by No_of_order desc) AS RNK 
from CTE
)
select a.cust_name, b.RNK 
from customers a 
join CTE2 b
on a.cust_id = b.cust_id
where b.RNK < 3

-- Solution: Top customers based on amount of orders placed. 

with CTE1 AS
(
select
	cust_id, sum(order_amount) as total_order
from orders
where order_date > (current_date - interval '90 days')
group by cust_id
),
CTE2 AS
(
select *, dense_rank() over(order by total_order) as RNK
from CTE1
)
select a.cust_name, b.RNK
from customers a join CTE2 b
on a.cust_id = b.cust_id
where b.RNK < 3;
