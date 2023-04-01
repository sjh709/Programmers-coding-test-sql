-- 코드를 입력하세요
SELECT a.writer_id, b.nickname, sum(a.price)
  from used_goods_board a,
       used_goods_user b
 where a.writer_id = b.user_id
   and a.status = 'DONE'
 group by a.writer_id, b.nickname
 having sum(a.price) >= 700000
  order by sum(a.price);
