                     CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END)  IN ('C','D','Y') 
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
                     --,SUM(PURC_AMT) AS TOT_PURC_AMT
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
                            ,E.DLR_CD
                      from (
                      SELECT
                      D.*
                      ,C.*
                      FROM (
                          SELECT
                          A.OHR_ORD_NO
                          ,A.OHR_ORD_RCVE_DT
                          ,B.DLR_NM
                          ,B.DLR_CD
                          FROM 
                           (
                              SELECT
                              *
                              FROM CM_0101T
                              WHERE DMS_USE_YN = 'Y'
                              AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
                          ) B INNER JOIN PT_0421I A
                          ON A.OHR_DLR_CD = B.DLR_CD
                          WHERE 1=1 
--                          <if test='sPurcRegDtFr != null'>
--			                       AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--                          </if>
--                          <if test='sPurcRegDtTo != null'>
--			                    AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--                          </if>
                          
                      ) D INNER JOIN  PT_0422I C
                      ON C.ODR_ODR_NO = D.OHR_ORD_NO
                      )E  
                    
                      
                      
                      
                    
                  