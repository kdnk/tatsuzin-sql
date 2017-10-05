-- /* HAVING 句でサブクエリ：最頻値を求める(メジアンも同じサンプルを使用) */
-- CREATE TABLE Graduates
-- (name   VARCHAR(16) PRIMARY KEY,
--  income INTEGER NOT NULL);
--
-- INSERT INTO Graduates VALUES('サンプソン', 400000);
-- INSERT INTO Graduates VALUES('マイク',     30000);
-- INSERT INTO Graduates VALUES('ホワイト',   20000);
-- INSERT INTO Graduates VALUES('アーノルド', 20000);
-- INSERT INTO Graduates VALUES('スミス',     20000);
-- INSERT INTO Graduates VALUES('ロレンス',   15000);
-- INSERT INTO Graduates VALUES('ハドソン',   15000);
-- INSERT INTO Graduates VALUES('ケント',     10000);
-- INSERT INTO Graduates VALUES('ベッカー',   10000);
-- INSERT INTO Graduates VALUES('スコット',   10000);

select G1.income, count(G1.income)
from Graduates G1
group by G1.income
having count(*) >= all (
  select count(G2.income)
  from Graduates G2
  group by G2.income
)
;

select count(G2.income)
from Graduates G2
group by G2.income
;

select G1.income, count(G1.income)
from Graduates G1
group by G1.income
having count(G1.income) >= (
  select max(tmp.count)
    from (
      select count(G2.income) count
      from Graduates G2
      group by G2.income
    ) as tmp
)
;
