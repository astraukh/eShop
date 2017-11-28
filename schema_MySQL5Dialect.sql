drop table if exists CREDENTIAL;
drop table if exists ORDER_PRODUCT;
drop table if exists ORDERS;
drop table if exists PRODUCT;
drop table if exists USER;
create table CREDENTIAL (id integer not null auto_increment, CREATED_AT datetime not null, EMAIL varchar(64) not null, IS_IN_BLACK_LIST bit not null, LOGIN varchar(255) not null, PASSWORD varchar(255) not null, ROLE varchar(255) not null, primary key (id)) engine=MyISAM;
create table ORDER_PRODUCT (ORDER_ID integer not null, PRODUCT_ID integer not null) engine=MyISAM;
create table ORDERS (id integer not null auto_increment, CREATED_AT datetime not null, STATUS varchar(255) not null, USER_ID integer, primary key (id)) engine=MyISAM;
create table PRODUCT (id integer not null auto_increment, CREATED_AT datetime not null, CATEGORY varchar(255) not null, NAME varchar(255) not null, PRICE integer not null, QUANTITY integer not null, primary key (id)) engine=MyISAM;
create table USER (id integer not null auto_increment, CREATED_AT datetime not null, ADDRESS varchar(255) not null, DISCOUNT integer not null, NAME varchar(255) not null, PHONE_NUMBER varchar(255) not null, SURNAME varchar(255) not null, CREDENTIAL_ID integer not null, primary key (id)) engine=MyISAM;
alter table USER add constraint UK_7qvj1s1jc7s9hajf5q2lgkebu unique (CREDENTIAL_ID);
alter table ORDER_PRODUCT add constraint FK2mf2y4acvw0ols2p4nmsg5ifi foreign key (PRODUCT_ID) references PRODUCT (id);
alter table ORDER_PRODUCT add constraint FKf0sghmn59s14cxrjtrvkvi5yk foreign key (ORDER_ID) references ORDERS (id);
alter table ORDERS add constraint FK90axj458blwuqkm8314rulchx foreign key (USER_ID) references USER (id);
alter table USER add constraint FKrey7tj0xcksoq9xgkafvhhii6 foreign key (CREDENTIAL_ID) references CREDENTIAL (id);
