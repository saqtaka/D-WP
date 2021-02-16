drop table if exists wordpress.wp_x_todoufuken;

create table if not exists wordpress.wp_x_todoufuken
(
    todoufuken_code nvarchar(200) not null,
    todoufukenmei nvarchar(100) not null,
    PRIMARY KEY(todoufuken_code)
);

delete from wordpress.wp_x_todoufuken;

select
    todoufuken_code,
    todoufukenmei
from
    wordpress.wp_x_shikutyouson
group by
    todoufuken_code,
    todoufukenmei;

insert into wordpress.wp_x_todoufuken
(
    todoufuken_code,
    todoufukenmei
)
select
    todoufuken_code,
    todoufukenmei
from
    wordpress.wp_x_shikutyouson
group by
    todoufuken_code,
    todoufukenmei;

select * from wordpress.wp_x_todoufuken;

