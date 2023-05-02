-- 코드를 입력하세요
SELECT B.HISTORY_ID,
       (1 - NVL((SELECT C.DISCOUNT_RATE
          FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN C
         WHERE C.CAR_TYPE = A.CAR_TYPE
           AND C.DURATION_TYPE = (CASE WHEN (B.END_DATE - B.START_DATE + 1) >= 90 THEN '90일 이상'
                                       WHEN (B.END_DATE - B.START_DATE + 1) >= 30 THEN '30일 이상'
                                       WHEN (B.END_DATE - B.START_DATE + 1) >= 7  THEN '7일 이상'
                                  ELSE NULL END)), 0) / 100) * A.DAILY_FEE * (B.END_DATE - B.START_DATE + 1) AS FEE
  FROM CAR_RENTAL_COMPANY_CAR A,
       CAR_RENTAL_COMPANY_RENTAL_HISTORY B
 WHERE A.CAR_ID = B.CAR_ID
   AND A.CAR_TYPE = '트럭'
 ORDER BY FEE DESC, B.HISTORY_ID DESC;
