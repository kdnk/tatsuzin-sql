-- /* 完全外部結合 */
-- CREATE TABLE Class_A2
-- (id char(1),
--  name varchar(30),
--  PRIMARY KEY(id));
--
-- CREATE TABLE Class_B2
-- (id   char(1),
--  name varchar(30),
--  PRIMARY KEY(id));
--
-- INSERT INTO Class_A2 (id, name) VALUES('1', '田中');
-- INSERT INTO Class_A2 (id, name) VALUES('2', '鈴木');
-- INSERT INTO Class_A2 (id, name) VALUES('3', '伊集院');
--
-- INSERT INTO Class_B2 (id, name) VALUES('1', '田中');
-- INSERT INTO Class_B2 (id, name) VALUES('2', '鈴木');
-- INSERT INTO Class_B2 (id, name) VALUES('4', '西園寺');

-- full outer join
select coalesce(A.id, B.id) as id, A.name as A_name, B.name as B_name
from Class_A2 A full outer join Class_B2 B
on A.id = B.id
;

-- A - B
select *
from Class_A2 A left outer join Class_B2 B
on A.id = B.id
where B.id is null
;

-- B - A
select *
from Class_A2 A right outer join Class_B2 B
on A.id = B.id
where A.id is null
;

-- 排他的和集合
select *
from Class_A2 A full outer join Class_B2 B on A.id = B.id
where A.id is null or B.id is null
;

-- 商
select shop
from ShopItems SI1
where not exists (
  select I.item
  from Items I left outer join ShopItems SI2
    on I.item = SI2.item
    and SI1.shop = SI2.shop
  where SI2.item is null
)
;
