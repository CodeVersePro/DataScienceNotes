CREATE Table cross_join (

    x INTEGER,
    y INTEGER
)

insert into cross_join(x,y)
values
(-1,-1),
(0,0),
(-1,-2)

select * from cross_join

select c1.x as x1, c2.x as x2, c1.y as y1, c2.y as y2, 
sqrt(pow((c1.x-c2.x),2) + pow((c1.y - c2.y), 2)) as shortest
from cross_join as c1
cross join cross_join as c2
where c1.x != c2.x or c1.y != c2.y 
order by shortest
limit 1