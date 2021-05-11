package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationTemplateService;
import chn.bhmc.dms.cmm.nms.service.dao.NotificationTemplateDAO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTemplateServiceImpl.java
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
@Service("notificationTemplateService")
public class NotificationTemplateServiceImpl extends HService implements NotificationTemplateService {

    @Resource(name="notificationTemplateDAO")
    NotificationTemplateDAO notificationTemplateDAO;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTemplateService#insertNotificationTemplate(chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO)
     */
    @Override
    public int insertNotificationTemplate(NotificationTemplateVO notificationTemplateVO) throws Exception {

        NotificationTemplateVO obj = selectNotificationTemplateByKey(
                notificationTemplateVO.getAlrtPolicyGrpId(),
                notificationTemplateVO.getAlrtPolicyId(),
                notificationTemplateVO.getMesgTmplGrpId(),
                notificationTemplateVO.getMesgTmplTp());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return notificationTemplateDAO.insertNotificationTemplate(notificationTemplateVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTemplateService#deleteNotificationTemplate(chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO)
     */
    @Override
    public int deleteNotificationTemplate(NotificationTemplateVO notificationTemplateVO) throws Exception {
        return notificationTemplateDAO.deleteNotificationTemplate(notificationTemplateVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTemplateService#selectNotificationTemplateByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public NotificationTemplateVO selectNotificationTemplateByKey(
            String alrtPolicyGrpId,
            String alrtPolicyId,
            String mesgTmplGrpId,
            String mesgTmplTp)
            throws Exception {
        return notificationTemplateDAO.selectNotificationTemplateByKey(alrtPolicyGrpId, alrtPolicyId, mesgTmplGrpId, mesgTmplTp);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTemplateService#multiNotificationTemplates(chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSaveVO)
     */
    @Override
    public void multiNotificationTemplates(NotificationTemplateSaveVO notificationTemplateSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(NotificationTemplateVO notificationTemplateVO : notificationTemplateSaveVO.getInsertList()){
            notificationTemplateVO.setRegUsrId(userId);
            insertNotificationTemplate(notificationTemplateVO);
        }

        for(NotificationTemplateVO notificationTemplateVO : notificationTemplateSaveVO.getDeleteList()){
            deleteNotificationTemplate(notificationTemplateVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationTemplateService#selectNotificationTemplatesByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSearchVO)
     */
    @Override
    public List<NotificationTemplateVO> selectNotificationTemplatesByCondition(NotificationTemplateSearchVO searchVO)
            throws Exception {
        return notificationTemplateDAO.selectNotificationTemplatesByCondition(searchVO);
    }

}
