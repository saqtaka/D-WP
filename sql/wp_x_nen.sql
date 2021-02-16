drop table if exists wordpress.wp_x_nen;

create table if not exists wordpress.wp_x_nen
(
    nen int not null,
    PRIMARY KEY(nen)
);

delete from wordpress.wp_x_nen;

insert into wordpress.wp_x_nen
(
    nen
)
select
    nen
from
    wordpress.wp_x_kikan
group by
    nen;

select * from wordpress.wp_x_nen;

