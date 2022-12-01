select member_id, member_name, gender, to_char(date_of_birth, 'yyyy-mm-dd')
  from member_profile
 where to_char(date_of_birth, 'mm') = '03'
   and gender = 'W'
   and tlno is not null
 order by member_id;
