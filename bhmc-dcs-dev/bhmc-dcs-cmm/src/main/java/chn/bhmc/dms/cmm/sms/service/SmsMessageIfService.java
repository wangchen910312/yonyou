package chn.bhmc.dms.cmm.sms.service;

import java.util.List;

import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageIFService.java
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

public interface SmsMessageIfService {

	/**
     * SMS 전송구분코드 즉시전송
     */
    public static final String SMS_SEND_DSTIN_CD_IMMEDIATELY = "1";

    /**
     * SMS 전송구분코드 예약전송
     */
    public static final String SMS_SEND_DSTIN_CD_RESERVATION = "2";

    /**
     * APP 구분코드 알림메세지
     */
    public static final String APP_DSTN_CD_ALARM = "1";

    /**
     * APP 구분코드 고객케어
     */
    public static final String APP_DSTN_CD_CUSTOMER_CARE = "2";

    /**
     * APP 구분코드 캠페인
     */
    public static final String APP_DSTN_CD_CAMPAIGN = "3";

    /**
     * APP 구분코드 만족도조사
     */
    public static final String APP_DSTN_CD_SATISFACTION = "4";

    /**
     * APP 구분코드 정비예약
     */
    public static final String APP_DSTN_CD_SERVICE_RESERVATION = "5";

    /**
     * 수신 결과 코드 미전송
     */
    public static final String RECEIVE_RSLT_CD_NOT_SEND = "99";


    /**
     * DMS에서 DCS로 SMS 전송을 위한 인터페이스
     * @param smsMessageIfVO
     */
    String mergeSmsMessageIF(List<SmsMessageIfVO> smsMessageIfVOs) throws Exception;
}