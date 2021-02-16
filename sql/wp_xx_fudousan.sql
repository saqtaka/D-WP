
drop table if exists wordpress.wp_xx_fudousan;

create table if not exists wordpress.wp_xx_fudousan
(
    no nvarchar(200),
    syurui nvarchar(200),
    chiiki nvarchar(200),
    shikutyouson_code nvarchar(200),
    todoufukenmei nvarchar(200),
    shikutyousonmei nvarchar(200),
    chikumei nvarchar(200),
    moyorieki_meisyou nvarchar(200),
    moyorieki_kyori nvarchar(200),
    torihikikakaku_sougaku nvarchar(200),
    tsubotanka nvarchar(200),
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
    torihikijiten nvarchar(200),
    kaisou nvarchar(200),
    torihikinojijyoutou nvarchar(200)
);

delete from wordpress.wp_xx_fudousan