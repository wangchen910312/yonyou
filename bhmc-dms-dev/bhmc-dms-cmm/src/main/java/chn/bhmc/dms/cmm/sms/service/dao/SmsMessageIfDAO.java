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

    /**
     * SMS Seq 조회
     * @param SmsMessageIfVO smsMessageIfVO
     * @return String
     */
    public String selectSmsMessageSeq(SmsMessageIfVO smsMessageIfVO);

    /**
     * SMS 전송 이력 저장
     * @param SmsMessageIfVO smsMessageIfVO
     * @return int
     */
    public int insertSmsMessageIF(SmsMessageIfVO smsMessageIfVO);

    /**
     * SMS 전송 요청 저장
     * @param SmsMessageIfVO smsMessageIfVO
     * @return void
     */
    public int insertSmsMessageEaiIF();

    /**
     * SMS 전송여부 업데이트(dms)
     * @param null
     * @return Count
     */
    public int updateSmsMessageIfSuccess(SmsMessageIfVO smsMessageIfVO) throws Exception;

    /**
     * SMS 전송여부 업데이트(eai)
     * @param null
     * @return Count
     */
    public int updateSmsMessageEaiIfSuccess(SmsMessageIfVO smsMessageIfVO) throws Exception;

    /**
     * SMS 예약 취소를 위한 업데이트
     * @param null
     * @return Count
     */
    public int updateSmsMessageCancIF(SmsMessageIfVO smsMessageIfVO) throws Exception;
}