-- 코드를 입력하세요
SELECT A.MEMBER_NAME, B.REVIEW_TEXT, TO_CHAR(B.REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE
  FROM MEMBER_PROFILE A, REST_REVIEW B
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND A.MEMBER_ID||1 IN (SELECT C.MEMBER_ID||RANK() OVER(ORDER BY COUNT(*) DESC) AS RNK
                            FROM REST_REVIEW C
                           GROUP BY C.MEMBER_ID)
 ORDER BY B.REVIEW_DATE, B.REVIEW_TEXT;
