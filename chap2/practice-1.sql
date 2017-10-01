-- DROP TABLE Products;
--
-- CREATE TABLE Products
-- (name VARCHAR(16) PRIMARY KEY,
--  price INTEGER NOT NULL);
--
-- -- --重複順列・順列・組み合わせ
-- INSERT INTO Products VALUES('りんご',	50);
-- INSERT INTO Products VALUES('みかん',	100);
-- INSERT INTO Products VALUES('バナナ',	50);

select P1.name, P2.name
from Products P1 inner join Products P2
  on P1.name >= P2.name
;
