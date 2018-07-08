--书的大类
 drop table s_cate;
 create table s_cate (
 id number primary key,
 name varchar2(100)
) ;
--书的小类
drop table  s_cate_detail;
create table s_cate_detail (
  id number primary key,
  name varchar2(100) ,
  category_id number references s_cate(id)
) ;
--书
drop table s_product;
create table s_product (
 id number primary key,
 name varchar2(60),
 price number,
 publish varchar2(60),
 img varchar2(1000),
 parameter varchar2(2400),
 introduction varchar2(3600),
 wraplist varchar2(2400),
 hot number,
 remain number,
 sellnum number,
 clickrate number,
 publishdate date ,
 cate_detail_id number references s_cate_detail (id) on delete cascade
);
--用户
drop table s_user;
create table s_user (
  id number primary key,
  username varchar2(30),
  password varchar2(30),
  zip varchar2(60),
  address varchar2(60),
  phone varchar2(60),
  email varchar2(60),
  dob date
) 
--订单
drop table  s_order;
create table s_order (
  id number primary key,
  orderid varchar2(60) ,
  paystatus number,
  receivename varchar2(60),
  receiveaddress varchar2(240),
  receivephone varchar2(60),
  sum number,
  dob number,
  user_id number references s_user(id) 
);
--订单项
drop table orderline;
create table  orderline (
  id number primary key,
  num number,
  order_id number  references s_order (id) on delete cascade,
  product_id number references s_product(id)
) ;
--价格区间
drop table s_price_scope;
create table s_price_scope (
  id number primary key,
  min number ,
  max number
) ;
---公告
drop table s_report;
create table s_report (
  id number primary key,
  name varchar2(60),
  rank number,
  publish_date date,
  department varchar2(60),
  publish_writer varchar2(60),
  content varchar2(4000)
) ;
create table s_shopcart_item(
	id number primary key,
	user_id number references s_user(id),
	product_id number references s_product(id),
	num number
);
create table s_reduce(
	id number primary key,
	user_id number references s_user(id),
	product_id number references s_product(id),
	baseprice number
);

--序列，oracle提供的解决主键自增用，等价与
--mysql中的auto_increment
create sequence my_seq;


insert into s_cate(id,name) values(1,'文学类');
insert into s_cate(id,name) values(2,'教育类');
insert into s_cate(id,name) values(3,'计算机类');
insert into s_cate(id,name) values(4,'儿童类');
insert into s_cate(id,name) values(5,'漫画类');
insert into s_cate(id,name) values(6,'工具类');
insert into s_cate(id,name) values(7,'期刊类');

insert into s_cate_detail(id,name,category_id) values(1,'校园文学',1);
insert into s_cate_detail(id,name,category_id) values(2,'纪实文学',1);
insert into s_cate_detail(id,name,category_id) values(3,'职业技术培训教材',2);
insert into s_cate_detail(id,name,category_id) values(4,'注册会计师',2);
insert into s_cate_detail(id,name,category_id) values(5,'研究生/本科/专科教材',2);
insert into s_cate_detail(id,name,category_id) values(6,'数据库',3);
insert into s_cate_detail(id,name,category_id) values(7,'编程语言',3);
insert into s_cate_detail(id,name,category_id) values(8,'算法',3);
insert into s_cate_detail(id,name,category_id) values(9,'故事书',4);
insert into s_cate_detail(id,name,category_id) values(10,'国内漫画',5);
insert into s_cate_detail(id,name,category_id) values(11,'国外漫画',5);
insert into s_cate_detail(id,name,category_id) values(12,'驾驶工具书',6);



insert into s_price_scope(id,min,max) values(1,1,100);
insert into s_price_scope(id,min,max) values(2,101,200);
insert into s_price_scope(id,min,max) values(3,201,300);
insert into s_price_scope(id,min,max) values(4,301,400);

insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(1,'草原帝国',100,'南京出版社','upload/c66f7019e93746c1b98da6421f27d088.jpg#upload/c66f7019e93746c1b98da6421f27d088.jpg',1529299201214,1);
insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(2,'java入门',70,'清华出版社','upload/6c53626c6a5a41fda4990c2e552cd416.jpg#upload/6c53626c6a5a41fda4990c2e552cd416.jpg',1529299201214,8);
insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(3,'android开发',80,'清华出版社','upload/903d4092f8e24f4f9c8b56a18a8f1cac.jpg#upload/903d4092f8e24f4f9c8b56a18a8f1cac.jpg',1529299201214,8);







