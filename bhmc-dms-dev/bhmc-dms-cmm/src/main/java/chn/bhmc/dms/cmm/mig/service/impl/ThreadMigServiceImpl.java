package chn.bhmc.dms.cmm.mig.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.mig.vo.MigVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ThreadMigServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 10. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 10. 3.     Choi Kyung Yong     최초 생성
 * </pre>
 */

public class ThreadMigServiceImpl implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");

    private MigVO migVO = new MigVO();

    public ThreadMigServiceImpl(MigVO pMigVO) {
        migVO = pMigVO;
    }
    /*
     * @see java.lang.Runnable#run()
     */
    @Override
    public void run() {
        Connection conn = null;
        CallableStatement cs = null;

        try {
            Class.forName("com.tmax.tibero.jdbc.TbDriver");
            conn = DriverManager.getConnection("jdbc:tibero:thin:@localhost:8629:BHDMS", "DMSDB", "DMSDB_#01");
            cs = conn.prepareCall("{call DMSDB.MIG_NDMS_INSERT(?,?,?,?)}");
            cs.setString(1,migVO.getDlrCd());
            cs.setInt(2,migVO.getPartRunNum());
            cs.setInt(3,migVO.getPartRunNum2());
            cs.setString(4,migVO.getMembershipPolicy());
            cs.executeUpdate();
            conn.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn != null){
                try {
                    conn.rollback();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if(cs != null){
                try {
                    cs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
