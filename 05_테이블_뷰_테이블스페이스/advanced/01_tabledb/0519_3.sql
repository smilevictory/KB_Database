use tabledb;

drop table if exists userTBL;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10),
    birthYear int not null check (birthYear >= 1900 and birthYear <= 2023),
    mobile char(3) not null
)