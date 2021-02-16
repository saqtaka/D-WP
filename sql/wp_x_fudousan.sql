drop table if exists wordpress.wp_x_fudousan;

create table if not exists wordpress.wp_x_fudousan
(
    no int not null,
    syurui nvarchar(200),
    chiiki nvarchar(200),
    shikutyouson_code nvarchar(200) not null,
    todoufukenmei nvarchar(200) not null,
    shikutyousonmei nvarchar(200),
    chikumei nvarchar(200),
    moyorieki_meisyou nvarchar(200),
    moyorieki_kyori nvarchar(200),
    torihikikakaku_sougaku nvarchar(200),
    tsubotanka int,
    madori nvarchar(200),
    menseki nvarchar(200),
    torihikikakaku_tanka nvarchar(200),
    tochinokeijyou nvarchar(200),
    maguchi nvarchar(200),
    nobeyukamenseki nvarchar(200),
    kenchikunen nvarchar(200),
    tatemononokouzou nvarchar(200),
    youto nvarchar(200),
    kongonoriyoumokuteki nvarchar(200),
    zenmendouro_houi nvarchar(200),
    zenmendouro_syurui nvarchar(200),
    zenmendouro_fukuin nvarchar(200),
    toshikeikaku nvarchar(200),
    kenpeiritsu nvarchar(200),
    yousekiritsu nvarchar(200),
    torihikijiten nvarchar(200) not null,
    kaisou nvarchar(200),
    torihikinojijyoutou nvarchar(200),
    PRIMARY KEY(no, todoufukenmei, torihikijiten)
);

delete from wordpress.wp_x_fudousan;

select
    no,
    case when (length(tsubotanka) != 0) 
    then tsubotanka
    else 0 end
from
wordpress.wp_xx_fudousan
order by no
limit 200;

insert into wordpress.wp_x_fudousan
(
    no,
    syurui,
    chiiki,
    shikutyouson_code,
    todoufukenmei,
    shikutyousonmei,
    chikumei,
    moyorieki_meisyou,
    moyorieki_kyori,
    torihikikakaku_sougaku,
    tsubotanka,
    madori,
    menseki,
    torihikikakaku_tanka,
    tochinokeijyou,
    maguchi,
    nobeyukamenseki,
    kenchikunen,
    tatemononokouzou,
    youto,
    kongonoriyoumokuteki,
    zenmendouro_houi,
    zenmendouro_syurui,
    zenmendouro_fukuin,
    toshikeikaku,
    kenpeiritsu,
    yousekiritsu,
    torihikijiten,
    kaisou,
    torihikinojijyoutou
)
select
    no,
    syurui,
    chiiki,
    shikutyouson_code,
    todoufukenmei,
    shikutyousonmei,
    chikumei,
    moyorieki_meisyou,
    moyorieki_kyori,
    torihikikakaku_sougaku,
    case when (length(tsubotanka) != 0) 
        then tsubotanka
        else 0 end as tsubotanka,
    madori,
    menseki,
    torihikikakaku_tanka,
    tochinokeijyou,
    maguchi,
    nobeyukamenseki,
    kenchikunen,
    tatemononokouzou,
    youto,
    kongonoriyoumokuteki,
    zenmendouro_houi,
    zenmendouro_syurui,
    zenmendouro_fukuin,
    toshikeikaku,
    kenpeiritsu,
    yousekiritsu,
    torihikijiten,
    kaisou,
    torihikinojijyoutou
from
    wordpress.wp_xx_fudousan;

select count(*) from wordpress.wp_x_fudousan where (wp_x_fudousan.torihikijiten like '2015%') and (wp_x_fudousan.todoufukenmei = '北海道');


select count(*) from wordpress.wp_x_fudousan;

select count(*) from wordpress.wp_xx_fudousan;






