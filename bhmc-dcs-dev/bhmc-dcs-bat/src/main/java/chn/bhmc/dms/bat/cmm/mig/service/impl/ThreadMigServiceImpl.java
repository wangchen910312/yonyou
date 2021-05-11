package chn.bhmc.dms.bat.cmm.mig.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigServiceImpl.java
 * @Description : DCS Migration을 위한 배치
 * @author Choi KyungYong
 * @since 2017. 07. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 07. 10.    Choi KyungYong         최초 생성
 * </pre>
 */

public class ThreadMigServiceImpl implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");

    private String dlrCd = "";
    private int iRRFlag = 0;

    public ThreadMigServiceImpl(String pDlrCd, int pRRFlag) {
        dlrCd = pDlrCd;
        iRRFlag = pRRFlag;
    }

    /*
     * @see java.lang.Runnable#run()
     */
    public void run() {
        Connection conn = null;
        Connection conn2 = null;
        CallableStatement cs = null;
        CallableStatement cs2 = null;
        try {
            //쓰레드가 2번 실행하는 오류가 있어 count 체크
            logger.debug("ThreadMigServiceImpl start dealer = " + dlrCd);

            Class.forName("oracle.jdbc.driver.OracleDriver");
            if(iRRFlag % 2 > 0){
                conn = DriverManager.getConnection("jdbc:oracle:thin:@10.125.211.200:1521:NDMSMIG1", "GDMS", "BHDMS2016");
            }else{
                conn = DriverManager.getConnection("jdbc:oracle:thin:@10.125.211.201:1521:NDMSMIG2", "GDMS", "BHDMS2016");
            }

            logger.debug("ThreadMigServiceImpl 1 process = " + dlrCd);
            cs = conn.prepareCall("{call GDMS.MIG_GDMS_DELETE_DLR(?)}");
            cs.setString(1,dlrCd);
            cs.executeUpdate();

            logger.debug("ThreadMigServiceImpl 2 process = " + dlrCd);
            cs = null;
            cs = conn.prepareCall("{call GDMS.MIG_GDMS_INSERT_DLR(?)}");
            cs.setString(1,dlrCd);
            cs.executeUpdate();

            if(iRRFlag % 2 > 0){
                conn2 = DriverManager.getConnection("jdbc:oracle:thin:@10.125.211.200:1521:NDMSMIG1", "MIG", "MIG1234#");
            }else{
                conn2 = DriverManager.getConnection("jdbc:oracle:thin:@10.125.211.201:1521:NDMSMIG2", "MIG", "MIG1234#");
            }
            logger.debug("ThreadMigServiceImpl 3 process = " + dlrCd);
            cs2 = conn2.prepareCall("{call GDMS.MIG_SIEBEL(?)}");
            cs2.setString(1,dlrCd);
            cs2.executeUpdate();

            logger.debug("ThreadMigServiceImpl 4 process = " + dlrCd);
            cs2 = null;
            cs2 = conn2.prepareCall("{call MIG.MIG_PROC_MAIN_DLR_CD(?)}");
            cs2.setString(1,dlrCd);
            cs2.executeUpdate();

            logger.debug("ThreadMigServiceImpl end dealer = " + dlrCd);
        } catch (Exception e) {
            logger.debug("ThreadMigServiceImpl error" + e.toString());
        }finally{
            if(conn != null){
                try {
                    conn.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            if(conn2 != null){
                try {
                    conn2.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            if(cs != null){
                try {
                    cs.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            if(cs2 != null){
                try {
                    cs2.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }
}