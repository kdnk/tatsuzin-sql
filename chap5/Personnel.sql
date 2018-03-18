-- CREATE TABLE Personnel
--  (employee   varchar(32),
--   child_1    varchar(32),
--   child_2    varchar(32),
--   child_3    varchar(32),
--   PRIMARY KEY(employee));
--
-- INSERT INTO Personnel VALUES('赤井', '一郎', '二郎', '三郎');
-- INSERT INTO Personnel VALUES('工藤', '春子', '夏子', NULL);
-- INSERT INTO Personnel VALUES('鈴木', '夏子', NULL,   NULL);
-- INSERT INTO Personnel VALUES('吉田', NULL,   NULL,   NULL);

select *
from Personnel P
;
select *
from children
;

select P.employee, C1.child_1
from Personnel P left outer join children C1
  on C1.child_1 IN (P.child_1, P.child_2, P.child_3)
;





-- create view children(child) as (
--   select child_1
--   from Personnel
--   union
--   select child_2
--   from Personnel
--   union
--   select child_3
--   from Personnel
-- )
-- ;
