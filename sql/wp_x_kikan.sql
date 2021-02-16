drop table if exists wordpress.wp_x_kikan;

create table if not exists wordpress.wp_x_kikan
(
    torihikijiten nvarchar(10) not null,
    nen int null,
    PRIMARY KEY(torihikijiten)
);

delete from wordpress.wp_x_kikan;

insert into wordpress.wp_x_kikan
(
    torihikijiten
)
select
    torihikijiten
from
    wordpress.wp_x_fudousan
group by
    torihikijiten;

update wordpress.wp_x_kikan
set nen = left(torihikijiten, 4);

select * from wordpress.wp_x_kikan;

