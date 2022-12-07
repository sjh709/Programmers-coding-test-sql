select b.animal_id, b.name
  from animal_ins a, animal_outs b
 where a.animal_id(+) = b.animal_id
   and a.animal_id is null
 order by b.animal_id;
