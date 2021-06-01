 SELECT
        T2.*
        FROM (
            SELECT
            ROWNUM AS RNUM
            ,T1.*
            FROM (
                SELECT
                D.OHR_DLR_CD AS DLR_CD
                ,D.DLR_NM AS DLR_NM
                ,D.OHR_ORD_NO AS BMP_ORD_NO
                ,D.OHR_DLR_ORD_NO AS PURC_ORD_NO
                ,E.ITEM_NM AS ITEM_NM
                ,C.ODR_CFM_PNO AS CONFIRM_PAR_NO
                ,C.ODR_LST_BO_QT AS BO_QTY
                ,D.OHR_ORD_RCVE_DT AS PURC_REG_DT
                ,C.ODR_UPCE_NDP + C.ODR_VAT_AMT AS BMP_PURC_PRC
                ,D.OHR_ORD_RCVE_DT AS CONFIRM_DT
                ,C.ODR_ETD AS ARRV_DT
                ,C.ODR_ODR_LN AS PURC_ORD_LINE_NO
                ,'03' AS PURC_ITEM_STAT_CD
                ,C.ODR_ALC_QT
                ,C.ODR_OPIC_QT
                ,C.ODR_OPAC_QT
                ,C.ODR_PAKD_QT
                ,C.ODR_INV_QT
                FROM PT_0422I C INNER JOIN(
                    SELECT
                    A.*
                    ,B.DLR_NM
                    ,B.OPEN_DT
                    FROM PT_0421I A INNER JOIN (
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
                    ) B
                    ON A.OHR_DLR_CD = B.DLR_CD
                    
                    <where> 
                        TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD') >= CASE WHEN LENGTH(B.OPEN_DT) = 8 THEN TO_DATE(TO_CHAR(ADD_MONTHS(TO_DATE(B.OPEN_DT,'YYYY-MM-DD'),-2),'YYYYMM')||'01','YYYY-MM-DD')  else null end
                        <if test='sPurcRegDtFr != null'>
                            AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                        </if>
                        <if test='sPurcRegDtTo != null'>
                            AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                        </if>
                        <if test='sConfirmFr != null'>
                            AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sConfirmFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')    <!-- dms??? 0431t? arrv_dt? ????. -->
                        </if>
                        <if test='sConfirmTo != null'>
                            AND TO_DATE(A.OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sConfirmTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
                        </if>
                    </where>
                ) D 
                ON C.ODR_ODR_NO = D.OHR_ORD_NO
                
                LEFT JOIN (
                    SELECT
                    ITEM_CD
                    ,ITEM_NM
                    FROM PT_0201T
                ) E ON E.ITEM_CD = TRIM(C.ODR_CFM_PNO)
                WHERE C.ODR_CFM_APL_FLG != 'N'
                AND C.ODR_LST_BO_QT <![CDATA[>]]> 0
                <if test='sPurcOrdNo != null and sPurcOrdNo != ""'>
                    AND D.OHR_DLR_ORD_NO = #{sPurcOrdNo}
                </if>
                <if test='sBmpOrdNo != null and sBmpOrdNo != ""'>
                    AND D.OHR_ORD_NO = #{sBmpOrdNo}
                </if>
                <if test='sItemCd != null and sItemCd != ""'>
                    AND TRIM(C.ODR_CFM_PNO) = #{sItemCd}
                </if>
                <if test='sItemNm != null and sItemNm != ""'>
                    AND TRIM(E.ITEM_NM) LIKE '%'||#{sItemNm}||'%'
                </if>
               ORDER BY D.OHR_DLR_CD ASC
                         ,D.OHR_ORD_RCVE_DT DESC
                         ,D.OHR_DLR_ORD_NO DESC
                         ,C.ODR_ODR_LN ASC
            ) T1 
        ) T2
        <where>
            <if test='firstIndex != -1 and lastIndex != -1'>
                RNUM <![CDATA[<=]]> #{lastIndex}
                AND RNUM <![CDATA[>]]> #{firstIndex}
            </if>
        </where>