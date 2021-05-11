package chn.bhmc.dms.dply.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.dply.cmm.vo.NotificationHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationHistoryVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("notificationDAO")
public interface NotificationDAO {

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
     * Notification Receiver 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertNotificationReceiver(NotificationReceiverVO saveVO) throws Exception;

    /**
     * Notification Receiver 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateNotificationReceiver(NotificationReceiverVO saveVO) throws Exception;

    /**
     * Notification Receiver 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteNotificationReceiver(NotificationReceiverVO saveVO) throws Exception;

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
