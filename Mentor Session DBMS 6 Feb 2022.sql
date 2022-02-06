show databases;

create schema lpgsgl;

use lpgsgl;

CREATE table cust_details_new(
	id	int auto_increment primary key,
	custname varchar(50),
	Gender	varchar(1),
	Address	varchar(100),
	Phone_NO	bigint,
	Connection_Type	decimal(3,1),
	No_Of_Cylinders	int);
   
create table Orders (Id int primary key auto_increment, 
Date date, Cust_Id int, 
Quantity int, Payment_type varchar(30), 
Status varchar(30), 
foreign key(Cust_Id) references cust_details_new(Id));

-- cancelled_orders
create table Cancelled_Orders (Order_Id int, 
Date date, 
Reason varchar(50), 
foreign key(Order_Id) references Orders(Id));

create table Billing_Details(
Inv_Id int Primary key auto_increment, 
Date date, 
Order_Id int, 
Delivery_Status varchar(30), 
foreign key(Order_Id) references Orders(Id));

create table Cancelled_Bills (Inv_Id int, 
Date date, 
Reason varchar(50), 
foreign key(Inv_Id) references billing_details(Inv_Id));

create table Pricing (Type decimal(3,1), 
Month varchar(10), 
Year int, 
Price int);

insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Harish', 'M', '1-2, bglr', 1987654322, 14.2, 1);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Amisha', 'F', '32-12, bglr', 1614322387, 14.2, 1);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Ujjawal', 'M', '19-0, gurgaon', 1871614322, 14.2, 1);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Anu', 'F', '2-10, hyd', 1000614322, 19.0, 5);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Rakshitha', 'F', '3-1-3, chennai', 1614322551, 19.0, 10);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Varuni', 'F', '10-4, gurgaon', 1432245789, 14.2, 1);
insert into cust_details_new (custname, Gender, Address, Phone_No, Connection_Type, No_Of_Cylinders) values ('Vamshi', 'M', '31-14, hyd', 14433245789, 19.0, 6);

select * from cust_details_new;

insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-10-01', 6, 1, 'online', 'cancelled');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-10-01', 3, 1, 'POD', 'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-10-02', 5, 4, 'POD', 'Cancelled');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-10-03', 6, 1, 'POD',	'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-10-04', 3, 1, 'Online', 'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-11-05', 6, 1, 'Online', 'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-11-06', 4, 4, 'Online', 'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-11-07', 5, 9, 'POD', 'Ordered');
insert into orders (Date, Cust_Id, Quantity, Payment_type, Status) values('2021-11-09', 7, 5, 'Online', 'Ordered');

select * from orders;

-- Cancelled Orders 
insert into cancelled_orders values(1, '2021-10-02', 'Out of Station');
insert into cancelled_orders values(3, '2021-10-03', 'Mistakenly Ordered');

select * from cancelled_orders;

-- Billing_details
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-10-03', 1, 'Delivered'); 
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-10-03', 2, 'Undelivered');
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-10-04', 4, 'Delivered'); 
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-10-06', 5, 'Delivered'); 
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-11-06', 6, 'Delivered'); 
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-11-06', 7, 'Delivered'); 
insert into billing_details(Date, Order_Id, Delivery_Status) values ('2021-11-08', 8, 'Delivered');

select * from billing_details;

-- Cancelled_Bills
insert into cancelled_bills values(2, '2021-10-04', 'Insufficient Amount');
select * from cancelled_bills;

-- Pricing 
insert into pricing values(14.2, 'January', 2021, 925);
insert into pricing values(19.0, 'January', 2021, 1223);
insert into pricing values(5.0, 'January', 2021, 352);

insert into pricing values(14.2, 'February', 2021, 931);
insert into pricing values(19.0, 'February', 2021, 1025);
insert into pricing values(5.0, 'February', 2021, 361);

insert into pricing values(14.2, 'March', 2021, 910);
insert into pricing values(19.0, 'March', 2021, 1225);
insert into pricing values(5.0, 'March', 2021, 365);

insert into pricing values(14.2, 'April', 2021, 942);
insert into pricing values(19.0, 'April', 2021, 1300);
insert into pricing values(5.0, 'April', 2021, 330);

-- 2

insert into pricing values(14.2, 'May', 2021, 942);
insert into pricing values(19.0, 'May', 2021, 1280);
insert into pricing values(5.0, 'May', 2021, 333);

insert into pricing values(14.2, 'June', 2021, 958);
insert into pricing values(19.0, 'June', 2021, 1283);
insert into pricing values(5.0, 'June', 2021, 320);

insert into pricing values(14.2, 'July', 2021, 950);
insert into pricing values(19.0, 'July', 2021, 1295);
insert into pricing values(5.0, 'July', 2021, 330);

