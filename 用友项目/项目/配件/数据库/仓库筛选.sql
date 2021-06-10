SELECT
                    T1.*
                    ,T2.PLT_NM
                    ,'Y' AS DB_YN
                    ,DECODE(T1.STRGE_TP, '02','N','Y') AS STRGE_SALE_DEL_YN
                    ,(SELECT COUNT(0) FROM PT_0301T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_STOCK_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GR_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GI_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0222T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_BIN_STRGE_CNT
                    ,(
                        SELECT
                            WM_CONCAT(A.USR_NM) AS STRGE_MANAGER_LIST
                        FROM PT_0223T A
                        WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD
                        GROUP BY A.STRGE_CD
                    ) AS STRGE_MANAGER_LIST
                FROM CM_0104T T1
                INNER JOIN CM_0103T T2 ON T1.PLT_CD = T2.PLT_CD AND T1.DLR_CD = T2.DLR_CD
                WHERE T1.STRGE_NM='精品仓库';
                
                
                SELECT * FROM CM_0104T T WHERE T.STRGE_NM='精品仓库';
                
                SELECT * FROM CM_0103T;
                
                select * from PT_0223T t where t.DLR_CD = 'D2327';
                
                
                
                SELECT
                    T1.*
                    
                    ,'Y' AS DB_YN
                    ,DECODE(T1.STRGE_TP, '02','N','Y') AS STRGE_SALE_DEL_YN
                    ,(SELECT COUNT(0) FROM PT_0301T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_STOCK_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GR_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GI_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0222T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_BIN_STRGE_CNT
                    ,(
                        SELECT
                            WM_CONCAT(A.USR_NM) AS STRGE_MANAGER_LIST
                        FROM PT_0223T A
                        WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD
                        GROUP BY A.STRGE_CD
                    ) AS STRGE_MANAGER_LIST
                FROM CM_0104T T1 WHERE T1.STRGE_NM='精品仓库'
          
                
                     SELECT STRGE_CD FROM CM_0104T T WHERE T.STRGE_NM='精品仓库';--JPCK
                	SELECT A.STRGE_CD FROM PT_0223T A  WHERE A.DLR_CD = 'D2327';
                	
                	
                	SELECT Y.STRGE_TP,Y.* FROM CM_0104T Y
                	
                	
                	
  			SELECT
                    T1.*
                    ,T2.PLT_NM
                    ,'Y' AS DB_YN
                    ,DECODE(T1.STRGE_TP, '02','N','Y') AS STRGE_SALE_DEL_YN
                    ,(SELECT COUNT(0) FROM PT_0301T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_STOCK_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GR_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0201T A WHERE A.DLR_CD = 'D2327' AND A.GI_STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_GR_STRGE_CNT
                    ,(SELECT COUNT(0) FROM PT_0222T A WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD ) AS PT_MASTER_BIN_STRGE_CNT
                    ,(
                        SELECT
                            WM_CONCAT(A.USR_NM) AS STRGE_MANAGER_LIST
                        FROM PT_0223T A
                        WHERE A.DLR_CD = 'D2327' AND A.STRGE_CD = T1.STRGE_CD
                        GROUP BY A.STRGE_CD
                    ) AS STRGE_MANAGER_LIST
                FROM CM_0104T T1
                INNER JOIN CM_0103T T2 ON T1.PLT_CD = T2.PLT_CD AND T1.DLR_CD = T2.DLR_CD
                WHERE T1.STRGE_NM='精品仓库'
                AND T1.STRGE_TP NOT IN ('20', '02')
                              	
                	
                