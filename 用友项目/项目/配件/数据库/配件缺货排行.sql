select 
--E.OHR_DLR_ORD_NO--订单编号
--,E.DLR_CD--经销商代码
F.ITEM_CD--缺件编码
,F.ITEM_NM--缺件名称
,E.ODR_CFM_APL_FLG--
,E.ODR_LST_BO_QT----缺件数量
,round(E.BO_AVG_DAY,2) as BO_AVG_DAY--缺件时长
 ,(NVL((SELECT NVL(ROUND(LPR_LST_PRC * ( 1 + FN_GET_VAT(null,'ALL')),2),0)
  FROM PT_0218I T2
  WHERE (LPR_PNO,LPR_APL_DT) IN (
            SELECT LPR_PNO,
                   MAX(LPR_APL_DT) AS LPR_APL_DT
              FROM PT_0218I T3
          GROUP BY LPR_PNO)
   AND TRIM(T2.LPR_PNO) = E.ODR_CFM_PNO),0) * E.ODR_LST_BO_QT) AS BMP_PURC_PRC --缺件金额（单价*数量）
from (
SELECT
C.ODR_CFM_PNO,C.ODR_CFM_APL_FLG,C.ODR_LST_BO_QT,(CASE WHEN SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0 AND G.INVC_DT IS NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL  THEN 1 ELSE 0 END ) = 0 
THEN 0 ELSE 
SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0  AND G.INVC_DT IS NULL  AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN TO_NUMBER(SYSDATE-TO_DATE(D.OHR_ORD_RCVE_DT, 'yyyyMMdd')) ELSE 0 END) 
END) AS BO_AVG_DAY
FROM (
SELECT
A.OHR_ORD_NO
,A.OHR_ORD_RCVE_DT
,A.OHR_DLR_ORD_NO
,B.DLR_NM
,B.DLR_CD
FROM 
 (
    SELECT
    *
    FROM CM_0101T
    WHERE DMS_USE_YN = 'Y'
    -- AND  OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
    AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
) B INNER JOIN PT_0421I A
ON A.OHR_DLR_CD = B.DLR_CD
WHERE 1=1 
--<if test='sPurcRegDtFr != null'>
--	AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--</if>
--<if test='sPurcRegDtTo != null'>
--	AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--</if>
) D INNER JOIN  PT_0422I C
ON C.ODR_ODR_NO = D.OHR_ORD_NO
LEFT  JOIN (  SELECT INVC_DT,INR_ORD_LN,INR_ORD_NO FROM (
    SELECT
      DLR_CD
    FROM
      CM_0101T
    WHERE DMS_USE_YN = 'Y'
--       AND  OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
      AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
    ) M INNER JOIN 
        (SELECT
            INR_DLR_CD
            ,INR_ORD_NO
            ,INR_ORD_LN
            ,MAX(INR_INV_DT) AS INVC_DT
        FROM PT_0435I
        WHERE 1=1
        GROUP BY INR_DLR_CD, INR_ORD_NO, INR_ORD_LN
    ) N ON N.INR_DLR_CD = M.DLR_CD
		)G
ON C.ODR_ODR_NO = G.INR_ORD_NO AND C.ODR_ODR_LN = G.INR_ORD_LN
group by C.ODR_CFM_PNO,C.ODR_CFM_APL_FLG,C.ODR_LST_BO_QT
)E LEFT JOIN (
SELECT
ITEM_CD
,ITEM_NM
FROM PT_0201T
) F ON F.ITEM_CD = TRIM(E.ODR_CFM_PNO)
WHERE E.ODR_CFM_APL_FLG != 'N'
--  AND E.ODR_LST_BO_QT <![CDATA[>]]> 0
AND E.ODR_LST_BO_QT > 0;

----
CASE WHEN SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0 AND G.INVC_DT IS NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL  THEN 1 ELSE 0 END ) = 0 
THEN 0 
ELSE 
SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0  AND G.INVC_DT IS NULL  AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN TO_NUMBER(SYSDATE-TO_DATE(D.OHR_ORD_RCVE_DT, 'yyyyMMdd')) ELSE 0 END) 
END AS BO_AVG_DAY -- 配件缺货总时长

