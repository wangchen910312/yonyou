package chn.bhmc.dms.cmm.nms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetDAO.java
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
@Mapper("notificationTargetDAO")
public interface NotificationTargetDAO {


    /**
     * 알림정책 수신대상 정보를 등록한다.
     * @param notificationTargetVO - 등록할 정보가 담긴 NotificationTargetVO
     * @return 등록된 목록수
     */
    public int insertNotificationTarget(NotificationTargetVO notificationTargetVO);

    /**
     * 알림정책 수신대상 정보를 수정한다.
     * @param notificationTargetGroupVO - 수정할 정보가 담긴 NotificationTargetVO
     * @return 등록된 목록수
     */
    public int updateNotificationTarget(NotificationTargetVO notificationTargetVO);

    /**
     * 알림정책 수신대상 정보를 삭제한다.
     * @param notificationTargetVO - 삭제할 정보가 담긴 NotificationTargetVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationTarget(NotificationTargetVO notificationTargetVO);

    /**
     * Key에 해당하는 알림정책 수신대상 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책 수신대상그룹 ID
     * @param alrtPolicyId - 알림정책 수신대상 ID
     * @param refTp - 참조유형 R:역할, U:사용자
     * @param refId - 참조ID
     * @return 조회한 알림정책 수신대상 정보
     */
    public NotificationTargetVO selectNotificationTargetByKey(
            @Param("alrtPolicyGrpId") String alrtPolicyGrpId,
            @Param("alrtPolicyId") String alrtPolicyId,
            @Param("refTp") String refTp,
            @Param("refId") String refId);

    /**
     * 조회 조건에 해당하는 알림정책 수신대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationTargetSearchVO
     * @return 조회 목록
     */
    public List<NotificationTargetVO> selectNotificationTargetsByCondition(NotificationTargetSearchVO searchVO);


    /**
     * 알림정책 수신대상제외 정보를 등록한다.
     * @param notificationTargetVO - 등록할 정보가 담긴 NotificationExcludeTargetVO
     * @return 등록된 목록수
     */
    public int insertNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO);

    /**
     * 알림정책 수신대상제외 정보를 삭제한다.
     * @param notificationExcludeTargetVO - 삭제할 정보가 담긴 NotificationExcludeTargetVO
     * @return 삭제된 목록수
     */
    public int deleteNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO);

    /**
     * Key에 해당하는 알림정책 수신대상제외 정보를 조회한다.
     * @param alrtPolicyGrpId - 알림정책 수신대상그룹 ID
     * @param alrtPolicyId - 알림정책 수신대상 ID
     * @param usrId - 사용자ID
     * @return 조회한 알림정책 수신대상제외 정보
     */
    public NotificationExcludeTargetVO selectNotificationExcludeTargetByKey(
            @Param("alrtPolicyGrpId") String alrtPolicyGrpId,
            @Param("alrtPolicyId") String alrtPolicyId,
            @Param("usrId") String usrId);

    /**
     * 조회 조건에 해당하는 알림정책 수신대상제외 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationExcludeTargetSearchVO
     * @return 조회 목록
     */
    public List<NotificationExcludeTargetVO> selectNotificationExcludeTargetsByCondition(NotificationExcludeTargetSearchVO searchVO);

    /**
     * 수신대상 사용자에 해당하는 사용자정보 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @param alrtPolicyId 알림정책ID
     * @return
     */
    //public List<NotificationTargetUserVO> selectNotificationTargetUsers(@Param("sysCd") String sysCd, @Param("alrtPolicyGrpId") String alrtPolicyGrpId, @Param("alrtPolicyId") String alrtPolicyId);

    /**
     * 수신대상 역할에 해당하는 사용자정보 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @param alrtPolicyId 알림정책ID
     * @return
     */
    //public List<NotificationTargetUserVO> selectNotificationTargetRoleUsers(@Param("sysCd") String sysCd, @Param("alrtPolicyGrpId") String alrtPolicyGrpId, @Param("alrtPolicyId") String alrtPolicyId);

    /**
     * 수신대상 사용자정보 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':임포터
     * @param alrtPolicyGrpId 알림정책그룹ID
     * @param alrtPolicyId 알림정책ID
     * @return
     */
    public List<NotificationTargetUserVO> selectNotificationTargetAllUsers(@Param("sysCd") String sysCd, @Param("alrtPolicyGrpId") String alrtPolicyGrpId, @Param("alrtPolicyId") String alrtPolicyId);
}
