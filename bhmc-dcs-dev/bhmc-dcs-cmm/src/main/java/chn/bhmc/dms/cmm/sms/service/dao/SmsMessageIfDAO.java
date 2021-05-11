package chn.bhmc.dms.cmm.sms.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageIfDAO.java
 * @Description : DMS에서 DCS로 SMS 전송을 위한 인터페이스
 * @author Choi Kyung Yong
 * @since 2016. 9. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since           author                 description
 *  ===========    ===============    ===========================
 *  2016. 9. 5.    Choi Kyung Yong              최초 생성
 * </pre>
 */

@Mapper("smsMessageIfDAO")
public interface SmsMessageIfDAO {

    public int insertSmsMessageIF(SmsMessageIfVO smsMessageIfVO);
}