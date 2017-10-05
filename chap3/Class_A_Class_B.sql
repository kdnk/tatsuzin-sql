-- /* 実践編：３. NOT IN とNOT EXISTS は同値ではない */
-- CREATE TABLE Class_A
-- (name VARCHAR(16) PRIMARY KEY,
--  age  INTEGER,
--  city VARCHAR(16) NOT NULL );
--
-- CREATE TABLE Class_B
-- (name VARCHAR(16) PRIMARY KEY,
--  age  INTEGER,
--  city VARCHAR(16) NOT NULL );
--  j
-- INSERT INTO Class_A VALUES('ブラウン', 22, '東京');
-- INSERT INTO Class_A VALUES('ラリー',   19, '埼玉');
-- INSERT INTO Class_A VALUES('ボギー',   21, '千葉');
--
-- INSERT INTO Class_B VALUES('斎藤',  22,   '東京');
-- INSERT INTO Class_B VALUES('田尻',  23,   '東京');
-- INSERT INTO Class_B VALUES('山田',  NULL, '東京');
-- INSERT INTO Class_B VALUES('和泉',  18,   '千葉');
-- INSERT INTO Class_B VALUES('武田',  20,   '千葉');
-- INSERT INTO Class_B VALUES('石川',  19,   '神奈川');

select *
from Class_A A
where A.age NOT IN (
  select B.age
  from Class_B B
  where B.city = '東京' and B.age is not null
)
;

select *
from Class_A A
where not exists (
  select B.age
  from Class_B B
  where A.age = B.age and B.city = '東京'
)
;

select *
from Class_A A
where A.age < ALL (
  select B.age
  from Class_B B
  where B.city = '東京' and B.age is not null
)
;

-- drop table Class_B;
-- CREATE TABLE Class_B
-- (name VARCHAR(16) PRIMARY KEY,
--  age  INTEGER,
--  city VARCHAR(16) NOT NULL );
--
-- INSERT INTO Class_B VALUES('和泉',  18,   '千葉');
-- INSERT INTO Class_B VALUES('武田',  20,   '千葉');
-- INSERT INTO Class_B VALUES('石川',  19,   '神奈川');

select *
from Class_A A
where A.age < (
  select min(B.age)
  from Class_B B
  where B.city = '東京'
)
;

select *
from Class_A A
where A.age < ALL (
  select B.age
  from Class_B B
  where B.city = '東京'
)
;
