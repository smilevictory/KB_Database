use tabledb;

drop table if exists userTBL;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10) not null,
    birthYear int not null default -1,
    addr char(2) not null  default '서울',
    mobile1 char(3),
    mobile2 char(8),
    height smallint default 170,
    mDate DATETIME
);