package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO;

/**
 * 알림정책 수신대상 관리 서비스
 *
 * @ClassName   : NotificationTargetService.java
 * @Description : 알림정책 수신대상을 관리한다.
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

public interface NotificationTargetService {

    /**
     * 알림정책 수신대상 정보를 등록한다.
     * @param notificationTargetGroupVO - 등록할 정보가 담긴 NotificationTargetVO
     * @return 등록된 목록수
     */
    public int insertNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception;

    /**
     * 알림정책 수신대상 정보를 수정한다.
     * @param notificationTargetGroupVO - 수정할 정보가 담긴 NotificationTargetVO
     * @return 등록된 목록수
     */
    public int updateNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception;

    /**
     * 알림정책 수신대상 정보를 삭제한다.
     * @param notificationTargetVO - 삭제할 정보가 담긴 NotificationTargetVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception;

    /**
     * Key에 해당하는 알림정책 수신대상 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책 수신대상그룹 ID
     * @param alrtPolicyId - 알림정책 수신대상 ID
     * @param refTp - 참조유형 R:역할, U:사용자
     * @param refId - 참조ID
     * @return 조회한 알림정책 수신대상 정보
     */
    public NotificationTargetVO selectNotificationTargetByKey(
            String alrtPolicyGrpId,
            String alrtPolicyId,
            String refTp,
            String refId) throws Exception;

    /**
     * 알림정책 수신대상 정보를 등록/수정/삭제 처리한다.
     * @param notificationTargetSaveVO
     */
    public void multiNotificationTargets(NotificationTargetSaveVO notificationTargetSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책 수신대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationTargetSearchVO
     * @return 조회 목록
     */
    public List<NotificationTargetVO> selectNotificationTargetsByCondition(NotificationTargetSearchVO searchVO) throws Exception;

    /**
     * 알림정책 수신제외대상 정보를 등록한다.
     * @param notificationTargetVO - 등록할 정보가 담긴 NotificationExcludeTargetVO
     * @return 등록된 목록수
     */
    public int insertNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO) throws Exception;

    /**
     * 알림정책 수신제외대상 정보를 삭제한다.
     * @param notificationExcludeTargetVO - 삭제할 정보가 담긴 NotificationExcludeTargetVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO) throws Exception;

    /**
     * Key에 해당하는 알림정책 수신제외대상 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책 수신대상그룹 ID
     * @param alrtPolicyId - 알림정책 수신대상 ID
     * @param usrId - 사용자ID
     * @return 조회한 알림정책 수신제외대상 정보
     */
    public NotificationExcludeTargetVO selectNotificationExcludeTargetByKey(
            @Param("alrtPolicyGrpId") String alrtPolicyGrpId,
            @Param("alrtPolicyId") String alrtPolicyId,
            @Param("usrId") String usrId) throws Exception;

    /**
     * 알림정책 수신제외대상 정보를 등록/수정/삭제 처리한다.
     * @param notificationExcludeTargetSaveVO
     */
    public void multiNotificationExcludeTargets(NotificationExcludeTargetSaveVO notificationExcludeTargetSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 알림정책 수신제외대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationExcludeTargetSearchVO
     * @return 조회 목록
     */
    public List<NotificationExcludeTargetVO> selectNotificationExcludeTargetsByCondition(NotificationExcludeTargetSearchVO searchVO) throws Exception;

    /**
     * 수신대상 사용자 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @param alrtPolicyId 알림정책ID
     * @return
     */
    public List<NotificationTargetUserVO> selectNotificationTargetAllUsers(String sysCd, String alrtPolicyGrpId, String alrtPolicyId) throws Exception;

}
