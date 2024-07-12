--Answer 1:- 
select team_name, count(winner_flag) as played, sum(winner_flag) as won, 
(count(winner_flag)-sum(winner_flag)) as loss
from
(select Team_1 as team_name, case when Team_1 = Winner then 1 else 0 end as winner_flag
from icc_world_cup
union all
select Team_2 as team_name, case when Team_2 = Winner then 1 else 0 end as winner_flag
from icc_world_cup) AA
group by team_name;
