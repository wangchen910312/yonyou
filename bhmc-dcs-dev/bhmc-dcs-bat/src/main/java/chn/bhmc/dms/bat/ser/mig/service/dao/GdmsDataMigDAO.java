package chn.bhmc.dms.bat.ser.mig.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GdmsDataMigDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Yunseung
 * @since 2017. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 22.   Kin Yunseung     최초 생성
 * </pre>
 */

@Mapper("gdmsDataMigDAO")
public interface GdmsDataMigDAO {

    /**
     * Base Info
     * @throws Exception
     */
    public void insertBaseInfoGdmsToDcs(int pDay)throws Exception;

    /**
     * PWA Info
     * @throws Exception
     */
    public void insertPwaGdmsToDcs(int pDay)throws Exception;

    /**
     * Claim Info
     * @throws Exception
     */
    public void insertClaimGdmsToDcs(int pDay)throws Exception;

    /**
     * R/O Info
     * @throws Exception
     */
    public void insertRoGdmsToDcs(int pDay)throws Exception;


}
