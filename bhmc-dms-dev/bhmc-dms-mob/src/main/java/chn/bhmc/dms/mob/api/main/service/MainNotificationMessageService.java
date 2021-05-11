package chn.bhmc.dms.mob.api.main.service;

import java.util.List;

import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;

/**
 * <pre>
 * 알림메세지 서비스
 * </pre>
 *
 * @ClassName   : NotificationMessageService.java
 * @Description : 알림메세지 서비스
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

public interface MainNotificationMessageService {

    public static final String MESG_TP_WEB_PUSH = "W";
    public static final String MESG_TP_MOBILE_PUSH = "P";
    public static final String MESG_TP_SMS = "S";
    public static final String MESG_TP_EMAIL = "M";


    /**
     * 메세지 ID에 해당하는 알림메세지 정보를 조회한다.
     * @param mesgId 메세지 ID
     * @return
     * @throws Exception
     */
    public NotificationMessageVO selectNotificationMessageByKey(String mesgId) throws Exception;

    /**
     * 조회 조건에 해당하는 알림메세지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return 조회 목록
     */
    public List<NotificationMessageVO> selectNotificationMessagesByCondition(NotificationMessageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림메세지 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return
     */
    public int selectNotificationMessagesByConditionCnt(NotificationMessageSearchVO searchVO) throws Exception;
}
