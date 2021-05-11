package chn.bhmc.dms.crm.cmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

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
import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtVO;
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
     * SMS 메시지 전송
     *
     * @param messageVO
     */
    @Override
    public boolean smsMessageSend(SmsMessageVO smsMessageVO) throws Exception {

        boolean smsRslt = false;
        int smsGroup = 0 ;
        int insertGroup = 0 ;
        int updateGroup = 0;
        int deleteUser = 0;


        /**
         *  SMS 발송 대상자는 파라미터에 따라서 보내는 방법이 다름
         *  1. SMS 발송 대상자 임시 테이블에서 대상자를 조회해서 SELECT -> INSERT 로 전송 ( int smsTmplUserSeq 번호 확인 )
         *      -> 문자발송 > 컨택히스토리 등록 > SMS발송일수정(서비스에 따라 다름) > SMS 발송 대상자 임시 테이블 삭제
         *
         *  2. 대상자를 리스트를 받아서 전송  ( <SmsTmplUserVO> insertSms() 확인 )
         *      -> 문자발송 > 컨택히스토리 등록 > SMS발송일수정(서비스에 따라 다름)
         */

        // 1. 임시테이블에서 고객을 가지고 오는 경우
        if ( smsMessageVO.getSmsTmplUserSeq() > 0 ) {

            // TODO SMS 발송
            smsGroup = 1;
            if ( smsGroup > 0 ){
                smsRslt = true;
            } else {
                smsRslt = false;
            }

            if ( smsRslt ) {

                /**
                 * 컨택 히스토리 등록
                 */
                String messageTp = "04";
                ContactHistoryVO contactHistoryVO = new ContactHistoryVO();
                contactHistoryVO.setSmsTmplUserSeq(smsMessageVO.getSmsTmplUserSeq());
                contactHistoryVO.setDlrCd(LoginUtil.getDlrCd());
                contactHistoryVO.setContactStatCd("OUT");                           // IN/OUT
                contactHistoryVO.setContactTp(messageTp);                           // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
                contactHistoryVO.setContactBizCd(smsMessageVO.getContactBizCd());   // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
                contactHistoryVO.setContactCont(smsMessageVO.getSmsTmplMsg());      // 접촉내용        TODO 메시지 내용 어떤걸로??
                contactHistoryVO.setRefTableNm(smsMessageVO.getRefTableNm());
                contactHistoryVO.setRegUsrId(LoginUtil.getUserId());                // TODO [이인문] 등록자 : 로그인한사람? 아니면 파라미터??
                insertGroup = contactHistoryService.insertGroupContactHistory(contactHistoryVO);

                if ( insertGroup > 0 ){
                    smsRslt = true;
                } else {
                    smsRslt = false;
                }

            }

            /****************************************************************************************
             ******** 전송후 RefTableNm() / RefTableKey 를 가지고 처리 해야 하는 경우 아래 에서 로직구현. ********
             ****************************************************************************************/
            if ( smsRslt ) {

                /**
                 * 고객케어 - SMS 발송일 업데이트
                 */
                if ( "CR_0502T".equals(smsMessageVO.getRefTableNm()) ) {

                    // TODO 예약전송일경우는 SMS 전송일자를 어떻게 해줘야 하나?
                    CustomerCareExtrTargetVO customerCareExtrTargetVO = new CustomerCareExtrTargetVO();
                    customerCareExtrTargetVO.setCustCareSeq(Integer.parseInt(smsMessageVO.getRefKeyNm()));
                    customerCareExtrTargetVO.setDlrCd(LoginUtil.getDlrCd());
                    customerCareExtrTargetVO.setSmsTmplUserSeq(smsMessageVO.getSmsTmplUserSeq());
                    customerCareExtrTargetVO.setUpdtUsrId(LoginUtil.getUserId());
                    updateGroup = customerCareExtrTargetService.updateGroupCustomerCareExtrTargetSmsSendDt(customerCareExtrTargetVO);

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }

                } else if ( "CR_0811T".equals(smsMessageVO.getRefTableNm()) ) {
                    // 멤버십 관리 => 포인트 소멸 예정관리 SMS발신여부 처리하기 위함
                    MembershipPointExtVO membershipPointExtVO = new MembershipPointExtVO();
                    membershipPointExtVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
                    membershipPointExtVO.setSmsTmplUserSeq(smsMessageVO.getSmsTmplUserSeq());
                    //membershipPointExtVO.setCustNo(obj.getCustNo());
                    membershipPointExtVO.setSmsSendYn("Y");//SMS발송여부
                    membershipPointExtVO.setUpdtUsrId(LoginUtil.getUserId());

                    updateGroup = membershipPointExtService.updateMembershipPointExtSmsYnGroup(membershipPointExtVO);

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }

                } else if ( "CR_0710T".equals(smsMessageVO.getRefTableNm()) ) {
                    // 캠페인 관리 => 캠페인 대상자 SMS발신여부 처리하기 위함
                    CampaignActionVO campaignActionVO = new CampaignActionVO();
                    campaignActionVO.setExtrDgreCnt(Integer.parseInt(smsMessageVO.getRefKeyNm()));
                    campaignActionVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
                    campaignActionVO.setSmsTmplUserSeq(smsMessageVO.getSmsTmplUserSeq());
                    //campaignActionVO.setCustNo(obj.getCustNo());
                    //campaignActionVO.setSmsSendYn("Y");//SMS발송여부
                    campaignActionVO.setUpdtUsrId(LoginUtil.getUserId());

                    updateGroup = campaignActionService.updateGroupCampaignExtrTargetSmsSend(campaignActionVO);

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }
                }

            }

            if ( smsRslt ) {

                // SMS 발송 대상자 임시 목록 삭제
                SmsTmplUserSearchVO searchVO = new SmsTmplUserSearchVO();
                searchVO.setsSeq(smsMessageVO.getSmsTmplUserSeq());
                deleteUser = smsTmplUserService.deleteSmsTmplUsers(searchVO);

                if ( deleteUser > 0 ){
                    smsRslt = true;
                } else {
                    smsRslt = false;
                }

            }

        } else if (smsMessageVO.getInsertSms().size() > 0 ) {

            // sms 발송
//            for (SmsTmplUserVO obj : smsMessageVO.getInsertSms() ) {
//                System.out.println("SMS 발송");
//            }
            smsGroup = 1;
            if ( smsGroup > 0 ){
                smsRslt = true;
            } else {
                smsRslt = false;
            }

            if ( smsRslt ) {

                // contact history 등록
                for (SmsTmplUserVO obj : smsMessageVO.getInsertSms() ) {

                    String messageTp = "04";

                    ContactHistoryVO contactHistoryVO = new ContactHistoryVO();
                    contactHistoryVO.setDlrCd(LoginUtil.getDlrCd());
                    contactHistoryVO.setCustNo(obj.getCustNo());
                    contactHistoryVO.setContactStatCd("OUT");                           // IN/OUT
                    contactHistoryVO.setContactTp(messageTp);                           // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
                    contactHistoryVO.setContactBizCd(smsMessageVO.getContactBizCd());   // [공통코드 확인] 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
                    contactHistoryVO.setContactCont(smsMessageVO.getSmsTmplMsg());      // 접촉내용        TODO 메시지 내용 어떤걸로??
                    contactHistoryVO.setRefTableNm(smsMessageVO.getRefTableNm());
                    contactHistoryVO.setRefKeyNm(obj.getRefKeyNm());
                    contactHistoryVO.setRegUsrId(LoginUtil.getUserId());                // TODO [이인문] 등록자 : 로그인한사람? 아니면 파라미터??

                    insertGroup =+ contactHistoryService.insertContactHistory(contactHistoryVO);

                }

                if ( insertGroup > 0 ){
                    smsRslt = true;
                } else {
                    smsRslt = false;
                }

            }

            /****************************************************************************************
             ******** 전송후 RefTableNm() / RefTableKey 를 가지고 처리 해야 하는 경우 아래 에서 로직구현. ********
             ****************************************************************************************/
            if ( smsRslt ) {

                /**
                 * 고객케어 - SMS 발송일 업데이트
                 */
                if ( "CR_0502T".equals(smsMessageVO.getRefTableNm()) ) {

                    for (SmsTmplUserVO obj : smsMessageVO.getInsertSms() ) {

                        CustomerCareExtrTargetVO customerCareExtrTargetVO = new CustomerCareExtrTargetVO();
                        customerCareExtrTargetVO.setCustCareSeq(Integer.parseInt(smsMessageVO.getRefKeyNm()));
                        customerCareExtrTargetVO.setDlrCd(LoginUtil.getDlrCd());
                        customerCareExtrTargetVO.setCustNo(obj.getCustNo());
                        customerCareExtrTargetVO.setUpdtUsrId(LoginUtil.getUserId());

                        updateGroup =+ customerCareExtrTargetService.updateCustomerCareExtrTargetSmsSendDt(customerCareExtrTargetVO);

                    }

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }

                }else if ( "CR_0811T".equals(smsMessageVO.getRefTableNm()) ) {
                    // 멤버십 관리 => 포인트 소멸 예정관리 SMS발신여부 처리하기 위함
                    for (SmsTmplUserVO obj : smsMessageVO.getInsertSms() ) {

                        MembershipPointExtVO membershipPointExtVO = new MembershipPointExtVO();
                        membershipPointExtVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
                        //membershipPointExtVO.setCustNo(obj.getCustNo());
                        membershipPointExtVO.setExtcSeq(Integer.parseInt(obj.getRefKeyNm()));//소멸예정일련번호
                        membershipPointExtVO.setSmsSendYn("Y");//SMS발송여부
                        membershipPointExtVO.setUpdtUsrId(LoginUtil.getUserId());

                        updateGroup =+ membershipPointExtService.updateMembershipPointExtSmsYn(membershipPointExtVO);

                    }

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }

                }else if ( "CR_0710T".equals(smsMessageVO.getRefTableNm()) ) {
                    // 캠페인 관리 => 캠페인 대상자 SMS발신여부 처리하기 위함
                    for (SmsTmplUserVO obj : smsMessageVO.getInsertSms() ) {

                        CampaignActionVO campaignActionVO = new CampaignActionVO();
                        campaignActionVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
                        campaignActionVO.setExtrDgreCnt(Integer.parseInt(obj.getRefKeyNm()));//추출차수
                        campaignActionVO.setCustNo(obj.getCustNo());
                        //campaignActionVO.setSmsSendYn("Y");//SMS발송여부
                        campaignActionVO.setUpdtUsrId(LoginUtil.getUserId());

                        updateGroup =+ campaignActionService.updateCampaignExtrTargetSmsSend(campaignActionVO);

                    }

                    if ( updateGroup > 0 ){
                        smsRslt = true;
                    } else {
                        smsRslt = false;
                    }

                }

            }

        }

        if ( !smsRslt ) {
            // {메시지전송} 에 실패하였습니다.
            throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.msgTransmission", null, LocaleContextHolder.getLocale())});
        }

        return smsRslt;
    }

}
