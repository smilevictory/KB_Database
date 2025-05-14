-- World 데이터베이스에서 다음 질문을 처리
use world;

-- 국가 코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시
select
    Population
from
    city
where CountryCode = 'KOR'
order by Population desc ;

-- city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드별로 오름차순으로, 동일한 코드(국가) 안에서는 인구 수의 역순으로 표시
select
    CountryCode, Population
from
    city
order by CountryCode asc, Population desc ;

-- city 테이블에서 국가코드가 'KOR'인 도시의 수를 표시
select
    count(Name)
from
    city
where
    CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR', 'CHN', 'JPN'인 도시를 찾기
select
    *
from
    city
where CountryCode='CHN'  OR CountryCode='JPN' OR CountryCode= 'KOR';

-- 국가코드가 'KOR'이면서 인구가 100만 이상인 도시를 찾기
select
    Name
from city
where CountryCode = 'KOR' AND Population >= 1000000;

-- 국가 코드가 'KOR'인 도시 중 인구수가 많은 순서로 상위 10개만 표시
select
    *
from
    city
where CountryCode ='KOR'
order by Population desc
limit 10;

-- city 테이블에서 국가코드가 'KOR'이고, 인구가 100만 이상 500만 이하인 도시를 찾기
select
    Name
from
    city
where CountryCode ='KOR' AND Population between 1000000 and 5000000;