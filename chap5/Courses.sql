-- /* 外部結合で行列変換　その1（行→列）：クロス表を作る */
-- CREATE TABLE Courses
-- (name   VARCHAR(32),
--  course VARCHAR(32),
--  PRIMARY KEY(name, course));
--
-- INSERT INTO Courses VALUES('赤井', 'SQL入門');
-- INSERT INTO Courses VALUES('赤井', 'UNIX基礎');
-- INSERT INTO Courses VALUES('鈴木', 'SQL入門');
-- INSERT INTO Courses VALUES('工藤', 'SQL入門');
-- INSERT INTO Courses VALUES('工藤', 'Java中級');
-- INSERT INTO Courses VALUES('吉田', 'UNIX基礎');
-- INSERT INTO Courses VALUES('渡辺', 'SQL入門');

select
  C.name
  , (
    case when (
      select count(*)
      from Courses C1
      where C1.name = C.name and C1.course = 'SQL入門'
    ) > 0 then '○' else null end
  )
  , (
    case when (
      select count(*)
      from Courses C1
      where C1.name = C.name and C1.course = 'UNIX基礎'
    ) > 0 then '○' else null end
  )
  , (
    case when (
      select count(*)
      from Courses C1
      where C1.name = C.name and C1.course = 'Java中級'
    ) > 0 then '○' else null end
  )
from Courses C
group by C.name
;


select
  name
  , case when sum(case when C.course = 'SQL入門' then 1 else 0 end) = 1 then '○' else null end
  , case when sum(case when C.course = 'UNIX基礎' then 1 else 0 end) = 1 then '○' else null end
  , case when sum(case when C.course = 'Java中級' then 1 else 0 end) = 1 then '○' else null end
from Courses C
group by C.name
;
