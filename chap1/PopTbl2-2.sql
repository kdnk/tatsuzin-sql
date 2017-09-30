select
  case when sex = '1' then '男' else '女' end
  , sum(population) "全国"
  , sum(case when pref_name = '徳島' then population else 0 end) "徳島"
  , sum(case when pref_name = '香川' then population else 0 end) "香川"
  , sum(case when pref_name = '愛媛' then population else 0 end) "愛媛"
  , sum(case when pref_name = '高知' then population else 0 end) "高知"
  , sum(case when pref_name IN ('徳島', '香川', '愛媛', '高知') then population else 0 end) "四国"
from PopTbl2 P
group by sex
;
