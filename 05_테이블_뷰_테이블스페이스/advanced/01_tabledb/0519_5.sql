use tabledb;

-- mobile1 컬럼 삭제
alter table userTBL drop column mobile1;

-- name -> uName으로 변경
alter table userTBL change name uName varchar(10);

-- 기본키 제거
alter table userTBL drop primary key ;