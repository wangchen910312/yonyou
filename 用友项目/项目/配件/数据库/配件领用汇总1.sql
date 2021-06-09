 CREATE TABLE "PT_0911IS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DLR_CD" VARCHAR2(255 BYTE), 
	"DLR_NM" VARCHAR2(255 BYTE), 
	"DELEGATE_TYPE" VARCHAR2(255 BYTE), 
	"PART_NUM" NUMBER, 
	"DELIVERY_AMT" NUMBER, 
	"COST_AMT" NUMBER, 
	"YEAR_MONTH" VARCHAR2(255 BYTE), 
	REMARK VARCHAR(4000),
	CREATETIME VARCHAR(14),
	UPDATETIME VARCHAR(14),
	IFRESULT CHAR(1),
	IFFAILMSG VARCHAR(2000),
	 CONSTRAINT "PT_0911IS_PK" PRIMARY KEY ("ID")
   )  ;

   COMMENT ON COLUMN "PT_0911IS"."DLR_CD" IS '经销商代码';
   COMMENT ON COLUMN "PT_0911IS"."DLR_NM" IS '经销商名称';
   COMMENT ON COLUMN "PT_0911IS"."DELEGATE_TYPE" IS '委托类型';
   COMMENT ON COLUMN "PT_0911IS"."PART_NUM" IS '配件数量';
   COMMENT ON COLUMN "PT_0911IS"."DELIVERY_AMT" IS '出库金额';
   COMMENT ON COLUMN "PT_0911IS"."COST_AMT" IS '成本金额';
   COMMENT ON COLUMN "PT_0911IS"."YEAR_MONTH" IS '年月';


