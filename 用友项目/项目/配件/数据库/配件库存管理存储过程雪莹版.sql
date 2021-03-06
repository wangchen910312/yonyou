CREATE or REPLACE-- added during DDL generation.
PROCEDURE       SP_PAR_STOCK_ANALYSIS_IF_TO_DCS (
  G_DATE IN NUMBER  
)
IS    
    L_CALL_TIMESTAMP    TIMESTAMP;
    
    V_ERR_MSG           VARCHAR2(4000);
    V_LOG_CNT           Number := 0;  
    V_DATE              Number := G_DATE;  
    V_MONTH             VARCHAR2(6);
    



BEGIN

        L_CALL_TIMESTAMP := SYSTIMESTAMP;    --????? ?? ??(???? ??? ?? ??????? ??)
        
        IF V_DATE IS NULL THEN
           V_DATE := 1;
        END IF;
        
        V_MONTH := TO_CHAR(SYSDATE - V_DATE, 'YYYYMM');
                
        BEGIN
            PR_GEN_CM_PROC_LOG_START(
              L_CALL_TIMESTAMP
             ,'SP_PAR_STOCK_ANALYSIS_IF_TO_DCS'
             ,'BATCH'
             ,'SYSTEM'
             ,G_DATE
             ,V_MONTH
             ,NULL
             ,NULL
             ,NULL
             ,NULL
             ,NULL
             ,NULL
             ,NULL
            );
        EXCEPTION
           WHEN OTHERS THEN
             RAISE_APPLICATION_ERROR(-20007,'LOG_START_ERROR');
        END;                
        
        BEGIN
        	MERGE INTO PT_0320I T1
		        USING (
		                SELECT  A.DLR_CD
				                --,TO_CHAR(SYSDATE,'YYYYMM') AS YYMM    
								,TO_CHAR(V_MONTH,'YYYYMM') AS YYMM--?ĳ? V_MONTH
				                ,SUM(AVLB_STOCK_QTY) AS AVLB_STOCK_QTY
				                ,SUM(RESV_STOCK_QTY) AS RESV_STOCK_QTY
				                ,SUM(BORROW_QTY) AS BORROW_QTY
				                ,SUM(RENT_QTY) AS RENT_QTY
				                ,SUM(STOCK_QTY) AS STOCK_QTY
				                ,SUM(STOCK_AMT) AS STOCK_AMT
				                ,SUM(GI_QTY) AS GI_QTY                                                                                                
				                ,SUM(GI_AMT) AS GI_AMT 
				                ,SUM(PRE_STOCK_QTY) AS PRE_STOCK_QTY         
				                ,SUM(PRE_STOCK_AMT) AS PRE_STOCK_AMT          
				                ,MAX(STOCK_TOT_QTY) AS STOCK_TOT_QTY
				                ,MAX(STOCK_TOT_AMT) AS STOCK_TOT_AMT
				                ,CASE WHEN NVL(SUM(STOCK_AMT),0)  <=  0 THEN 0
				                      WHEN NVL(MAX(STOCK_TOT_AMT),0)  <=  0 THEN 0
				                      ELSE ROUND(SUM(STOCK_AMT)/MAX(STOCK_TOT_AMT), 3)
				                 END STOCK_AMT_RATE 
				                ,CASE WHEN NVL(SUM(GI_AMT),0)  <=  0 THEN 0
				                      WHEN NVL(SUM(STOCK_AMT),0)  <=  0 THEN 0
				                      ELSE ROUND(SUM(STOCK_AMT)/SUM(GI_AMT), 3) / 30
				                 END MOS 
				                /*,CASE WHEN NVL(SUM(GI_QTY),0)   <=   0 THEN 0  
				                      WHEN NVL(SUM(AVLB_STOCK_QTY),0) + NVL(SUM(PRE_STOCK_QTY),0) = 0 THEN 0
				                      ELSE ROUND(SUM(GI_QTY) / ((NVL(SUM(AVLB_STOCK_QTY),0) + NVL(SUM(PRE_STOCK_QTY),0))/2), 3)
				                 END INVENTORY_TURNOVER_RATIO*/
				                 
				                 ---- 20210621???¿?????ת??=???³????ɱ??£??³?????????+??ĩ????????)/2-------
				                , CASE WHEN SUM(PRE_STOCK_AMT)+SUM(STOCK_AMT) = 0 THEN 0
				                       ELSE ROUND(NVL(SUM(GI_BASE_AMT),0)/((SUM(PRE_STOCK_AMT)+SUM(STOCK_AMT))/2),3)
				                       END INVENTORY_TURNOVER_RATIO
				                       
				                ---- 20210621???¿?????ת??=???³????ɱ??£??³?????????+??ĩ????????)/2-------
				                ,'Z' AS IFRESULT
				                ,TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') AS CREATEDATE
                                ,TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') AS UPDATEDATE
                                ,SYSDATE AS IF_REG_DT
                                ,'N' AS BAT_STAT_CD
                                ,SUM(PAR_SALE_QTY) AS PAR_SALE_QTY --????????
                                ,SUM(SER_SALE_QTY) AS SER_SALE_QTY --????????
                                ,SUM(PAR_SALE_BASE_AMT) AS PAR_SALE_BASE_AMT --???۽???
                                ,SUM(SER_SALE_BASE_AMT) AS SER_SALE_BASE_AMT --????????
				           FROM (
						            SELECT   A.DLR_CD
							                ,A.AVLB_STOCK_QTY       
							                ,A.RESV_STOCK_QTY       
							                ,A.BORROW_QTY           
							                ,A.RENT_QTY             
							                ,A.STOCK_QTY            
							                ,A.STOCK_AMT   
							                ,NVL(D.GI_QTY_3M,0) AS GI_QTY
							                ----20210621--------
							                ,NVL(D.GI_AMT_3M,0) AS GI_AMT ----????????
							                ,NVL(D.GI_BASE_AMT_3M,0) AS GI_BASE_AMT ----?????ɱ?????
							                ,NVL(D.PAR_SALE_QTY,0) AS PAR_SALE_QTY  ---????????????
							                ,NVL(D.SER_SALE_QTY,0) AS SER_SALE_QTY  ---????ά?޳???????
							              	,NVL(D.PAR_SALE_BASE_AMT,0) AS PAR_SALE_BASE_AMT ---???????۽???
							              	,NVL(D.SER_SALE_BASE_AMT,0) AS SER_SALE_BASE_AMT ---????????????
							                ----20210621--------

							                ,A.PRE_STOCK_QTY        
							                ,A.PRE_STOCK_AMT        
							                ,A.STOCK_TOT_QTY        
							                ,A.STOCK_TOT_AMT    
							           FROM (
								              SELECT A.DLR_CD
								                    ,A.PLT_CD
								                    ,A.ITEM_CD
								                    ,A.AVLB_STOCK_QTY       
								                    ,A.RESV_STOCK_QTY       
								                    ,A.BORROW_QTY           
								                    ,A.RENT_QTY             
								                    ,A.STOCK_QTY            
								                    ,A.STOCK_AMT            
								                    ,A.PRE_STOCK_QTY        
								                    ,A.PRE_STOCK_AMT        
								                    ,B.STOCK_TOT_QTY        
								                    ,B.STOCK_TOT_AMT        
								                FROM (
										                 SELECT  A.DLR_CD
										                        ,A.PLT_CD
										                        ,A.ITEM_CD
										                        ,A.STOCK_QTY   
										                        ,A.AVLB_STOCK_QTY                         
										                        ,A.RESV_STOCK_QTY                         
										                        ,A.BORROW_QTY                           
										                        ,A.RENT_QTY                           
										                        ,A.STOCK_AMT                         
										                        ,C.AVLB_STOCK_QTY AS PRE_STOCK_QTY
										                        ,C.STOCK_AMT AS PRE_STOCK_AMT
										                   FROM (
											                        SELECT   A.DLR_CD
											                                ,A.PLT_CD
											                                ,A.ITEM_CD
											                                ,SUM(NVL(A.AVLB_STOCK_QTY,0)) + SUM(NVL(A.RESV_STOCK_QTY,0)) - SUM(NVL(A.BORROW_QTY,0)) + SUM(NVL(A.RENT_QTY,0)) AS STOCK_QTY   --????????+Ԥ??????-????????+???????? = ????????
																			--,SUM(NVL2(A.ITEM_CD,(NVL(A.AVLB_STOCK_QTY,0) + NVL(A.RESV_STOCK_QTY,0) + NVL(A.CLAM_STOCK_QTY,0)),0)) AS STOCK_QTY   --????????+Ԥ??????+ ?????????? ??ĩ????
											                                ,SUM(NVL(A.AVLB_STOCK_QTY,0)) AS AVLB_STOCK_QTY
											                                ,SUM(NVL(A.RESV_STOCK_QTY,0)) AS RESV_STOCK_QTY
											                                ,SUM(NVL(A.BORROW_QTY,0)) AS BORROW_QTY
											                                ,SUM(NVL(A.RENT_QTY,0)) AS RENT_QTY
											                                ,SUM((NVL(A.AVLB_STOCK_QTY,0) + NVL(A.RESV_STOCK_QTY,0) - NVL(A.BORROW_QTY,0) + NVL(A.RENT_QTY,0)) * B.MOVING_AVG_PRC) AS STOCK_AMT   --????????
																		    --,SUM(NVL2(A.ITEM_CD,(NVL(A.AVLB_STOCK_QTY,0) + NVL(A.RESV_STOCK_QTY,0) + NVL(A.CLAM_STOCK_QTY,0)),0) * B.MOVING_AVG_PRC) AS STOCK_AMT   --????????
											                            FROM PT_0301T A
											                                 LEFT JOIN PT_0208T B 
											                                   ON A.DLR_CD = B.DLR_CD 
											                                  AND A.STRGE_CD = B.STRGE_CD 
											                                  AND A.ITEM_CD = B.ITEM_CD
											                           GROUP BY A.DLR_CD, A.PLT_CD, A.ITEM_CD
										                         ) A                    
												                 LEFT JOIN (
												                     SELECT  
																	 DLR_CD
												                            ,PLT_CD
												                            ,ITEM_CD
												                            ,YY_MM
												                            ,SUM(NVL(AVLB_STOCK_QTY,0)) + SUM(NVL(RESV_STOCK_QTY,0)) - SUM(NVL(BORROW_QTY,0)) + SUM(NVL(RENT_QTY,0)) AS STOCK_QTY
												                            ,SUM(NVL(AVLB_STOCK_QTY,0)) AS AVLB_STOCK_QTY
												                            ,SUM(NVL(RESV_STOCK_QTY,0)) AS RESV_STOCK_QTY  --????
												                            ,SUM(NVL(BORROW_QTY,0)) AS BORROW_QTY
												                            ,SUM(NVL(RENT_QTY,0)) AS RENT_QTY												                           
												                            ,SUM(NVL(PRE_MM_DDLN_STOCK_AMT,0)) AS PRE_STOCK_AMT
												                            ,SUM((NVL(AVLB_STOCK_QTY,0) + NVL(RESV_STOCK_QTY,0) - NVL(BORROW_QTY,0) + NVL(RENT_QTY,0)) * PSNT_MM_DDLN_MOVE_AVG_PRC) AS STOCK_AMT
												                       FROM  PT_0902T
												                      WHERE  YY_MM = TO_CHAR(ADD_MONTHS(TO_DATE(V_MONTH||'01','YYYYMMDD'),-1),'YYYYMM')
																	
												                      GROUP BY DLR_CD, PLT_CD, ITEM_CD, YY_MM
												                ) C ON A.DLR_CD = C.DLR_CD 
												                   AND A.PLT_CD  = C.PLT_CD 
												                   AND A.ITEM_CD = C.ITEM_CD
										              ) A
										             ,(
										                  SELECT SUM(STOCK_QTY) AS STOCK_TOT_QTY
										                        ,SUM(STOCK_AMT) AS STOCK_TOT_AMT
										                    FROM (                        
											                       SELECT  A.DLR_CD
	                                                                      ,A.PLT_CD
												                          ,A.ITEM_CD
												                          ,SUM(NVL(A.AVLB_STOCK_QTY,0)) + SUM(NVL(A.RESV_STOCK_QTY,0)) - SUM(NVL(A.BORROW_QTY,0)) + SUM(NVL(A.RENT_QTY,0)) AS STOCK_QTY
												                          ,SUM((NVL(A.AVLB_STOCK_QTY,0) + NVL(A.RESV_STOCK_QTY,0) - NVL(A.BORROW_QTY,0) + NVL(A.RENT_QTY,0)) * B.MOVING_AVG_PRC) AS STOCK_AMT
												                     FROM  PT_0301T A 
												                           LEFT JOIN PT_0208T B 
												                             ON A.DLR_CD = B.DLR_CD 
												                            AND A.STRGE_CD = B.STRGE_CD 
												                            AND A.ITEM_CD = B.ITEM_CD												                    
												                    GROUP BY A.DLR_CD, A.PLT_CD, A.ITEM_CD                        
										                         ) A
										               ) B
										            ) A    
										            INNER JOIN PT_0201T B 
										              ON A.DLR_CD  = B.DLR_CD 
										             AND A.ITEM_CD = B.ITEM_CD       
										            LEFT JOIN (
										                SELECT A.DLR_CD
										                      ,A.PLT_CD
										                      ,A.ITEM_CD
										                      ,SUM(GI_AMT) AS GI_AMT_3M 
										                      ----20210621?????ɱ?????
										                      ,SUM(GI_BASE_AMT) AS GI_BASE_AMT_3M 
										                      ,SUM(GI_QTY) AS GI_QTY_3M 
										                      ---20210621????????????-----
										                      ,SUM(NVL(CT_SALE_QTY,0)  + NVL(WKS_SALE_QTY,0)) AS  PAR_SALE_QTY    
										                      ---20210621????????????----- 
										                      ---20210622???????۽???-----
										                      ,SUM(NVL(CT_SALE_BASE_AMT,0)  + NVL(WKS_SALE_BASE_AMT,0)) AS PAR_SALE_BASE_AMT
										                      ---20210622???????۽???----- 
										                      ---20210621ά?޳???????-----
										                      ,SUM(SER_SALE_QTY) AS SER_SALE_QTY
										                      ---20210621ά?޳???????-----
										                      ---20210622ά?޳???????-----
										                      ,SUM(SER_SALE_BASE_AMT) AS SER_SALE_BASE_AMT
										                      ---20210622ά?޳???????-----
	                                                      FROM (
												                  SELECT A.DLR_CD
												                        ,A.MVT_DOC_YY_MM AS YY_MM
												                        ,A.MVT_DOC_NO
												                        ,A.MVT_TP
												                        ,D.MVT_GR_GI_TP
												                        ,B.ITEM_CD
												                        ,C.ITEM_DSTIN_CD AS ITEM_TP
												                        ,B.MVT_DOC_LINE_NO
												                        ,B.PLT_CD
												                        ,B.STRGE_CD
												                        /*,CASE WHEN A.MVT_TP IN ('11', '14','71', '74','61') THEN NVL(B.ITEM_QTY,0)
												                              WHEN A.MVT_TP IN ('12', '13','72', '73', '62') THEN NVL(B.ITEM_QTY,0) * -1
												                              ELSE 0
												                         END GI_QTY
																		 */
																		 --update GI_QTY ???????? by tianjx  
																		 ,CASE WHEN A.MVT_TP IN ('11', '14', '15','71', '74', '75', '41', '43','45','47','48','61', '65')
							                                                THEN NVL(B.ITEM_QTY,0)
							                                              WHEN A.MVT_TP IN ('21','23','25')
							                                                THEN
							                                                  CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
							                                                         THEN NVL(B.ITEM_QTY,0)
							                                                       ELSE 0
							                                                   END
							                                                WHEN A.MVT_TP IN ('22','24','26')
							                                                THEN
							                                                  CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
							                                                         THEN NVL(B.ITEM_QTY,0)
							                                                       ELSE 0
							                                                   END
							                                              WHEN  A.MVT_TP IN ('12', '13', '16','72', '73', '76',  '42', '44', '46','62','66')     THEN NVL(B.ITEM_QTY,0) * -1 ELSE 0 END GI_QTY --update GI_QTY ???????? by tianjx  

												                        /*,CASE WHEN A.MVT_TP IN ('11', '14','71', '74','61') THEN B.MOVING_AVG_PRC                                         
												                              WHEN A.MVT_TP IN ('12', '13','72', '73','62') THEN NVL(B.MOVING_AVG_PRC,0) * -1                                          
												                              ELSE 0
												                         END GI_BASE_AMT*/
																		 
																		 --update Gi_Amt ???????? by tianjx 
																		 --20210621???ӳ????ɱ?????-----
																		  ,CASE WHEN A.MVT_TP IN ('11', '14', '15','71', '74', '75', '41', '43','45','47','48','61', '65')
													                        THEN NVL(B.MOVING_AVG_AMT,0)
													                      WHEN A.MVT_TP IN ('21','23','25')
													                        THEN
													                          CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
													                                 THEN NVL(B.MOVING_AVG_AMT,0)
													                               ELSE 0
													                           END
													                        WHEN A.MVT_TP IN ('22','24','26')
													                        THEN
													                          CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
													                                 THEN NVL(B.MOVING_AVG_AMT,0)
													                               ELSE 0
													                           END
													                      WHEN  A.MVT_TP IN ('12', '13', '16','72', '73', '76', '42', '44', '46','62','66')     THEN NVL(B.MOVING_AVG_AMT,0) * -1 ELSE 0 END GI_BASE_AMT   --???? 
																		 --20210621???ӳ????ɱ?????-----
																		  ,CASE WHEN A.MVT_TP IN ('11', '14', '15','71', '74', '75', '41', '43','45','47','48','61', '65')
							                                                THEN NVL(B.SALE_AMT,0)
							                                              WHEN A.MVT_TP IN ('21','23','25')
							                                                THEN
							                                                  CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
							                                                         THEN NVL(B.SALE_AMT,0)
							                                                       ELSE 0
							                                                   END
							                                                WHEN A.MVT_TP IN ('22','24','26')
							                                                THEN
							                                                  CASE WHEN B.DEBIT_CREDIT_DSTIN_CD = 'H'
							                                                         THEN CASE WHEN NVL(B.SALE_AMT, 0) = 0
							                                                                     THEN NVL(B.PURC_AMT, 0)
							                                                                   ELSE NVL(B.SALE_AMT, 0)
							                                                               END
							                                                       ELSE 0
							                                                   END
							                                              WHEN  A.MVT_TP IN ('12', '13', '16','72', '73', '76', '42', '44', '46','62','66')     THEN NVL(B.SALE_AMT,0) * -1 ELSE 0 END  GI_AMT   
																		 --update Gi_Amt ???????? by tianjx  
																		 ----20210621????????????----------
																		 ,CASE WHEN A.MVT_TP IN ('71', '74', '75')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.ITEM_QTY,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('72', '73', '76')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.ITEM_QTY,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                      END CT_SALE_QTY   --COUNTER????
													                      ,CASE WHEN A.MVT_TP IN ('71', '74', '75')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '02'
													                                     THEN NVL(B.ITEM_QTY,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('72', '73', '76')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '02'
													                                     THEN NVL(B.ITEM_QTY,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                      END WKS_SALE_QTY   --WOKSHOP???? 
													                      ----20210621????????????----------
													                      ----20210622???????۽???---------
													                      ,CASE WHEN A.MVT_TP IN ('71', '74', '75')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.MOVING_AVG_AMT,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('72', '73', '76')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.MOVING_AVG_AMT,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                     END CT_SALE_BASE_AMT  --COUNTER????
													                    ,CASE WHEN A.MVT_TP IN ('71', '74', '75')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '02'
													                                     THEN NVL(B.MOVING_AVG_AMT,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('72', '73', '76')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '02'
													                                     THEN NVL(B.MOVING_AVG_AMT,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                     END WKS_SALE_BASE_AMT  --WOKSHOP??????
													                     ----20210622???????۽???---------
													                      ----20210621ά?޳???????----------
													                       ,CASE WHEN A.MVT_TP IN ('11','14','15')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.ITEM_QTY,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('12','13','16')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.ITEM_QTY,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                      END SER_SALE_QTY   
													                     ----20210621ά?޳???????---------
													                     ----20210622ά?޳???????---------
													                     ,CASE WHEN A.MVT_TP IN ('11','14','15')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.MOVING_AVG_AMT,0)
													                                   ELSE 0
													                               END
													                          WHEN  A.MVT_TP IN ('12','13','16')
													                            THEN
													                              CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.MOVING_AVG_AMT,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                     END SER_SALE_BASE_AMT  --????????
													                     ----20210622ά?޳???????---------
													                     ----20210621ά?޳???????---------
													                      /*,CASE WHEN A.MVT_TP IN ('11','14','15')
													                            THEN
													                               CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.SALE_AMT,0)
													                                   ELSE 0
													                               END
													                          WHEN A.MVT_TP IN ('12','13','16')
													                            THEN
													                               CASE WHEN NVL(E.SALE_TP,'01') = '01'
													                                     THEN NVL(B.SALE_AMT,0) * -1
													                                   ELSE 0
													                               END
													                          ELSE 0
													                     END SER_SALE_AMT */
													                           ----20210621ά?޳???????---------
												                        ,CASE WHEN A.MVT_TP IN ('61') THEN NVL(B.ITEM_QTY,0)
												                              WHEN A.MVT_TP IN ('62') THEN NVL(B.ITEM_QTY,0) * -1
												                              ELSE 0
												                         END OBT_GI_QTY
												                        ,CASE WHEN A.MVT_TP IN ('61') THEN NVL(B.SALE_AMT,0)
												                              WHEN A.MVT_TP IN ('62') THEN NVL(B.SALE_AMT,0) * -1
												                              ELSE 0
												                         END OBT_GI_AMT
												                        ,CASE WHEN A.MVT_TP IN ('61') THEN B.MOVING_AVG_PRC                                          
												                              WHEN A.MVT_TP IN ('62') THEN NVL(B.MOVING_AVG_PRC,0) * -1
												                              ELSE 0
												                         END OBT_GI_BASE_AMT
												                        ,NVL(E.PAR_SALE_ORD_NO,B.REF_DOC_NO) AS REF_DOC_NO
												                        ,NVL(E.PAR_SALE_ORD_LINE_NO,B.REF_DOC_LINE_NO) AS REF_DOC_LINE_NO
												                    FROM PT_0311T A
												                         INNER JOIN PT_0312T B 
												                           ON A.DLR_CD = B.DLR_CD 
												                          AND A.MVT_DOC_YY_MM = B.MVT_DOC_YY_MM 
												                          AND A.MVT_DOC_NO = B.MVT_DOC_NO
                                                                         INNER JOIN PT_0201T C 
                                                                           ON A.DLR_CD = C.DLR_CD 
                                                                          AND B.ITEM_CD = C.ITEM_CD
												                         LEFT JOIN PT_0102T D 
												                           ON A.DLR_CD = D.DLR_CD 
												                          AND A.MVT_TP = D.MVT_TP
                                                                         LEFT JOIN (
														                      SELECT A.DLR_CD
														                            ,A.PAR_SALE_ORD_NO
														                            ,A.SALE_TP
														                            ,B.PAR_SALE_ORD_LINE_NO
														                            ,B.ITEM_CD
														                            ,B.REF_DOC_NO      AS RETURN_DOC_NO
														                            ,B.REF_DOC_LINE_NO AS RETURN_DOC_LINE_NO
														                        FROM PT_0521T A
														                             INNER JOIN PT_0522T B
														                               ON A.DLR_CD = B.DLR_CD 
														                              AND A.PAR_SALE_ORD_NO = B.PAR_SALE_ORD_NO
												                         ) E 
												                           ON A.DLR_CD = E.DLR_CD 
												                          AND B.REF_DOC_NO = E.RETURN_DOC_NO 
												                          AND B.REF_DOC_LINE_NO = E.RETURN_DOC_LINE_NO                    
												                   WHERE A.MVT_DOC_YY_MM = TO_CHAR(TO_DATE(V_MONTH||'01','YYYYMMDD'),'YYYYMM')                    
												                     AND D.MVT_GR_GI_TP = 'I'
												                     AND A.MVT_TP IN ('11', '12', '13', '14','71', '72', '73', '74', '61', '62')                    
												                ) A 
												            GROUP BY A.DLR_CD ,A.PLT_CD ,A.ITEM_CD
												    ) D 
												      ON A.DLR_CD = D.DLR_CD 
												     AND A.PLT_CD = D.PLT_CD 
												     AND A.ITEM_CD = D.ITEM_CD  --1??????? ??...
										            LEFT JOIN PT_0211T E 
										              ON A.DLR_CD = E.DLR_CD 
										             AND B.BP_CD = E.BP_CD       
								WHERE B.ITEM_DSTIN_CD != '20'
								--AND E.BP_TP = '01'                            
								) A
		    	            GROUP BY A.DLR_CD                      				                				        
		        ) T2 ON (
                        T1.IAN_DLR_CD = T2.DLR_CD
                    AND T1.IAN_YYMM = T2.YYMM
		        )
		        WHEN MATCHED THEN
	            UPDATE 
                   SET    T1.IAN_AVLB_STOCK_QTY = T2.AVLB_STOCK_QTY	
						, T1.IAN_RESV_STOCK_QTY = T2.RESV_STOCK_QTY	
						, T1.IAN_BORROW_QTY 	= T2.BORROW_QTY	
						, T1.IAN_RENT_QTY 		= T2.RENT_QTY	
						, T1.IAN_STOCK_QTY 		= T2.STOCK_QTY	
						, T1.IAN_STOCK_AMT 		= T2.STOCK_AMT
						, T1.IAN_GI_QTY 		= T2.GI_QTY	
						, T1.IAN_GI_AMT 		= T2.GI_AMT	
						, T1.IAN_PRE_STOCK_QTY 	= T2.PRE_STOCK_QTY	
						, T1.IAN_PRE_STOCK_AMT 	= T2.PRE_STOCK_AMT	
						, T1.IAN_STOCK_TOT_QTY 	= T2.STOCK_TOT_QTY				
						, T1.IAN_STOCK_TOT_AMT 	= T2.STOCK_TOT_AMT					
						, T1.IAN_STOCK_AMT_RATE = T2.STOCK_AMT_RATE					
						, T1.IAN_MOS 			= T2.MOS					
						, T1.IAN_INVENTORY_TURNOVER_RATIO = T2.INVENTORY_TURNOVER_RATIO					
						, T1.IFRESULT = T2.IFRESULT
						, T1.UPDATEDATE = T2.UPDATEDATE
						, T1.IF_REG_DT = T2.IF_REG_DT
						, T1.BAT_STAT_CD = T2.BAT_STAT_CD
						, T1.PAR_SALE_QTY = T2.PAR_SALE_QTY --????????
						, T1.SER_SALE_QTY = T2.SER_SALE_QTY --????????
						, T1.PAR_SALE_BASE_AMT = T2.PAR_SALE_BASE_AMT --???۽???
						, T1.SER_SALE_BASE_AMT = T2.SER_SALE_BASE_AMT --????????
		        WHEN NOT MATCHED THEN
		            INSERT(
		                      T1.IAN_DLR_CD                  
							, T1.IAN_YYMM 			        
							, T1.IAN_AVLB_STOCK_QTY 	        
							, T1.IAN_RESV_STOCK_QTY 	        
							, T1.IAN_BORROW_QTY 		        
							, T1.IAN_RENT_QTY 		        
							, T1.IAN_STOCK_QTY 		        
							, T1.IAN_STOCK_AMT 		        
							, T1.IAN_GI_QTY 			        
							, T1.IAN_GI_AMT 			        
							, T1.IAN_PRE_STOCK_QTY 	        
							, T1.IAN_PRE_STOCK_AMT 	        
							, T1.IAN_STOCK_TOT_QTY 	        
							, T1.IAN_STOCK_TOT_AMT 	        
							, T1.IAN_STOCK_AMT_RATE 	        
							, T1.IAN_MOS 			        
							, T1.IAN_INVENTORY_TURNOVER_RATIO
							, T1.IFRESULT
							, T1.CREATEDATE
							, T1.IF_REG_DT
							, T1.BAT_STAT_CD
							, T1.PAR_SALE_QTY --????????
							, T1.SER_SALE_QTY --????????
							, T1.PAR_SALE_BASE_AMT --???۽???
							, T1.SER_SALE_BASE_AMT --????????
		            )VALUES(
						  T2.DLR_CD    
						, T2.YYMM	
						, T2.AVLB_STOCK_QTY	
						, T2.RESV_STOCK_QTY	
						, T2.BORROW_QTY	
						, T2.RENT_QTY	
						, T2.STOCK_QTY	
						, T2.STOCK_AMT
						, T2.GI_QTY	
						, T2.GI_AMT	
						, T2.PRE_STOCK_QTY	
						, T2.PRE_STOCK_AMT	
						, T2.STOCK_TOT_QTY				
						, T2.STOCK_TOT_AMT				
						, T2.STOCK_AMT_RATE			
						, T2.MOS					
						, T2.INVENTORY_TURNOVER_RATIO
						, T2.IFRESULT
						, T2.CREATEDATE
						, T2.IF_REG_DT
						, T2.BAT_STAT_CD
						, T2.PAR_SALE_QTY --????????
						, T2.SER_SALE_QTY --????????
						, T2.PAR_SALE_BASE_AMT --???۽???
						, T2.SER_SALE_BASE_AMT --????????
		            );                              
        EXCEPTION
        	WHEN OTHERS THEN
	        	V_Err_Msg := '???? ????? ?? PT_0320I MERGE? ??'||'SQLCODE:'||SQLCODE||',SQLERRM:'||SQLERRM;
	            V_LOG_CNT := V_LOG_CNT + 1;
	            Pr_Gen_Cm_Proc_Log(
	                    L_CALL_TIMESTAMP      
	                   ,'LOG_CNT:' ||V_LOG_CNT    
	                   ,'I'
	                   ,V_Err_Msg
	                   ,NULL
	            );  
	            Raise_Application_Error(-20001, '???? ????? ??  PT_0320I MERGE? ?? ??!'||'SQLCODE:'||Sqlcode||',SQLERRM:'||Sqlerrm);
        END;
        
        BEGIN
           PR_GEN_CM_PROC_LOG_CLOSE(
              L_CALL_TIMESTAMP
             ,'SP_PAR_STOCK_ANALYSIS_IF_TO_DCS'
            );
        EXCEPTION
           When Others Then
             V_Err_Msg := '???? ?? ? ??'||'SQLCODE:'||SQLCODE||',SQLERRM:'||SQLERRM;                   
             RAISE_APPLICATION_ERROR(-20007,V_Err_Msg);
        END;
            
        Commit;  
        
EXCEPTION        
When Others Then
      Raise_Application_Error(-20007,'SQLCODE:'||Sqlcode||',SQLERRM:'||Sqlerrm);  
      rollback;
END SP_PAR_STOCK_ANALYSIS_IF_TO_DCS;