package chn.bhmc.dms.sal.mon.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

public class ThreadSalesMonthOrdServiceImpl implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");
    
    SalesMonthDAO salesMonthDAO = null;
    
    //最大线程数
  	final static int MAX_QPS = 30;
  	
    //获得线程执行坑位
  	final static Semaphore semaphore = new Semaphore(MAX_QPS);
    
    private String devOrPrd = "BHDCSOP";
    private TmpDmsOrderCheckVO tmpDmsOrderCheckVO = null;
    private String threadName = "任务_";
    public ThreadSalesMonthOrdServiceImpl(TmpDmsOrderCheckVO tmpDmsOrderCheckVOIn, int i,SalesMonthDAO salesMonthDAOIn) {
    	tmpDmsOrderCheckVO = tmpDmsOrderCheckVOIn;
    	threadName = threadName+i;
    	salesMonthDAO = salesMonthDAOIn;
    }
    public String getName(){
    	return threadName;
    }

    /*
     * @see java.lang.Runnable#run()
     */
    @Override
    public void run() {
    	//semaphore.acquireUninterruptibly(1);
    	System.out.println("线程开始 "+threadName);
    	StringBuffer sqlnotmatch = new StringBuffer();
		sqlnotmatch.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
		sqlnotmatch.append("    USING( \n");
		sqlnotmatch.append("      SELECT T1.DLR_CD, COUNT(1) COUNT \n");
		sqlnotmatch.append("        FROM SA_0416T T1 \n");
		sqlnotmatch.append("       WHERE 1=1 \n");
		sqlnotmatch.append("         AND T1.PRTY = 'A' \n");
		sqlnotmatch.append("    GROUP BY T1.DLR_CD \n");
		sqlnotmatch.append("    ) B \n");
		sqlnotmatch.append("    ON (A.DLR_CD = B.DLR_CD) \n");
		sqlnotmatch.append("    WHEN MATCHED THEN \n");
		sqlnotmatch.append("      UPDATE SET A.DMS_ORDER_NOTMATCH = B.COUNT \n");

		StringBuffer sqlmatch = new StringBuffer();
		sqlmatch.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
		sqlmatch.append("    USING( \n");
		sqlmatch.append("      SELECT T1.DLR_CD, COUNT(1) COUNT \n");
		sqlmatch.append("        FROM SA_0416T T1 \n");
		sqlmatch.append("       WHERE 1=1 \n");
		sqlmatch.append("         AND T1.PRTY IN('P','M','N','C','F','D','E') \n");
		sqlmatch.append("         AND SUBSTR(T1.ALDY,0,6) = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("' \n");
		sqlmatch.append("    GROUP BY T1.DLR_CD \n");
		sqlmatch.append("    ) B \n");
		sqlmatch.append("    ON (A.DLR_CD = B.DLR_CD) \n");
		sqlmatch.append("    WHEN MATCHED THEN \n");
		sqlmatch.append("      UPDATE SET A.DMS_ORDER_MATCH = B.COUNT \n");
	
		StringBuffer sql = new StringBuffer();
    	sql.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
    	sql.append("    USING( \n");
    	sql.append("      SELECT C.DLR_CD,COUNT(1) DIFF_COUNT FROM( \n");
    	sql.append("      SELECT NVL(A.DLR_CD,B.DLR_CD) DLR_CD,NVL(A.SALES_NO,B.SALES_NO) \n");
    	sql.append("               FROM (SELECT T1.DLR_CD, T1.SALES_NO ,T1.CNDY,(CASE   WHEN  T1.PRTY IN('P','M','N','C','F','D','E')  THEN 'P' ELSE 'A' END) AS PRTY , T1.ALDY , T1.EMONT \n");
    	sql.append("                     FROM SA_0416T T1 \n");
    	sql.append("                     WHERE 1=1 \n");
    	sql.append("                      AND ((T1.PRTY  IN('P','M','N','C','F','D','E')  AND SUBSTR(T1.ALDY,0,6) = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("')  OR T1.PRTY = 'A') \n");
//    	sql.append("                      AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    	sql.append("                   ) A FULL JOIN ( \n");
    	sql.append("                      SELECT T1.DLR_CD, T1.SALES_NO ,T1.CNDY,T1.PRTY , T1.ALDY , T1.EMONT \n");
    	sql.append("                      FROM SA_0416IR_ERP@").append(devOrPrd).append(" T1 \n");
    	sql.append("                     WHERE 1=1 \n");
    	sql.append("                      AND T1.PRTY  IN('A','P','M','N','C','F','D','E') \n");
    	sql.append("                      AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    	sql.append("                   ) B    ON A.SALES_NO = B.SALES_NO \n");
    	sql.append("               WHERE 1=1 \n");
    	sql.append("                    AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR \n");
    	sql.append("                          (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A')) \n");
    	sql.append("      ) C,TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" D \n");
    	sql.append("      WHERE C.DLR_CD  = D.DLR_CD \n");
    	sql.append("        AND D.CHECK_MONTH = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("' \n");
    	sql.append("        AND C.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    	sql.append("      GROUP BY C.DLR_CD \n");
    	sql.append("    ) B \n");
    	sql.append("    ON (A.DLR_CD = B.DLR_CD AND A.CHECK_MONTH = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("') \n");
    	sql.append("    WHEN MATCHED THEN \n");
    	sql.append("      UPDATE SET A.TOTAL_DIFF = B.DIFF_COUNT \n");
    	sql.append("      ,A.CHECK_RESULT = 'Z' \n");
    	sql.append("      ,A.CHECK_MESSAGE = 'SUCCESS' \n");
//		System.out.println(sql.toString());
		
		StringBuffer sqlDetail = new StringBuffer();
		sqlDetail.append("INSERT INTO TMP_DMS_ERP_ORD_DETAIL@").append(devOrPrd).append(" \n");
		sqlDetail.append("  (DLR_CD, \n");
		sqlDetail.append("   SALES_NO, \n");
		sqlDetail.append("   PRTY, \n");
		sqlDetail.append("   ORTY, \n");
		sqlDetail.append("   ALDY, \n");
		sqlDetail.append("   ORD_YYMM, \n");
		sqlDetail.append("   ORD_WEEK, \n");
		sqlDetail.append("   ASDY, \n");
		sqlDetail.append("   ACDY, \n");
		sqlDetail.append("   OCDY, \n");
		sqlDetail.append("   VIN_NO1, \n");
		sqlDetail.append("   VIN_NO2, \n");
		sqlDetail.append("   REG_USR_ID, \n");
		sqlDetail.append("   REG_DT, \n");
		sqlDetail.append("   ERP_DLR_CD, \n");
		sqlDetail.append("   ERP_SALES_NO, \n");
		sqlDetail.append("   ERP_PRTY, \n");
		sqlDetail.append("   ERP_ORTY, \n");
		sqlDetail.append("   ERP_ALDY, \n");
		sqlDetail.append("   ERP_ORD_YYMM, \n");
		sqlDetail.append("   ERP_ORD_WEEK, \n");
		sqlDetail.append("   ERP_ASDY, \n");
		sqlDetail.append("   ERP_ACDY, \n");
		sqlDetail.append("   ERP_OCDY, \n");
		sqlDetail.append("   ERP_VIN_NO1, \n");
		sqlDetail.append("   ERP_VIN_NO2, \n");
		sqlDetail.append("   ERP_REG_USR_ID, \n");
		sqlDetail.append("   ERP_REG_DT) \n");
		sqlDetail.append("  SELECT A.DLR_CD, \n");
		sqlDetail.append("         A.SALES_NO, \n");
		sqlDetail.append("         A.PRTY, \n");
		sqlDetail.append("         A.ORTY, \n");
		sqlDetail.append("         A.ALDY, \n");
		sqlDetail.append("         A.ORD_YYMM, \n");
		sqlDetail.append("         A.ORD_WEEK, \n");
		sqlDetail.append("         A.ASDY, \n");
		sqlDetail.append("         A.ACDY, \n");
		sqlDetail.append("         A.OCDY, \n");
		sqlDetail.append("         A.VIN_NO1, \n");
		sqlDetail.append("         A.VIN_NO2, \n");
		sqlDetail.append("         'admin' REG_USR_ID, \n");
		sqlDetail.append("         SYSDATE REG_DT, \n");
		sqlDetail.append("         B.DLR_CD ERP_DLR_CD, \n");
		sqlDetail.append("         B.SALES_NO ERP_SALES_NO, \n");
		sqlDetail.append("         B.PRTY ERP_PRTY, \n");
		sqlDetail.append("         B.ORTY ERP_ORTY, \n");
		sqlDetail.append("         B.ALDY ERP_ALDY, \n");
		sqlDetail.append("         B.ORD_YYMM ERP_ORD_YYMM, \n");
		sqlDetail.append("         B.ORD_WEEK ERP_ORD_WEEK, \n");
		sqlDetail.append("         CASE WHEN B.ASDY IS NULL OR NVL(B.ASDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.ASDY, 'YYYYMMDD') END ERP_ASDY, \n");
		sqlDetail.append("         CASE WHEN B.ACDY IS NULL OR NVL(B.ACDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.ACDY, 'YYYYMMDD') END ERP_ACDY, \n");
		sqlDetail.append("         CASE WHEN B.OCDY IS NULL OR NVL(B.OCDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.OCDY, 'YYYYMMDD') END ERP_OCDY, \n");
		sqlDetail.append("         B.VIN_NO1 ERP_VIN_NO1, \n");
		sqlDetail.append("         B.VIN_NO2 ERP_VIN_NO2, \n");
		sqlDetail.append("         'admin' ERP_REG_USR_ID, \n");
		sqlDetail.append("         SYSDATE ERP_REG_DT \n");
		sqlDetail.append("    FROM (SELECT T1.DLR_CD, \n");
		sqlDetail.append("                 T1.SALES_NO, \n");
		sqlDetail.append("                 T1.CNDY, \n");
		sqlDetail.append("                 (CASE \n");
		sqlDetail.append("                   WHEN T1.PRTY IN ('P', 'M', 'N', 'C', 'F', 'D', 'E') THEN \n");
		sqlDetail.append("                    'P' \n");
		sqlDetail.append("                   WHEN T1.PRTY = 'B' THEN \n");
		sqlDetail.append("                    'B' \n");
		sqlDetail.append("                   ELSE \n");
		sqlDetail.append("                    'A' \n");
		sqlDetail.append("                 END) AS PRTY, \n");
		sqlDetail.append("                 T1.ORTY, \n");
		sqlDetail.append("                 T1.ALDY, \n");
		sqlDetail.append("                 T1.ORD_YYMM, \n");
		sqlDetail.append("                 T1.ORD_WEEK, \n");
		sqlDetail.append("                 T1.ASDY, \n");
		sqlDetail.append("                 T1.ACDY, \n");
		sqlDetail.append("                 T1.OCDY, \n");
		sqlDetail.append("                 T1.VIN_NO1, \n");
		sqlDetail.append("                 T1.VIN_NO2 \n");
		sqlDetail.append("            FROM SA_0416T T1 \n");
		sqlDetail.append("           WHERE 1 = 1 \n");
		sqlDetail.append("             AND ((T1.PRTY IN ('P', 'M', 'N', 'C', 'F', 'D', 'E') AND \n");
		sqlDetail.append("                 SUBSTR(T1.ALDY, 0, 6) = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("') OR T1.PRTY = 'A')) A \n");
		sqlDetail.append("    FULL JOIN (SELECT T1.DLR_CD, \n");
		sqlDetail.append("                      T1.SALES_NO, \n");
		sqlDetail.append("                      T1.CNDY, \n");
		sqlDetail.append("                      T1.PRTY, \n");
		sqlDetail.append("                      T1.ORTY, \n");
		sqlDetail.append("                      T1.ALDY, \n");
		sqlDetail.append("                      T1.ORD_YYMM, \n");
		sqlDetail.append("                      T1.ORD_WEEK, \n");
		sqlDetail.append("                      T1.ASDY, \n");
		sqlDetail.append("                      T1.ACDY, \n");
		sqlDetail.append("                      T1.OCDY, \n");
		sqlDetail.append("                      T1.VIN_NO1, \n");
		sqlDetail.append("                      T1.VIN_NO2 \n");
		sqlDetail.append("                 FROM SA_0416IR_ERP@").append(devOrPrd).append(" T1 \n");
		sqlDetail.append("                WHERE 1 = 1 \n");
		sqlDetail.append("                  AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
		sqlDetail.append("                  AND T1.PRTY IN ('A', 'P', 'M', 'N', 'C', 'F', 'D', 'E')) B \n");
		sqlDetail.append("      ON A.SALES_NO = B.SALES_NO \n");
		sqlDetail.append("   WHERE 1 = 1 \n");
		sqlDetail.append("     AND (NVL(A.PRTY, '1') <> NVL(B.PRTY, '2') OR \n");
		sqlDetail.append("         (NVL(A.ALDY, '1') <> NVL(B.ALDY, '2') AND NVL(A.PRTY, '1') <> 'A')) \n");
//		System.out.println(sqlDetail.toString());
		
		StringBuffer updateCheckResultSql = new StringBuffer();
		updateCheckResultSql.append("UPDATE TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A SET A.NOTMATCH_DIFF = ABS(NVL(A.ERP_ORDER_NOTMATCH,0)-NVL(A.DMS_ORDER_NOTMATCH,0)),A.MATCH_DIFF = ABS(NVL(A.ERP_ORDER_MATCH,0)-NVL(A.DMS_ORDER_MATCH,0)),A.CHECK_RESULT = 'Z',A.CHECK_MESSAGE = 'SUCCESS' WHERE A.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("'");
		
		//在经销商数据库执行SQL
		Connection conn = null;
        try{
            conn = dbConnection(tmpDmsOrderCheckVO.getDmsIpNm());
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" 网络不通");
            try {
	            tmpDmsOrderCheckVO.setCheckResult("E");
	            tmpDmsOrderCheckVO.setCheckMessage("网络不通");
	            salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);
				salesMonthDAO.callIfMergeCommit();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
        if(null!=conn){
        	int rsnotmatch = -1;
        	int rsmatch = -1;
        	int rs = -1;
            int rsDetail = -1;
            int rsLast = -1;
            Statement stmtnotmatch = null;
            Statement stmtmatch = null;
            Statement stmt = null;
            Statement stmtDetail = null;
            Statement stmtLast = null;
            try {
                stmtnotmatch = conn.createStatement();
                rsnotmatch = stmtnotmatch.executeUpdate(sqlnotmatch.toString());
                
                stmtmatch = conn.createStatement();
                rsmatch = stmtmatch.executeUpdate(sqlmatch.toString());
                
                stmt = conn.createStatement();
                rs = stmt.executeUpdate(sql.toString());
                
                stmtDetail = conn.createStatement();
                rsDetail = stmtDetail.executeUpdate(sqlDetail.toString());
                
                stmtLast = conn.createStatement();
                rsLast = stmtLast.executeUpdate(updateCheckResultSql.toString());

                try {
    	            tmpDmsOrderCheckVO.setCheckResult("Z");
    	            tmpDmsOrderCheckVO.setCheckMessage("SUCCESS");
                    salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" SQL执行报错");
                try {
    	            tmpDmsOrderCheckVO.setCheckResult("E");
    	            tmpDmsOrderCheckVO.setCheckMessage("SQL执行报错");
                    salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
                
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsOrderCheckVO.getDlrCd()+"SQL执行报错");
                try {
    	            tmpDmsOrderCheckVO.setCheckResult("E");
    	            tmpDmsOrderCheckVO.setCheckMessage("SQL执行报错");
                    salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } finally {
                try {
                    // Statement 종료
                	stmtnotmatch.close();
                	stmtmatch.close();
                    stmt.close();
                    stmtDetail.close();
                    stmtLast.close();
                    // Connection 종료
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            System.out.println("# UPDATE RESULT END : "+ rsLast);
        }
        System.out.println("线程结束 "+threadName);
    }

    //如果是是继承Thread，开放下面方法，如果是继承Runnable，关掉下面方法
//    public void cancel() {
//        interrupt();
//    }
    
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