CREATE SEQUENCE DMSDB.SEQ_PT_0911IS
  START WITH 1
  MAXVALUE 9999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
 
 alter table PT_0911IS add 	BAT_ID VARCHAR(100);
 
 
 
 
 select * from SE_0960IS
 
 SELECT SEQ_PT_0911IS.nextval FROM dual
 
 select to_char((last_day(add_months(sysdate,-2))+1),'yyyy-mm') from dual
 
 
 		insert into PT_0911IS (ID,DLR_CD,DLR_NM,DELEGATE_TYPE,PART_NUM,DELIVERY_AMT,COST_AMT,YEAR_MONTH,CREATEDATE,IFRESULT)	
 			SELECT  SEQ_PT_0911IS.nextval as id,C.DLR_CD,C.DLR_NM,W1.RO_TP as DELEGATE_TYPE,W1.END_QTY AS PART_NUM,W1.ITEM_AMT AS DELIVERY_AMT,W1.MOVING_AVG_AMT AS COST_AMT,
 			(select to_char((last_day(add_months(sysdate,-2))+1),'yyyy-mm') from dual) as YEAR_MONTH,to_char(sysdate,'yyyymmddhh24miss') as CREATEDATE,
 			'N'
 			 from (
 				SELECT  
					T1.DLR_CD --店代码
					,T1.RO_TP---维修委托类型
                    ,SUM(T1.ITEM_AMT) AS ITEM_AMT--出库金额
                    ,SUM(T1.END_QTY) AS END_QTY--配件数量
                    ,SUM(T1.MOVING_AVG_AMT) AS MOVING_AVG_AMT--成本金额
                FROM
                (

                    SELECT
                        A.DLR_CD
                        ,A.PAR_REQ_DOC_NO
                        ,CASE WHEN A.PAR_GI_TP = 'RO' AND NVL(R.RO_STAT_CD, '01') NOT IN ('01','02','06') THEN '02'
                        ELSE A.PAR_REQ_STAT_CD
                        END AS PAR_REQ_STAT_CD
                        ,A.PAR_GI_TP
                        ,A.RO_DOC_NO
                        ,NVL(R.RO_STAT_CD, '01') AS RO_STAT_CD
                        ,NVL(R.RO_TP, '01') AS RO_TP
                        ,A.ITEM_AMT
                        ,A.TAX_AMT
                        ,H.VIN_NO
                        ,H.CAR_NO
                        ,K.USR_NM AS RECEIVE_NM
                        ,NVL(F.GI_DOC_NO,'-') AS GI_DOC_NO
                        ,NVL(E.GI_DOC_TP,'01') AS GI_DOC_TP
                        ,NVL(F.GI_DOC_STAT_CD,'01') AS GI_DOC_STAT_CD
                        ,A.END_QTY
                        ,A.REG_DT
                        ,U.USR_NM AS REG_USR_ID
                        ,NVL(CASE WHEN A.PAR_REQ_STAT_CD = '01' THEN A.REQ_QTY
                                  WHEN A.PAR_REQ_STAT_CD = '03' THEN A.END_QTY
                                  ELSE A.END_QTY
                              END, 0) * NVL(NVL(A.MOVING_AVG_PRC,NVL(J.MOVING_AVG_PRC, 0)),0) AS MOVING_AVG_AMT
                        ,CASE WHEN A.PAR_REQ_STAT_CD IN ('01','03') THEN ROUND(A.END_QTY * ROUND(A.MOVING_AVG_PRC / ( 1 + FN_GET_VAT(to_char(A.reg_dt,'yyyymmdd'),'ALL')),2),2)
                              ELSE ROUND(A.END_QTY * NVL(K6.MOVING_AVG_TAX_DDCT_PRC,0),2)
                         END MOVING_AVG_TAX_DDCT_AMT
                        ,(FN_GET_VAT(TO_CHAR(A.REG_DT,'YYYYMMDD'),'ALL') * 100) AS TAX_RATE
                      --  ,TO_CHAR(X.CALC_DT,'YYYY-MM-DD HH24:MI:SS') AS CALC_DT_FORMAT
                    FROM PT_0502T A
                    LEFT JOIN PT_0501T H ON A.DLR_CD = H.DLR_CD AND A.PAR_REQ_DOC_NO = H.PAR_REQ_DOC_NO
                    LEFT JOIN SE_0300T R ON A.DLR_CD = R.DLR_CD AND A.RO_DOC_NO = R.RO_DOC_NO
                    LEFT JOIN PT_0511T E ON A.DLR_CD = E.DLR_CD AND A.PAR_REQ_DOC_NO = E.PAR_REQ_DOC_NO AND A.RO_DOC_NO = E.RO_DOC_NO
                    LEFT JOIN PT_0512T F ON A.DLR_CD = F.DLR_CD AND A.PAR_REQ_DOC_NO = F.PAR_REQ_DOC_NO AND A.PAR_REQ_DOC_LINE_NO = F.PAR_REQ_DOC_LINE_NO
                   -- LEFT JOIN SE_0500T X ON A.DLR_CD = X.DLR_CD AND A.RO_DOC_NO = X.RO_DOC_NO
                    AND A.PAR_REQ_DOC_LINE_NO = F.GI_DOC_LINE_NO
                    AND A.PAR_REQ_STAT_CD = F.GI_DOC_STAT_CD
                    LEFT JOIN (
                        SELECT
                            DLR_CD
                            ,ITEM_CD
                            ,MAX(PRC_TP) AS PRC_TP
                            ,MAX(LINE_NO) AS LINE_NO
                            ,MAX(NVL(SALE_PRC_AMT,0)) AS PURC_PRC
                        FROM PT_0214T
                        WHERE 1=1 AND DEL_YN != 'Y'
                        GROUP BY DLR_CD, ITEM_CD
                    ) I ON A.DLR_CD = I.DLR_CD AND A.ITEM_CD = I.ITEM_CD
                    LEFT JOIN PT_0208T J ON A.DLR_CD = J.DLR_CD AND A.REQ_STRGE_CD = J.STRGE_CD AND A.ITEM_CD = J.ITEM_CD
                    LEFT JOIN CM_0801T U ON R.REG_USR_ID = U.USR_ID
                    LEFT JOIN CM_0801T K ON F.RECEIVE_ID = K.USR_ID
                    LEFT JOIN PT_0312T K6 ON K6.DLR_CD = F.DLR_CD AND K6.MVT_DOC_NO = F.MVT_DOC_NO AND K6.ITEM_CD = F.ITEM_CD
                    WHERE 1=1 ---(限制状态是除了录入之外，现在维修领用产生的数据)
 					AND A.PAR_GI_TP LIKE '%RO%'
					AND A.PAR_REQ_STAT_CD  IN ('02','03')
					AND F.REG_DT >=(select last_day(add_months(sysdate,-2))+1 from dual) 
                   	AND F.REG_DT <=(select last_day(add_months(sysdate,-1)) from dual) 
                ) T1
                GROUP BY T1.DLR_CD, T1.RO_TP
               ) W1 LEFT JOIN CM_0101T C on W1.DLR_CD = C.DLR_CD