-----
SELECT C.ODR_CFM_PNO,C.ODR_CFM_APL_FLG,C.ODR_LST_BO_QT FROM PT_0422I C

select * from 
SELECT
A.OHR_ORD_NO
,A.OHR_ORD_RCVE_DT
,A.OHR_DLR_ORD_NO
,B.DLR_NM
,B.DLR_CD
FROM 
 (
    SELECT
    *
    FROM CM_0101T
    WHERE DMS_USE_YN = 'Y'
    -- AND  OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
    AND OPEN_DT <= TO_CHAR(SYSDATE,'YYYYMMDD')   
) B INNER JOIN PT_0421I A
ON A.OHR_DLR_CD = B.DLR_CD
WHERE 1=1 
--<if test='sPurcRegDtFr != null'>
--	AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--</if>
--<if test='sPurcRegDtTo != null'>
--	AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--</if>
) D INNER JOIN  PT_0422I C
ON C.ODR_ODR_NO = D.OHR_ORD_NO


--C
SELECT ODR_LST_BO_QT from PT_0422I


--G

SELECT * FROM (
  SELECT
    DLR_CD
  FROM
    CM_0101T
  WHERE DMS_USE_YN = 'Y'
--     AND  OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
  AND  OPEN_DT <= TO_CHAR (SYSDATE, 'YYYYMMDD')
) F INNER JOIN 
    (SELECT
        INR_DLR_CD
        ,INR_ORD_NO
        ,INR_ORD_LN
        ,MAX(INR_INV_NO) AS MOBIS_INVC_NO
        ,MAX(TRIM(INR_GCN_BL_NO)) AS BOX_NO
        ,MAX(INR_INV_DT) AS INVC_DT
    FROM PT_0435I
    WHERE 1=1
    GROUP BY INR_DLR_CD, INR_ORD_NO, INR_ORD_LN
   ) E ON E.INR_DLR_CD = F.DLR_CD

-----d
				SELECT
					A .*,
					B.DLR_CD,
					B.SDPT_CD,
					B.DIST_OFFICE_CD
				FROM
					(
						SELECT
							*
						FROM
							CM_0101T 
						WHERE DMS_USE_YN = 'Y'
							AND OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
					) B
				INNER JOIN (
					SELECT
						*
					FROM
						PT_0421I
					  WHERE 1=1 
						<if test='sPurcRegDtFr != null'>
		                  AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
		                </if>
		                <if test='sPurcRegDtTo != null'>
		                  AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
		                </if>
				) A ON A .OHR_DLR_CD = B.DLR_CD



---

