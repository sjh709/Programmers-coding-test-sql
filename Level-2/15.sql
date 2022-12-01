select substr(price, 1, 1) * 10000 as price_group, count(*) as products
  from product
 group by substr(price, 1, 1)
 order by price_group;
