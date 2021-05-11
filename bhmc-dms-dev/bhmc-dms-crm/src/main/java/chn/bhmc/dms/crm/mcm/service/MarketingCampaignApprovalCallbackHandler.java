package chn.bhmc.dms.crm.mcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;

/**
 * <pre>
 * 마케팅캠페인 결재승인 콜백 핸들러
 * </pre>
 *
 * @ClassName   : MarketingCampaignApprovalCallbackHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyoung Jun An
 * @since 2016. 7. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 5.    Hyoung Jun An    최초 생성
 * </pre>
 */

public class MarketingCampaignApprovalCallbackHandler implements ApprovalCallbackHandler {

    /**
     * 마케팅 캠페인 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 캠페인결과 관리 서비스
     */
    @Resource(name="campaignResultService")
    CampaignResultService campaignResultService;

    /**
     * 결재양식 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 알림메세지 서비스
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    Logger log = LoggerFactory.getLogger(MarketingCampaignApprovalCallbackHandler.class);

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#isSupport(java.lang.String)
     */
    @Override
    public boolean isSupport(String signDocId) {
        if(signDocId.equals("CRM-0003")) return true;
        return false;
    }

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#callback(chn.bhmc.dms.cmm.apr.vo.SignLineVO)
     */
    @Override
    public void callback(SignVO signVO) throws Exception {
        log.debug("MarketingCampaignApprovalCallbackHandler callback");
        log.debug("최종결재여부 : {}, 결재진행상태 : {}"
                , new String[]{
                        signVO.getSignLine().getLastSignYn()
                        ,signVO.getSignStatCd()});

        SignSearchVO searchVO = new SignSearchVO();
        MarketingCampaignSearchVO searchVO01 = new MarketingCampaignSearchVO();
        SignVO saveVO = new SignVO();
        MarketingCampaignVO marketingCampaignVO = new MarketingCampaignVO();

        //마케팅캠페인코드를 조회하여 가져온다.
        searchVO01.setsApprDocNo(signVO.getSignDocNo());
        marketingCampaignVO = marketingCampaignService.selectMakCdByKey(searchVO01);
        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());

        searchVO.setsSignDocNo(signVO.getSignDocNo());

        // 결재상태 값을 가져오기 위해서 결재 마스터 조회
        saveVO = marketingCampaignService.selectSignExByKey(searchVO);

        //결재상태가 결재(03), 또는 반려(04) 일 경우 캠페인 진행상태 값 변경 셋팅
        if("03".equals(saveVO.getSignStatCd())){

            marketingCampaignVO.setStatCd("03");

            // 캠페인 진행상태 값 업데이트
            marketingCampaignService.updateStatCd(marketingCampaignVO);

        }else if("04".equals(saveVO.getSignStatCd())){

            marketingCampaignVO.setStatCd("04");

            // 캠페인 진행상태 값 업데이트
            marketingCampaignService.updateStatCd(marketingCampaignVO);

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