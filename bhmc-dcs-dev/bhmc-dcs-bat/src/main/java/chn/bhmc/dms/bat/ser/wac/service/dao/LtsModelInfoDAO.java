package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("ltsModelInfoDAO")
public interface LtsModelInfoDAO {

    /**
     *
     * BWMS LTS MODEL 정보를 가져온다.
     *
     * @throws Exception
     */
    public void insertBwmsLtsModelInfo()throws Exception;

}
