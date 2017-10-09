select *
from SeqTbl
;

select 'あり'
from SeqTbl S1
having count(*) <> max(seq)
;

select *
from SeqTbl S1
where (seq + 1) NOT IN (
  select seq
  from SeqTbl
)
;
