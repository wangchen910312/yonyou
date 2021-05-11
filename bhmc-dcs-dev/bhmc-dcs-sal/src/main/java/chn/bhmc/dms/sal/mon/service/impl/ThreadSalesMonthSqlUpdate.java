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

import chn.bhmc.dms.cmm.cmp.vo.TmpDmsUpdateSqlVO;
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

public class ThreadSalesMonthSqlUpdate implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");
    
    SalesMonthDAO salesMonthDAO = null;
    
    //最大线程数
  	final static int MAX_QPS = 30;
  	
    //获得线程执行坑位
  	final static Semaphore semaphore = new Semaphore(MAX_QPS);
    
    private String devOrPrd = "BHDCSOP";
    private TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO = null;
    private String sql = "";
    private String threadName = "任务_";
    public ThreadSalesMonthSqlUpdate(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVOIn, int i,SalesMonthDAO salesMonthDAOIn, String sqlIn) {
    	tmpDmsUpdateSqlVO = tmpDmsUpdateSqlVOIn;
    	threadName = threadName+i;
    	salesMonthDAO = salesMonthDAOIn;
    	sql = sqlIn;
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
		
		//在经销商数据库执行SQL
		Connection conn = null;
        try{
            conn = dbConnection(tmpDmsUpdateSqlVO.getDmsIpNm());
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            System.out.println(tmpDmsUpdateSqlVO.getDlrCd()+" 网络不通");
            try {
	            tmpDmsUpdateSqlVO.setUpdateResult("E");
	            tmpDmsUpdateSqlVO.setUpdateMessage("网络不通");
	            salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);
				salesMonthDAO.callIfMergeCommit();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
        if(null!=conn){
        	int rs = -1;
            Statement stmt = null;
            try {
                stmt = conn.createStatement();
                rs = stmt.executeUpdate(sql);
                try {
    	            tmpDmsUpdateSqlVO.setUpdateResult("Z");
    	            tmpDmsUpdateSqlVO.setUpdateMessage("SUCCESS");
                    salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsUpdateSqlVO.getDlrCd()+" SQL执行报错");
                try {
    	            tmpDmsUpdateSqlVO.setUpdateResult("E");
    	            tmpDmsUpdateSqlVO.setUpdateMessage("SQL执行报错");
                    salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
                
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsUpdateSqlVO.getDlrCd()+" SQL执行报错");
                try {
    	            tmpDmsUpdateSqlVO.setUpdateResult("E");
    	            tmpDmsUpdateSqlVO.setUpdateMessage(" SQL执行报错");
                    salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);
    				salesMonthDAO.callIfMergeCommit();
    			} catch (Exception e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
            } finally {
                try {
                    // Statement 종료
                    stmt.close();
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