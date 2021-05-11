package chn.bhmc.dms.crm.dmm.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySearchVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointSearchVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointVO;

/**
 * <pre>
 * 특별포인트 결재승인 콜백 핸들러
 * </pre>
 *
 * @ClassName   : SpecialPointApprovalCallbackHandler
 * @Description : 특별포인트 결재승인 콜백 핸들러.
 * @author Hyun Ho Kim
 * @since 2016. 08. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 08. 01.   Hyun Ho Kim     최초 생성
 * </pre>
 */

public class SpecialPointApprovalCallbackHandler implements ApprovalCallbackHandler {

    Logger log = LoggerFactory.getLogger(SpecialPointApprovalCallbackHandler.class);

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    @Resource(name="specialPointService")
    SpecialPointService specialPointService;

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Resource(name="docService")
    DocService docService;

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#isSupport(java.lang.String)
     */
    @Override
    public boolean isSupport(String signDocId) {
        //TODO[김현호] 특별포인트 콜백 핸들러
        if(signDocId.equals("CRM-0001")) return true;
        return false;
        //return true;
    }

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#callback(chn.bhmc.dms.cmm.apr.vo.SignLineVO)
     */
    @Override
    public void callback(SignVO signVO) throws Exception {
        log.debug("PackageCouponStandbyApprovalCallbackHandler callback");
        log.debug("최종결재여부 : {}, 결재진행상태 : {}", new String[]{signVO.getSignLine().getLastSignYn(),signVO.getSignStatCd()});

        String dlrCd = LoginUtil.getDlrCd();
        String signDocNo = signVO.getSignDocNo();

        PackageCouponStandbySearchVO searchVO = new PackageCouponStandbySearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsSignDocNo(signDocNo);

        //최종결재여부 : Y , 결재 진행상태 : 03(완료)
        if(signVO.getSignLine().getLastSignYn().equals("Y") && signVO.getSignStatCd().equals("03")){
            //특별포인트 지급 점수 조회
            SpecialPointSearchVO spsVO = new SpecialPointSearchVO();
            spsVO.setsDlrCd(dlrCd);
            spsVO.setsSignDocNo(signDocNo);
            spsVO.setsUseYn("Y");
            SpecialPointVO infoVO = specialPointService.selectSpecialPointByKey(spsVO);

            if ( infoVO != null ) {

                //특별포인트 조회(04 : 특별 포인트)
                //CommonCodeVO code = commonCodeService.selectCommonCodeByKey("04","CRM802");
                CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM802",infoVO.getPointCd());

                if ( code != null )  {

                    MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();

                    membershipPointHisVO.setDlrCd(dlrCd);//딜러코드
                    membershipPointHisVO.setMembershipNo(infoVO.getMembershipNo());//멤버십번호
                    membershipPointHisVO.setPointTp(code.getRemark1()); //포인트 타입
                    membershipPointHisVO.setPointCd(code.getCmmCd()); //포인트 타입
                    membershipPointHisVO.setOccrPointVal(infoVO.getProvidePointVal());//발생포인트값
                    membershipPointHisVO.setExtcTargYn("Y"); // 소멸대상여부
                    membershipPointHisVO.setRealTotAmt(infoVO.getProvidePointVal());//최종포인트값
                    membershipPointHisVO.setCardNo(infoVO.getCardNo());//카드번호
                    membershipPointHisVO.setCardTpCd("01"); //카드유형코드
                    membershipPointHisVO.setPrsnId(infoVO.getRegUsrId()); //담당자


                    try {

                      //멤버십 포인트를 등록한다.
                        membershipPointHisService.insertSpecialPoint(membershipPointHisVO);

                        String result = membershipPointHisVO.getResult();

                        if ( !result.equals("00") ) {

                            throw new BizException("global.btn.failed");

                        }
                    } catch (Exception e) {
                        throw new BizException(e.getMessage());
                    }

                }

            }
        } else if (signVO.getSignStatCd().equals("04")) {
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

                 notificationMessageService.sendNotificationMessage(Constants.SYS_CD_DLR, "COM-0002", dlrCd, context, targetUsers);
            }

        }

    }

}
