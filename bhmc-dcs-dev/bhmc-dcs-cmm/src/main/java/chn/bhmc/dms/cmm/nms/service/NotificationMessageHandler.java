package chn.bhmc.dms.cmm.nms.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 25.     Kang Seok Han     최초 생성
 * </pre>
 */
@Component("notificationMessageHandler")
public class NotificationMessageHandler extends TextWebSocketHandler {
    public static final Logger log = LoggerFactory.getLogger(NotificationMessageHandler.class);

    private List<WebSocketSession> sessionList;

    public SimpleDateFormat timeFormat;

    public NotificationMessageHandler() {
        super();
        setSessionList(new ArrayList<WebSocketSession>());
        setTimeFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
    }

    /**
     * 접속시 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        String broadCastMessage=session.getId()+"님께서 입장하셨습니다["+getTimeFormat().format(new Date())+"]";
        for(WebSocketSession user: getSessionList()){
            user.sendMessage(new TextMessage(broadCastMessage));
        }
        sessionList.add(session);
        session.sendMessage(new TextMessage("당신의 아이디는 "+session.getId()+"입니다."));

        log.info(broadCastMessage);
    }
    /**
     * 메시지 핸들러
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
            String broadCastMessage=session.getId()+":"+message.getPayload()+"["+getTimeFormat().format(new Date())+"]";
            for(WebSocketSession user: getSessionList()){
                user.sendMessage(new TextMessage(broadCastMessage));
            }

            log.info(broadCastMessage);
    }

    /**
     * 접속종료시 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
            getSessionList().remove(session);
            String broadCastMessage=session.getId()+"님이 퇴장하였습니다"+"["+getTimeFormat().format(new Date())+"]";
            for(WebSocketSession user: getSessionList()){
                user.sendMessage(new TextMessage(broadCastMessage));
            }

            log.info(broadCastMessage);
    }
    /**
     * @return sessionList
     */
    public List<WebSocketSession> getSessionList() {
        return sessionList;
    }
    /**
     * @param sessionList 설정할 sessionList
     */
    public void setSessionList(List<WebSocketSession> sessionList) {
        this.sessionList = sessionList;
    }

    /**
     * @return timeFormat
     */
    public SimpleDateFormat getTimeFormat() {
        return timeFormat;
    }

    /**
     * @param timeFormat 설정할 timeFormat
     */
    public void setTimeFormat(SimpleDateFormat timeFormat) {
        this.timeFormat = timeFormat;
    }
}
