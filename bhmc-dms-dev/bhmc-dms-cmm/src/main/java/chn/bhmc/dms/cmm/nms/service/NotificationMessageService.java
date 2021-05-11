package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;

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

public interface NotificationMessageService {

    public static final String MESG_TP_WEB_PUSH = "W";
    public static final String MESG_TP_MOBILE_PUSH = "P";
    public static final String MESG_TP_SMS = "S";
    public static final String MESG_TP_EMAIL = "M";

    /**
     * 알림정책그룹의 수신대상 사용자에게 알림메세지를 발송한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹 ID
     * @param dlrCd 딜러코드
     * @param context
     */
    public void sendNotificationMessage(String sysCd, String alrtPolicyGrpId, String dlrCd, NotificationMessageContext context) throws Exception;

    /**
     * 알림정책그룹의 수신대상을 받아 알림메세지를 발송한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹 ID
     * @param dlrCd 딜러코드
     * @param context
     * @param targetUser 메세지 대상
     */
    public void sendNotificationMessage(String sysCd, String alrtPolicyGrpId, String dlrCd, NotificationMessageContext context, List<NotificationTargetUserVO> targetUsers) throws Exception;

    /**
     * 알림메세지를 등록한다.
     * @param notificationMessageVO 알림메세지 정보
     * @throws Exception
     */
    public void insertNotificationMessage(NotificationMessageVO notificationMessageVO) throws Exception;

    /**
     * 메세지 ID에 해당하는 메세지를 삭제한다.
     * @param mesgId 메세지 ID
     * @return
     * @throws Exception
     */
    public int deleteNotificationMessage(String mesgId) throws Exception;

    /**
     * 수신여부를 수신상태로 변경한다.
     * @param mesgId 메세지 ID
     * @return
     * @throws Exception
     */
    public int updateReceive(String mesgId) throws Exception;

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

    /**
     * 알림메세지 정보를 수신처리한다.
     * @param list
     * @return
     */
    public int updateNotificationInfoRcve(List<String> list) throws Exception;

    /**
     * 알림메세지 정보를 수신처리한다.
     * @param mesgId
     */
    public int updateNotificationInfoRcve(String mesgId) throws Exception;
}
