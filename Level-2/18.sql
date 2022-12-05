select mcdp_cd, count(*)
  from appointment
 where to_char(apnt_ymd, 'mm') = '05'
 group by mcdp_cd
 order by count(*), mcdp_cd;
