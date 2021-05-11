package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInterfaceDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("sanbaoInterfaceDAO")
public interface SanbaoInterfaceDAO {

    /**
     *
     * 삼포 기준정책
     *
     * @throws Exception
     */
    public void insertSanbaoBaseInfo()throws Exception;

    /**
     *
     * 삼포 대상빈 정보
     *
     * @throws Exception
     */
    public void insertSanbaoVinInfo()throws Exception;

}
