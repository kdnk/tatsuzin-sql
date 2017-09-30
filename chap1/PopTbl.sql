-- /* 既存のコード体系を新しい体系に変換して集計 */
-- CREATE TABLE PopTbl
-- (pref_name VARCHAR(32) PRIMARY KEY,
--  population INTEGER NOT NULL);
--
-- INSERT INTO PopTbl VALUES('徳島', 100);
-- INSERT INTO PopTbl VALUES('香川', 200);
-- INSERT INTO PopTbl VALUES('愛媛', 150);
-- INSERT INTO PopTbl VALUES('高知', 200);
-- INSERT INTO PopTbl VALUES('福岡', 300);
-- INSERT INTO PopTbl VALUES('佐賀', 100);
-- INSERT INTO PopTbl VALUES('長崎', 200);
-- INSERT INTO PopTbl VALUES('東京', 400);
-- INSERT INTO PopTbl VALUES('群馬', 50);

select
  case
    when pref_name = '徳島' then '四国'
    when pref_name = '香川' then '四国'
    when pref_name = '愛媛' then '四国'
    when pref_name = '高知' then '四国'
    when pref_name = '福岡' then '九州'
    when pref_name = '佐賀' then '九州'
    when pref_name = '長崎' then '九州'
  else 'その他' end
  , sum(population)
from PopTbl
group by
  case
    when pref_name = '徳島' then '四国'
    when pref_name = '香川' then '四国'
    when pref_name = '愛媛' then '四国'
    when pref_name = '高知' then '四国'
    when pref_name = '福岡' then '九州'
    when pref_name = '佐賀' then '九州'
    when pref_name = '長崎' then '九州'
  else 'その他' end
;

select
  case
    when population > 0 and population <= 100 then '01'
    when population > 100 and population <= 200 then '02'
    when population > 200 and population <= 300 then '03'
    when population > 300 and population <= 400 then '04'
    when population > 400 and population <= 500 then '05'
    when population > 500 then '06'
  else null end
  , count(pref_name)
from PopTbl
group by
  case
    when population > 0 and population <= 100 then '01'
    when population > 100 and population <= 200 then '02'
    when population > 200 and population <= 300 then '03'
    when population > 300 and population <= 400 then '04'
    when population > 400 and population <= 500 then '05'
    when population > 500 then '06'
  else null end
;
