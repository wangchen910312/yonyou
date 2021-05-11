package chn.bhmc.dms.bat.crm.crq.service.impl;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.quartz.JobExecutionException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.mcm.service.dao.BatMarkingCampaignDAO;

import chn.bhmc.dms.bat.crm.crq.service.BatCustomerCareBatchService;
import chn.bhmc.dms.bat.crm.crq.service.dao.BatCustomerCareBatchDAO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCampaignActionVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatContactHistoryVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCrmTargExtractVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareExtrTargetVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareSearchVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatSmsTmplUserVO;
import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * BatCustomerCareBatchServiceImpl
 *
 * @author In Moon Lee
 * @since 2016.08.05.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016.08.05.     In Moon Lee      최초 생성
 * </pre>
 */
@Service("batCustomerCareBatchService")
public class BatCustomerCareBatchServiceImpl extends HService implements BatCustomerCareBatchService {
    /**
     * BatCustomerCareBatchDAO DAO
     */
    @Resource(name="batCustomerCareBatchDAO")
    BatCustomerCareBatchDAO batCustomerCareBatchDAO;

    /**
     * SMS 발송 서비스
     */
    @Resource(name="smsMessageIfService")
    SmsMessageIfService smsMessageIfService;

    /**
     * 캠페인 배치 DAO
     */
    @Resource(name="batMarkingCampaignDAO")
    BatMarkingCampaignDAO batMarkingCampaignDAO;

