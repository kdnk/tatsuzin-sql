-- /* NULL を含まない集合を探す */
-- CREATE TABLE Students
-- (student_id   INTEGER PRIMARY KEY,
--  dpt          VARCHAR(16) NOT NULL,
--  sbmt_date    DATE);
--
-- INSERT INTO Students VALUES(100,  '理学部',   '2005-10-10');
-- INSERT INTO Students VALUES(101,  '理学部',   '2005-09-22');
-- INSERT INTO Students VALUES(102,  '文学部',   NULL);
-- INSERT INTO Students VALUES(103,  '文学部',   '2005-09-10');
-- INSERT INTO Students VALUES(200,  '文学部',   '2005-09-22');
-- INSERT INTO Students VALUES(201,  '工学部',   NULL);
-- INSERT INTO Students VALUES(202,  '経済学部', '2005-09-25');

select S1.dpt
from Students S1
group by S1.dpt
having count(sbmt_date) = count(student_id)
;

select S1.dpt
from Students S1
group by S1.dpt
having count(student_id) = sum(
  case when S1.sbmt_date is not null then 1 else 0 end
)
;

select S.dpt
from Students S
group by S.dpt
having count(S.dpt) = sum(
  case when S.sbmt_date between '2005-09-01' and '2005-09-30' then 1 else 0 end
)
;
