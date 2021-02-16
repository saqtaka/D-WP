
drop table if exists wordpress.wp_xx_jinkouyosoku;

create table if not exists wordpress.wp_xx_jinkouyosoku
(
    code nvarchar(200),
    kubun nvarchar(200),
    todoufukenmei nvarchar(200),
    shikutyousonmei nvarchar(200),
    soujinkou_2015 nvarchar(200),
    soujinkou_2020 nvarchar(200),
    soujinkou_2025 nvarchar(200),
    soujinkou_2030 nvarchar(200),
    soujinkou_2035 nvarchar(200),
    soujinkou_2040 nvarchar(200),
    soujinkou_2045 nvarchar(200),
    soujinkou_shisuu_2015 nvarchar(200),
    soujinkou_shisuu_2020 nvarchar(200),
    soujinkou_shisuu_2025 nvarchar(200),
    soujinkou_shisuu_2030 nvarchar(200),
    soujinkou_shisuu_2035 nvarchar(200),
    soujinkou_shisuu_2040 nvarchar(200),
    soujinkou_shisuu_2045 nvarchar(200)
);

delete from wordpress.wp_xx_jinkouyosoku