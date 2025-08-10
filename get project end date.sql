QUE : write sql to populate the end_date and it should be the one day prior to the start date of the next project. 
table --> project
project_id    start_date    end_date
1            01-01-2024
2            02-01-2025
3            05-02-2026
-- =========================================
-- Solution:-
create table projects
(
project_id int,
start_date date,
end_date date
)

insert into projects (project_id, start_date)
values
(1, '2020-01-10'),
(2, '2022-01-20'),
(3, '2023-01-11'),
(4, '2025-01-21');

select * from projects;

-- solution using lead() window funciton. 
with CTE as(
select project_id, 
		start_date, 
		date((lead(start_date) over(order by start_date) - interval '1 day')) AS end_date1 
from projects)

update projects P
SET end_date = C.end_date1
FROM CTE C
Where P.project_id = C.project_id;

	
