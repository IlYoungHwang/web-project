select * from user,seller where user.passwd=1234;

create table users(
	user_id int not null auto_increment,
	mail varchar(30) not null,
	passwd varchar(20) not null,
	name varchar(10) not null,
	address varchar(30) not null,
	phone varchar(15) not null,
	division varchar(10) not null,
	primary key(user_id)
); 

drop table users;
select * from users;

create table seller(
	seller_id int not null auto_increment,
	sellername varchar(15) not null,
	selleraddress varchar(30) not null,
	sellerhours varchar(15) not null,
	sellerphone varchar(10) not null,
	primary key(seller_id),
	FOREIGN KEY (seller_id) REFERENCES users(user_id)
);
drop table seller;
select * from seller;

select * from users, seller where users.division=1 and users.passwd=123 and users.address=123;
select * from users left outer join seller on division = seller_id where division=1;


create table saleinfo(
	sale_id int not null auto_increment,
	saleclass varchar(10) not null,
	salename varchar(10) not null,
	saleoption varchar(15) not null,
	salefoodinfo varchar(20) not null,
	saleprice varchar(10) not null,
	primary key(sale_id)
);
select * from saleinfo;
drop table saleinfo;

create table orderinfo(
	order_id int not null auto_increment,
	ordernum int not null,
	totalprice int not null,
	primary key(order_id)
);

drop table orderinfo;
select * from orderinfo;

create table payment(
	payment_id int not null auto_increment,
	point boolean not null,
	card boolean not null,
	cash boolean not null,
	phone boolean not null,
	primary key(payment_id)
);

drop table payment;
select * from mayment;