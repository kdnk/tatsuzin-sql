-- /* 関係除算でバスケット解析 */
-- CREATE TABLE Items
-- (item VARCHAR(16) PRIMARY KEY);
--
-- CREATE TABLE ShopItems
-- (shop VARCHAR(16),
--  item VARCHAR(16),
--     PRIMARY KEY(shop, item));
--
-- INSERT INTO Items VALUES('ビール');
-- INSERT INTO Items VALUES('紙オムツ');
-- INSERT INTO Items VALUES('自転車');
--
-- INSERT INTO ShopItems VALUES('仙台',  'ビール');
-- INSERT INTO ShopItems VALUES('仙台',  '紙オムツ');
-- INSERT INTO ShopItems VALUES('仙台',  '自転車');
-- INSERT INTO ShopItems VALUES('仙台',  'カーテン');
-- INSERT INTO ShopItems VALUES('東京',  'ビール');
-- INSERT INTO ShopItems VALUES('東京',  '紙オムツ');
-- INSERT INTO ShopItems VALUES('東京',  '自転車');
-- INSERT INTO ShopItems VALUES('大阪',  'テレビ');
-- INSERT INTO ShopItems VALUES('大阪',  '紙オムツ');
-- INSERT INTO ShopItems VALUES('大阪',  '自転車');


select S.shop
from Items I left outer join ShopItems S on I.item = S.item
group by S.shop
having count(S.item) = (
  select count(item)
  from Items
)
;

select S.shop
from ShopItems S inner join Items I on S.item = I.item
group by S.shop
having count(*) = (
  select count(item)
  from Items
)
;

select S.shop
from ShopItems S left outer join Items I on S.item = I.item
group by S.shop
having count(S.item) = (select count(*) from Items)
  and count(I.item) = (select count(*) from Items)
;

select
  S.shop
  , count(I.item) "my_item_cnt"
  , (
    select count(*)
    from Items
  ) - count(I.item) "diff_cnt"
from ShopItems S left outer join Items I on S.item = I.item
group by S.shop
;
