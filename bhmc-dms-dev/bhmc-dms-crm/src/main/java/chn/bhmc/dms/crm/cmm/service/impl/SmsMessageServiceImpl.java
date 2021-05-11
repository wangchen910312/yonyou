package chn.bhmc.dms.crm.cmm.service.impl;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.SmsMessageService;
import chn.bhmc.dms.crm.cmm.service.SmsTmplUserService;
import chn.bhmc.dms.crm.cmm.service.dao.SmsMessageDAO;
import chn.bhmc.dms.crm.cmm.vo.SmsMessageVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserSearchVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserVO;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.vo.ContactHistoryVO;
import chn.bhmc.dms.crm.dmm.service.MembershipPointExtService;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     In Moon Lee     최초 생성
 * </pre>
 */
@Service("smsMessageService")
public class SmsMessageServiceImpl extends HService implements SmsMessageService {

    /**
     * DAO
     */
    @Resource(name="smsMessageDAO")
    SmsMessageDAO smsMessageDAO;

    /**
     * 컨택히스토리 등록 Service
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 고객케어 - 대상자 목록
     */
    @Resource(name="customerCareExtrTargetService")
    CustomerCareExtrTargetService customerCareExtrTargetService;

    /**
     * 고객케어 - 대상자 목록
     */
    @Resource(name="smsTmplUserService")
    SmsTmplUserService smsTmplUserService;

    /**
     * 멤버십 소멸 이력 서비스
     */
    @Resource(name="membershipPointExtService")
    MembershipPointExtService membershipPointExtService;

    /**
     * 캠페인실행 관리 서비스
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * SMS 발송 서비스
     */
    @Resource(name="smsMessageIfService")
    SmsMessageIfService smsMessageIfService;

