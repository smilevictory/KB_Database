-- employees 테이블에서 진행
use employees;

-- titles 테이블의 데이터 출력하기
select
    *
from
    titles;

-- employees 테이블에서 first_name 컬럼만 출력하기
select
    first_name
from
    employees;

-- employees 테이블에서 first_name 컬럼, last_name 컬럼, gender 컬럼 출력하기
select
    first_name, last_name, gender
from
    employees;

-- employees 테이블 출력시 다음과 같이 나오도록 쿼리를 작성하세요

select
    first_name as 이름,
    gender as 성별,
    hire_date as 회사입사일
from
    employees;