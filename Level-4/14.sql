-- 코드를 입력하세요
SELECT DISTINCT CAR_ID,
       CAR_TYPE,
       FEE
  FROM (SELECT A.CAR_ID,
               A.CAR_TYPE,
               (1 - (SELECT DISCOUNT_RATE
                       FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                      WHERE CAR_TYPE = A.CAR_TYPE
                        AND DURATION_TYPE = '30일 이상') / 100) * A.DAILY_FEE * 30 AS FEE
          FROM CAR_RENTAL_COMPANY_CAR A,
               CAR_RENTAL_COMPANY_RENTAL_HISTORY B
         WHERE A.CAR_ID = B.CAR_ID
           AND A.CAR_TYPE IN ('세단', 'SUV')
           AND A.CAR_ID NOT IN (SELECT DISTINCT CAR_ID
                                  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                                 WHERE END_DATE >= TO_DATE('2022-11-01', 'YYYY-MM-DD')
                                   AND START_DATE <= TO_DATE('2022-11-30', 'YYYY-MM-DD')))
 WHERE FEE >= 500000 AND FEE < 2000000
 ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC;