    @Override
    public String customerCareTargetExtract() throws Exception {

        String result = "99";                           // 고객케어대상자 추출 결과 코드

        // 배치 작업할 고객케어 목록을 조회한다. ( 필수 조건 - useYn:Y / 자동추출:Y )
        BatCustomerCareSearchVO searchVO = new BatCustomerCareSearchVO();
        if(batMarkingCampaignDAO.selectSysOwnerDlrCdCnt() == 1){
            searchVO.setsSysOwnDlrYn("Y");
        }else{
            searchVO.setsSysOwnDlrYn("N");
        }
        List<BatCustomerCareVO> customerCareBatchList = batCustomerCareBatchDAO.selectCustomerCareMgmtsByCondition(searchVO);

        // 고객캐어관리 배치 목록 List 시작
        for (BatCustomerCareVO customerCareVO : customerCareBatchList) {

            String dlrCd = customerCareVO.getDlrCd();
            String userId = customerCareVO.getRegUsrId();           // 배치에서 등록하는 ID는 SYSTEM인데 고객케어는 예외케이스로 고객케어 등록자 아이디로 사용한다. 20161010 이인문
            int custCareSeq = customerCareVO.getCustCareSeq();

            BatCrmTargExtractVO batCrmTargExtractVO = new BatCrmTargExtractVO();

            try {

                // 고객케어 대상자 추출 프로시저 호출 : 대상자 추출 / 고객케어대상자 테이블로 전송 / 추출차수 및 추출시간 업데이트
                batCrmTargExtractVO.setDlrCd(dlrCd);
                batCrmTargExtractVO.setCustCareSeq(custCareSeq);
                batCrmTargExtractVO.setRegUsrId(userId);
                batCrmTargExtractVO.setUpdtUsrId(userId);
                batCustomerCareBatchDAO.callCustCareTargExtr(batCrmTargExtractVO);
                result = batCrmTargExtractVO.getResult();

            } catch (Exception e) {

                result = "99";
                throw new JobExecutionException("CustomerCare : "+customerCareVO.getCustCareNm()+" || targExtract FAIL");

            }

            // 고객케어 대상자 추출 성공일경우 시작
            if ( "00".equals(result) ) {

                /**
                 * 대상자 추출후 실행유형 확인 ( activeTpCd )
                 *      01(전화) : 콜센터 전송  프로시저 호출
                 *      02(문자) && 자동발송 : 문자 발송
                 */
                if ( "01".equals(customerCareVO.getActiveTpCd()) ) {

                    String refKeyNm = String.valueOf(custCareSeq);
                    String bizCd = "09";
                    //int extrDgreCnt = batCrmTargExtractVO.getExtrDgreCnt();           // 콜센터 전송 수정으로 인해 조건 사용 안함.
                    //String custExtrTermCd = customerCareVO.getCustExtrTermCd();       // 콜센터 전송 수정으로 인해 조건 사용 안함.

                    // 콜센터 전송 프로시저 호출
                    BatCampaignActionVO campaignActionVO = new BatCampaignActionVO();
                    try {

                        // 콜센터 전송 프로시저 호출
                        campaignActionVO.setDlrCd(dlrCd);                   // 딜러코드
                        campaignActionVO.setRefKeyNm(refKeyNm);             // 고객케어 일련번호
                        campaignActionVO.setBizCd(bizCd);                   // 업무코드
                        campaignActionVO.setRegUsrId(userId);               // 등록자
                        campaignActionVO.setUpdtUsrId(userId);              // 수정자
                        //campaignActionVO.setCustExtrTermCd(custExtrTermCd); // 고객추출조건코드       - 콜센터 전송 수정으로 인해 조건 사용 안함.
                        //campaignActionVO.setExtrDgreCnt(extrDgreCnt);       // 추출차수                    - 콜센터 전송 수정으로 인해 조건 사용 안함.
                        batCustomerCareBatchDAO.selectCallCenterSends(campaignActionVO);
                        result = campaignActionVO.getResult();

                    } catch (Exception e) {

                        result = "99";
                        throw new JobExecutionException("CustomerCare : "+customerCareVO.getCustCareNm()+" || CallSend FAIL");

                    }


                // 문자일경우
                } else if ( "02".equals(customerCareVO.getActiveTpCd()) ) {

                    // ########### 자동 전송인경우 문자 전송 시작
                    if ( "Y".equals(customerCareVO.getAutoActiveYn()) && StringUtils.isNotBlank(customerCareVO.getActiveTmplId())) {

                        //customerCareVO.getActiveTmplId();

                        // SMS 템플릿 메시지 가지고 오기
                        int sMesgTmplNo = Integer.parseInt(customerCareVO.getActiveTmplId());
                        String smsTmplMsg = batCustomerCareBatchDAO.selectMessageTemplateByKey(sMesgTmplNo);

                        // 대상자 목록 가지고 오기
                        BatCustomerCareExtrTargetSearchVO batCustomerCareExtrTargetSearchVO = new BatCustomerCareExtrTargetSearchVO();
                        batCustomerCareExtrTargetSearchVO.setsDlrCd(dlrCd);
                        batCustomerCareExtrTargetSearchVO.setsCustCareSeq(Integer.toString(custCareSeq));
                        List<BatSmsTmplUserVO> batSmsTmplUserList = batCustomerCareBatchDAO.selectCustomerCareExtrTargetsByCondition(batCustomerCareExtrTargetSearchVO);

                        if ( batSmsTmplUserList.size() == 0 ) {
                            // {메시지전송 대상자}이(가) 없습니다.
                            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.info.msgTransTarget", null, LocaleContextHolder.getLocale())});

                        } else {

                            int mesgTmplNo = custCareSeq;// 아무거나 유니크한거...
                            String custNm;
                            String custNo;
                            String hpNo;
                            String contactStatCd = "OUT";                           // IN/OUT
                            String messageTp = "04";                                // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
                            String contactBizCd = "09"; // [공통코드 확인] 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
                            String refTableNm = "CR_0501T";
                            String refKeyNm = Integer.toString(custCareSeq);
                            String targCustSeq;

                            // SMS I/F 호출
                            String smsSendDstinCd = null;                                               // SMS전송구분코드(1: 즉시전송, 2:예약전송)
                            String resvDt = null;                                                       // 예약일시(12자리, yyyymmddhhmm)
                            String appDstinCd = "2";                       // [SMS I/F] APP 구분코드(1:알림메시지, 2: 고객케어, 3: 캠페인, 4:만족도조사)
                            String sysDt = DateUtil.getDate("yyyyMMdd");        // 예약 날짜 설정
                            List<SmsMessageIfVO> smsMessageIfVOs = new ArrayList <SmsMessageIfVO>();    // SMS I/F 전송 리스트
                            if ( "N".equals(customerCareVO.getAutoActiveYn()) ){
                                smsSendDstinCd = "1";
                            } else if ( "Y".equals(customerCareVO.getAutoActiveYn()) ){
                                smsSendDstinCd = "2";
                                resvDt = sysDt+customerCareVO.getSmsResvHm();        // TO-DO 고객케어 SMS 자동발송 컬럼명 확인     // TODO 배치시간 < 예약발송시간 확인
                            }

                            // ##################################################### SMS 전송 LOOP 시작
                            for (BatSmsTmplUserVO batSmsTmplUserVO : batSmsTmplUserList) {

                                custNm = batSmsTmplUserVO.getCustNm();
                                custNo = batSmsTmplUserVO.getCustNo();
                                hpNo = batSmsTmplUserVO.getHpNo();
                                targCustSeq = batSmsTmplUserVO.getTargCustSeq();

                                // Velocity로 SMS 전송 텍스트 만들기 시작
                                VelocityContext vContext = new VelocityContext();
                                vContext.put("custNm", custNm);       // $custNm / ${custNm}
                                vContext.put("hpNo", hpNo);         // $hpNo / ${hpNo}
                                StringWriter swOut = new StringWriter();
                                Velocity.evaluate(vContext, swOut, String.valueOf(mesgTmplNo), smsTmplMsg);
                                smsTmplMsg = swOut.toString();      // 메시지 내용
                                // Velocity로 SMS 전송 텍스트 만들기 종료

                               /**
                                 * TODO SMS 발송 호출
                                 *
                                 */

                                // ContactHistory 등록
                                BatContactHistoryVO batContactHistoryVO = new BatContactHistoryVO();
                                batContactHistoryVO.setDlrCd(dlrCd);
                                batContactHistoryVO.setCustNo(custNo);
                                batContactHistoryVO.setContactStatCd(contactStatCd);
                                batContactHistoryVO.setContactTp(messageTp);
                                batContactHistoryVO.setContactBizCd(contactBizCd);
                                batContactHistoryVO.setContactCont(smsTmplMsg);      // 접촉내용
                                batContactHistoryVO.setRefTableNm(refTableNm);
                                batContactHistoryVO.setRefKeyNm(refKeyNm);
                                batContactHistoryVO.setRegUsrId(userId);
                                batCustomerCareBatchDAO.insertContactHistory(batContactHistoryVO);

                                // 고객케어 - SMS 발송일 업데이트
                                BatCustomerCareExtrTargetVO batCustomerCareExtrTargetVO = new BatCustomerCareExtrTargetVO();
                                batCustomerCareExtrTargetVO.setCustCareSeq(custCareSeq);
                                batCustomerCareExtrTargetVO.setDlrCd(dlrCd);
                                batCustomerCareExtrTargetVO.setCustNo(custNo);
                                batCustomerCareExtrTargetVO.setUpdtUsrId(userId);
                                batCustomerCareBatchDAO.updateCustomerCareExtrTargetSmsSendDt(batCustomerCareExtrTargetVO);

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
                                smsMessageIfVO.setAppDstinCd(appDstinCd);                // APP 구분코드(1:알림메시지, 2: 고객케어, 3: 캠페인, 4:만족도조사)
                                smsMessageIfVO.setAppSeq(targCustSeq);                   // APP 일련번호     ( 고객케어 대상자 일련번호 )
                                smsMessageIfVO.setCustNo(custNo);                        // 고객번호
                                smsMessageIfVO.setRegUsrId(userId);                      // 등록자
                                smsMessageIfVOs.add(smsMessageIfVO);

                            }

                            smsMessageIfService.mergeSmsMessageIF(smsMessageIfVOs);

                            // ##################################################### SMS 전송 LOOP 종료
                        }

                    }
                    // ########### 자동 전송인경우 문자 전송 종료
                }
                // 대상자 추출후 프로세스 종료
            }
            // 고객케어 대상자 추출 성공일경우 종료
        }
        // 고객캐어관리 배치 목록 List 종료

        return result;

    }

}