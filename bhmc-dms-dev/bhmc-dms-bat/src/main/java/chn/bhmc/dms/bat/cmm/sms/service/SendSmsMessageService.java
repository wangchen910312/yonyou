package chn.bhmc.dms.bat.cmm.sms.service;

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

public interface SendSmsMessageService {

    /**
     * SMS 전송구분코드 즉시전송
     */
    public static final String SMS_SEND_DSTIN_CD_IMMEDIATELY = "1";

    /**
     * SMS 전송구분코드 예약전송
     */
    public static final String SMS_SEND_DSTIN_CD_RESERVATION = "2";
    /**
     * DCS - SMS Relay 서버간 RESTFUL 전송을 위한 배치(POST)
     * @param null
     * @return Count
     */
    public void requestSMSMessage() throws Exception;

}