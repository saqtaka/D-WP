drop table if exists wordpress.wp_x_shikutyouson;

create table if not exists wordpress.wp_x_shikutyouson
(
    todoufukenmei nvarchar(100) not null,
    shikutyousonmei nvarchar(100) not null,
    shikutyouson_code nvarchar(200) not null,
    todoufuken_code nvarchar(200) not null,
    PRIMARY KEY(todoufukenmei, shikutyousonmei)
);

delete from wordpress.wp_x_shikutyouson;

insert into wordpress.wp_x_shikutyouson
(
    todoufukenmei,
    shikutyousonmei,
    shikutyouson_code,
    todoufuken_code
)
select
    todoufukenmei,
    shikutyousonmei,
    shikutyouson_code,
    left(shikutyouson_code, 2)
from
    wordpress.wp_x_fudousan
group by
    todoufukenmei,
    shikutyousonmei,
    shikutyouson_code;

select * from wordpress.wp_x_shikutyouson;

