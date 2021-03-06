SELECT
	A .DLR_CD --,TO_CHAR(SYSDATE,'YYYYMM') AS YYMM    
	,
	--TO_CHAR ('202105', 'YYYYMM') AS YYMM --?ĳ? '202105'
	--,
	SUM (AVLB_STOCK_QTY) AS AVLB_STOCK_QTY,
	SUM (RESV_STOCK_QTY) AS RESV_STOCK_QTY,
	SUM (BORROW_QTY) AS BORROW_QTY,
	SUM (RENT_QTY) AS RENT_QTY,
	SUM (STOCK_QTY) AS STOCK_QTY,
	SUM (STOCK_AMT) AS STOCK_AMT,
	SUM (GI_QTY) AS GI_QTY,
	SUM (GI_AMT) AS GI_AMT,
	SUM (PRE_STOCK_QTY) AS PRE_STOCK_QTY,
	SUM (PRE_STOCK_AMT) AS PRE_STOCK_AMT,
	MAX (STOCK_TOT_QTY) AS STOCK_TOT_QTY,
	MAX (STOCK_TOT_AMT) AS STOCK_TOT_AMT,
	CASE
WHEN NVL (SUM(STOCK_AMT), 0) <= 0 THEN
	0
WHEN NVL (MAX(STOCK_TOT_AMT), 0) <= 0 THEN
	0
ELSE
	ROUND (
		SUM (STOCK_AMT) / MAX (STOCK_TOT_AMT),
		3
	)
END STOCK_AMT_RATE,
 CASE
WHEN NVL (SUM(GI_AMT), 0) <= 0 THEN
	0
WHEN NVL (SUM(STOCK_AMT), 0) <= 0 THEN
	0
ELSE
	ROUND (
		SUM (STOCK_AMT) / SUM (GI_AMT),
		3
	) / 30
END MOS,
 CASE
WHEN NVL (SUM(GI_QTY), 0) <= 0 THEN
	0
WHEN NVL (SUM(AVLB_STOCK_QTY), 0) + NVL (SUM(PRE_STOCK_QTY), 0) = 0 THEN
	0
ELSE
	ROUND (
		SUM (GI_QTY) / (
			(
				NVL (SUM(AVLB_STOCK_QTY), 0) + NVL (SUM(PRE_STOCK_QTY), 0)
			) / 2
		),
		3
	)
END INVENTORY_TURNOVER_RATIO,
 'Z' AS IFRESULT,
 TO_CHAR (SYSDATE, 'YYYYMMDDHH24MISS') AS CREATEDATE,
 TO_CHAR (SYSDATE, 'YYYYMMDDHH24MISS') AS UPDATEDATE,
 SYSDATE AS IF_REG_DT,
 'N' AS BAT_STAT_CD
