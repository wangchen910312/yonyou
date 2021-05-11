package chn.bhmc.dms.bat.cmm.sms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsMessageVO;


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
     * Relay 서버에 SMS 전송할 딜러 리스트 조회
     * @param null
     * @return Count
     */
    public List<SendSmsMessageVO> selectRequestSMSDlrCdList() throws Exception;

    /**
     * Relay 서버에 SMS 전송할 메시지 조회
     * @param null
     * @return Count
     */
    public List<SendSmsMessageVO> selectRequestSMSMessage(SendSmsMessageVO sendSmsMessageVO) throws Exception;

    /**
     * SMS 전송여부 업데이트(dms)
     * @param null
     * @return Count
     */
    public void updateSmsMessageIFSucc(SendSmsMessageVO sendSmsMessageVO) throws Exception;

    /**
     * SMS 전송여부 업데이트(eai)
     * @param null
     * @return Count
     */
    public void updateSmsMessageEaiIFSucc(SendSmsMessageVO sendSmsMessageVO) throws Exception;

    /**
     * SMS 전송여부 업데이트(dms)
     * @param null
     * @return Count
     */
    public void updateSmsMessageIFFail(SendSmsMessageVO sendSmsMessageVO) throws Exception;

    /**
     * SMS 전송여부 업데이트(eai)
     * @param null
     * @return Count
     */
    public void updateSmsMessageEaiIFFail(SendSmsMessageVO sendSmsMessageVO) throws Exception;

    /**
     * SMS 예약 전송 건을 전송 대기 Flag로 변경 (중간에 취소 가능하도록 하기 위해 전송 1시간 전에 변경)
     * @param null
     * @return Count
     */
    public void updateSmsResvSendFlag() throws Exception;

}
