-- 코드를 입력하세요
select to_number(to_char(start_date, 'mm')) as month, car_id, count(car_id) as records
  from car_rental_company_rental_history
 where car_id in (select car_id
                    from car_rental_company_rental_history
                   where to_char(start_date, 'yyyymm') between '202208' and '202210'
                   group by car_id
                   having count(*) >= 5)
   and to_char(start_date, 'yyyymm') between '202208' and '202210'
 group by to_char(start_date, 'mm'), car_id
 order by month, car_id desc;
