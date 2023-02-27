Create database ecommerce;
use ecommerce;

drop table if exists supplier;
drop table if exists customer;
drop table if exists category;
drop table if exists product;
drop table if exists supplier_pricing;
drop table if exists `ORDER`;
drop table if exists rating;

create table supplier(SUPP_ID	INT Primary key,
SUPP_NAME	varchar(50) NOT NULL,
SUPP_CITY	varchar(50) NOT NULL,
SUPP_PHONE	varchar(50) NOT NULL);

create table customer(CUS_ID INT primary key,
CUS_NAME	VARCHAR(20) NOT NULL,
CUS_PHONE	VARCHAR(10) NOT NULL,
CUS_CITY	VARCHAR(30) NOT NULL,
CUS_GENDER	CHAR);

create table category(CAT_ID	INT primary key,
CAT_NAME	VARCHAR(20) NOT NULL);

create table product(PRO_ID	INT primary key,
PRO_NAME	VARCHAR(20) NOT NULL DEFAULT "Dummy Product",
PRO_DESC	VARCHAR(60),
CAT_ID	INT,
foreign key (CAT_ID) references category (CAT_ID) );

create table supplier_pricing(PRICING_ID INT primary key,
PRO_ID	INT,
SUPP_ID	INT,
SUPP_PRICE	INT DEFAULT 0,
foreign key (PRO_ID) references product (PRO_ID),
foreign key (SUPP_ID) references supplier(SUPP_ID));

create table `ORDER`(ORD_ID INT primary key,
ORD_AMOUNT	INT NOT NULL,
ORD_DATE	DATE NOT NULL,
CUS_ID	INT,
PRICING_ID	INT,
foreign key (CUS_ID) references customer (CUS_ID),
foreign key (PRICING_ID) references supplier_pricing(PRICING_ID));

create table rating(RAT_ID	INT primary key,
ORD_ID	INT,
RAT_RATSTARS INT NOT NULL,
foreign key (ORD_ID) references `ORDER`(ORD_ID)
);