insert into pricing values(14.2, 'August', 2021, 947);
insert into pricing values(19.0, 'August', 2021, 1298);
insert into pricing values(5.0, 'August', 2021, 337);

insert into pricing values(14.2, 'September', 2021, 963);
insert into pricing values(19.0, 'September', 2021, 1306);
insert into pricing values(5.0, 'September', 2021, 340);

-- 3
insert into pricing values(14.2, 'October', 2021, 960);
insert into pricing values(19.0, 'October', 2021, 1310);
insert into pricing values(5.0, 'October', 2021, 347);

insert into pricing values(14.2, 'November', 2021, 970);
insert into pricing values(19.0, 'November', 2021, 1313);
insert into pricing values(5.0, 'November', 2021, 350);

insert into pricing values(14.2, 'December', 2021, 974);
insert into pricing values(19.0, 'December', 2021, 1320);
insert into pricing values(5.0, 'December', 2021, 362);

insert into pricing values(14.2, 'February', 2022, 999);
insert into pricing values(19.0, 'January', 2022, 1309);
insert into pricing values(5.0, 'January', 2022, 359);

select * from pricing;

-- 3.	Write a query to display a table with customer Id, Name, Connection_Type and No_Of Cylinders ordered from orders table.

select * from orders;

select cust_id, sum(quantity)
from orders where status='Ordered'
group by cust_id;

select id, custname, connection_type, total_No_Of_Cylinders from cust_details_new
inner join(
select cust_id, sum(quantity) as total_No_Of_Cylinders
from orders where status='Ordered'
group by cust_id
) as customer_total_orders
on cust_details_new.id = customer_total_orders.cust_id;

-- 4.	Display one customer from each product category
-- who purchased maximum no of cylinders with Connection_Type, Cust_Id, Name and Quantity purchased.

-- 4a
select * from orders;

-- 4b
select cust_id, sum(quantity) as total_No_Of_Cylinders
from orders where status='Ordered'
group by cust_id;

-- 4c
select cust_id, custname, connection_type, total_no_of_cylinders
from cust_details_new
inner join(
select cust_id, sum(quantity) as total_No_Of_Cylinders
from orders where status='Ordered'
group by cust_id) as P
on cust_details_new.id= P.cust_id;

-- 4d
select connection_type, cust_id, custname, max(total_no_of_cylinders)
as max_total_no_of_cylinders
from
(select cust_id, custname, connection_type, total_no_of_cylinders
from cust_details_new
inner join(
select cust_id, sum(quantity) as total_No_Of_Cylinders
from orders where status='Ordered'
group by cust_id) as P
on cust_details_new.id= P.cust_id) as Q
group by connection_type;

-- 5
select cust_id , successfully_delivered,
case
	when successfully_delivered>=8 then 'highly valued'
    when successfully_delivered between 5 and 7 then 'moderately valued'
    else 'low valued'
    end as Value from 
(select o.cust_id, sum(o.quantity) as successfully_delivered from Orders as o 
inner join
(select order_id from billing_details where delivery_status='delivered') as P
on P.order_id = o.id group by cust_id) as Q;

-- 8
call PriceOfCurrentMonth;

-- 6
select C.Id as Cust_Id, C.Name, Delivery_Date from cust_details as C 
inner join (
select cust_id, Delivery_Date from 
(select O.id, O.cust_id, D.Inv_Id, D.Delivery_Date from orders as O inner join 
(select Inv_Id, Order_Id, date as Delivery_Date from billing_details where Delivery_Status = 'Delivered') 
as D on O.id = D.Order_id) 
as P) 
as Q on Q.cust_id = C.Id order by Cust_Id;

-- 7
select Q.Customer_Id, Q.Name, Q.Order_Id, Q.Order_Date, Q.Inv_Id, Q.Delivery_Date, Q.Connection_Type, Pricing.Price from Pricing inner join 
(select C.Id as Customer_Id, C.Name, P.Order_Id, P.Order_Date, P.Inv_Id, P.Delivery_Date, C.Connection_Type, monthname(Delivery_Date) as month, year(Delivery_Date) as Year
 from cust_details as C inner join 
(select O.Id as Order_Id, O.date as Order_Date, O.Cust_Id, D.Inv_Id, D.Delivery_Date from orders as O inner join 
(select Inv_Id, Order_Id, date as Delivery_Date from billing_details where Delivery_Status = 'Delivered') 
as D on D.Order_Id = O.Id) 
as P on P.Cust_Id = C.Id) 
as Q on Q.Month = Pricing.Month and Q.Year = Pricing.Year and Q.Connection_Type = Pricing.Type order by Customer_Id;













