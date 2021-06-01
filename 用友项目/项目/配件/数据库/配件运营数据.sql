select * from PT_0421T A;
--REG_DT
select * from PT_0622T;

--E.OHR_ORD_RCVE_DT

 SELECT
        T2.*
        FROM (
            SELECT
            ROWNUM AS RNUM
            ,T1.*
            FROM (
                SELECT
                F.*
                FROM (
                    SELECT
                    E.OHR_DLR_CD AS DLR_CD
                    ,MAX(E.DLR_NM) AS DLR_NM
                    ,E.OHR_ORD_NO AS BMP_ORD_NO
                    ,MAX(E.OHR_DLR_ORD_NO) AS PURC_ORD_NO
                    ,MAX(E.OHR_ORD_RCVE_DT) AS PURC_REG_DT
                    ,CASE WHEN MAX(E.OHR_ORD_AMT) = 0 THEN MAX(E.OHR_CFM_ITM) ELSE MAX(E.OHR_ORD_ITM) END ITEM_CNT
                    
                    ---liuxueying update 顾松dcs和dms订单总金额和订单含税金额数量不一致 start ---
                    ---,SUM(E.ODR_CFM_QT) AS TOT_PURC_QTY                 
                    ,SUM(E.CALC_CONFIRM_QTY) AS TOT_PURC_QTY
                    ---,SUM(CASE WHEN E.ODR_CFM_QT - E.ODR_XCL_QT <![CDATA[>]]> 0 THEN E.ODR_CFM_QT - E.ODR_XCL_QT ELSE E.ODR_ODR_QT END * (E.ODR_UPCE_NDP + E.ODR_VAT_AMT)) AS TOT_PURC_AMT
                    ,SUM(PURC_AMT) AS TOT_PURC_AMT
                    ---,MAX(E.OHR_CFM_AMT) AS TOT_TAX_DDCT_AMT
                    ,sum(E.CALC_TAX_DDCT_AMT) AS TOT_TAX_DDCT_AMT
                    ---liuxueying update end --------
                    
                    ,SUM(CASE WHEN E.ODR_CFM_APL_FLG = 'N' THEN 1 ELSE 0 END) AS ALL_CANC_CHK
                    ,'03' AS PURC_ORD_STAT_CD
                    ,MAX(E.OHR_ORD_TYP) AS PURC_ORD_TP
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
                            SELECT
                            A.*
                            ,B.DLR_NM
                            FROM 
                             (
                                SELECT
                                *
                                FROM CM_0101T
                                WHERE DMS_USE_YN = 'Y'
                                AND OPEN_DT <![CDATA[<=]]> TO_CHAR(SYSDATE,'YYYYMMDD')
                                <if test='sDlrCd != null and sDlrCd != ""'>
                                    AND DLR_CD = #{sDlrCd}
                                </if>
                                <if test='sDlrNm != null and sDlrNm != ""'>
                                    AND DLR_NM LIKE '%'||#{sDlrNm}||'%'
                                </if>
                            ) B INNER JOIN PT_0421I A
                            ON A.OHR_DLR_CD = B.DLR_CD
                            WHERE 1=1 
                             <if test='sPurcRegDtFr != null'>
			                    AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
			                </if>
			                <if test='sPurcRegDtTo != null'>
			                    AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
			                </if>
                            <if test='sBmpOrdNo != null and sBmpOrdNo != ""'>
                                AND A.OHR_ORD_NO = #{sBmpOrdNo}
                            </if>
                            <if test='sPurcOrdNo != null and sPurcOrdNo != ""'>
                                AND A.OHR_DLR_ORD_NO = #{sPurcOrdNo}
                            </if>
                        ) D INNER JOIN  PT_0422I C
                        ON C.ODR_ODR_NO = D.OHR_ORD_NO
                    ) E
                    GROUP BY E.OHR_DLR_CD, E.OHR_ORD_NO
                ) F
                WHERE F.ITEM_CNT - F.ALL_CANC_CHK != 0
                <if test='sPurcOrdStatLst != null and !sPurcOrdStatLst.isEmpty'>
                    AND F.PURC_ORD_STAT_CD IN
                    <foreach item="item" index="index" collection="sPurcOrdStatLst" open="(" separator="," close=")">
                        #{item}
                    </foreach>
                </if>
                <!--  <if test='sPurcRegDtFr != null'>
                    AND TO_DATE(F.PURC_REG_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                </if>
                <if test='sPurcRegDtTo != null'>
                    AND TO_DATE(F.PURC_REG_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                </if>-->
                ORDER BY F.DLR_CD ASC ,F.PURC_REG_DT DESC
            )T1
        )T2
        <where>
            <if test='firstIndex != -1 and lastIndex != -1'>
                RNUM <![CDATA[<=]]> #{lastIndex}
                AND RNUM <![CDATA[>]]> #{firstIndex}
            </if>
        </where>