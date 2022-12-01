select count(name)
  from (select distinct name
          from animal_ins);
