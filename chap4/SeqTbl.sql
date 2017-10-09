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

select case when count(*) = max(seq) then '歯抜けなし' else '歯抜あり' end
from SeqTbl
having count(*) <> max(seq)
;
