-- /* 演習問題2-2：地域ごとのランキング */
-- CREATE TABLE DistrictProducts
-- (district  VARCHAR(16) NOT NULL,
--  name      VARCHAR(16) NOT NULL,
--  price     INTEGER NOT NULL,
--  PRIMARY KEY(district, name));
--
-- INSERT INTO DistrictProducts VALUES('東北', 'みかん',	100);
-- INSERT INTO DistrictProducts VALUES('東北', 'りんご',	50);
-- INSERT INTO DistrictProducts VALUES('東北', 'ぶどう',	50);
-- INSERT INTO DistrictProducts VALUES('東北', 'レモン',	30);
-- INSERT INTO DistrictProducts VALUES('関東', 'レモン',	100);
-- INSERT INTO DistrictProducts VALUES('関東', 'パイン',	100);
-- INSERT INTO DistrictProducts VALUES('関東', 'りんご',	100);
-- INSERT INTO DistrictProducts VALUES('関東', 'ぶどう',	70);
-- INSERT INTO DistrictProducts VALUES('関西', 'レモン',	70);
-- INSERT INTO DistrictProducts VALUES('関西', 'スイカ',	30);
-- INSERT INTO DistrictProducts VALUES('関西', 'りんご',	20);

select
  P1.district
  , (
    select count(P2.name) + 1
    from DistrictProducts P2
    where P1.price < P2.price and P1.name <> P2.name and P1.district = P2.district
  ) as rank
from DistrictProducts P1
order by P1.district, rank
;

select
  P1.district
  , P1.name
  , P1.price
  , rank() over (partition by P1.district order by P1.price DESC)
from DistrictProducts P1
;

select
  P1.district
  , P1.name
  , count(P2.name) + 1 rank
from DistrictProducts P1 left outer join DistrictProducts P2
  on P1.district = P2.district and P1.price < P2.price
group by P1.district, P1.name
order by P1.district, rank
;
