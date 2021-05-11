package chn.bhmc.dms.cmm.sms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.service.dao.SmsMessageIfDAO;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageIfServiceImpl.java
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

@Service("smsMessageIfService")
public class SmsMessageIfServiceImpl extends HService implements SmsMessageIfService {
    /**
     * SMS 인터페이스 DAO
     */
    @Resource(name = "smsMessageIfDAO")
    SmsMessageIfDAO smsMessageIfDAO;

    @Override
    public String mergeSmsMessageIF(List<SmsMessageIfVO> smsMessageIfVOs) throws Exception {
        return null;
    }
}