package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationPolicyService;
import chn.bhmc.dms.cmm.nms.service.dao.NotificationPolicyDAO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicyServiceImpl.java
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
@Service("notificationPolicyService")
public class NotificationPolicyServiceImpl extends HService implements NotificationPolicyService {

    @Resource(name="notificationPolicyDAO")
    NotificationPolicyDAO notificationPolicyDAO;

    @Resource(name="notificationPolicyIdGenService")
    EgovIdGnrService notificationPolicyIdGenService;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#insertNotificationPolicyGroup(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO)
     */
    @Override
    public int insertNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception {

        NotificationPolicyGroupVO obj = selectNotificationPolicyGroupByKey(notificationPolicyGroupVO.getAlrtPolicyGrpId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return notificationPolicyDAO.insertNotificationPolicyGroup(notificationPolicyGroupVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#updateNotificationPolicyGroup(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO)
     */
    @Override
    public int updateNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception {
        return notificationPolicyDAO.updateNotificationPolicyGroup(notificationPolicyGroupVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#deleteNotificationPolicyGroup(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO)
     */
    @Override
    public int deleteNotificationPolicyGroup(NotificationPolicyGroupVO notificationPolicyGroupVO) throws Exception {
        return notificationPolicyDAO.deleteNotificationPolicyGroup(notificationPolicyGroupVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPolicyGroupByKey(java.lang.String)
     */
    @Override
    public NotificationPolicyGroupVO selectNotificationPolicyGroupByKey(String alrtPolicyGrpId) throws Exception {
        return notificationPolicyDAO.selectNotificationPolicyGroupByKey(alrtPolicyGrpId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#multiNotificationPolicyGroups(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySaveVO)
     */
    @Override
    public void multiNotificationPolicyGroups(NotificationPolicyGroupSaveVO notificationPolicyGroupSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for(NotificationPolicyGroupVO notificationPolicyGroupVO : notificationPolicyGroupSaveVO.getInsertList()){
            notificationPolicyGroupVO.setRegUsrId(userId);
            insertNotificationPolicyGroup(notificationPolicyGroupVO);
        }

        for(NotificationPolicyGroupVO notificationPolicyGroupVO : notificationPolicyGroupSaveVO.getUpdateList()){
            notificationPolicyGroupVO.setUpdtUsrId(userId);
            updateNotificationPolicyGroup(notificationPolicyGroupVO);
        }

        for(NotificationPolicyGroupVO notificationPolicyGroupVO : notificationPolicyGroupSaveVO.getDeleteList()){
            deleteNotificationPolicyGroup(notificationPolicyGroupVO);
        }

    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPolicyGroupsByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO)
     */
    @Override
    public List<NotificationPolicyGroupVO> selectNotificationPolicyGroupsByCondition(NotificationPolicySearchVO searchVO)
            throws Exception {
        return notificationPolicyDAO.selectNotificationPolicyGroupsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPolicyGroupsByConditionCnt(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO)
     */
    @Override
    public int selectNotificationPolicyGroupsByConditionCnt(NotificationPolicySearchVO searchVO) throws Exception {
        return notificationPolicyDAO.selectNotificationPolicyGroupsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#insertNotificationPolicy(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO)
     */
    @Override
    public int insertNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception {

        NotificationPolicyVO obj = selectNotificationPolicyByKey(notificationPolicyVO.getAlrtPolicyGrpId(), notificationPolicyVO.getAlrtPolicyId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        notificationPolicyVO.setAlrtPolicyId(notificationPolicyIdGenService.getNextStringId());

        return notificationPolicyDAO.insertNotificationPolicy(notificationPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#updateNotificationPolicy(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO)
     */
    @Override
    public int updateNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception {
        return notificationPolicyDAO.updateNotificationPolicy(notificationPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#deleteNotificationPolicy(chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO)
     */
    @Override
    public int deleteNotificationPolicy(NotificationPolicyVO notificationPolicyVO) throws Exception {
        return notificationPolicyDAO.deleteNotificationPolicy(notificationPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPolicyByKey(java.lang.String, java.lang.String)
     */
    @Override
    public NotificationPolicyVO selectNotificationPolicyByKey(String alrtPolicyGrpId, String alrtPolicyId)
            throws Exception {
        return notificationPolicyDAO.selectNotificationPolicyByKey(alrtPolicyGrpId, alrtPolicyId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPolicyByGrpId(java.lang.String)
     */
    @Override
    public NotificationPolicyVO selectNotificationPolicyByGrpId(String alrtPolicyGrpId) throws Exception {
        return notificationPolicyDAO.selectNotificationPolicyByGrpId(alrtPolicyGrpId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#multiNotificationPolicys(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySaveVO)
     */
    @Override
    public void multiNotificationPolicies(NotificationPolicySaveVO notificationPolicySaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(NotificationPolicyVO notificationPolicyVO : notificationPolicySaveVO.getInsertList()){
            notificationPolicyVO.setRegUsrId(userId);
            insertNotificationPolicy(notificationPolicyVO);
        }

        for(NotificationPolicyVO notificationPolicyVO : notificationPolicySaveVO.getUpdateList()){
            notificationPolicyVO.setUpdtUsrId(userId);
            updateNotificationPolicy(notificationPolicyVO);
        }

        for(NotificationPolicyVO notificationPolicyVO : notificationPolicySaveVO.getDeleteList()){
            deleteNotificationPolicy(notificationPolicyVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPoliciesByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO)
     */
    @Override
    public List<NotificationPolicyVO> selectNotificationPoliciesByCondition(NotificationPolicySearchVO searchVO)
            throws Exception {
        return notificationPolicyDAO.selectNotificationPoliciesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationPolicyService#selectNotificationPoliciesByConditionCnt(chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO)
     */
    @Override
    public int selectNotificationPoliciesByConditionCnt(NotificationPolicySearchVO searchVO) throws Exception {
        return notificationPolicyDAO.selectNotificationPoliciesByConditionCnt(searchVO);
    }

}
