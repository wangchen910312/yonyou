package chn.bhmc.dms.cmm.nms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicyDAO.java
 * @Description : 클래스 설명을 기술합니다.
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
@Mapper("notificationPolicyDAO")
public interface NotificationPolicyDAO {

    /**
     * 알림정책그룹 정보를 등록한다.
     * @param notificationPolicyGroupVO - 등록할 정보가 담긴 NotificationPolicyGroupVO
     * @return 등록된 목록수
     */
    public int insertNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO);

    /**
     * 알림정책그룹 정보를 수정한다.
     * @param notificationPolicyGroupVO - 수정할 정보가 담긴 NotificationPolicyGroupVO
     * @return 수정된 목록수
     */
    public int updateNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO);

    /**
     * 알림정책그룹 정보를 삭제한다.
     * @param notificationPolicyGroupVO - 삭제할 정보가 담긴 NotificationPolicyGroupVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO);

    /**
     * Key에 해당하는 알림정책그룹 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책그룹 ID
     * @return 조회한 알림정책그룹 정보
     */
    public NotificationPolicyGroupVO selectNotificationPolicyGroupByKey(String alrtPolicyGrpId);

    /**
     * 조회 조건에 해당하는 알림정책그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return 조회 목록
     */
    public List<NotificationPolicyGroupVO> selectNotificationPolicyGroupsByCondition(NotificationPolicySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 알림정책그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    public int selectNotificationPolicyGroupsByConditionCnt(NotificationPolicySearchVO searchVO);

    /**
     * 알림정책 정보를 등록한다.
     * @param notificationPolicyGroupVO - 등록할 정보가 담긴 NotificationPolicyVO
     * @return 등록된 목록수
     */
    public int insertNotificationPolicy(NotificationPolicyVO notificationPolicyVO);

    /**
     * 알림정책 정보를 수정한다.
     * @param notificationPolicyVO - 수정할 정보가 담긴 NotificationPolicyVO
     * @return 수정된 목록수
     */
    public int updateNotificationPolicy(NotificationPolicyVO notificationPolicyVO);

    /**
     * 알림정책 정보를 삭제한다.
     * @param notificationPolicyVO - 삭제할 정보가 담긴 NotificationPolicyVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationPolicy(NotificationPolicyVO notificationPolicyVO);

    /**
     * Key에 해당하는 알림정책 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책그룹 ID
     * @param alrtPolicyId - 알림정책 ID
     * @return 조회한 알림정책 정보
     */
    public NotificationPolicyVO selectNotificationPolicyByKey(@Param("alrtPolicyGrpId") String alrtPolicyGrpId, @Param("alrtPolicyId") String alrtPolicyId);

    /**
     * 알림정책그룹ID에 해당하는 알림정책 정보를 조회한다.
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @return
     * @throws Exception
     */
    public NotificationPolicyVO selectNotificationPolicyByGrpId(String alrtPolicyGrpId);

    /**
     * 조회 조건에 해당하는 알림정책 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return 조회 목록
     */
    public List<NotificationPolicyVO> selectNotificationPoliciesByCondition(NotificationPolicySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 알림정책 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    public int selectNotificationPoliciesByConditionCnt(NotificationPolicySearchVO searchVO);

}
