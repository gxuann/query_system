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

insert into users values('admin','admin',1)
insert into users values('xiaohong','123456',2)

delete from users where rid=2

 
select * from users

create table detail(
company nvarchar(16), 
flight varchar(16)primary key ,
start nvarchar(16), 
finish nvarchar(16),
)


insert into detail values('天津航空','GS7815','天津','青岛')
insert into detail values('幸福航空','JR1602','天津','石家庄')
insert into detail values('中国航空','CA1533','天津','吐鲁番')
insert into detail values('九元航空','AQ1055','广州','天津')
insert into detail values('春秋航空','9C8930','广州','上海')
insert into detail values('河北航空','NS8117','厦门','北京')
insert into detail values('华夏航空','G52909','重庆','武汉')
insert into detail values('东方航空','MU2787','大连','三亚')
insert into detail values('东方航空','MU2788','大连','上海')
insert into detail values('东方航空','MU2517','青岛','济南')
insert into detail values('南方航空','CZ6551','郑州','三亚')
insert into detail values('中国航空','CA4418','昆明','广汉')
insert into detail values('厦门航空','MF8342','深圳','福州')
insert into detail values('深圳航空','ZH1359','北京','张家界')
insert into detail values('东方航空','MU5223','宁波','西安')
insert into detail values('深圳航空','ZH9969','上海','台州')
insert into detail values('长安航空','9H8308','海口','庆阳')

select * from detail where flight = 'GS7815'
select * from detail