SELECT
	         SUM (NVL(C.ODR_ODR_QT, 0)) AS ODR_QT  ----订购数量
			,COUNT (C.ODR_ODR_PNO) AS ODR_PNO_QT   ---订购品种
			,SUM ( DECODE (NVL (C.ODR_LST_BO_QT, 0),0,0,1)) as BO_PNO_QT---缺件品种
			,SUM (NVL(C.ODR_LST_BO_QT, 0)) AS BO_QT ---缺件数量
			,H.DIVI_NM
			,H.OFF_NM
            ,CASE WHEN SUM(CASE WHEN G.INVC_DT IS NOT NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN 1 ELSE 0 END ) = 0 
				 THEN 0 
				ELSE 
				 SUM(CASE WHEN G.INVC_DT IS NOT NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN  TO_NUMBER(TO_DATE(G.INVC_DT, 'yyyyMMdd')-TO_DATE(D.OHR_ORD_RCVE_DT, 'yyyyMMdd')) ELSE 0 END)/SUM(CASE WHEN G.INVC_DT IS NOT NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL  THEN 1 ELSE 0 END ) 
				END AS AVG_DAY  --- 配件发货总时长/发货订单明细条数
		     ,COUNT(DISTINCT D.DLR_CD) DLR_CNT ----店数
		     ,CASE WHEN SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0 AND G.INVC_DT IS NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL  THEN 1 ELSE 0 END ) = 0 
		               THEN 0 
		              ELSE 
		               SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0  AND G.INVC_DT IS NULL  AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN TO_NUMBER(SYSDATE-TO_DATE(D.OHR_ORD_RCVE_DT, 'yyyyMMdd')) ELSE 0 END)/SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0  AND G.INVC_DT IS NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL   THEN 1 ELSE 0 END ) 
		              END AS BO_AVG_DAY -- 配件缺货总时长/缺货订单明细条数
		     ,SUM(NVL(PURC_AMT,0)) AS TOT_PURC_AMT --订单总金额
		     ,COUNT(DISTINCT OHR_ORD_NO) AS ODR_NO_CNT ---订单数量
	    FROM
		(
				SELECT
					A .*,
					B.DLR_CD,
					B.SDPT_CD,
					B.DIST_OFFICE_CD
				FROM
					(
						SELECT
							*
						FROM
							CM_0101T 
						WHERE DMS_USE_YN = 'Y'
							AND OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
					) B
				INNER JOIN (
					SELECT
						*
					FROM
						PT_0421I
					  WHERE 1=1 
						<if test='sPurcRegDtFr != null'>
		                  AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
		                </if>
		                <if test='sPurcRegDtTo != null'>
		                  AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
		                </if>
				) A ON A .OHR_DLR_CD = B.DLR_CD
		) D
		INNER JOIN 
		(SELECT CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') THEN
                                               CASE WHEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) > 0 
                                                 THEN ROUND((ODR_CFM_QT - 
                                                      NVL(ODR_XCL_QT,0)) * (Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)),2) ELSE 0 END
                                           WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') THEN
                                                CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0
                                                       THEN ROUND((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2)
                                                    ELSE 0 END
                                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT
                ,ODR_ODR_QT
                ,ODR_ODR_NO
                ,ODR_ODR_PNO
                ,ODR_LST_BO_QT
                ,ODR_ODR_LN
                from PT_0422I) C ON C.ODR_ODR_NO = D .OHR_ORD_NO
		LEFT  JOIN (  SELECT * FROM (
						SELECT
							DLR_CD
						FROM
							CM_0101T
						WHERE DMS_USE_YN = 'Y'
						   AND  OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
					) F INNER JOIN 
		                    (SELECT
		                        INR_DLR_CD
		                        ,INR_ORD_NO
		                        ,INR_ORD_LN
		                        ,MAX(INR_INV_NO) AS MOBIS_INVC_NO
		                        ,MAX(TRIM(INR_GCN_BL_NO)) AS BOX_NO
		                        ,MAX(INR_INV_DT) AS INVC_DT
		                    FROM PT_0435I
		                    WHERE 1=1
		                    GROUP BY INR_DLR_CD, INR_ORD_NO, INR_ORD_LN
		                ) E ON E.INR_DLR_CD = F.DLR_CD
		)G
		ON C.ODR_ODR_NO = G.INR_ORD_NO AND C.ODR_ODR_LN = G.INR_ORD_LN
		RIGHT JOIN
		(SELECT SDPT.DIVI_CD,SDPT.DIVI_NM ,OFFICE.OFF_CD,OFFICE.OFF_NM from  CM_2501T SDPT inner join CM_2601T OFFICE on SDPT.DIVI_CD = OFFICE.DIVI_CD) H 
		ON D.SDPT_CD = H.DIVI_CD  AND D.DIST_OFFICE_CD = H.OFF_CD
		WHERE 1=1 
		   <if test='sDivision != null and sDivision != ""'>
                AND H.DIVI_CD = #{sDivision}
            </if>
            <if test='sOffice != null and sOffice != ""'>
                AND H.OFF_CD = #{sOffice}
            </if>
		  GROUP BY
			  H.DIVI_NM,
			  H.OFF_NM,
		      H.DIVI_CD,
		      H.OFF_CD


---------------------------------------------




