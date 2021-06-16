      select X.PURC_REG_DT AS yearMonth,X.TOT_PURC_AMT AS purchaseAmtInclusive,X.TOT_TAX_DDCT_AMT AS purchaseAmt,NVL(T.DLRFILLRATE,0) as dlrFillRate,NVL(T.PARTRATE,0) as partRate 
        ,NVL(K.ODR_CFM_PNO,0) as partItemNm,NVL(K.ODR_LST_BO_QT,0) as partNm,NVL(K.SUM_BMP_PURC_PRC,0) as partAmt
         from (  
            select Z.PURC_REG_DT,SUM(TOT_PURC_AMT) AS TOT_PURC_AMT,SUM(TOT_TAX_DDCT_AMT) AS TOT_TAX_DDCT_AMT from (   
                SELECT
                    SUBSTR(E.OHR_ORD_RCVE_DT,0,6) AS PURC_REG_DT
                    ,SUM(PURC_AMT) AS TOT_PURC_AMT
                    ,sum(E.CALC_TAX_DDCT_AMT) AS TOT_TAX_DDCT_AMT 
                    FROM (
                        SELECT
                        D.*
                        ,C.*
                        ,CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') 
                                THEN
                                     CASE WHEN ODR_CFM_QT - ODR_XCL_QT > 0 THEN ROUND((ODR_CFM_QT - ODR_XCL_QT) * Odr_Upce_Ndp,2) ELSE 0 END 
                                          WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') 
                                           THEN CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0 THEN ROUND(Odr_Upce_Ndp * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2) ELSE 0 END -- CHECK ??? ??? : ??*???? , ??? : 0
                                          ELSE round(nvl(Odr_Upce_Ndp,0) * nvl(ODR_CFM_QT,0),2) END  CALC_TAX_DDCT_AMT
                                            
                        ,CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END)  IN ('C','D','Y') 
                                THEN 
                                     CASE WHEN NVL(ODR_CFM_QT,0) > 0 THEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) ELSE 0 END
                                          WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END)  IN ('X','Z') 
                                           THEN NVL(NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0),0)
                                          ELSE ODR_CFM_QT END CALC_CONFIRM_QTY
                        ,CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') THEN
                                               CASE WHEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) > 0 
                                                 THEN ROUND((ODR_CFM_QT - 
                                                      NVL(ODR_XCL_QT,0)) * (Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)),2) ELSE 0 END
                                           WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') THEN
                                                CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0
                                                       THEN ROUND((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2)
                                                    ELSE 0 END
                                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT
                        FROM (
                            SELECT A.*,B.DLR_NM
                              FROM 
                               ( SELECT
                                  *
                                  FROM CM_0101T
                                  WHERE DMS_USE_YN = 'Y'
                              ) B INNER JOIN PT_0421I A
                              ON A.OHR_DLR_CD = B.DLR_CD
                              WHERE 1=1 
                            -- <if test='sPurcRegDtFr != null'>
                               -- AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                            -- </if>
                            -- <if test='sPurcRegDtTo != null'>
                             --  AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                            --  </if>
                        ) D INNER JOIN  PT_0422I C
                        ON C.ODR_ODR_NO = D.OHR_ORD_NO
                    ) E
                    GROUP BY E.OHR_DLR_CD, E.OHR_ORD_NO,E.OHR_ORD_RCVE_DT
                )Z GROUP BY Z.PURC_REG_DT
              )X LEFT JOIN (
                      SELECT OHR_ORD_RCVE_DT,SUM(PURC_AMT) AS PURC_AMT, SUM(ODR_CFM_PNO) AS ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      FROM(
                      select SUBSTR(OHR_ORD_RCVE_DT,0,6) as OHR_ORD_RCVE_DT ,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,SUM(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC 
                      ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      from (  
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
                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT
                            ,E.OHR_ORD_NO,E.OHR_ORD_RCVE_DT,E.OHR_DLR_ORD_NO ,E.DLR_CD,E.ODR_CFM_PNO ,E.ODR_CFM_APL_FLG,E.ODR_LST_BO_QT
                             ,(NVL((SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
                              FROM PT_0218I T2
                              WHERE (LPR_PNO,LPR_APL_DT) IN (
                              SELECT LPR_PNO, MAX(LPR_APL_DT) AS LPR_APL_DT FROM PT_0218I T3
                              GROUP BY LPR_PNO)
                              AND TRIM(T2.LPR_PNO) = E.ODR_CFM_PNO),0) * E.ODR_LST_BO_QT) AS SUM_BMP_PURC_PRC
                      from (
                      SELECT D.*,C.*FROM (
                          SELECT A.OHR_ORD_NO,A.OHR_ORD_RCVE_DT,A.OHR_DLR_ORD_NO,B.DLR_NM,B.DLR_CD
                          FROM 
                           (SELECT DLR_CD,DLR_NM FROM CM_0101T WHERE DMS_USE_YN = 'Y'
                              AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
                           ) B INNER JOIN PT_0421I A
                          ON A.OHR_DLR_CD = B.DLR_CD
                          WHERE 1=1 
			             -- <if test='sinvcsFromDt != null'>
			               --   AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> #{sinvcsFromDt}
			             -- </if>
			            --  <if test='sinvcsToDt != null'>
			             --	  AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> #{sinvcsToDt}
			            --  </if>  
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
                    ) K ON X.PURC_REG_DT = K.OHR_ORD_RCVE_DT
                LEFT JOIN PT_0910T T ON X.PURC_REG_DT = T.YEARMONTH
                ORDER BY X.PURC_REG_DT DESC;
              
                    
---ԭʼ
SELECT * FROM (	 
			 SELECT OHR_ORD_RCVE_DT as yearMonth,NVL(DLRFILLRATE,0) as dlrFillRate,NVL(PARTRATE,0) as partRate
                      ,ODR_CFM_PNO as partItemNm,ODR_LST_BO_QT as partNm,SUM_BMP_PURC_PRC as partAmt
                      FROM (
                      SELECT OHR_ORD_RCVE_DT,SUM(PURC_AMT) AS PURC_AMT, SUM(ODR_CFM_PNO) AS ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      FROM(
                      select SUBSTR(OHR_ORD_RCVE_DT,0,6) as OHR_ORD_RCVE_DT ,OHR_DLR_ORD_NO,SUM(PURC_AMT)/COUNT(OHR_DLR_ORD_NO) as PURC_AMT,SUM(ODR_CFM_PNO) as ODR_CFM_PNO,SUM(SUM_BMP_PURC_PRC) AS SUM_BMP_PURC_PRC 
                      ,SUM(ODR_LST_BO_QT) AS ODR_LST_BO_QT
                      from (  
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
                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT
                            ,E.OHR_ORD_NO
                            ,E.OHR_ORD_RCVE_DT
                            ,E.OHR_DLR_ORD_NO
                            ,E.DLR_CD
                            ,E.ODR_CFM_PNO
                            ,E.ODR_CFM_APL_FLG
                            ,E.ODR_LST_BO_QT
                             ,(NVL((SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
                              FROM PT_0218I T2
                              WHERE (LPR_PNO,LPR_APL_DT) IN (
                              SELECT LPR_PNO, MAX(LPR_APL_DT) AS LPR_APL_DT FROM PT_0218I T3
                              GROUP BY LPR_PNO)
                              AND TRIM(T2.LPR_PNO) = E.ODR_CFM_PNO),0) * E.ODR_LST_BO_QT) AS SUM_BMP_PURC_PRC
                      from (
                      SELECT D.*,C.*FROM (
                          SELECT A.OHR_ORD_NO,A.OHR_ORD_RCVE_DT,A.OHR_DLR_ORD_NO,B.DLR_NM,B.DLR_CD
                          FROM 
                           (SELECT DLR_CD,DLR_NM FROM CM_0101T WHERE DMS_USE_YN = 'Y'
                              AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
                           ) B INNER JOIN PT_0421I A
                          ON A.OHR_DLR_CD = B.DLR_CD
                          WHERE 1=1 
			             -- <if test='sinvcsFromDt != null'>
			               --   AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> #{sinvcsFromDt}
			             -- </if>
			            --  <if test='sinvcsToDt != null'>
			             --	  AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> #{sinvcsToDt}
			            --  </if>  
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
               ) L ;