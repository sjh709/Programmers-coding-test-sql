-- 코드를 입력하세요
SELECT a.book_id, b.author_name, to_char(a.published_date, 'yyyy-mm-dd')
  from book a, author b
 where a.author_id = b.author_id
   and a.category = '경제'
 order by published_date;
