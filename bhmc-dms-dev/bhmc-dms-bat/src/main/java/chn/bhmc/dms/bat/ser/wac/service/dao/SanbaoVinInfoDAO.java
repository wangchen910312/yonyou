package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoVinInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 10. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 7.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("sanbaoVinInfoDAO")
public interface SanbaoVinInfoDAO {

    /**
    *
    * 삼포 대상빈 등록
    *
    * @throws Exception
    */
   public void insertSanbaoVinInfo()throws Exception;
}
