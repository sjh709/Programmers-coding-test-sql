select animal_id, name,
       decode(substr(sex_upon_intake, 1, instr(sex_upon_intake, ' ')), 'Intact ', 'X', 'O')
  from animal_ins
 order by animal_id;
