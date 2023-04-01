-- 코드를 입력하세요
SELECT order_id, product_id, to_char(out_date, 'yyyy-mm-dd'),
       case when to_char(out_date, 'yyyymmdd') <= '20220501' then '출고완료'
       when out_date is null then '출고미정'
       else '출고대기' end
  from food_order
 order by order_id;
