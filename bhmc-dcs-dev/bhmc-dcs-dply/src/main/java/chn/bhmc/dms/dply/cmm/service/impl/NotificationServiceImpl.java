package chn.bhmc.dms.dply.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.dply.cmm.service.NotificationService;
import chn.bhmc.dms.dply.cmm.service.dao.NotificationDAO;
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
 * @ClassName   : NotificationServiceImpl.java
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

@Service("notificationService")
public class NotificationServiceImpl extends HService implements NotificationService {

    /**
     * 메세지소스 관리 DAO
     */
    @Resource(name="notificationDAO")
    NotificationDAO notificationDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.dply.cmm.service.NotificationService#selectNotificationReceiverByCondition(chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSearchVO)
     */
    @Override
    public List<NotificationReceiverVO> selectNotificationReceiverByCondition(NotificationReceiverSearchVO searchVO) {
        return notificationDAO.selectNotificationReceiverByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.NotificationService#selectNotificationReceiverByConditionCnt(chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSearchVO)
     */
    @Override
    public int selectNotificationReceiverByConditionCnt(NotificationReceiverSearchVO searchVO) {
        return notificationDAO.selectNotificationReceiverByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.NotificationService#multiNotificationReceiver(chn.bhmc.dms.dply.cmm.vo.NotificationReceiverNotificationReceiverSaveVO)
     */
    @Override
    public String multiNotificationReceiver(NotificationReceiverSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(NotificationReceiverVO notificationReceiverVO : saveVO.getInsertList()) {
            notificationReceiverVO.setRegUsrId(usrId);
            notificationDAO.insertNotificationReceiver(notificationReceiverVO);
        }

        for(NotificationReceiverVO notificationReceiverVO : saveVO.getUpdateList()) {
            notificationReceiverVO.setUpdtUsrId(usrId);
            notificationDAO.updateNotificationReceiver(notificationReceiverVO);
        }

        for(NotificationReceiverVO notificationReceiverVO : saveVO.getDeleteList()) {
            notificationReceiverVO.setUpdtUsrId(usrId);
            notificationDAO.deleteNotificationReceiver(notificationReceiverVO);

        }

        return "OK";
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.NotificationService#selectNotificationHistoryByCondition(chn.bhmc.dms.dply.cmm.vo.NotificationHistorySearchVO)
     */
    @Override
    public List<NotificationHistoryVO> selectNotificationHistoryByCondition(NotificationHistorySearchVO searchVO) {
        return notificationDAO.selectNotificationHistoryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.NotificationService#selectNotificationHistoryByConditionCnt(chn.bhmc.dms.dply.cmm.vo.NotificationHistorySearchVO)
     */
    @Override
    public int selectNotificationHistoryByConditionCnt(NotificationHistorySearchVO searchVO) {
        return notificationDAO.selectNotificationHistoryByConditionCnt(searchVO);
    }

}
