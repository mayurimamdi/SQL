create table customers(cust_id SERIAl primary key, cust_name Varchar(100) not null);

insert into customers( cust_name) values ('Mayuri'),
('Mansi'), ('Niket'), ('Radha');

select * from customers;

create table orders(ord_id SERIAL primary key,
ord_date date not null,
cust_id INT,
foreign key(cust_id) references customers(cust_id));

INSERT INTO orders (ord_date, cust_id)
VALUES 
    ('2024-01-01', 1),  
    ('2024-01-15', 1),  
    ('2024-02-01', 2),
    ('2024-03-01', 3),
    ('2024-04-04', 2);  

select * from orders;

create table products(p_id SERIAL primary key,
p_name VArchar(100) not null,
price Numeric not null);

insert into products(p_name, price) values
('ABCD', 145.00),
('PQRS',345.00),
('XYZA',258.00),
('MNOP',392.00);

select * from products;


create table ord_items(item_id serial primary key,
ord_id INT,
Foreign key(ord_id) references orders(ord_id),
p_id INT,
foreign key(p_id) references products(p_id),
quantity INT not null);

insert into ord_items(ord_id,p_id,quantity) values
(2,3,45),
(4,2,12),
(3,1,23),
(1,4,42),
(5,3,21);

create view billing_info as
select  
 	c.cust_name, 
	 p.p_name, 
	 o.ord_date, 
	 oi.quantity,
	 p.price,
	 (oi.quantity*p.price) AS total_price
from ord_items oi
join products p ON oi.p_id=p.p_id
join orders o ON o.ord_id=oi.ord_id
join customers c ON c.cust_id=o.cust_id;



select p_name,sum(total_price) from billing_info where total_price>4000.00 group by p_name;
or
select p_name,sum(total_price) from billing_info group by p_name having sum(total_price)>4000.00;



