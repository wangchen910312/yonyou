<select id="selectItemMastersByCondition" parameterType="ItemMasterSearchVO" resultType="ItemMasterVO">
        /* [chn.bhmc.dms.par.pmm.service.dao.ItemMasterDao.selectItemMastersByCondition] */
        SELECT
            *
        FROM(
            SELECT
                ROWNUM AS RNUM
                , T1.*
            FROM
            (
                SELECT
                    A.DLR_CD
                    ,A.ITEM_CD
                    ,A.SPYR_CD
                    ,A.ITEM_NM
                    ,A.ITEM_EN_NM
                    ,A.BRAND_CD
                    ,A.ABC_IND
                    ,A.CARLINE_CD
                    ,A.CARLINE_CD2
                    ,B.BP_TP
                    ,A.BP_CD
                    ,B.BP_NM
                    ,B.BP_FULL_NM
                    ,A.OLD_RPLC_ITEM_CD
                    ,A.NEW_RPLC_ITEM_CD
                    ,A.LAST_CMPT_ITEM_CD
                    ,A.STOCK_UNIT_CD
                    ,A.NON_MOVING_FLG
                    ,A.ITEM_DSTIN_CD
                    ,A.ITEM_DSTIN_AMOS_CD
                    ,A.END_YN
                    ,A.PRND_YN
                    ,A.DGR_ITEM_YN
                    ,A.RENEW_DT
                    ,A.START_DT
                    ,A.END_DT
                    ,A.ETC_CD1
                    ,A.ETC_CD2
                    ,A.ETC1
                    ,A.ETC2
                    ,A.ETC3
                    ,NVL(A.GR_STRGE_CD,'WHP1') AS GR_STRGE_CD
                    ,TO_CHAR(NVL(A.UPDT_DT,A.REG_DT), 'YYYYMMDDHH24MISS') AS UPDT_DT_STR
                    <!--Q20122300004 配件信息管理-bmp采购价取值逻辑与dms保持一致 update by sunzq3 start  -->
                    <!-- ,NVL((SELECT ROUND(T.APCP_PRICE_NAT_AMT * (1 + FN_GET_VAT(NULL,'ALL')),2)
                            FROM PT_0217I T
                           WHERE (APCP_PART_NO,APCP_APPLY_DATE) IN
                                  (SELECT APCP_PART_NO, MAX(APCP_APPLY_DATE) AS APCP_APPLY_DATE
                                     FROM PT_0217I I
                                    WHERE I.APCP_PART_NO = A.ITEM_CD
                                 GROUP BY APCP_PART_NO) ),0) AS BMP_PURC_PRC -->
                    ,(SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
                                  FROM PT_0218I T2
                                 WHERE (LPR_PNO,LPR_APL_DT) IN (
                                            SELECT LPR_PNO,
                                                   MAX(LPR_APL_DT) AS LPR_APL_DT
                                              FROM PT_0218I T3
                                             --WHERE TRIM(T3.LPR_PNO) = A.ITEM_CD
                                          GROUP BY LPR_PNO)
                                   AND TRIM(T2.LPR_PNO) = A.ITEM_CD)
                     AS BMP_PURC_PRC
                    <!--Q20122300004 配件信息管理-bmp采购价取值逻辑与dms保持一致 update by sunzq3 end  -->
                    ,ROUND(NVL(A.RECOM_RTPRC_AMT,0) * (1 + FN_GET_VAT(NULL,'ALL')),2) AS RECOM_RTPRC_AMT
                    ,A.SUC_CD
                    ,A.PTR_SPEC_MEMO
                FROM DMSDB.PT_0201T A
                LEFT JOIN PT_0211T B ON A.DLR_CD = B.DLR_CD AND A.BP_CD  = B.BP_CD
                WHERE A.DLR_CD = #{sDlrCd}
                <if test='sItemCd != null and sItemCd != ""'>
                    AND A.ITEM_CD LIKE '%'||#{sItemCd}||'%'
                </if>
                <if test='sItemCdOnly != null and sItemCdOnly != ""'>
                    AND A.ITEM_CD = #{sItemCdOnly}
                </if>
                <if test='sSpyrCd != null and sSpyrCd != ""'>
                    AND A.SPYR_CD = #{sSpyrCd}
                </if>
                <if test='sBpTp != null and sBpTp != ""'>
                    AND B.BP_TP = #{sBpTp}
                </if>
                <if test='sItemNm != null and sItemNm != ""'>
                    AND A.ITEM_NM LIKE '%'||#{sItemNm}||'%'
                </if>
                <if test='sItemDstinCd != null and sItemDstinCd != ""'>
                    AND A.ITEM_DSTIN_CD = #{sItemDstinCd}
                </if>
                <if test='sPackage != null and sPackage != ""'>
                    AND A.ITEM_DSTIN_CD in ('04', '06')
                </if>
                <if test='sItemGrpCd != null and sItemGrpCd != ""'>
                    AND A.ITEM_GRP_CD = #{sItemGrpCd}
                </if>
                <if test='sAbcInd != null and sAbcInd != ""'>
                    AND A.ABC_IND = #{sAbcInd}
                </if>
                <if test='sCarlineCd != null and sCarlineCd != ""'>
                    AND A.CARLINE_CD = #{sCarlineCd}
                </if>
                <if test='sCarlineCd2 != null and sCarlineCd2 != ""'>
                    AND A.CARLINE_CD2 = #{sCarlineCd2}
                </if>
                <if test='sBrandCd != null and sBrandCd != ""'>
                    AND A.BRAND_CD = #{sBrandCd}
                </if>
                <if test='sBpCd != null and sBpCd != ""'>
                    AND A.BP_CD LIKE '%'|| #{sBpCd} ||'%'
                </if>
                <if test='sBpNm != null and sBpNm != ""'>
                    AND B.BP_NM LIKE '%'|| #{sBpNm} ||'%'
                </if>
                <if test='sEndYn != null and sEndYn != ""'>
                    AND A.END_YN = #{sEndYn}
                </if>
                <if test='sEtcCd1 != null and sEtcCd1 != ""'>
                    AND A.ETC_CD1 = #{sEtcCd1}
                </if>
                <if test='sEtcCd2 != null and sEtcCd2 != ""'>
                    AND A.ETC_CD2 = #{sEtcCd2}
                </if>
                AND A.ITEM_DSTIN_CD NOT IN ('04', '20') <!-- ????(???, ????) ?? -->
                ORDER BY
                <choose>
                    <when test='sort != null'>
                        <foreach item="item" index="index" collection="sort" open="" separator="," close="">
                        <choose>
                            <when test='item.field == "itemCd"'>A.ITEM_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "itemNm"'>A.ITEM_NM <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "itemNmEng"'>A.ITEM_EN_NM <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "itemDstinCd"'>A.ITEM_DSTIN_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "brandCd"'>A.BRAND_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "carlineCd"'>A.CARLINE_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "carlineCd2"'>A.CARLINE_CD2 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "abcInd"'>A.ABC_IND <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "bpTp"'>A.SPYR_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "bpCd"'>A.BP_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "bpNm"'>B.BP_NM <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "newRplcItemCd"'>A.NEW_RPLC_ITEM_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "oldRplcItemCd"'>A.OLD_RPLC_ITEM_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "lastCmptItemCd"'>A.LAST_CMPT_ITEM_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "stockUnitCd"'>A.STOCK_UNIT_CD <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "nonMovingFlg"'>A.NON_MOVING_FLAG <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "endYn"'>A.END_YN <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "dgrItemYn"'>A.DGR_ITEM_YN <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "renewDt"'>A.RENEW_DT <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "updtDt"'>A.UPDT_DT <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "startDt"'>A.START_DT <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "endDt"'>A.END_DT <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etcCd1"'>A.ETC_CD1 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etcCd2"'>A.ETC_CD2 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etc1"'>A.ETC1 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etc2"'>A.ETC2 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etc3"'>A.ETC3 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <when test='item.field == "etc4"'>A.ETC4 <choose><when test='item.dir == "asc"'>ASC</when><otherwise>DESC</otherwise></choose></when>
                            <otherwise>
                            A.DLR_CD ASC, A.ITEM_CD ASC
                            </otherwise>
                        </choose>
                        </foreach>
                    </when>
                    <otherwise>
                    A.DLR_CD ASC, A.ITEM_CD ASC
                    </otherwise>
                </choose>
            ) T1
            WHERE 1=1
            <if test='firstIndex != -1 and lastIndex != -1'>
               AND ROWNUM <![CDATA[<=]]> #{lastIndex}
            </if>
        )
        <where>
        <if test='firstIndex != -1 and lastIndex != -1'>
            RNUM <![CDATA[>]]> #{firstIndex}
        </if>
        </where>
    </select>