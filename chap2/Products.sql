-- CREATE TABLE Products
-- (name VARCHAR(16) PRIMARY KEY,
--  price INTEGER NOT NULL);
--
-- --重複順列・順列・組み合わせ
-- INSERT INTO Products VALUES('りんご',	100);
-- INSERT INTO Products VALUES('みかん',	50);
-- INSERT INTO Products VALUES('バナナ',	80);

select P1.name, P2.name
from Products P1 cross join Products P2
;
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

select P1.name, P2.name
from Products P1 cross join Products P2
where P1.name <> P2.name
;
--   name  |  name
-- --------+--------
--  りんご | みかん
--  りんご | バナナ
--  みかん | りんご
--  みかん | バナナ
--  バナナ | りんご
--  バナナ | みかん
-- (6 rows)

select P1.name, P2.name
from Products P1 cross join Products P2
where P1.name > P2.name
;
--   name  |  name
-- --------+--------
--  りんご | みかん
--  バナナ | みかん
--  バナナ | りんご
-- (3 rows)
