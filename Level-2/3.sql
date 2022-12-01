select *
  from (select name, count(*) as count
          from animal_ins
         where name is not null
         group by name
         order by name)
 where count >= 2;
