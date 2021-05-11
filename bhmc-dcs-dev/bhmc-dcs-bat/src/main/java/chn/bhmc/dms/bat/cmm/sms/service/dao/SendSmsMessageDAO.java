package chn.bhmc.dms.bat.cmm.sms.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsMessageVO;
import chn.bhmc.dms.bat.cmm.sms.vo.SmsMessageResultVO;


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

@Mapper("sendSmsMessageDAO")
public interface SendSmsMessageDAO {

    /**
     * Relay 서버에 SMS 전송할 메시지 조회
     * @param null
     * @return Count
     */
    public List<SendSmsMessageVO> selectRequestSMSMessage() throws Exception;

    /**
     * SMS 일련번호에 따른 전송번호 업데이트
     * @param null
     * @return Count
     */
    public void updateSmsSeq(HashMap<String, Object> map) throws Exception;

    /**
     * SMS 일련번호에 따른 전송번호 업데이트
     * @param null
     * @return Count
     */
    public void updateSmsSeqIR(HashMap<String, Object> map) throws Exception;

    /**
     * DCS - SMS Relay 서버간 RESTFUL 전송내역을 저장
     * @param null
     * @return Count
     */
    public void insertSendSMSMessage(SmsMessageResultVO smsMessageResultVO) throws Exception;

    /**
     * SMS 일련번호에 따른 전송번호 업데이트
     * @param null
     * @return Count
     */
    public void updateSmsResponse(SmsMessageResultVO smsMessageResultVO) throws Exception;

    /**
     * SMS 일련번호에 따른 전송번호 업데이트
     * @param null
     * @return Count
     */
    public void updateSmsResponseIR(SmsMessageResultVO smsMessageResultVO) throws Exception;

    /**
     * SMS 일련번호에 따른 전송번호 업데이트
     * @param null
     * @return Count
     */
    public void insertSmsResponseIS(SmsMessageResultVO smsMessageResultVO) throws Exception;

}
