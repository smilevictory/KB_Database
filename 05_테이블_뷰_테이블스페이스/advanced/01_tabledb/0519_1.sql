use tabledb;
-- 기존 테이블 삭제
drop table if exists buytbl;
drop table if exists usertbl;

-- 테이블 재정의
create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10) not null ,
    birthyear int not null
);

create table buyTBL(
    num int not null auto_increment primary key ,
    userID char(8) not null,
    prodName char(6) not null
);

-- alter을 이용해 userID를 외래키로 수정
alter table buyTBL
    add constraint
FK_userID foreign key  (userID) references userTBL (userID);
