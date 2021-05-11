package chn.bhmc.dms.sal.mon.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.Semaphore;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.cmp.vo.CarSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsOrderCheckVO;
import chn.bhmc.dms.sal.mon.service.dao.SalesMonthDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ThreadSalesMonthCarServiceImpl.java
 * @Description : 批量执行经销商差异对比
 * @author Bruce
 * @since 2019. 08. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 07. 10.    Choi KyungYong         최초 생성
 * </pre>
 */

public class ThreadSalesMonthCarServiceImpl implements Runnable {


    SalesMonthDAO salesMonthDAO = null;
    
    //最大线程数
  	final static int MAX_QPS = 30;
  	
    //获得线程执行坑位
  	final static Semaphore semaphore = new Semaphore(MAX_QPS);
    
    private String devOrPrd = "BHDCSOP";
    private String threadName = "任务_";
    public String getName(){
    	return threadName;
    }

    private TmpDmsCarCheckVO tmpDmsCarCheckVO = null;

    public ThreadSalesMonthCarServiceImpl(TmpDmsCarCheckVO tmpDmsCarCheckVOIn, int i,SalesMonthDAO salesMonthDAOIn) {
    	tmpDmsCarCheckVO = tmpDmsCarCheckVOIn;
    	threadName = threadName+i;
    	salesMonthDAO = salesMonthDAOIn;
    }

