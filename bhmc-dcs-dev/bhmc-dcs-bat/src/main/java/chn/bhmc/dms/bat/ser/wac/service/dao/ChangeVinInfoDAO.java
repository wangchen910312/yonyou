package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeVinInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 29.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("changeVinInfoDAO")
public interface ChangeVinInfoDAO {

   /**
    *
    * VIN 정보 변경
    *
    * @throws Exception
    */
    public void insertChangeVinNoInfo()throws Exception;
}
