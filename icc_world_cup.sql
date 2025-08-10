--================================ICC WC===================================
--PROBLEM:
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

--input
--team_1, team_2, winner

--output required.
--team_name, num_of_match_played, no_of_wins, no_of_losses

--======================================================================================
-- SOLUTION:
select team_name, count(winner_flag) as played, sum(winner_flag) as won, 
(count(winner_flag)-sum(winner_flag)) as loss
from
(select Team_1 as team_name, case when Team_1 = Winner then 1 else 0 end as winner_flag
from icc_world_cup
union all
select Team_2 as team_name, case when Team_2 = Winner then 1 else 0 end as winner_flag
from icc_world_cup) AA
group by team_name;



