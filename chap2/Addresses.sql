-- --部分的に不一致なキーの検索
-- CREATE TABLE Addresses
-- (name VARCHAR(32),
--  family_id INTEGER,
--  address VARCHAR(32),
--  PRIMARY KEY(name, family_id));
--
-- INSERT INTO Addresses VALUES('前田 義明', '100', '東京都港区虎ノ門3-2-29');
-- INSERT INTO Addresses VALUES('前田 由美', '100', '東京都港区虎ノ門3-2-92');
-- INSERT INTO Addresses VALUES('加藤 茶',   '200', '東京都新宿区西新宿2-8-1');
-- INSERT INTO Addresses VALUES('加藤 勝',   '200', '東京都新宿区西新宿2-8-1');
-- INSERT INTO Addresses VALUES('ホームズ',  '300', 'ベーカー街221B');
-- INSERT INTO Addresses VALUES('ワトソン',  '400', 'ベーカー街221B');

select *
from Addresses A1 inner join Addresses A2
  on A1.family_id = A2.family_id
where A1.address <> A2.address
;
