select *
from vehicle_collision;

#-- Are traffic crashes rising or falling over time?

select monthname(crash_date) as 'month', count(*) as total_crash
from vehicle_collision
where year(crash_date) = 2022
group by 1, month(crash_date)
order by 2 desc,1;

-- which borogh, street or intersection are most dangerous?

select borough, count(*) as total_crashes
from vehicle_collision
where borough is not null
group by borough
order by 2 desc;

-- what are the leading causes of crashes and do thay vary by borough?

select contributing_factor_vehicle_1,borough
from vehicle_collision
where borough is not null and contributing_factor_vehicle_1 is not null
group by contributing_factor_vehicle_1, borough;

-- which group face the highest level of injuries or death?
select
sum(number_of_persons_injured) as persons_Injured,
sum(number_of_persons_killed) as persons_Injured,
sum(number_of_pedestrians_injured) as pedestrians_Injured,
sum(number_of_pedestrians_killed) as pedesrtrians_killed,
sum(number_of_cyclists_injured) as cyclists_Injured,
sum(number_of_cyclists_killed) as cyclists_killed,
sum(number_of_motorists_injured) as motorists_injured,
sum(number_of_motorists_killed) as motorists_killed
from vehicle_collision;