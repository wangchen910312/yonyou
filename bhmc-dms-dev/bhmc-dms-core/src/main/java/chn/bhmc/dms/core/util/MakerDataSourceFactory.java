package chn.bhmc.dms.core.util;

import java.sql.SQLException;

import javax.sql.DataSource;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MakerDataSourceFactory.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MakerDataSourceFactory {
    public static DataSource getDataSource() throws SQLException {
//        TbConnectionPoolDataSource ds = new TbConnectionPoolDataSource();
//        ds.setURL("jdbc:tibero:thin:@10.125.211.115:8629:BHDMS");
//        ds.setUser("DMSDB");
//        ds.setPassword("DMSDB_#01");
//        return ds;
        return null;
    }
}
