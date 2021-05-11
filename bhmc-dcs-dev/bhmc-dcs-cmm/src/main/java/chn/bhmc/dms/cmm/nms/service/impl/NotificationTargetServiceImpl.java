package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationTargetService;
import chn.bhmc.dms.cmm.nms.service.dao.NotificationTargetDAO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetServiceImpl.java
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
@Service("notificationTargetService")
public class NotificationTargetServiceImpl extends HService implements NotificationTargetService {

    @Resource(name="notificationTargetDAO")
    NotificationTargetDAO notificationTargetDAO;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#insertNotificationTarget(chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO)
     */
    @Override
    public int insertNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception {

        NotificationTargetVO obj = selectNotificationTargetByKey(
                notificationTargetVO.getAlrtPolicyGrpId(),
                notificationTargetVO.getAlrtPolicyId(),
                notificationTargetVO.getRefTp(),
                notificationTargetVO.getRefId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return notificationTargetDAO.insertNotificationTarget(notificationTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#updateNotificationTarget(chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO)
     */
    @Override
    public int updateNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception {
        return notificationTargetDAO.updateNotificationTarget(notificationTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#deleteNotificationTarget(chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO)
     */
    @Override
    public int deleteNotificationTarget(NotificationTargetVO notificationTargetVO) throws Exception {
        return notificationTargetDAO.deleteNotificationTarget(notificationTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#selectNotificationTargetByKey(java.lang.String, java.lang.String)
     */
    @Override
    public NotificationTargetVO selectNotificationTargetByKey(
            String alrtPolicyGrpId,
            String alrtPolicyId,
            String refTp,
            String refId)
            throws Exception {
        return notificationTargetDAO.selectNotificationTargetByKey(alrtPolicyGrpId, alrtPolicyId, refTp, refId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#multiNotificationTargets(chn.bhmc.dms.cmm.nms.vo.NotificationTargetSaveVO)
     */
    @Override
    public void multiNotificationTargets(NotificationTargetSaveVO notificationTargetSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(NotificationTargetVO notificationTargetVO : notificationTargetSaveVO.getInsertList()){
            notificationTargetVO.setRegUsrId(userId);
            insertNotificationTarget(notificationTargetVO);
        }

        for(NotificationTargetVO notificationTargetVO : notificationTargetSaveVO.getUpdateList()){
            notificationTargetVO.setUpdtUsrId(userId);
            updateNotificationTarget(notificationTargetVO);
        }

        for(NotificationTargetVO notificationTargetVO : notificationTargetSaveVO.getDeleteList()){
            deleteNotificationTarget(notificationTargetVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#selectNotificationTargetsByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationTargetSearchVO)
     */
    @Override
    public List<NotificationTargetVO> selectNotificationTargetsByCondition(NotificationTargetSearchVO searchVO)
            throws Exception {
        return notificationTargetDAO.selectNotificationTargetsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#insertNotificationExcludeTarget(chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO)
     */
    @Override
    public int insertNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO)
            throws Exception {
        return notificationTargetDAO.insertNotificationExcludeTarget(notificationExcludeTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#deleteNotificationExcludeTarget(chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO)
     */
    @Override
    public int deleteNotificationExcludeTarget(NotificationExcludeTargetVO notificationExcludeTargetVO)
            throws Exception {
        return notificationTargetDAO.deleteNotificationExcludeTarget(notificationExcludeTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#multiNotificationExcludeTargets(chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSaveVO)
     */
    @Override
    public void multiNotificationExcludeTargets(NotificationExcludeTargetSaveVO notificationExcludeTargetSaveVO)
            throws Exception {
        String userId = LoginUtil.getUserId();

        for(NotificationExcludeTargetVO notificationExcludeTargetVO : notificationExcludeTargetSaveVO.getInsertList()){
            notificationExcludeTargetVO.setRegUsrId(userId);
            insertNotificationExcludeTarget(notificationExcludeTargetVO);
        }

        for(NotificationExcludeTargetVO notificationExcludeTargetVO : notificationExcludeTargetSaveVO.getDeleteList()){
            deleteNotificationExcludeTarget(notificationExcludeTargetVO);
        }

    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#selectNotificationExcludeTargetByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public NotificationExcludeTargetVO selectNotificationExcludeTargetByKey(String alrtPolicyGrpId,
            String alrtPolicyId, String usrId) throws Exception {
        return notificationTargetDAO.selectNotificationExcludeTargetByKey(alrtPolicyGrpId, alrtPolicyId, usrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#selectNotificationExcludeTargetsByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSearchVO)
     */
    @Override
    public List<NotificationExcludeTargetVO> selectNotificationExcludeTargetsByCondition(
            NotificationExcludeTargetSearchVO searchVO) throws Exception {
        return notificationTargetDAO.selectNotificationExcludeTargetsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTargetService#selectNotificationTargetUsers(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public List<NotificationTargetUserVO> selectNotificationTargetAllUsers(String sysCd, String alrtPolicyGrpId, String alrtPolicyId) throws Exception {

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        List<NotificationTargetUserVO> targetAllUsers = notificationTargetDAO.selectNotificationTargetAllUsers(sysCd, alrtPolicyGrpId, alrtPolicyId);

        //수신대상제외목록
        NotificationExcludeTargetSearchVO notificationExcludeTargetSearchVO = new NotificationExcludeTargetSearchVO();
        notificationExcludeTargetSearchVO.setsAlrtPolicyGrpId(alrtPolicyGrpId);
        notificationExcludeTargetSearchVO.setsAlrtPolicyId(alrtPolicyId);
        List<NotificationExcludeTargetVO> excludeUsers = selectNotificationExcludeTargetsByCondition(notificationExcludeTargetSearchVO);

        if(excludeUsers.size() > 0){
            for(NotificationTargetUserVO obj : targetAllUsers){
                boolean flag = true;
                for(NotificationExcludeTargetVO exObj : excludeUsers){
                    if(obj.getUsrId().equals(exObj.getUsrId())){
                        flag = false;
                        break;
                    }
                }

                if(flag){
                    targetUsers.add(obj);
                }
            }
            return targetUsers;
        }

        return targetAllUsers;
    }
}
