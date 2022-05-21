create database if not exists project;
use project;

create table if not exists Brand (
Name varchar(25) not null,
created int unsigned not null,
company_name  varchar(25) not null,
primary key(Name)
);

desc Brand;

drop table Brand;

create table if not exists Model (
Name varchar(25) not null,
price int unsigned not null,
launch_date date not null default '0000-00-00',
primary key(Name)
);

-- drop table Model;
desc Model;

INSERT INTO Brand VALUES 
("vivo", 2016, 'vivo china'),
("oppo", '2018', 'oppo_electronics');

select * from Brand;

INSERT INTO Model VALUES 
("vivo Y21 2021", 17000, '2021-03-17'),
("vivo Y73", 19000, '2022-05-21');

select * from Model;

