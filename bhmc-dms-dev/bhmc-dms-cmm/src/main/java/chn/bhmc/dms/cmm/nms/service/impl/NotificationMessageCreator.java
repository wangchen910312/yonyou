package chn.bhmc.dms.cmm.nms.service.impl;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.jms.core.MessageCreator;

import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageCreator.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationMessageCreator implements MessageCreator {

    private NotificationMessageVO notificationMessageVO;

    /**
     * @param notificationMessageVO the notificationMessageVO to set
     */
    public void setNotificationMessageVO(NotificationMessageVO notificationMessageVO) {
        this.notificationMessageVO = notificationMessageVO;
    }

    /*
     * @see org.springframework.jms.core.MessageCreator#createMessage(javax.jms.Session)
     */
    @Override
    public Message createMessage(Session session) throws JMSException {
        TextMessage message = session.createTextMessage(notificationMessageVO.getMesgCont());
        message.setStringProperty("actionUrlWeb", notificationMessageVO.getActionUrlWeb());
        message.setStringProperty("actionUrlMob", notificationMessageVO.getActionUrlMob());
        message.setStringProperty("actionParams", notificationMessageVO.getActionParams());
        return message;
    }

}
