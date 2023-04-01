-- 코드를 입력하세요
select car_id, '대여중' as availability
  from car_rental_company_rental_history
 where car_id in (select car_id
                    from car_rental_company_rental_history
                   where to_char(start_date, 'yyyymmdd') <= '20221016'
                     and to_char(end_date, 'yyyymmdd') >= '20221016')
 group by car_id
 union all
select car_id, '대여 가능' as availability
  from car_rental_company_rental_history
 where car_id not in (select car_id
                        from car_rental_company_rental_history
                       where to_char(start_date, 'yyyymmdd') <= '20221016'
                         and to_char(end_date, 'yyyymmdd') >= '20221016')
 group by car_id
 order by car_id desc;
