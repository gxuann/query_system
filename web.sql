create database web

use web

create table roles(
r_id int primary key,
rname nvarchar(8) unique not null,
)

insert into roles values(1,'管理员')
insert into roles values(2,'用户')

create table users (
u_id int identity(1,1) primary key,
uname nvarchar(32) unique not null,
upass varchar(16) not null,
rid int references roles(r_id),
)

insert into users values('xiaoming','123456',1)
insert into users values('xiaohong','123456',2)

select * from users
