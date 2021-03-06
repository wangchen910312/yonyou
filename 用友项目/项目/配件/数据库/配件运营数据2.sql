  SELECT *
     FROM ( 
        select ROWNUM AS RNUM , T1.* 
		from(
			
			 SELECT OHR_ORD_RCVE_DT as yearMonth,PURC_AMT as purchaseAmtInclusive,round((PURC_AMT/1.13), 2) as purchaseAmt,NVL(DLRFILLRATE,0) as dlrFillRate,NVL(PARTRATE,0) as partRate
                      ,ODR_CFM_PNO as partItemNm,ODR_LST_BO_QT as partNm,SUM_BMP_PURC_PRC as partAmt
                      FROM (
                      --合并月份和缺件率
                      SELECT OHR_ORD_RCVE_DT,SUM(PURC_AMT) AS PURC_AMT, SUM(ODR_CFM_PNO) AS ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      FROM(
                      --按照编号进行分组 求零件种类
                      select SUBSTR(OHR_ORD_RCVE_DT,0,6) as OHR_ORD_RCVE_DT ,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,SUM(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC 
                      ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      from (  
                      --将零件种类分组，零件单价*数量求和，缺件数量合并
                      SELECT OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,COUNT(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC
                      ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      FROM (
                      select 
                            CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') THEN
                            CASE WHEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) > 0 
                            THEN ROUND((ODR_CFM_QT - 
                            NVL(ODR_XCL_QT,0)) * (Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)),2) ELSE 0 END
                            WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') THEN
                                CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0
                                       THEN ROUND((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2)
                                    ELSE 0 END
                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT--订单金额
                            ,E.OHR_ORD_NO--BMP订单编号
                            ,E.OHR_ORD_RCVE_DT--订单申请日期
                            ,E.OHR_DLR_ORD_NO--订单编号
                            ,E.DLR_CD--经销商代码
                            ,E.ODR_CFM_PNO--零件编号
                            ,E.ODR_CFM_APL_FLG--
                            ,E.ODR_LST_BO_QT----缺件数量
                             ,(NVL((SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
                              FROM PT_0218I T2
                              WHERE (LPR_PNO,LPR_APL_DT) IN (
                              SELECT LPR_PNO, MAX(LPR_APL_DT) AS LPR_APL_DT FROM PT_0218I T3
                              GROUP BY LPR_PNO)
                              AND TRIM(T2.LPR_PNO) = E.ODR_CFM_PNO),0) * E.ODR_LST_BO_QT) AS SUM_BMP_PURC_PRC--单价*缺件数量=缺件金额 
                      from (
                      SELECT D.*,C.*FROM (
                          SELECT A.OHR_ORD_NO,A.OHR_ORD_RCVE_DT,A.OHR_DLR_ORD_NO,B.DLR_NM,B.DLR_CD
                          FROM 
                           (SELECT DLR_CD,DLR_NM FROM CM_0101T WHERE DMS_USE_YN = 'Y'
                              AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
                           ) B INNER JOIN PT_0421I A
                          ON A.OHR_DLR_CD = B.DLR_CD
                          WHERE 1=1 
                          
                      ) D INNER JOIN  PT_0422I C
                      ON C.ODR_ODR_NO = D.OHR_ORD_NO
                      )E LEFT JOIN (
                        SELECT ITEM_CD,ITEM_NM FROM PT_0201T
                    ) F ON F.ITEM_CD = TRIM(E.ODR_CFM_PNO)
                    WHERE E.ODR_CFM_APL_FLG != 'N'
                    AND E.ODR_LST_BO_QT > 0
                    ) G GROUP BY OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO,ODR_CFM_PNO
                    ) H GROUP BY OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO
                    ) J GROUP BY OHR_ORD_RCVE_DT
                    ) K LEFT JOIN PT_0910T T ON K.OHR_ORD_RCVE_DT = T.YEARMONTH
			
		)T1
      where 1=1 AND ROWNUM<= 20
   	) where 1=1 AND RNUM > 0;
    
    
    
    
    SELECT count(*) FROM (
              SELECT OHR_ORD_RCVE_DT,SUM(PURC_AMT) AS PURC_AMT, SUM(ODR_CFM_PNO) AS ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
              FROM(
              --按照编号进行分组 求零件种类
              select SUBSTR(OHR_ORD_RCVE_DT,0,6) as OHR_ORD_RCVE_DT ,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,SUM(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC 
              ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
              from (  
              --将零件种类分组，零件单价*数量求和，缺件数量合并
              SELECT OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,COUNT(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC
              ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
              FROM (
              select 
                    CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') THEN
                    CASE WHEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) > 0 
                    THEN ROUND((ODR_CFM_QT - NVL(ODR_XCL_QT,0)) * (Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)),2) ELSE 0 END
                    WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') THEN
                        CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0
                               THEN ROUND((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2)
                            ELSE 0 END
                      ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT--订单金额
                    ,E.OHR_ORD_NO--BMP订单编号
                    ,E.OHR_ORD_RCVE_DT--订单申请日期
                    ,E.OHR_DLR_ORD_NO--订单编号
                    ,E.DLR_CD--经销商代码
                    ,E.ODR_CFM_PNO--零件编号
                    ,E.ODR_CFM_APL_FLG--
                    ,E.ODR_LST_BO_QT----缺件数量
                     ,(NVL((SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
                      FROM PT_0218I T2
                      WHERE (LPR_PNO,LPR_APL_DT) IN (
                      SELECT LPR_PNO, MAX(LPR_APL_DT) AS LPR_APL_DT FROM PT_0218I T3
                      GROUP BY LPR_PNO)
                      AND TRIM(T2.LPR_PNO) = E.ODR_CFM_PNO),0) * E.ODR_LST_BO_QT) AS SUM_BMP_PURC_PRC--单价*缺件数量=缺件金额 
              from (
              SELECT D.*,C.*FROM (
                  SELECT A.OHR_ORD_NO,A.OHR_ORD_RCVE_DT,A.OHR_DLR_ORD_NO,B.DLR_NM,B.DLR_CD
                  FROM 
                   (SELECT DLR_CD,DLR_NM FROM CM_0101T WHERE DMS_USE_YN = 'Y'
                      AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')    
                   ) B INNER JOIN PT_0421I A
                  ON A.OHR_DLR_CD = B.DLR_CD
                  WHERE 1=1 
               
            ) D INNER JOIN  PT_0422I C
            ON C.ODR_ODR_NO = D.OHR_ORD_NO
            )E LEFT JOIN (
              SELECT ITEM_CD,ITEM_NM FROM PT_0201T
          ) F ON F.ITEM_CD = TRIM(E.ODR_CFM_PNO)
          WHERE E.ODR_CFM_APL_FLG != 'N'
          AND E.ODR_LST_BO_QT > 0
          ) G GROUP BY OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO,ODR_CFM_PNO
          ) H GROUP BY OHR_ORD_RCVE_DT,OHR_DLR_ORD_NO
          ) J GROUP BY OHR_ORD_RCVE_DT
          ) K ;