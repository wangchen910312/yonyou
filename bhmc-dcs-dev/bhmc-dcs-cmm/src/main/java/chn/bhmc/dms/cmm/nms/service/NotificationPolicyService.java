package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO;

/**
 * 알림정책 관리 서비스
 *
 * @ClassName   : NotificationPolicyService.java
 * @Description : 알림정책을 관리한다.
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface NotificationPolicyService {

    /**
     * 알림정책그룹 정보를 등록한다.
     * @param notificationPolicyGroupVO - 등록할 정보가 담긴 NotificationPolicyGroupVO
     * @return 등록된 목록수
     */
    public int insertNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception;

    /**
     * 알림정책그룹 정보를 수정한다.
     * @param notificationPolicyGroupVO - 수정할 정보가 담긴 NotificationPolicyGroupVO
     * @return 수정된 목록수
     */
    public int updateNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception;

    /**
     * 알림정책그룹 정보를 삭제한다.
     * @param notificationPolicyGroupVO - 삭제할 정보가 담긴 NotificationPolicyGroupVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception;

    /**
     * Key에 해당하는 알림정책그룹 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책그룹 ID
     * @return 조회한 알림정책그룹 정보
     */
    public NotificationPolicyGroupVO selectNotificationPolicyGroupByKey(String alrtPolicyGrpId) throws Exception;

    /**
     * 알림정책그룹 정보를 등록/수정/삭제 처리한다.
     * @param notificationPolicySaveVO
     */
    public void multiNotificationPolicyGroups(NotificationPolicyGroupSaveVO notificationPolicyGroupSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return 조회 목록
     */
    public List<NotificationPolicyGroupVO> selectNotificationPolicyGroupsByCondition(NotificationPolicySearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    public int selectNotificationPolicyGroupsByConditionCnt(NotificationPolicySearchVO searchVO) throws Exception;

    /**
     * 알림정책 정보를 등록한다.
     * @param notificationPolicyGroupVO - 등록할 정보가 담긴 NotificationPolicyVO
     * @return 등록된 목록수
     */
    public int insertNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception;

    /**
     * 알림정책 정보를 수정한다.
     * @param notificationPolicyVO - 수정할 정보가 담긴 NotificationPolicyVO
     * @return 수정된 목록수
     */
    public int updateNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception;

    /**
     * 알림정책 정보를 삭제한다.
     * @param notificationPolicyVO - 삭제할 정보가 담긴 NotificationPolicyVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception;

    /**
     * Key에 해당하는 알림정책 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책그룹 ID
     * @param alrtPolicyId - 알림정책 ID
     * @return 조회한 알림정책 정보
     */
    public NotificationPolicyVO selectNotificationPolicyByKey(String alrtPolicyGrpId, String alrtPolicyId) throws Exception;

    /**
     * 알림정책그룹ID에 해당하는 알림정책 정보를 조회한다.
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @return
     * @throws Exception
     */
    public NotificationPolicyVO selectNotificationPolicyByGrpId(String alrtPolicyGrpId) throws Exception;

    /**
     * 알림정책 정보를 등록/수정/삭제 처리한다.
     * @param notificationPolicySaveVO
     */
    public void multiNotificationPolicies(NotificationPolicySaveVO notificationPolicySaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return 조회 목록
     */
    public List<NotificationPolicyVO> selectNotificationPoliciesByCondition(NotificationPolicySearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    public int selectNotificationPoliciesByConditionCnt(NotificationPolicySearchVO searchVO) throws Exception;

}
