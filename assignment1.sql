create database if not exists businessdb2;
use businessdb2;

-- drop database businessdb2;

-- creating table salespeople

create table salespeople(
Snum int not null,
Sname varchar(10) unique not null,
City varchar(10) not null,
Comm int not null,
primary key(Snum)
);

desc salespeople;

-- creating table customers

create table customers(
Cnum int not null,
Cname varchar(20) unique not null,
City varchar(20) not null,
Snum int not null,
primary key(Cnum),
foreign key(Snum) references salespeople(Snum)
);

desc customers;

-- creating table orders

create table if not exists orders(
Onum int unsigned not null,
Amount decimal(7,2),
Odate date not null default '0000-00-00',
Cnum int not null,
Snum int not null,
primary key(Onum),
foreign key(Cnum) references customers(Cnum),
foreign key(Snum) references salespeople(Snum)
);

-- drop table orders;

desc salespeople;
desc customers;
desc orders;

-- inserting values to table salespeople

insert into salespeople values
(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

select * from salespeople;

-- inserting values to table customers

insert into customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

select * from customers;

-- inserting values to table orders

insert into orders values
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4273.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

select * from salespeople;
select * from customers;
select * from orders;

--  Count the number of Salesperson whose name begin with ‘a’/’A’.

Select count(Sname) from salespeople where Sname LIKE 'A%';

--  Display all the Salesperson whose all orders worth is more than Rs. 2000.

select Snum from orders group by Snum having sum(Amount) > 2000;

--  Count the number of Salesperson belonging to Newyork.

select count(Sname) from salespeople where city like 'Newyork';

--  Display the number of Salespeople belonging to London and belonging to Paris.

select count(Sname) from salespeople where City like 'London' or City like 'Paris';

-- Display the number of orders taken by each Salesperson and their date of orders.

select Snum, Odate, count(*) from orders group by Odate, Snum;







