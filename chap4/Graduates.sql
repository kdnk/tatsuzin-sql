select avg(tmp.income)
from (
  select G1.income
  from Graduates G1 cross join Graduates G2
  group by G1.income
  having sum(
    case when G1.income >= G2.income then 1 else 0 end
  ) >= count(*) / 2
  and
  sum(
    case when G1.income <= G2.income then 1 else 0 end
  ) >= count(*) / 2
) as tmp
;
