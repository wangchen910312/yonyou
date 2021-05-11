package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : QvocInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("qvocInfoDAO")
public interface QvocInfoDAO {

    /**
     *
     * 원인 현상 코드 정보
     *
     * @throws Exception
     */
    public void insertQvocInfo() throws Exception;

}
