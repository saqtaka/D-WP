drop table if exists wordpress.wp_x_jinkouyosoku;

create table if not exists wordpress.wp_x_jinkouyosoku
(
    code int not null,
    kubun nvarchar(200),
    tdfk_skts nvarchar(200),
    todoufukenmei nvarchar(200),
    shikutyousonmei nvarchar(200),
    soujinkou_2015 int not null,
    soujinkou_2020 int not null,
    soujinkou_2025 int not null,
    soujinkou_2030 int not null,
    soujinkou_2035 int not null,
    soujinkou_2040 int not null,
    soujinkou_2045 int not null,
    soujinkou_shisuu_2015 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2020 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2025 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2030 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2035 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2040 DECIMAL ( 4, 1 ),
    soujinkou_shisuu_2045 DECIMAL ( 4, 1 ),
    PRIMARY KEY(code)
);

delete from wordpress.wp_x_jinkouyosoku;

select
*
from
wordpress.wp_xx_jinkouyosoku
limit 200;

insert into wordpress.wp_x_jinkouyosoku
(
    code,
    kubun,
    tdfk_skts,
    todoufukenmei,
    shikutyousonmei,
    soujinkou_2015,
    soujinkou_2020,
    soujinkou_2025,
    soujinkou_2030,
    soujinkou_2035,
    soujinkou_2040,
    soujinkou_2045,
    soujinkou_shisuu_2015,
    soujinkou_shisuu_2020,
    soujinkou_shisuu_2025,
    soujinkou_shisuu_2030,
    soujinkou_shisuu_2035,
    soujinkou_shisuu_2040,
    soujinkou_shisuu_2045
)
select
    code,
    kubun,
    concat(todoufukenmei, shikutyousonmei),
    todoufukenmei,
    shikutyousonmei,
    replace(soujinkou_2015, ',', ''),
    replace(soujinkou_2020, ',', ''),
    replace(soujinkou_2025, ',', ''),
    replace(soujinkou_2030, ',', ''),
    replace(soujinkou_2035, ',', ''),
    replace(soujinkou_2040, ',', ''),
    replace(soujinkou_2045, ',', ''),
    soujinkou_shisuu_2015,
    soujinkou_shisuu_2020,
    soujinkou_shisuu_2025,
    soujinkou_shisuu_2030,
    soujinkou_shisuu_2035,
    soujinkou_shisuu_2040,
    soujinkou_shisuu_2045
from
    wordpress.wp_xx_jinkouyosoku;

select
*
from
wordpress.wp_x_jinkouyosoku
limit 200;

select count(*) from wordpress.wp_x_jinkouyosoku;

select count(*) from wordpress.wp_xx_jinkouyosoku;






