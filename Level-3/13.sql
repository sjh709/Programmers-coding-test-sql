-- 코드를 입력하세요
select b.user_id, b.nickname,
       b.city || ' ' || b.street_address1 || ' ' || b.street_address2 as 전체주소,
       substr(b.tlno, 0, 3) || '-' || substr(b.tlno, 4, 4) || '-' || substr(b.tlno, 8) as 전화번호
  from (select writer_id, count(*) as cnt
          from used_goods_board
         group by writer_id
        having count(*) >= 3) a, used_goods_user b
 where a.writer_id = b.user_id
 order by b.user_id desc;
