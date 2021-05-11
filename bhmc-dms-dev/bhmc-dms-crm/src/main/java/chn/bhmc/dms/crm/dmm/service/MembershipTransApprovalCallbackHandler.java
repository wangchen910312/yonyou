package chn.bhmc.dms.crm.dmm.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransApprovalCallbackHandler.java
 * @Description : 멤버십 양도양수 콜백 핸들러
 * @author Kim Hyun Ho
 * @since 2016. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 10.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipTransApprovalCallbackHandler implements ApprovalCallbackHandler {

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="membershipTransService")
    MembershipTransService membershipTransService;

    @Resource(name="docService")
    DocService docService;

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#isSupport(java.lang.String)
     */
    @Override
    public boolean isSupport(String signDocId) {
        //TODO[김현호] 멤버십 양도/양수 콜백 핸들러
        if(signDocId.equals("CRM-0002")) return true;
        return false;
    }

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#callback(chn.bhmc.dms.cmm.apr.vo.SignLineVO)
     */
    @Override
    public void callback(SignVO signVO) throws Exception {

        //멤버십 양도/양수 반려인경우 알람등록.

        if (signVO.getSignStatCd().equals("04")) {
            // 반려인경우 알람 보낸다.
            DocVO docVO = docService.selectDocByKey(signVO.getSignDocId());

            //결재양식의 결재상신 알람이 'Y'인 경우 결재반려 알림을 발송한다.
            if("Y".equals(docVO.getSignAlrtYn())){
                 NotificationMessageContext context = new NotificationMessageContext();
                 context.getVelocityContext().put("signDocNm", docVO.getSignDocNm());

                 List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
                 NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
                 targetVO.setUsrId(signVO.getRegUsrId());
                 targetVO.setMesgTmplTpList("P,W");
                 targetUsers.add(targetVO);

                 notificationMessageService.sendNotificationMessage(Constants.SYS_CD_DLR, "COM-0002", LoginUtil.getDlrCd(), context, targetUsers);
            }

        }

    }

}
