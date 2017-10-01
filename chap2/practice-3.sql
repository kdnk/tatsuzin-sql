-- /* 演習問題2-3：ランキングの更新 */
-- CREATE TABLE DistrictProducts2
-- (district  VARCHAR(16) NOT NULL,
--  name      VARCHAR(16) NOT NULL,
--  price     INTEGER NOT NULL,
--  ranking   INTEGER,
--  PRIMARY KEY(district, name));
--
-- INSERT INTO DistrictProducts2 VALUES('東北', 'みかん',	100, NULL);
-- INSERT INTO DistrictProducts2 VALUES('東北', 'りんご',	50 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('東北', 'ぶどう',	50 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('東北', 'レモン',	30 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('関東', 'レモン',	100, NULL);
-- INSERT INTO DistrictProducts2 VALUES('関東', 'パイン',	100, NULL);
-- INSERT INTO DistrictProducts2 VALUES('関東', 'りんご',	100, NULL);
-- INSERT INTO DistrictProducts2 VALUES('関東', 'ぶどう',	70 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('関西', 'レモン',	70 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('関西', 'スイカ',	30 , NULL);
-- INSERT INTO DistrictProducts2 VALUES('関西', 'りんご',	20 , NULL);

-- select
--   P1.district
--   , P1.name
--   , (
--     select count(P2.name) + 1
--     from DistrictProducts2 P2
--     where P1.district = P2.district and P1.price < P2.price
--   )
-- from DistrictProducts2 P1
-- ;

update DistrictProducts2 P1
  set ranking = (
    select count(P2.name) + 1
    from DistrictProducts2 P2
    where P1.district = P2.district and P1.price < P2.price
  )
;

select *
from DistrictProducts2
;

DROP TABLE DistrictProducts2;

CREATE TABLE DistrictProducts2
(district  VARCHAR(16) NOT NULL,
 name      VARCHAR(16) NOT NULL,
 price     INTEGER NOT NULL,
 ranking   INTEGER,
 PRIMARY KEY(district, name));

INSERT INTO DistrictProducts2 VALUES('東北', 'みかん',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'りんご',	50 , NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'ぶどう',	50 , NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'レモン',	30 , NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'レモン',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'パイン',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'りんご',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'ぶどう',	70 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'レモン',	70 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'スイカ',	30 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'りんご',	20 , NULL);

-- ×××××××××××××××××××××××××××××××××××
-- update DistrictProducts2 P1
--   set ranking = (
--     select rank() over (partition by P1.district order by P1.price desc)
--   )
-- ;
--
-- select *
-- from DistrictProducts2;
