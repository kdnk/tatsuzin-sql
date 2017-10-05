select P1.district, P1.name, count(P2.name) + 1 as rank
from DistrictProducts P1 left outer join DistrictProducts P2
  on P1.district = P2.district and P1.price < P2.price and P1.name <> P2.name
group by P1.district, P1.name
order by P1.district, rank
;

select P1.district, p1.name, (
  select count(*) + 1
  from DistrictProducts P2
  where P1.district = P2.district and P1.price < P2.price and P1.name <> P2.name
) as rank
from DistrictProducts P1
order by P1.district, rank
;

select
  district
  , name
  , rank() over (partition by district order by price)
  , dense_rank() over (partition by district order by price)
from DistrictProducts
