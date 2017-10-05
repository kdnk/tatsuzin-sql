-- /* データの歯抜けを探す */
-- CREATE TABLE SeqTbl
-- (seq  INTEGER PRIMARY KEY,
--  name VARCHAR(16) NOT NULL);
--
-- INSERT INTO SeqTbl VALUES(1,	'ディック');
-- INSERT INTO SeqTbl VALUES(2,	'アン');
-- INSERT INTO SeqTbl VALUES(3,	'ライル');
-- INSERT INTO SeqTbl VALUES(5,	'カー');
-- INSERT INTO SeqTbl VALUES(6,	'マリー');
-- INSERT INTO SeqTbl VALUES(8,	'ベン');


select '歯抜け'
from SeqTbl
having count(*) < max(seq)
;

select ''
from SeqTbl
;

select *
from SeqTbl S1
where (S1.seq + 1) NOT IN (
  select seq
  from SeqTbl
)
;
