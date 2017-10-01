-- CREATE TABLE Products
-- (name VARCHAR(16) PRIMARY KEY,
--  price INTEGER NOT NULL);

-- --重複順列・順列・組み合わせ
-- INSERT INTO Products VALUES('りんご',	50);
-- INSERT INTO Products VALUES('みかん',	100);
-- INSERT INTO Products VALUES('ぶどう',	50);
-- INSERT INTO Products VALUES('スイカ',	80);
-- INSERT INTO Products VALUES('レモン',	30);
-- INSERT INTO Products VALUES('バナナ',	50);
--

-- select P1.name, P2.name
-- from Products P1 cross join Products P2
-- ;
--   name  |  name
-- --------+--------
--  りんご | りんご
--  りんご | みかん
--  りんご | バナナ
--  みかん | りんご
--  みかん | みかん
--  みかん | バナナ
--  バナナ | りんご
--  バナナ | みかん
--  バナナ | バナナ
-- (9 rows)

-- select P1.name, P2.name
-- from Products P1 cross join Products P2
-- where P1.name <> P2.name
-- ;
--   name  |  name
-- --------+--------
--  りんご | みかん
--  りんご | バナナ
--  みかん | りんご
--  みかん | バナナ
--  バナナ | りんご
--  バナナ | みかん
-- (6 rows)

-- select P1.name, P2.name
-- from Products P1 cross join Products P2
-- where P1.name > P2.name
-- ;
--   name  |  name
-- --------+--------
--  りんご | みかん
--  バナナ | みかん
--  バナナ | りんご
-- (3 rows)

-- select distinct P1.name
-- from Products P1 inner join Products P2
--   on P1.price = P2.price
--     and P1.name <> P2.name
-- ;
--   name
-- --------
--  みかん
--  ぶどう
--  バナナ
--  りんご
--  いちご
-- (5 rows)

-- select *
-- from Products P1
-- where exists (
--   select P2.price
--   from Products P2
--   where P1.name <> P2.name and P1.price = P2.price
-- )
-- ;
--   name  | price
-- --------+-------
--  りんご |    50
--  みかん |   100
--  バナナ |   100
--  ぶどう |    50
--  いちご |   100
-- (5 rows)

-- -- ランキング olap
-- select
--   name
--   , rank() over (order by price)
--   , dense_rank() over (order by price)
-- from Products
-- ;
--   name  | rank | dense_rank
-- --------+------+------------
--  レモン |    1 |          1
--  ぶどう |    2 |          2
--  りんご |    2 |          2
--  スイカ |    4 |          3
--  いちご |    5 |          4
--  みかん |    5 |          4
--  バナナ |    5 |          4
-- (7 rows)

-- ランキング
select
  P1.name
  , count(P2.name) + 1 rank
from Products P1 left outer join Products P2
  on P1.name <> P2.name and P1.price < P2.price
group by P1.name
order by rank
;
--   name  | rank
-- --------+------
--  みかん |    1
--  スイカ |    2
--  ぶどう |    3
--  りんご |    3
--  バナナ |    3
--  レモン |    6
-- (6 rows)

-- サブクエリ
select
  P1.name
  , (
    select count(P2.name) + 1
    from Products P2
    where P1.name <> P2.name and P1.price < P2.price
  ) rank
from Products P1
order by rank
;
