package chn.bhmc.dms.dply.cmm.service;

import java.util.List;

import chn.bhmc.dms.dply.cmm.vo.NotificationHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationHistoryVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSaveVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheolman Man Oh     최초 생성
 * </pre>
 */

public interface NotificationService {

    /**
     * 조회 조건에 해당하는 Notification Receiver 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationReceiverSearchVO
     * @return 조회 목록
     */
    public List<NotificationReceiverVO> selectNotificationReceiverByCondition(NotificationReceiverSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Notification Receiver 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationReceiverSearchVO
     * @return
     */
    public int selectNotificationReceiverByConditionCnt(NotificationReceiverSearchVO searchVO);

    /**
     * Notificatin Receiver 신규 등록, 수정
     */
    public String multiNotificationReceiver(NotificationReceiverSaveVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 Notification History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationHistorySearchVO
     * @return 조회 목록
     */
    public List<NotificationHistoryVO> selectNotificationHistoryByCondition(NotificationHistorySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Notification History 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationHistorySearchVO
     * @return
     */
    public int selectNotificationHistoryByConditionCnt(NotificationHistorySearchVO searchVO);




}