select 
CASE WHEN SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0 AND G.INVC_DT IS NULL AND D.OHR_ORD_RCVE_DT  IS NOT NULL  THEN 1 ELSE 0 END ) = 0 
THEN 0 ELSE 
SUM(CASE WHEN NVL (C.ODR_LST_BO_QT, 0)>0  AND G.INVC_DT IS NULL  AND D.OHR_ORD_RCVE_DT  IS NOT NULL THEN TO_NUMBER(SYSDATE-TO_DATE(D.OHR_ORD_RCVE_DT, 'yyyyMMdd')) ELSE 0 END) 
END AS BO_AVG_DAY
 FROM
		(
				SELECT
					A .*,
					B.DLR_CD,
					B.SDPT_CD,
					B.DIST_OFFICE_CD
				FROM
					(
						SELECT
							*
						FROM
							CM_0101T 
						WHERE DMS_USE_YN = 'Y'
--							AND OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
              AND OPEN_DT <= TO_CHAR (SYSDATE, 'YYYYMMDD')
					) B
				INNER JOIN (
					SELECT
						*
					FROM
						PT_0421I
					  WHERE 1=1 
--						<if test='sPurcRegDtFr != null'>
--              AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[>=]]> TO_DATE(TO_CHAR(#{sPurcRegDtFr},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--            </if>
--            <if test='sPurcRegDtTo != null'>
--              AND TO_DATE(OHR_ORD_RCVE_DT,'YYYY-MM-DD HH24:MI:SS') <![CDATA[<=]]> TO_DATE(TO_CHAR(#{sPurcRegDtTo},'YYYYMMDD'),'YYYY-MM-DD HH24:MI:SS')
--            </if>
				) A ON A .OHR_DLR_CD = B.DLR_CD
		) D
		INNER JOIN 
		(SELECT CASE WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('C','D','Y') THEN
                                               CASE WHEN ODR_CFM_QT - NVL(ODR_XCL_QT,0) > 0 
                                                 THEN ROUND((ODR_CFM_QT - 
                                                      NVL(ODR_XCL_QT,0)) * (Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)),2) ELSE 0 END
                                           WHEN (CASE WHEN ODR_ODR_DTL_PRC = ' ' THEN 'P' ELSE ODR_ODR_DTL_PRC END) IN ('X','Z') THEN
                                                CASE WHEN NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0) > 0
                                                       THEN ROUND((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * (NVL(ODR_SHP_QT,0) + NVL(ODR_ALC_QT,0) + NVL(ODR_OPIC_QT,0) + NVL(ODR_PAKD_QT,0) + NVL(ODR_INV_QT,0)),2)
                                                    ELSE 0 END
                                              ELSE  round((Nvl(Odr_Upce_Ndp,0) + Nvl(Odr_Vat_Amt,0)) * Nvl(ODR_CFM_QT,0),2) END PURC_AMT
                ,ODR_ODR_QT
                ,ODR_ODR_NO
                ,ODR_ODR_PNO
                ,ODR_LST_BO_QT
                ,ODR_ODR_LN
                from PT_0422I) C ON C.ODR_ODR_NO = D .OHR_ORD_NO
		LEFT  JOIN (  SELECT * FROM (
						SELECT
							DLR_CD
						FROM
							CM_0101T
						WHERE DMS_USE_YN = 'Y'
						  --AND OPEN_DT <![CDATA[<=]]> TO_CHAR (SYSDATE, 'YYYYMMDD')
              AND OPEN_DT <= TO_CHAR (SYSDATE, 'YYYYMMDD')
					) F INNER JOIN 
		                    (SELECT
		                        INR_DLR_CD
		                        ,INR_ORD_NO
		                        ,INR_ORD_LN
		                        ,MAX(INR_INV_NO) AS MOBIS_INVC_NO
		                        ,MAX(TRIM(INR_GCN_BL_NO)) AS BOX_NO
		                        ,MAX(INR_INV_DT) AS INVC_DT
		                    FROM PT_0435I
		                    WHERE 1=1
		                    GROUP BY INR_DLR_CD, INR_ORD_NO, INR_ORD_LN
		                ) E ON E.INR_DLR_CD = F.DLR_CD
		)G
		ON C.ODR_ODR_NO = G.INR_ORD_NO AND C.ODR_ODR_LN = G.INR_ORD_LN;