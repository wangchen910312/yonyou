package chn.bhmc.dms.crm.cmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cmm.vo.MessageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     In Moon Lee     최초 생성
 * </pre>
 */

@Mapper("smsMessageDAO")
public interface SmsMessageDAO {

    /**
     * 문자 정보를 입력 한다.
     * @param MessageVO
     * @return Inserte Count
     */
    public int insertSMS(MessageVO messageVO) throws Exception ;

}
