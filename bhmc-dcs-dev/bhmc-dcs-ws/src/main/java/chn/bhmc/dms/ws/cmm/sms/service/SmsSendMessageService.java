package chn.bhmc.dms.ws.cmm.sms.service;

import java.util.HashMap;
import java.util.List;

import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceResponse;

import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceRequest;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsMessageService
 * @Description : DDCS - SMS Relay 서버간 I/F 전송을 위한  Service
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

public interface SmsSendMessageService {

    /**
     * DCS - SMS Relay 서버간 RESTFUL 전송을 위한 배치(POST)
     * @param null
     * @return Count
     */
    public List<HashMap<String, String>> getSMSMessageValidate(SmsSendWebServiceRequest smsSendWebServiceRequest) throws Exception;

    /**
     * DCS - SMS Relay 서버간 RESTFUL 전송을 위한 배치(POST)
     * @param null
     * @return Count
     */
    public SmsSendWebServiceResponse requestSMSMessageValidate(List<HashMap<String, String>> pList) throws Exception;
}