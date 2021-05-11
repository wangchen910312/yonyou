package chn.bhmc.dms.cmm.mig.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import able.com.service.HService;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.mig.service.PatchableService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SqlPatchableServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SqlPatchableServiceImpl extends HService implements PatchableService {

    Logger logger = LoggerFactory.getLogger(SqlPatchableServiceImpl.class);

    DataSource dataSource;

    @Override
    public void patch(String id, String patchTempFolder, String destFilePath) throws Exception {

        File file = new File(patchTempFolder + destFilePath);
        if(!file.exists()){
            throw processException("File not found");
        }

        String queryString = FileUtils.readFileToString(file, "UTF-8");

        logger.debug("queryString {}", queryString);

        final int batchSize = 100;
        int count = 0;

        Connection con = null;
        Statement stmt = null;

        try {
            con = dataSource.getConnection();
            con.setAutoCommit(false);

            stmt = con.createStatement();

            String queries[] = queryString.split("//");

            for(String query : queries){

                if(StringUtils.isNotBlank(query)){
                    logger.debug("query {}", query);
                    stmt.addBatch(query);

                    if(++count % batchSize == 0) {
                        stmt.executeBatch();
                    }
                }
            }

            stmt.executeBatch();
            con.commit();

        } catch (SQLException e) {
            logger.error(e.getMessage(), e);

            try{
                con.rollback();
            } catch (SQLException ex){}

            throw processException(e.getMessage());
        }finally{
            try {
                if(stmt != null) stmt.close();
            }catch(SQLException e){}

            try{
                if(con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
            }
        }
    }

    @Override
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

}
