use employees;

-- 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성
drop view EMP_DEPT_INFO;
create view EMP_DEPT_INFO as
    select
        de.emp_no,
           de.dept_no,
           d.dept_name,
           de.from_date,
           de.to_date

from dept_emp de
join departments d
on de.dept_no = d.dept_no;

-- EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력
select
    *
from EMP_DEPT_INFO
where to_date = '9999-01-01';
