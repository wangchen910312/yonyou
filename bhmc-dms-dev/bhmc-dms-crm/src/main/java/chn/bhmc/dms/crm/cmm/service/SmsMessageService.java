package chn.bhmc.dms.crm.cmm.service;

import chn.bhmc.dms.crm.cmm.vo.SmsMessageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageService.java
 * @Description : 관심차종 Service
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

public interface SmsMessageService {

    /**
     * SMS 메시지 전송
     *
     * @param messageVO
     */
    public boolean smsMessageSend(SmsMessageVO smsMessageVO) throws Exception;

}