    /*
     * @see java.lang.Runnable#run()
     */
    public void run() {

    	System.out.println("线程开始 "+threadName);
		StringBuffer sql = new StringBuffer();
		sql.append("MERGE INTO TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" A \n");
		sql.append("USING ( \n");
		sql.append("SELECT Q.DEALER,SUM(TRANSIT) TRANSIT,  SUM(STOCK)-SUM(STR) STOCK,  SUM(STR) STR,  SUM(RETAIL) RETAIL \n");
		sql.append("FROM ( \n");
		sql.append("      SELECT ORD_DLR_CD AS DEALER \n");
		sql.append("          ,1 AS TRANSIT \n");
		sql.append("          ,0 AS STOCK \n");
		sql.append("          ,0 AS STR \n");
		sql.append("          ,0 AS RETAIL \n");
		sql.append("        from SA_0121t \n");
		sql.append("        WHERE 1=1 \n");
		sql.append("        AND NCAR_DSTIN_CD = 'N' \n");
		sql.append("        AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sql.append("        AND CAR_STAT_CD = '50' \n");
		sql.append("UNION ALL \n");
		sql.append("      SELECT ORD_DLR_CD AS DEALER \n");
		sql.append("          ,0 AS TRANSIT \n");
		sql.append("          ,1 AS STOCK \n");
		sql.append("          ,0 AS STR \n");
		sql.append("          ,0 AS RETAIL \n");
		sql.append("        from SA_0121T \n");
		sql.append("        WHERE 1=1 \n");
		sql.append("        AND NCAR_DSTIN_CD = 'N' \n");
		sql.append("        AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sql.append("        AND CAR_STAT_CD = '60' \n");
		sql.append("UNION ALL \n");
		sql.append("      SELECT A1.DLR_CD AS DEALER \n");
		sql.append("          ,0 AS TRANSIT \n");
		sql.append("          ,0 AS STOCK \n");
		sql.append("          ,1 AS STR \n");
		sql.append("          ,0 AS RETAIL \n");
		sql.append("                   FROM SA_0121T T1,SA_0256T A1 \n");
		sql.append("                              INNER JOIN ( \n");
		sql.append("                                     SELECT DLR_CD \n");
		sql.append("                                          , CAR_ID \n");
		sql.append("                                          , MAX(STR_NO) AS STR_NO \n");
		sql.append("                                       FROM SA_0256T \n");
		sql.append("                                      GROUP BY DLR_CD, CAR_ID \n");
		sql.append("                                ) B1  ON A1.DLR_CD = B1.DLR_CD   AND A1.CAR_ID = B1.CAR_ID  AND A1.STR_NO = B1.STR_NO \n");
		sql.append("                WHERE 1=1 \n");
		sql.append("                  AND T1.CAR_ID = A1.CAR_ID \n");
		sql.append("                  AND T1.CAR_STAT_CD = '60' \n");
		sql.append("                  AND TRIM(A1.STR_STAT) =  'B' \n");
		sql.append("UNION ALL \n");
		sql.append("        SELECT   KMDELR AS DEALER \n");
		sql.append("          ,0 AS TRANSIT \n");
		sql.append("                 ,0 AS STOCK \n");
		sql.append("                 ,0 AS STR \n");
		sql.append("          ,1 AS RETAIL \n");
		sql.append("         FROM \n");
		sql.append("              ( \n");
		sql.append("                  SELECT KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR ,RN \n");
		sql.append("                  FROM (   SELECT \n");
		sql.append("                              KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
		sql.append("                              ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
		sql.append("                              from SA_0301T \n");
		sql.append("                              WHERE 1=1 \n");
		sql.append("                         ) \n");
		sql.append("                  WHERE 1=1 \n");
		sql.append("                  AND RN = 1 \n");
		sql.append("                  AND KMOPT IN ( 'J1' ,  'J3',  'J5') \n");
		sql.append("                  AND SUBSTR(KMTRDY,0,6) = '").append(tmpDmsCarCheckVO.getCheckMonth()).append("' \n");
		sql.append("                  and KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sql.append("              ) A, \n");
		sql.append("               ( \n");
		sql.append("                 SELECT ORD_DLR_CD  , VIN_NO  , CAR_STAT_CD   , CUST_SALE_DT \n");
		sql.append("                 FROM SA_0121T \n");
		sql.append("                 WHERE 1=1 \n");
		sql.append("                 AND NCAR_DSTIN_CD = 'N' \n");
		sql.append("                ) D \n");
		sql.append("               WHERE 1=1 \n");
		sql.append("               AND A.KMVIN = D.VIN_NO(+) \n");
		sql.append("             AND A.KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sql.append(" \n");
		sql.append("    )AS Q \n");
		sql.append("    GROUP BY DEALER \n");
		sql.append(") B \n");
		sql.append("ON(A.DLR_CD = B.DEALER) \n");
		sql.append("WHEN MATCHED THEN \n");
		sql.append("  UPDATE SET A.DMS_TRANS = B.TRANSIT, \n");
		sql.append("             A.DMS_STOCK = B.STOCK, \n");
		sql.append("             A.DMS_STRATEGY = B.STR, \n");
		sql.append("             A.DMS_RETAIL = B.RETAIL, \n");
		sql.append("             A.TOTAL_DIFF = ABS(NVL(A.ERP_TRANS,0)-NVL(B.TRANSIT,0))+ABS(NVL(A.ERP_STOCK,0)-NVL(B.STOCK,0))+ABS(NVL(A.ERP_STRATEGY,0)-NVL(B.STR,0))+ABS(NVL(A.ERP_RETAIL,0)-NVL(B.RETAIL,0)), \n");
		sql.append("             A.TRANS_DIFF = ABS(NVL(A.ERP_TRANS,0)-NVL(B.TRANSIT,0)), \n");
		sql.append("             A.STOCK_DIFF = ABS(NVL(A.ERP_STOCK,0)-NVL(B.STOCK,0)), \n");
		sql.append("             A.RETAIL_DIFF = ABS(NVL(A.ERP_RETAIL,0)-NVL(B.RETAIL,0)), \n");
		sql.append("             A.STRATEGY_DIFF = ABS(NVL(A.ERP_STRATEGY,0)-NVL(B.STR,0)), \n");
		sql.append("        	 A.CHECK_RESULT = 'Z', \n");
    	sql.append("             A.CHECK_MESSAGE = 'SUCCESS' \n");
		//System.out.println(sql.toString());
		
		StringBuffer sqlDetail = new StringBuffer();
		sqlDetail.append("INSERT INTO TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" \n");
		sqlDetail.append("    		                (DLR_CD, \n");
		sqlDetail.append("    		                DMS_IP_NM, \n");
		sqlDetail.append("    		                VIN_NO, \n");
		sqlDetail.append("    		                VIN_NO1, \n");
		sqlDetail.append("    		                VIN_NO2, \n");
		sqlDetail.append("    		                CAR_STAT_CD, \n");
		sqlDetail.append("    		                PLT_GI_DT, \n");
		sqlDetail.append("    		                GR_DT, \n");
		sqlDetail.append("    		                GRTE_START_DT, \n");
		sqlDetail.append("    		                CUST_SALE_DT, \n");
		sqlDetail.append("    		                STR_NO, \n");
		sqlDetail.append("    		                STR_YN, \n");
		sqlDetail.append("    		                ORD_NO, \n");
		sqlDetail.append("    		                ERP_DLR_CD, \n");
		sqlDetail.append("    		                ERP_VIN_NO, \n");
		sqlDetail.append("    		                ERP_VIN_NO1, \n");
		sqlDetail.append("    		                ERP_VIN_NO2, \n");
		sqlDetail.append("    		                ERP_CAR_STAT_CD, \n");
		sqlDetail.append("    		                ERP_PLT_GI_DT, \n");
		sqlDetail.append("    		                ERP_GR_DT, \n");
		sqlDetail.append("    		                ERP_GRTE_START_DT, \n");
		sqlDetail.append("    		                ERP_CUST_SALE_DT, \n");
		sqlDetail.append("    		                ERP_STR_NO, \n");
		sqlDetail.append("    		                ERP_STR_YN, \n");
		sqlDetail.append("    		                ERP_ORD_NO, \n");
		sqlDetail.append("    		                CHECK_RESULT, \n");
		sqlDetail.append("    		                CHECK_REASON \n");
		sqlDetail.append("    		                ) \n");
		sqlDetail.append("SELECT DISTINCT '").append(tmpDmsCarCheckVO.getDlrCd()).append("' DLR_CD, \n");
		sqlDetail.append("        '").append(tmpDmsCarCheckVO.getDmsIpNm()).append("' DMS_IP_NM, \n");
		sqlDetail.append("        NVL(J.KMVIN,K.VIN_NO) VIN_NO, \n");
		sqlDetail.append("        NVL(J.VIN_NO1,K.VIN_NO1) VIN_NO1, \n");
		sqlDetail.append("        NVL(J.VIN_NO2 ,K.VIN_NO2) VIN_NO2, \n");
		sqlDetail.append("        J.CAR_STAT_CD, \n");
		sqlDetail.append("        J.PLT_GI_DT, \n");
		sqlDetail.append("        J.GR_DT, \n");
		sqlDetail.append("        J.GRTE_START_DT, \n");
		sqlDetail.append("        TO_DATE(J.CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
		sqlDetail.append("        J.STR_NO, \n");
		sqlDetail.append("        J.STR_YN, \n");
		sqlDetail.append("        J.ORD_NO, \n");
		sqlDetail.append("        K.ORD_DLR_CD ERP_DLR_CD, \n");
		sqlDetail.append("        K.VIN_NO ERP_VIN_NO, \n");
		sqlDetail.append("        K.VIN_NO1 ERP_VIN_NO1, \n");
		sqlDetail.append("        K.VIN_NO2 ERP_VIN_NO2, \n");
		sqlDetail.append("        K.CAR_STAT_CD ERP_CAR_STAT_CD, \n");
		sqlDetail.append("        K.PLT_GI_DT ERP_PLT_GI_DT, \n");
		sqlDetail.append("        K.GR_DT ERP_GR_DT, \n");
		sqlDetail.append("        K.GRTE_START_DT ERP_GRTE_START_DT, \n");
		sqlDetail.append("        K.CUST_SALE_DT ERP_CUST_SALE_DT, \n");
		sqlDetail.append("        K.STR_NO ERP_STR_NO, \n");
		sqlDetail.append("        K.STR_YN ERP_STR_YN, \n");
		sqlDetail.append("        K.ORD_NO ERP_ORD_NO, \n");
		sqlDetail.append("        'N', \n");
		sqlDetail.append("      CASE \n");
		sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NULL THEN 'SAP存在DMS不存在' \n");
		sqlDetail.append("	   WHEN K.ORD_DLR_CD IS NULL THEN 'DMS存在SAP不存在' \n");
		sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NOT NULL AND K.ORD_DLR_CD IS NOT NULL AND NVL(K.ORD_DLR_CD, '1') <> NVL(J.ORD_DLR_CD, '1') THEN '店代码不一致' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '13') THEN 'SAP在途DMS分配' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '60') THEN 'SAP在途DMS库存' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '70') THEN 'SAP在途DMS零售' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '13') THEN 'SAP库存DMS分配' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '50') THEN 'SAP库存DMS在途' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '70') THEN 'SAP库存DMS零售' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') <> 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J1','J5')) THEN 'SAP零售DMS非零售' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') = 'J1') THEN 'SAP战略出库DMS真实出库' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') = 'J5') THEN 'SAP战略出库DMS战略转真实' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') IN ('I1','J2','J4')) THEN 'SAP战略出库DMS库存' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.CUST_SALE_DT) THEN '零售日期不一致' \n");
		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.KMTRDY) THEN '销售记录表零售日期不一致' \n");
		sqlDetail.append("	 END CHECK_REASON \n");
		sqlDetail.append("  FROM \n");
		sqlDetail.append(" ( \n");
		sqlDetail.append(" SELECT A.KMTRDY, \n");
		sqlDetail.append("        A.KMTRTM, \n");
		sqlDetail.append("        A.KMVIN, \n");
		sqlDetail.append("        A.KMOPT, \n");
		sqlDetail.append("        A.KMDELR, \n");
		sqlDetail.append("        D.ORD_DLR_CD, \n");
		sqlDetail.append("        D.VIN_NO, \n");
		sqlDetail.append("        D.VIN_NO1, \n");
		sqlDetail.append("        D.VIN_NO2, \n");
		sqlDetail.append("        D.CAR_STAT_CD, \n");
		sqlDetail.append("        D.PLT_GI_DT, \n");
		sqlDetail.append("        D.GR_DT, \n");
		sqlDetail.append("        D.GRTE_START_DT, \n");
		sqlDetail.append("        D.CUST_SALE_DT, \n");
		sqlDetail.append("        D.STR_NO, \n");
		sqlDetail.append("        D.STR_YN, \n");
		sqlDetail.append("        D.ORD_NO \n");
		sqlDetail.append("   FROM ( SELECT KMTRDY, \n");
		sqlDetail.append("                 KMTRTM, \n");
		sqlDetail.append("                 KMVIN, \n");
		sqlDetail.append("                 KMOPT, \n");
		sqlDetail.append("                 KMDELR, \n");
		sqlDetail.append("                 RN \n");
		sqlDetail.append("            FROM ( SELECT KMTRDY, \n");
		sqlDetail.append("                          KMTRTM, \n");
		sqlDetail.append("                          KMVIN, \n");
		sqlDetail.append("                          KMOPT, \n");
		sqlDetail.append("                          KMDELR, \n");
		sqlDetail.append("                          ROW_NUMBER( ) OVER (PARTITION BY KMVIN \n");
		sqlDetail.append("                    ORDER BY TO_DATE(KMTRDY || KMTRTM, \n");
		sqlDetail.append("                          'YYYYMMDD HH24MISS') DESC ) AS RN \n");
		sqlDetail.append("                     from SA_0301T \n");
		sqlDetail.append("                    WHERE 1=1 \n");
		sqlDetail.append("                      AND SUBSTR(KMTRDY, \n");
		sqlDetail.append("                          0, \n");
		sqlDetail.append("                          6) = '").append(tmpDmsCarCheckVO.getCheckMonth()).append("' \n");
		//sqlDetail.append("                      AND KMOPT IN('I1', 'J1', 'J2', 'J3', 'J4', 'J5') \n");
		sqlDetail.append("                      ) \n");
		sqlDetail.append("           WHERE 1=1 \n");
		sqlDetail.append("             AND RN = 1 \n");
		//sqlDetail.append("             AND KMOPT IN('J1', 'J3', 'J5') \n");
		sqlDetail.append("             AND SUBSTR(KMTRDY, \n");
		sqlDetail.append("                 0, \n");
		sqlDetail.append("                 6) = '").append(tmpDmsCarCheckVO.getCheckMonth()).append("') A, \n");
		sqlDetail.append("        ( SELECT ORD_DLR_CD, \n");
		sqlDetail.append("                  CAR_STAT_CD, \n");
		sqlDetail.append("                  VIN_NO, \n");
		sqlDetail.append("                  VIN_NO1, \n");
		sqlDetail.append("                  VIN_NO2, \n");
		sqlDetail.append("                  PLT_GI_DT, \n");
		sqlDetail.append("                  GR_DT, \n");
		sqlDetail.append("                  GRTE_START_DT, \n");
		sqlDetail.append("                  TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
		sqlDetail.append("                  STR_NO, \n");
		sqlDetail.append("		          STR_YN, \n");
		sqlDetail.append("		          ORD_NO \n");
		sqlDetail.append("             FROM SA_0121T \n");
		sqlDetail.append("            WHERE 1=1 \n");
		sqlDetail.append("              AND NCAR_DSTIN_CD = 'N') D \n");
		sqlDetail.append("  WHERE 1=1 \n");
		sqlDetail.append("    AND KMVIN = D.VIN_NO (+ ) \n");
		sqlDetail.append("    AND KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sqlDetail.append(" \n");
		sqlDetail.append("    UNION ALL \n");
		sqlDetail.append(" \n");
		sqlDetail.append(" SELECT '' AS KMTRDY , '' AS KMTRTM , VIN_NO AS KMVIN , '' AS KMOPT , '' KMDELR, \n");
		sqlDetail.append("        ORD_DLR_CD, \n");
		sqlDetail.append("        VIN_NO, \n");
		sqlDetail.append("        VIN_NO1, \n");
		sqlDetail.append("        VIN_NO2, \n");
		sqlDetail.append("        CAR_STAT_CD, \n");
		sqlDetail.append("        PLT_GI_DT, \n");
		sqlDetail.append("        GR_DT, \n");
		sqlDetail.append("        GRTE_START_DT, \n");
		sqlDetail.append("        TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
		sqlDetail.append("        STR_NO, \n");
		sqlDetail.append("        STR_YN, \n");
		sqlDetail.append("        ORD_NO \n");
		sqlDetail.append(" from SA_0121t \n");
		sqlDetail.append(" WHERE 1=1 \n");
		sqlDetail.append(" AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sqlDetail.append(" AND CAR_STAT_CD = '60' \n");
		sqlDetail.append(" \n");
		sqlDetail.append(" UNION ALL \n");
		sqlDetail.append(" \n");
		sqlDetail.append(" SELECT '' AS KMTRDY , '' AS KMTRTM , VIN_NO AS KMVIN , '' AS KMOPT , '' KMDELR, \n");
		sqlDetail.append("        ORD_DLR_CD, \n");
		sqlDetail.append("        VIN_NO, \n");
		sqlDetail.append("        VIN_NO1, \n");
		sqlDetail.append("        VIN_NO2, \n");
		sqlDetail.append("        CAR_STAT_CD, \n");
		sqlDetail.append("        PLT_GI_DT, \n");
		sqlDetail.append("        GR_DT, \n");
		sqlDetail.append("        GRTE_START_DT, \n");
		sqlDetail.append("        TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
		sqlDetail.append("        STR_NO, \n");
		sqlDetail.append("        STR_YN, \n");
		sqlDetail.append("        ORD_NO \n");
		sqlDetail.append(" from SA_0121t \n");
		sqlDetail.append(" WHERE 1=1 \n");
		sqlDetail.append(" AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sqlDetail.append(" AND CAR_STAT_CD = '50' \n");
		sqlDetail.append(" ) J \n");
		sqlDetail.append("  FULL JOIN \n");
		sqlDetail.append(" ( \n");
		sqlDetail.append(" 	select ORD_DLR_CD, \n");
		sqlDetail.append("			VIN_NO1||VIN_NO2 VIN_NO, \n");
		sqlDetail.append("			CAR_STAT_CD, \n");
		sqlDetail.append("			VIN_NO1, \n");
		sqlDetail.append("			VIN_NO2, \n");
		sqlDetail.append("			CASE WHEN PLT_GI_DT IS NULL OR NVL(PLT_GI_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(PLT_GI_DT, 'YYYYMMDD') END PLT_GI_DT, \n");
		sqlDetail.append("    		CASE WHEN GR_DT IS NULL OR NVL(GR_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(GR_DT, 'YYYYMMDD') END GR_DT, \n");
		sqlDetail.append("    		CASE WHEN GRTE_START_DT IS NULL OR NVL(GRTE_START_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(GRTE_START_DT, 'YYYYMMDD') END GRTE_START_DT, \n");
		sqlDetail.append("    		CASE WHEN CUST_SALE_DT IS NULL OR NVL(CUST_SALE_DT, '00000000') = '00000000' THEN NULL ELSE CUST_SALE_DT END CUST_SALE_DT, \n");
		sqlDetail.append("        STR_NO, \n");
		sqlDetail.append("        STR_YN, \n");
		sqlDetail.append("        ORD_NO \n");
		sqlDetail.append("      FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
		sqlDetail.append("      WHERE 1=1 \n");
		sqlDetail.append("      AND ( (CAR_STAT_CD = 'Q190' AND SUBSTR(CUST_SALE_DT,0,6) = '").append(tmpDmsCarCheckVO.getCheckMonth()).append("' ) \n");
		sqlDetail.append("          OR CAR_STAT_CD = 'Q180' \n");
		sqlDetail.append("          OR CAR_STAT_CD = 'Q170') \n");
		sqlDetail.append("      and ord_dlr_cd = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
		sqlDetail.append(" ) K \n");
		sqlDetail.append("  ON J.KMVIN = K.VIN_NO \n");
		sqlDetail.append(" WHERE 1=1 \n");
		sqlDetail.append("   AND ( \n");
		sqlDetail.append("          J.ORD_DLR_CD IS NULL--SAP存在DMS不存在，根据SAP表补录DMS主表SA_0121T数据，如果是在途，复制SA_0121T，不添加SA_0301T表；如果是库存，复制SA_0121T表，同时增加J1入库记录；如果是零售，复制SA_0121T表，增加J1零售记录；如果是战略出库，这里需要确认补录SA_0121T表中CAR_STAT_CD为60还是70，同时SA_0301T添加为J3的记录。 \n");
		sqlDetail.append("        OR (K.ORD_DLR_CD IS NOT NULL AND J.ORD_DLR_CD IS NOT NULL AND NVL(K.ORD_DLR_CD, '1') <> NVL(J.ORD_DLR_CD, '1'))--店代码不一致，更新为一致的店代码 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '13')--SAP是在途，DMS是分配，直接更新SA_0121T状态为在途 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '60')--SAP是在途，DMS是库存，直接更新SA_0121T状态为在途,删除SA_0301T表中为I1的入库记录 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '70')--SAP是在途，DMS是零售，直接更新SA_0121T状态为在途,删除SA_0301T表中为I1,J1,J2,J3,J4,J5的记录 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '13')--SAP是库存，DMS是分配，直接更新SA_0121T状态为在库,在SA_0301T表中添加I1的入库记录，日期为月结最后一天 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '50')--SAP是库存，DMS是在途，直接更新SA_0121T状态为在库,在SA_0301T表中添加I1的入库记录，日期为月结最后一天 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '70')--SAP是库存，DMS是零售，直接更新SA_0121T状态为在库,删除SA_0301T表中为除了I1的其他记录 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') <> 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J1','J5'))--SAP是零售，DMS不是零售，直接更新SA_0121T状态为零售,SA_0301T表中，最后状态如果是J3就添加J5战略出库，如果是其他添加为J1的出库记录，日期为月结最后一天 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') = 'J1')--SAP是战略出库，DMS真实出库，（这里的处理方式待确认，想法是SA_0121的CAR_STAT_CD应该改成60，SA_0301T表添加J3的数据，日期为月结最后一天） \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') = 'J5')--SAP是战略出库，DMS战略转真实，（这里的处理方式待确认，想法是SA_0121的CAR_STAT_CD应该改成60，SA_0301T表添加J3的数据，日期为月结最后一天） \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') IN ('I1','J2','J4'))--SAP是战略出库，DMS不是战略出库，（这里的处理方式待确认，想法是SA_0121的CAR_STAT_CD应该改成60，SA_0301T表添加J3的数据，日期为月结最后一天） \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.CUST_SALE_DT)--主表零售日期不一致,修改SA_0121T零售日期 \n");
		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.KMTRDY)--销售记录表零售日期不一致,修改SA_0301T零售日期 \n");
		sqlDetail.append("        ) \n");
		sqlDetail.append(" ORDER BY CHECK_REASON \n");
		sqlDetail.append(" \n");

		//System.out.println(sqlDetail.toString());
		
		//在经销商数据库执行SQL
		Connection conn = null;
        try{
            conn = dbConnection(tmpDmsCarCheckVO.getDmsIpNm());
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            System.out.println(tmpDmsCarCheckVO.getDlrCd()+" 网络不通");
            try {
            	tmpDmsCarCheckVO.setCheckResult("E");
                tmpDmsCarCheckVO.setCheckMessage("网络不通");
                salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);
				salesMonthDAO.callIfMergeCommit();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
        if(null!=conn){
            int rs = -1;
            int rsDetail = -1;
            int rsUpdate = -1;
            Statement stmt = null;
            Statement stmtUpdate = null;
            Statement stmtDetail = null;
            
            try {
                stmt = conn.createStatement();
                stmtUpdate = conn.createStatement();
                stmtDetail = conn.createStatement();

                rs = stmt.executeUpdate(sql.toString());
                rsDetail = stmtDetail.executeUpdate(sqlDetail.toString());
                
                if(rs == 0){
	                StringBuffer updateCheckResultSql = new StringBuffer();
	        		updateCheckResultSql.append("UPDATE TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" A SET A.CHECK_RESULT = 'Z',A.CHECK_MESSAGE = 'SUCCESS' WHERE A.DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("'");
	        		rsUpdate = stmtUpdate.executeUpdate(updateCheckResultSql.toString());
                }else if(StringUtils.isBlank(String.valueOf(rs))){
                	StringBuffer updateCheckResultSql = new StringBuffer();
	        		updateCheckResultSql.append("UPDATE TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" A SET A.CHECK_RESULT = 'E',A.CHECK_MESSAGE = '网络不通' WHERE A.DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("'");
	        		rsUpdate = stmtUpdate.executeUpdate(updateCheckResultSql.toString());
                }
                try {
                	tmpDmsCarCheckVO.setCheckResult("Z");
                    tmpDmsCarCheckVO.setCheckMessage("SUCCESS");
                    salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } catch (SQLException e) {
                e.printStackTrace();
                try {
                	System.out.println("#"+e.getMessage());
	                System.out.println(tmpDmsCarCheckVO.getDlrCd()+" SQL执行报错");
                	tmpDmsCarCheckVO.setCheckResult("E");
                    tmpDmsCarCheckVO.setCheckMessage("SQL执行报错");
                    salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } catch (Exception e) {
                e.printStackTrace();
                try {
                	System.out.println("#"+e.getMessage());
	                System.out.println(tmpDmsCarCheckVO.getDlrCd()+" SQL执行报错");
                	tmpDmsCarCheckVO.setCheckResult("E");
                    tmpDmsCarCheckVO.setCheckMessage("SQL执行报错");
                    salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } finally {
                try {
                    stmt.close();
                    stmtUpdate.close();
                    stmtDetail.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            System.out.println("# UPDATE RESULT END : "+ rs);
            System.out.println("# UPDATE RESULT END : "+ rsUpdate);
            System.out.println("线程结束 "+threadName);
        }
    }
    
    public Connection dbConnection(String dlrIP) throws Exception{
        Connection conn = null;

        String url = "jdbc:tibero:thin:@"+dlrIP+":8629:BHDMS";
        String user = "DMSDB";
        String password = "DMSDB_#01";

        // 1. Driver
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("com.tmax.tibero.jdbc.TbDriver");

        // 2. Connection DB (URL, ID, P/W)
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }catch (Exception e) {
            throw e;
        }

        return conn;
    }
}