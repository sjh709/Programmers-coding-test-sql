-- 코드를 입력하세요
SELECT A.APNT_NO, 
       (SELECT C.PT_NAME
          FROM PATIENT C
         WHERE C.PT_NO = A.PT_NO) AS PT_NAME,
       A.PT_NO, A.MCDP_CD, 
       (SELECT C.DR_NAME
          FROM DOCTOR C
         WHERE C.DR_ID = A.MDDR_ID) AS DR_NAME,
       A.APNT_YMD
  FROM APPOINTMENT A
 WHERE TO_CHAR(A.APNT_YMD, 'YYYYMMDD') = '20220413'
   AND A.APNT_CNCL_YN = 'N'
   AND A.MCDP_CD = 'CS'
 ORDER BY A.APNT_YMD;
