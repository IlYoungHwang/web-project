


select * from 잔반;

	// 회원정보
create table coco_user(
	no int not null auto_increment primary key,
	email varchar(20) not null unique,
	passwd varchar(20) not null,
	name varchar(10) null,
	phone varchar(15) not null,
	address varchar(30) not null,
	point int default 0,
	auth varchar(5)
)

drop table coco_user;
insert coco_user values (null, '2@naver.com','123','test','01012341234','서울특별시',2,'1');


	// 면허정보
create table coco_licen(
	no int not null auto_increment primary key,
	userno int not null,
	name varchar(10) not null,
	birth varchar(15) not null,
	licentype varchar(10) not null,
	licennum varchar(20) not null,
	issu varchar(10) not null,
	expir varchar(10) not null,
	address varchar(30) not null
)

insert coco_licen value(null, 1,'123','123','123','123','123','123','123');
drop table coco_licen;
alter table coco_licen add foreign key(userno) references coco_user(no);



	//중고 차량 정보
create table coco_used(
	no int not null auto_increment primary key,
	userno int not null,
	manuf varchar(15) not null,
	name varchar(30) not null,
	year varchar(10) not null,
	color varchar(10) not null,
	carnum varchar(15) not null,
	trans varchar(15) not null,
	fuel varchar(10) not null,
	seize varchar(5) not null,
	acci varchar(5) not null,
	opt varchar(20) not null,
	appro varchar(10) default 'OK',
	driv varchar(20),
	regdate timestamp default now()	,
	pay int
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

drop table coco_used
delete from coco_used where userno = 2
select * from coco_used

insert coco_used values(null,2,'23','23','23','23','23','23','3','2ㅁ3','23','23','ㄹ','ㅇ ',null,20);
drop table coco_used
alter table coco_used add foreign key(userno) references coco_user(no);



	//렌트 차량 정보
create table coco_rent(
	no int not null auto_increment primary key,
	userno int not null,
	name varchar(15) not null,
	fee varchar(10) not null,
	fuel varchar(10) not null,
	opt varchar(20) not null,
	state varchar(15) default 'OK',
	loc varchar(20) not null,
	regdate timestamp not null default now()
)

delete from coco_rent

insert coco_rent values(null,2,'18','1','1','1','1','1',null);
select * from coco_rent;
desc coco_rent;
alter table coco_rent add regdate timestamp not null default now();
alter table coco_rent drop email;
alter table coco_rent add foreign key(userno) references coco_user(no);

desc coco_rent;
drop table coco_rent;

create table coco_attach(
	fullName varchar(150) not null,
	rentno int,
	usedno int,
	attregdate timestamp default now(),
	primary key(fullName)
)

drop table coco_attach
delete from coco_attach

alter table coco_attach add foreign key(rentno) references coco_rent(no);
alter table coco_attach add foreign key(usedno) references coco_used(no);


create table coco_order(
	orderno int not null auto_increment primary key,
	userno int not null,
	usedno int not null,
	usename varchar(15) not null,
	orderdate timestamp default now(),
	totalmoney int not null,
	orderaddr varchar(30) not null,
	userphone varchar(15) not null,
	paymethod varchar(15) not null
)

alter table coco_order add foreign key(userno) references coco_user(no)
alter table coco_order add foreign key(usedno) references coco_used(no)
drop table coco_order;


create table coco_reser(
	no int not null auto_increment primary key, 
	userno int not null,
	rentno int not null,
	reserdate timestamp default now(),
	returndate timestamp default now()
)

create table coco_fee(
	no int not null auto_increment primary key,
	reserno int not null,
	userno int not null,
	
) 
select coco_user.name as tt, coco_used.manuf as aa from coco_user join coco_used on coco_user.no = coco_used.userno join coco_order on coco_used.no = coco_order.usedno;
	