FROM
	(
	SELECT A .DLR_CD,A .AVLB_STOCK_QTY,A .RESV_STOCK_QTY,A .BORROW_QTY,A .RENT_QTY,A .STOCK_QTY,A .STOCK_AMT,NVL (D .GI_QTY_3M, 0) AS GI_QTY,NVL (D .GI_AMT_3M, 0) AS GI_AMT,
		A .PRE_STOCK_QTY,A .PRE_STOCK_AMT,A .STOCK_TOT_QTY,A .STOCK_TOT_AMT
	FROM
		(SELECT A .DLR_CD,A .PLT_CD,A .ITEM_CD,A .AVLB_STOCK_QTY,A .RESV_STOCK_QTY,A .BORROW_QTY,A .RENT_QTY,A .STOCK_QTY,A .STOCK_AMT,A .PRE_STOCK_QTY,A .PRE_STOCK_AMT,
				B.STOCK_TOT_QTY,B.STOCK_TOT_AMT
		 FROM
			(SELECT A .DLR_CD,A .PLT_CD,A .ITEM_CD,A .STOCK_QTY,A .AVLB_STOCK_QTY,A .RESV_STOCK_QTY,A .BORROW_QTY,A .RENT_QTY,A .STOCK_AMT,
					C.AVLB_STOCK_QTY AS PRE_STOCK_QTY,C.STOCK_AMT AS PRE_STOCK_AMT
			 FROM
				(SELECT A .DLR_CD,A .PLT_CD,A .ITEM_CD --,SUM(NVL(A.AVLB_STOCK_QTY,0)) + SUM(NVL(A.RESV_STOCK_QTY,0)) - SUM(NVL(A.BORROW_QTY,0)) + SUM(NVL(A.RENT_QTY,0)) AS STOCK_QTY   --????????
						,SUM (NVL2 (A .ITEM_CD,(NVL (A .AVLB_STOCK_QTY, 0) + NVL (A .RESV_STOCK_QTY, 0) + NVL (A .CLAM_STOCK_QTY, 0)),0)) AS STOCK_QTY --????????
						,SUM (NVL(A .AVLB_STOCK_QTY, 0)) AS AVLB_STOCK_QTY,SUM (NVL(A .RESV_STOCK_QTY, 0)) AS RESV_STOCK_QTY,SUM (NVL(A .BORROW_QTY, 0)) AS BORROW_QTY
						,SUM (NVL(A .RENT_QTY, 0)) AS RENT_QTY --  ,SUM((NVL(A.AVLB_STOCK_QTY,0) + NVL(A.RESV_STOCK_QTY,0) - NVL(A.BORROW_QTY,0) + NVL(A.RENT_QTY,0)) * B.MOVING_AVG_PRC) AS STOCK_AMT   --????????
						,SUM (NVL2 (A .ITEM_CD,(NVL (A .AVLB_STOCK_QTY, 0) + NVL (A .RESV_STOCK_QTY, 0) + NVL (A .CLAM_STOCK_QTY, 0)),0) * B.MOVING_AVG_PRC) AS STOCK_AMT --????????
				 FROM
					PT_0301T A
					LEFT JOIN PT_0208T B ON A .DLR_CD = B.DLR_CD
					AND A .STRGE_CD = B.STRGE_CD AND A .ITEM_CD = B.ITEM_CD
					GROUP BY A .DLR_CD,A .PLT_CD,A .ITEM_CD
				 ) A
				 LEFT JOIN (SELECT DLR_CD,PLT_CD,ITEM_CD,YY_MM,
							  SUM (NVL(AVLB_STOCK_QTY, 0)) + SUM (NVL(RESV_STOCK_QTY, 0)) - SUM (NVL(BORROW_QTY, 0)) + SUM (NVL(RENT_QTY, 0)) AS STOCK_QTY,
							  SUM (NVL(AVLB_STOCK_QTY, 0)) AS AVLB_STOCK_QTY,
							  SUM (NVL(RESV_STOCK_QTY, 0)) AS RESV_STOCK_QTY --????
							  ,SUM (NVL(BORROW_QTY, 0)) AS BORROW_QTY,
							  SUM (NVL(RENT_QTY, 0)) AS RENT_QTY,
							  SUM (NVL (PRE_MM_DDLN_STOCK_AMT, 0)) AS PRE_STOCK_AMT,
							  SUM ((NVL (AVLB_STOCK_QTY, 0) + NVL (RESV_STOCK_QTY, 0) - NVL (BORROW_QTY, 0) + NVL (RENT_QTY, 0)) * PSNT_MM_DDLN_MOVE_AVG_PRC) AS STOCK_AMT
				 			FROM
							  PT_0902T
						        WHERE YY_MM = TO_CHAR (ADD_MONTHS (TO_DATE ('202105' || '01', 'YYYYMMDD') ,- 1),'YYYYMM')
						    GROUP BY DLR_CD,PLT_CD,ITEM_CD,YY_MM
				 ) C ON A .DLR_CD = C.DLR_CD
				 AND A .PLT_CD = C.PLT_CD
				 AND A .ITEM_CD = C.ITEM_CD
		 ) A,
		 (SELECT SUM (STOCK_QTY) AS STOCK_TOT_QTY,SUM (STOCK_AMT) AS STOCK_TOT_AMT
		  FROM(
		      SELECT A .DLR_CD,A .PLT_CD,A .ITEM_CD,
					SUM (NVL(A .AVLB_STOCK_QTY, 0)) + SUM (NVL(A .RESV_STOCK_QTY, 0)) - SUM (NVL(A .BORROW_QTY, 0)) + SUM (NVL(A .RENT_QTY, 0)) AS STOCK_QTY,
					SUM ((NVL (A .AVLB_STOCK_QTY, 0) + NVL (A .RESV_STOCK_QTY, 0) - NVL (A .BORROW_QTY, 0) + NVL (A .RENT_QTY, 0)) * B.MOVING_AVG_PRC) AS STOCK_AMT
			  FROM PT_0301T A
			  LEFT JOIN PT_0208T B ON A .DLR_CD = B.DLR_CD
			  AND A .STRGE_CD = B.STRGE_CD AND A .ITEM_CD = B.ITEM_CD
			  GROUP BY  A .DLR_CD, A .PLT_CD, A .ITEM_CD
			  ) A
		  )B
	) A
	INNER JOIN PT_0201T B ON A .DLR_CD = B.DLR_CD
	AND A .ITEM_CD = B.ITEM_CD
	LEFT JOIN (
	  SELECT A .DLR_CD,A .PLT_CD,A .ITEM_CD,SUM (GI_BASE_AMT) AS GI_AMT_3M,SUM (GI_QTY) AS GI_QTY_3M
	  FROM(
		 SELECT A .DLR_CD,A .MVT_DOC_YY_MM AS YY_MM,A .MVT_DOC_NO,A .MVT_TP,D .MVT_GR_GI_TP,B.ITEM_CD,C.ITEM_DSTIN_CD AS ITEM_TP,B.MVT_DOC_LINE_NO,
				B.PLT_CD,B.STRGE_CD--update GI_QTY ???????? by tianjx  
				,CASE WHEN A .MVT_TP IN ('11','14','15','71','74','75','41','43','45','47','48','61','65') THEN NVL (B.ITEM_QTY, 0)
				WHEN A .MVT_TP IN ('21', '23', '25') THEN
				CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H' THEN NVL (B.ITEM_QTY, 0)
				ELSE 0 END WHEN A .MVT_TP IN ('22', '24', '26') THEN CASE
				WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H' THEN NVL (B.ITEM_QTY, 0)
				ELSE 0 END
				WHEN A .MVT_TP IN ('12','13','16','72','73','76','42','44','46','62','66') THEN NVL (B.ITEM_QTY, 0) * - 1
				ELSE 0 END GI_QTY --????
					--update GI_QTY ???????? by tianjx  
					--update Gi_Amt ???????? by tianjx  
				,CASE WHEN A .MVT_TP IN ('11','14','15','71','74','75','41','43','45','47','48','61','65') THEN NVL (B.MOVING_AVG_AMT, 0)
				WHEN A .MVT_TP IN ('21', '23', '25') THEN CASE
				WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H' THEN NVL (B.MOVING_AVG_AMT, 0)
				ELSE 0 END
				WHEN A .MVT_TP IN ('22', '24', '26') THEN CASE
				WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H' THEN NVL (B.MOVING_AVG_AMT, 0)
				ELSE 0 END
				WHEN A .MVT_TP IN ('12','13','16','72','73','76','42','44','46','62','66') THEN NVL (B.MOVING_AVG_AMT, 0) * - 1
				ELSE 0 END GI_BASE_AMT --????
				--update Gi_Amt ???????? by tianjx  
				,CASE WHEN A .MVT_TP IN ('61') THEN NVL (B.ITEM_QTY, 0)
                WHEN A .MVT_TP IN ('62') THEN NVL (B.ITEM_QTY, 0) * - 1 ELSE 0 
                END OBT_GI_QTY,
			    CASE WHEN A .MVT_TP IN ('61') THEN NVL (B.SALE_AMT, 0) WHEN A .MVT_TP IN ('62') THEN NVL (B.SALE_AMT, 0) * - 1 ELSE 0
				END OBT_GI_AMT,
				CASE WHEN A .MVT_TP IN ('61') THEN B.MOVING_AVG_PRC WHEN A .MVT_TP IN ('62') THEN NVL (B.MOVING_AVG_PRC, 0) * - 1 ELSE 0
                END OBT_GI_BASE_AMT,
                NVL ( E .PAR_SALE_ORD_NO,B.REF_DOC_NO) AS REF_DOC_NO,
				NVL (E .PAR_SALE_ORD_LINE_NO,B.REF_DOC_LINE_NO) AS REF_DOC_LINE_NO
         FROM PT_0311T A
		 INNER JOIN PT_0312T B ON A .DLR_CD = B.DLR_CD
         AND A .MVT_DOC_YY_MM = B.MVT_DOC_YY_MM
         AND A .MVT_DOC_NO = B.MVT_DOC_NO
		 INNER JOIN PT_0201T C ON A .DLR_CD = C.DLR_CD
		 AND B.ITEM_CD = C.ITEM_CD
		 LEFT JOIN PT_0102T D ON A .DLR_CD = D .DLR_CD
		 AND A .MVT_TP = D .MVT_TP
		 LEFT JOIN (
			SELECT
				A .DLR_CD,A .PAR_SALE_ORD_NO,A .SALE_TP,B.PAR_SALE_ORD_LINE_NO,B.ITEM_CD,
				B.REF_DOC_NO AS RETURN_DOC_NO,B.REF_DOC_LINE_NO AS RETURN_DOC_LINE_NO
			FROM
		PT_0521T A
		INNER JOIN PT_0522T B ON A .DLR_CD = B.DLR_CD
		AND A .PAR_SALE_ORD_NO = B.PAR_SALE_ORD_NO
	) E ON A .DLR_CD = E .DLR_CD
	AND B.REF_DOC_NO = E .RETURN_DOC_NO
	AND B.REF_DOC_LINE_NO = E .RETURN_DOC_LINE_NO
	WHERE
	A .MVT_DOC_YY_MM = TO_CHAR (
		TO_DATE ('202105' || '01', 'YYYYMMDD'),
		'YYYYMM'
	)
	AND D .MVT_GR_GI_TP = 'I'
	AND A .MVT_TP IN ('11','12','13','14','71','72','73','74','61','62')
) A
	GROUP BY
	A .DLR_CD,A .PLT_CD,A .ITEM_CD
) D ON A .DLR_CD = D .DLR_CD
	AND A .PLT_CD = D .PLT_CD
	AND A .ITEM_CD = D .ITEM_CD 
LEFT JOIN PT_0211T E ON A .DLR_CD = E .DLR_CD
	AND B.BP_CD = E .BP_CD
	WHERE B.ITEM_DSTIN_CD != '20' --AND E.BP_TP = '01'                            
) A
GROUP BY
	A .DLR_CD