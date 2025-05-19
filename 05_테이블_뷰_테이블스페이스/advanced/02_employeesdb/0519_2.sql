use employees;

-- EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력
select
    *
from EMPLOYEES_INFO
where s_to = '9999-01-01';