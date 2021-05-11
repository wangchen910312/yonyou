package chn.bhmc.dms.mob.api.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationPolicyService;
import chn.bhmc.dms.cmm.nms.service.NotificationTargetService;
import chn.bhmc.dms.cmm.nms.service.NotificationTemplateService;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;
import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.mob.api.main.dao.MainNotificationMessageDAO;
import chn.bhmc.dms.mob.api.main.service.MainNotificationMessageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("mainNotificationMessageService")
public class MainNotificationMessageServiceImpl extends HService implements MainNotificationMessageService {

    @Resource(name="mainNotificationMessageDAO")
    MainNotificationMessageDAO mainNotificationMessageDAO;
    

    @Resource(name="notificationTargetService")
    NotificationTargetService notificationTargetService;

    @Resource(name="notificationPolicyService")
    NotificationPolicyService notificationPolicyService;

    @Resource(name="notificationTemplateService")
    NotificationTemplateService notificationTemplateService;

    @Resource(name="notificationJmsTemplate")
    JmsTemplate notificationJmsTemplate;

    @Resource(name="smsMessageIfService")
    SmsMessageIfService smsMessageIfService;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessageByKey(java.lang.String)
     */
    @Override
    public NotificationMessageVO selectNotificationMessageByKey(String mesgId) throws Exception {
        return mainNotificationMessageDAO.selectNotificationMessageByKey(mesgId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessagesByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO)
     */
    @Override
    public List<NotificationMessageVO> selectNotificationMessagesByCondition(NotificationMessageSearchVO searchVO) throws Exception {
        return mainNotificationMessageDAO.selectNotificationMessagesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessagesByConditionCnt(chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO)
     */
    @Override
    public int selectNotificationMessagesByConditionCnt(NotificationMessageSearchVO searchVO) throws Exception {
        return mainNotificationMessageDAO.selectNotificationMessagesByConditionCnt(searchVO);
    }

}
