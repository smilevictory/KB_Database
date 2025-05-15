-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서
-- 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력하세요.

/*
- 세 개 이상 테이블 조인
- 각 테이블은 관계가 있어야 함, 조인 조건을 명확히 설정해야 함
작동 순서
1. 첫번째 테이블과 두번째 테이블 먼저 조인
2. 1번의 결과 테이블과 세번째 테이블이 조인
-- 각 조인마다 on으로 조건을 지정해야함
*/

select
    s.stdName as 학생이름,
    sc.clubName as 동아리명,
    c.roomNo as 동아리위치
from
    stdtbl s
join
        stdclubtbl sc
on
    s.stdName = sc.stdName
join
        clubtbl c
on sc.clubName = c.clubName;

USE sqldb;
CREATE TABLE empTbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl VALUES('나사장', NULL, '0000');
INSERT INTO empTbl VALUES('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES('이부장', '김재무', '2222-2');
INSERT INTO empTbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO empTbl VALUES('이영업', '나사장', '1111');
INSERT INTO empTbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES('최정보', '나사장', '3333');
INSERT INTO empTbl VALUES('윤차장', '최정보', '3333-1');
INSERT INTO empTbl VALUES('이주임', '윤차장', '3333-1-1');

/*
- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
○ 출력할 정보
 부하직원, 직속상관, 직속상관연락처
*/
select
    *
from
    empTbl
where
    emp = '우대리';



