-- 코드를 입력하세요
SELECT a.name, a.datetime
  from animal_ins a, animal_outs b
 where a.animal_id = b.animal_id(+)
   and b.animal_id is null
 order by a.datetime
 fetch first 3 rows only;
