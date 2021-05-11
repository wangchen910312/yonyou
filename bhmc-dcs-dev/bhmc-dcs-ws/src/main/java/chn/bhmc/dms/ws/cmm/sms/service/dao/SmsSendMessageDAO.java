package chn.bhmc.dms.ws.cmm.sms.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ws.cmm.sms.vo.SmsSendMessageForWsVO;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsMessageDAO
 * @Description : DCS - SMS Relay 서버간 I/F 전송을 위한  ServiceImpl
 * @author Choi KyungYong
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 9. 1.     Choi KyungYong            최초 생성
 * </pre>
 */

@Mapper("smsSendMessageDAO")
public interface SmsSendMessageDAO {

    /**
     * Relay 서버에 SMS 전송할 메시지 조회
     * @param null
     * @return Count
     */
    public List<SmsSendMessageForWsVO> selectRequestSMSMessageForWs(HashMap<String, Object> map) throws Exception;

}
