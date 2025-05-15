-- employees db에서 각 부서별 관리자를 출력하세요
-- 단, 현 재직자만 출력한다
select
    *
from
    dept_manager
where
    to_date = '9999-01-01'; -- 재직자

 select
     *
 from
     dept_manager
 where
     to_date = '9999-01-01' -- 재직자
    and dept_no = 'd005'; -- d005부서

/*
SUBQUERIES
-- 서브 쿼리는 다른 쿼리에서 실행되는 쿼리
-- 테이블 내에서 존재하지 않는 조건에 근거한 값들을 검색할 때 사용
*/
-- 조건1. 부서번호가 d005인 부서의 관리자
-- 조건2. 관리자의 정보를 가져오기
-- 출력 -> 관리자 정보

select
    *
from
    employees
where emp_no=(
    select
        emp_no
    from
        dept_manager
    where
        to_date='9999-01-01'
    and dept_no = 'd005'
    );

/*
CTE (Common Table Expression)
- 서브쿼리와 같은 개념으로 코드의 가독성과 재사용을 위해 임시 결과 테이블을 선언
*/
with
    current_manager as (select
                    emp_no
                from
                    dept_manager
                where
                    to_date='9999-01-01'
                  and dept_no = 'd005')
select
    *
from
    employees
where
    emp_no = (select emp_no from current_manager);

-- 부서번호 d005 부서의 현재 관리자 정보를 출력하세요.

select
    *
from
    dept_manager -- 부서별 관리자 tb
where
    to_date = '9999-01-01' -- 재직자
  and dept_no = 'd005'; -- d005 부서

-- employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다.
-- 다음 조건하에서 8번 페이지의 데이터를 출력하세요.
-- ○ 입사일을 내림차순으로 정렬한다.
-- ○ 한 페이지당 20명의 정보를 출력한다
select
    *
from
    employees
order by
    hire_date desc
limit 140, 20; -- offset, amount

-- employees db에서 재직자의 총 수를 구하시오

select
    count(*) as '총 재직자 수'
from
    dept_manager
where
    to_date = '9999-01-01';

-- employees db에서 재직자의 평균 급여를 출력하시오.
select
    avg(salary)
from
    salaries
where
    to_date='9999-01-01';

-- 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요.
-- 조건1. "재직자" --> 9999-01-01
-- 조건2. 전체 재직자의 평균 급여 보다 많이 받는 재직자
-- 출력 : 재직자 정보
select
    *
from
    salaries
where
    to_date='9999-01-01'
and salary > (select
                avg(salary)
            from
                salaries
            where to_date='9999-01-01');

-- employees db에서 각 부서별 재직자의 수를 구하시오
-- ○ 부서 번호로 구분하고, 부서 번호로 오름 차순 정렬하여 출력한다.

select
    dept_no, count(*)
from
    dept_emp
where
    to_date = '9999-01-01'
group by
    dept_no
order by
    dept_no asc ;

/*
ALL : 서브쿼리 결과 모든 값과 비교
ANY / SOME : 서브쿼리 결과가 하나로도 만족하면 참
*/
-- 급여가 재직자 모두의 평균보다 크면 출력
select
    *
from
    salaries
where
    to_date = '9999-01-01'
and salary = any (select
                     min(salary)
                 from
                     salaries
                 where
                     to_date = '9999-01-01');

/*
2025-05-15 오후 심화 실습 내용 : sql 고급 (심화)
*/

select
    e.emp_no,
    e.first_name,
    e.last_name,
    t.title
from
    employees e
join
        titles t
on e.emp_no = t.emp_no
where
    t.to_date = '9999-01-01';

/*
- 현재 재직 중인 직원 정보를 출력하세요
○ 출력항목: 직원의 기본 정보 모두, title, salary
*/
select
    e.*,
    t.title,
    s.salary
from
    employees e
        join
    titles t
    on e.emp_no = t.emp_no
join
        salaries s
on e.emp_no=s.emp_no
where
    t.to_date='9999-01-01' and
    s.to_date = '9999-01-01';

/*
- 현재 재직중인 직원의 정보를 출력하세요.
○ 출력항목: emp_no, first_name, last_name, department
○ 정렬: emp_no 오름 차순
*/
select
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
from
    employees e
        join
    dept_emp de
on e.emp_no = de.emp_no

join departments d
on de.dept_no = d.dept_no
where
    de.to_date = '9999-01-01'
order by e.emp_no asc ;

/*
- 부서별 재직중인 직원의 수를 출력하세요.
○ 출력 항목: 부서 번호, 부서명, 인원수
○ 정렬: 부서 번호 오름차순
 */

 select
     d.*,
     count(*)
 from
     departments d
 join
         dept_emp de
         on d.dept_no = de.dept_no

 where
     de.to_date='9999-01-01'
 group by d.dept_no, d.dept_name
 order by d.dept_no asc
 ;


/*
- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date

*/

select
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    de.from_date,
    de.to_date
from
    employees e
        join
    dept_emp de on e.emp_no = de.emp_no
        join
    departments d on de.dept_no = d.dept_no
where
    e.emp_no = 10209;
