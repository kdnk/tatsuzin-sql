-- /* CASE式の中で集約関数を使う */
-- CREATE TABLE StudentClub
-- (std_id  INTEGER,
--  club_id INTEGER,
--  club_name VARCHAR(32),
--  main_club_flg CHAR(1),
--  PRIMARY KEY (std_id, club_id));
--
-- INSERT INTO StudentClub VALUES(100, 1, '野球',        'Y');
-- INSERT INTO StudentClub VALUES(100, 2, '吹奏楽',      'N');
-- INSERT INTO StudentClub VALUES(200, 2, '吹奏楽',      'N');
-- INSERT INTO StudentClub VALUES(200, 3, 'バドミントン','Y');
-- INSERT INTO StudentClub VALUES(200, 4, 'サッカー',    'N');
-- INSERT INTO StudentClub VALUES(300, 4, 'サッカー',    'N');
-- INSERT INTO StudentClub VALUES(400, 5, '水泳',        'N');
-- INSERT INTO StudentClub VALUES(500, 6, '囲碁',        'N');

select
  std_id
  , case
    when count(club_id) > 1 then (
      select max(club_name)
      from StudentClub S2
      where S1.std_id = S2.std_id
        and main_club_flg = 'Y'
    )
    else max(club_name)
    end
from StudentClub S1
group by std_id
order by std_id
;

select
  std_id
  , case
    when count(std_id) = 1 then max(club_name)
    else
      max(case when main_club_flg = 'Y' then club_name else null end)
    end
from StudentClub S1
group by std_id
order by std_id
;
