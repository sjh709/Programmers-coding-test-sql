select count(*)
  from user_info
 where to_char(joined, 'yyyy') = '2021'
   and age between '20' and '29';
