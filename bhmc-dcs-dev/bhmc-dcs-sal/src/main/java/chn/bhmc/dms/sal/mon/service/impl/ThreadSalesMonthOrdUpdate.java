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
 * @ClassName   : ThreadSalesMonthOrdUpdate.java
 * @Description : 批量执行经销商差异修复
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

public class ThreadSalesMonthOrdUpdate implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");
    
    SalesMonthDAO salesMonthDAO = null;
    
    //最大线程数
  	final static int MAX_QPS = 30;
  	
    //获得线程执行坑位
  	final static Semaphore semaphore = new Semaphore(MAX_QPS);
    
    private String devOrPrd = "BHDCSOP";
    private TmpDmsOrderCheckVO tmpDmsOrderCheckVO = null;
    private String threadName = "任务_";
    public ThreadSalesMonthOrdUpdate(TmpDmsOrderCheckVO tmpDmsOrderCheckVOIn, int i,SalesMonthDAO salesMonthDAOIn) {
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
    	StringBuffer sql = new StringBuffer();
		sql.append("UPDATE SA_0416T A SET (A.PRTY,A.ALDY) = (SELECT B.PRTY,B.ALDY FROM SA_0416IR_ERP@").append(devOrPrd).append(" B WHERE B.SALES_NO = A.SALES_NO) \n");
		sql.append("WHERE A.SALES_NO IN \n");
		sql.append("( \n");
		sql.append("SELECT NVL(A.SALES_NO,B.SALES_NO) FROM ( \n");
		sql.append("         SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT \n");
		sql.append("         FROM SA_0416T \n");
		sql.append("         WHERE 1=1 \n");
		sql.append("          AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("')  OR PRTY = 'A'  ) \n");
		sql.append("          AND DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
		sql.append("     ) A FULL JOIN ( \n");
		sql.append("         SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
		sql.append("         FROM SA_0416IR_ERP@").append(devOrPrd).append(" \n");
		sql.append("         WHERE 1=1 \n");
		sql.append("          AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(tmpDmsOrderCheckVO.getCheckMonth()).append("')  OR PRTY = 'A'  ) \n");
		sql.append("          AND DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
		sql.append("     ) B    ON A.SALES_NO = B.SALES_NO \n");
		sql.append("     WHERE 1=1 \n");
		sql.append("          AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )) \n");
		sql.append(") \n");
		
		StringBuffer sqlCheck = new StringBuffer();
		sqlCheck.append("UPDATE TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" C SET C.UPDATE_RESULT='Z',C.UPDATE_MESSAGE='SUCCESS' WHERE C.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
		//在经销商数据库执行SQL
		Connection conn = null;
        try{
            conn = dbConnection(tmpDmsOrderCheckVO.getDmsIpNm());
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" 网络不通");
            try {
	            tmpDmsOrderCheckVO.setUpdateResult("E");
	            tmpDmsOrderCheckVO.setUpdateMessage("网络不通");
	            salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
				salesMonthDAO.callIfMergeCommit();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
        if(null!=conn){
        	int rs = -1;
        	int rsCheck = -1;
            Statement stmt = null;
            Statement stmtCheck = null;
            try {
                stmt = conn.createStatement();
                stmtCheck = conn.createStatement();
                rs = stmt.executeUpdate(sql.toString());
                rsCheck = stmt.executeUpdate(sqlCheck.toString());
                try {
    	            tmpDmsOrderCheckVO.setUpdateResult("Z");
    	            tmpDmsOrderCheckVO.setUpdateMessage("SUCCESS");
                    salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsOrderCheckVO.getDlrCd());
                try {
    	            tmpDmsOrderCheckVO.setUpdateResult("E");
    	            tmpDmsOrderCheckVO.setUpdateMessage("SQL执行报错");
                    salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
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
    	            tmpDmsOrderCheckVO.setUpdateResult("E");
    	            tmpDmsOrderCheckVO.setUpdateMessage("SQL执行报错");
                    salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } finally {
                try {
                    // Statement 종료
                    stmt.close();
                    stmtCheck.close();
                    // Connection 종료
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            System.out.println("# UPDATE RESULT END : "+ rs);
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