    /**
     * SMS 메시지 전송
     *
     * SMS 발송 페이지                            : 테이블      / contactBizCd (CRM361) / appDstinCd (COM065)
     * CRM > 고객정보관리 > 상세화면             : CR_0101T / 01                    / 6
     * CRM > 판매기회관리 > 판매기회관리         : CR_0201T / 03                    / 9
     * CRM > 고객 요청 관리 > 고객 요청 관리     : CR_0601T / 04                    / 8
     * CRM > 캠페인 관리 > 캠페인 실행 관리      : CR_0710T / 06                    / 3
     * CRM > 멤버십 관리 > 포인트 소멸 예정 관리 : CR_0811T / 07                    / 7
     * CRM > 멤버십 관리 > 포인트 소멸관리       : CR_0811T / 07                    / 7
     * CRM > 고객케어 관리 > 고객케어 실행       : CR_0502T / 09                    / 2
     * CRM > OB 실행                             : CR_0606T / 10                    / 10
     * CRM > 고객정보관리 > 고객할인관리         : CR_0825T / 11                    / 11
     *
     * @param messageVO
     */
    @Override
    public boolean smsMessageSend(SmsMessageVO smsMessageVO) throws Exception {

        boolean smsRslt = false;

        int mesgTmplNo = smsMessageVO.getMesgTmplNo();
        String custNm;
        String custNo;
        String hpNo;
        String contactStatCd = "OUT";                           // IN/OUT
        String messageTp = "04";                                // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
        String contactBizCd = smsMessageVO.getContactBizCd();   // [공통코드 확인 : CRM321] 업무구분 (01:고객 / 03:판매기회 / 04:VOC / 05:만족도 / 06:캠페인 / 07:멤버십 / 09:고객케어 / 10:콜센터 / 11:고객할인관리)
        String refTableNm = smsMessageVO.getRefTableNm();
        String refKeyNm;
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        // SMS I/F 호출
        String smsSendDstinCd = null;                                               // SMS전송구분코드(1: 즉시전송, 2:예약전송)
        String resvDt = null;                                                       // 예약일시(12자리, yyyymmddhhmm)
        String appDstinCd = null;                                                   // APP 구분코드(1:알림메시지, 2: 고객케어, 3: 캠페인, 4:만족도조사)
        if ( "N".equals(smsMessageVO.getSmsTp()) ){
            smsSendDstinCd = "1";
        } else if ( "R".equals(smsMessageVO.getSmsTp()) ){
            smsSendDstinCd = "2";
            resvDt = new SimpleDateFormat("yyyyMMddHHmm").format(smsMessageVO.getResvDt());
        }

        List<SmsTmplUserVO> smsTmplUserList = new ArrayList<SmsTmplUserVO>();

        // 1. 임시테이블에서 고객을 가지고 오는 경우
        if ( smsMessageVO.getSmsTmplUserSeq() > 0 ) {
            SmsTmplUserSearchVO searchVO = new SmsTmplUserSearchVO();
            searchVO.setsSeq(smsMessageVO.getSmsTmplUserSeq());
            smsTmplUserList = smsTmplUserService.selectSmsTmplUsersByCondition(searchVO);
        } else if (smsMessageVO.getInsertSms().size() > 0 ) {
            smsTmplUserList = smsMessageVO.getInsertSms();
        }

        if ( smsTmplUserList.size() == 0 ) {
            // {메시지전송 대상자}이(가) 없습니다.
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.info.msgTransTarget", null, LocaleContextHolder.getLocale())});
        }

        // ##################################################### SMS 전송 LOOP 시작
        for (SmsTmplUserVO smsTmplUserVO : smsTmplUserList) {

            String smsTmplMsg = smsMessageVO.getSmsTmplMsg();       // 템플릿 메시지
            custNm = smsTmplUserVO.getCustNm();
            custNo = smsTmplUserVO.getCustNo();
            hpNo = smsTmplUserVO.getHpNo();
            //hpNo = "18548908030";     //TODO 테스트 전화번호
            refKeyNm = smsTmplUserVO.getRefKeyNm();
            // Velocity로 SMS 전송 텍스트 만들기 시작
            VelocityContext vContext = new VelocityContext();
            vContext.put("custNm", custNm);       // $custNm / ${custNm}
            vContext.put("hpNo", hpNo);         // $hpNo / ${hpNo}
            StringWriter swOut = new StringWriter();
            Velocity.evaluate(vContext, swOut, String.valueOf(mesgTmplNo), smsTmplMsg);
            smsTmplMsg = swOut.toString();      // 메시지 내용
            // Velocity로 SMS 전송 텍스트 만들기 종료

            if ( "01".equals(contactBizCd) ) {
                appDstinCd = "6";
            }else if ( "03".equals(contactBizCd) ) {
                appDstinCd = "9";
            }else if ( "04".equals(contactBizCd) ) {
                appDstinCd = "8";
            }else if ( "06".equals(contactBizCd) ) {
                appDstinCd = "3";
            }else if ( "07".equals(contactBizCd) ) {
                appDstinCd = "7";
            }else if ( "09".equals(contactBizCd) ) {
                appDstinCd = "2";
            }else if ( "10".equals(contactBizCd) ) {
                appDstinCd = "10";
            }else if ( "11".equals(contactBizCd) ) {
                appDstinCd = "11";
            };

            /**
             * SMS 발송 호출
             * SMS IF 는 리스트로 받음.
             * FOR 문으로 내용 만들어서 보낸다.
             */
            SmsMessageIfVO smsMessageIfVO = new SmsMessageIfVO();
            smsMessageIfVO.setDlrCd(dlrCd);                          // 딜러코드
            smsMessageIfVO.setSmsSendDstinCd(smsSendDstinCd);        // SMS전송구분코드(1: 즉시전송, 2:예약전송)
            smsMessageIfVO.setTelNo(hpNo);                           // 전화번호
            smsMessageIfVO.setSmsCont(smsTmplMsg);                   // 내용
            smsMessageIfVO.setResvDt(resvDt);                        // 예약일시(12자리, yyyymmddhhmm)
            smsMessageIfVO.setAppDstinCd(appDstinCd);                // APP 구분코드(COM065)
            smsMessageIfVO.setAppSeq(refKeyNm);                      // APP 일련번호
            smsMessageIfVO.setCustNo(custNo);                      // APP 일련번호
            smsMessageIfVO.setRegUsrId(userId);                      // 등록자

            // smsMsgSeq 발송후 시퀀스를 리턴받는다.
            String smsSendSeq = smsMessageIfService.mergeSmsMessageIF(smsMessageIfVO);

            // 전송후 RefTableNm() / RefTableKey 를 가지고 처리 해야 하는 경우 아래 에서 로직구현.
            if ( "CR_0502T".equals(smsMessageVO.getRefTableNm()) ) {

                // 고객케어 - SMS 발송일 업데이트
                CustomerCareExtrTargetVO customerCareExtrTargetVO = new CustomerCareExtrTargetVO();
                customerCareExtrTargetVO.setCustCareSeq(Integer.parseInt(smsMessageVO.getRefKeyNm()));
                customerCareExtrTargetVO.setDlrCd(dlrCd);
                customerCareExtrTargetVO.setCustNo(custNo);
                customerCareExtrTargetVO.setUpdtUsrId(userId);
                customerCareExtrTargetVO.setSmsSendRsltCont(smsSendSeq);
                customerCareExtrTargetService.updateCustomerCareExtrTargetSmsSendDt(customerCareExtrTargetVO);
/*
            }else if ( "CR_0811T".equals(smsMessageVO.getRefTableNm()) ) {

                // 20170316 포인트 소멸 SMS 기능 삭제 멤버십 관리 => 포인트 소멸 예정관리 SMS발신여부 처리하기 위함
                MembershipPointExtVO membershipPointExtVO = new MembershipPointExtVO();
                membershipPointExtVO.setDlrCd(dlrCd);//딜러코드
                membershipPointExtVO.setExtcSeq(Integer.parseInt(smsMessageVO.getRefKeyNm()));//소멸예정일련번호
                membershipPointExtVO.setSmsSendYn("Y");//SMS발송여부        TODO 컬럼 사이즈 변경해야함.
                membershipPointExtVO.setUpdtUsrId(userId);
                membershipPointExtService.updateMembershipPointExtSmsYn(membershipPointExtVO);
*/
            }else if ( "CR_0710T".equals(smsMessageVO.getRefTableNm()) ) {

                // 캠페인 관리 => 캠페인 대상자 SMS발신여부 처리하기 위함
                CampaignActionVO campaignActionVO = new CampaignActionVO();
                campaignActionVO.setDlrCd(dlrCd);//딜러코드
                campaignActionVO.setExtrDgreCnt(Integer.parseInt(smsMessageVO.getRefKeyNm()));//추출차수
                campaignActionVO.setCustNo(custNo);
                campaignActionVO.setSmsSendRsltCont(smsSendSeq);
                campaignActionVO.setUpdtUsrId(userId);

                campaignActionService.updateCampaignExtrTargetSmsSend(campaignActionVO);

            }

            // 고객번호가 필수인 경우에만 ContactHistory 등록
            if ( "Y".equals(smsMessageVO.getCustNoRequired()) ) {

                // ContactHistory 등록
                ContactHistoryVO contactHistoryVO = new ContactHistoryVO();
                contactHistoryVO.setDlrCd(dlrCd);
                contactHistoryVO.setCustNo(custNo);
                contactHistoryVO.setContactStatCd(contactStatCd);
                contactHistoryVO.setContactTp(messageTp);
                contactHistoryVO.setContactBizCd(contactBizCd);
                contactHistoryVO.setContactCont(smsTmplMsg);      // 접촉내용
                contactHistoryVO.setRefTableNm(refTableNm);
                contactHistoryVO.setRefKeyNm(refKeyNm);
                contactHistoryVO.setRegUsrId(userId);
                contactHistoryVO.setSmsSendSeq(smsSendSeq);
                contactHistoryService.insertContactHistory(contactHistoryVO);

            }

        }

        smsRslt = true;
        // ##################################################### SMS 전송 LOOP 시작

        if ( !smsRslt ) {
            // {메시지전송} 에 실패하였습니다.
            throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.msgTransmission", null, LocaleContextHolder.getLocale())});
        }

        return smsRslt;
    }

}