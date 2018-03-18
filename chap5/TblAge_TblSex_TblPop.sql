-- /* クロス表で入れ子の表側を作る */
-- CREATE TABLE TblSex
-- (sex_cd   char(1),
--  sex varchar(5),
--  PRIMARY KEY(sex_cd));
--
-- CREATE TABLE TblAge
-- (age_class char(1),
--  age_range varchar(30),
--  PRIMARY KEY(age_class));
--
-- CREATE TABLE TblPop
-- (pref_name  varchar(30),
--  age_class  char(1),
--  sex_cd     char(1),
--  population integer,
--  PRIMARY KEY(pref_name, age_class,sex_cd));
--
-- INSERT INTO TblSex (sex_cd, sex ) VALUES('m',	'男');
-- INSERT INTO TblSex (sex_cd, sex ) VALUES('f',	'女');
--
-- INSERT INTO TblAge (age_class, age_range ) VALUES('1',	'21～30歳');
-- INSERT INTO TblAge (age_class, age_range ) VALUES('2',	'31～40歳');
-- INSERT INTO TblAge (age_class, age_range ) VALUES('3',	'41～50歳');
--
-- INSERT INTO TblPop VALUES('秋田', '1', 'm', 400 );
-- INSERT INTO TblPop VALUES('秋田', '3', 'm', 1000 );
-- INSERT INTO TblPop VALUES('秋田', '1', 'f', 800 );
-- INSERT INTO TblPop VALUES('秋田', '3', 'f', 1000 );
-- INSERT INTO TblPop VALUES('青森', '1', 'm', 700 );
-- INSERT INTO TblPop VALUES('青森', '1', 'f', 500 );
-- INSERT INTO TblPop VALUES('青森', '3', 'f', 800 );
-- INSERT INTO TblPop VALUES('東京', '1', 'm', 900 );
-- INSERT INTO TblPop VALUES('東京', '1', 'f', 1500 );
-- INSERT INTO TblPop VALUES('東京', '3', 'f', 1200 );
-- INSERT INTO TblPop VALUES('千葉', '1', 'm', 900 );
-- INSERT INTO TblPop VALUES('千葉', '1', 'f', 1000 );
-- INSERT INTO TblPop VALUES('千葉', '3', 'f', 900 );


select
  A.age_class
  , P.sex_cd
  , sum(case when P.pref_name IN ('秋田', '青森') then P.population else NULL end) as "東北"
  , sum(case when P.pref_name IN ('東京', '千葉') then P.population else NULL end) as "関東"
from TblAge A left outer join TblPop P
  on P.age_class = A.age_class
group by A.age_class, P.sex_cd
order by A.age_class, P.sex_cd desc
;
