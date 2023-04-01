-- 코드를 입력하세요
select a.car_id
  from car_rental_company_car a,
       car_rental_company_rental_history b
 where a.car_id = b.car_id
   and to_char(b.start_date, 'yyyymm') = '202210'
   and a.car_type = '세단'
 group by a.car_id
 order by a.car_id desc;
