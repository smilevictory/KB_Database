use testdb;

drop table if exists usertbl;

create table usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr NCHAR(2) NOT NULL
);

insert into usertbl
value
    ('LSG', '이승기', 1987, '서울'),
    ('KBS', '김범수', 1979, '경남'),
    ('KKH', '김경호', 1971, '전남'),
    ('JYP', '조용필', 1950, '경기'),
    ('S나', '성시경', 1979, '서울');

select *
from usertbl;

-- usertbl에서 primary key 제약조건 삭제
alter table usertbl drop primary key;

alter table usertbl
add constraint pk_name primary key (name);

-- 클러스터형 인덱스가 userID에서 name으로 바뀌어
-- 데이터 정렬 순서가 바뀜
select *
from usertbl;
