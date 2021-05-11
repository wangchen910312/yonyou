package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.DateUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.query.CommonQueryService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipInterfaceLogSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfBaseVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcAcceptVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcPointInfoVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfLogVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfPaymentRapVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIngerfaceServiceImpl.java
 * @Description : 블루멤버십 인터페이스 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * CRM501    회원가입 -> 삭제
 * CRM502    간편회원가입 : CreateMembership
 * CRM503    포인트 조회 : GetMemberUserintegralInfo
 * CRM504    회원정보조회 -> 삭제
 * CRM505    딜러인증검사 : MembershipApproval
 * CRM506    신규포인트 소비 : AddMembersConsume
 * CRM507    회원 포인트 명세 : GetAddORConsumeintegralList
 * CRM508    쿠폰 사용가능 여부 조회 : GetCustomCardCodeInfoByDMS
 * CRM509    쿠폰 사용 : UserAwardCustomCardInfo
 * CRM510    딜러인증검사대기 목록 조회 : PaymentAccessPoints
 * CRM511    블루 멤버십 정산수용여부(정산2) : GetDMSIntegralList
 * CRM512    블루 멤버십 쿠폰+포인트 사용 : UseCardAndAddConsume
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("blueMembershipInterfaceService")
public class BlueMembershipInterfaceServiceImpl extends HService implements BlueMembershipInterfaceService {

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 메시지 관리
     */
    @Resource(name="blueMembershipInterfaceLogSupportDAO")
    BlueMembershipInterfaceLogSupportDAO blueMembershipInterfaceLogSupportDAO;

    /**
     * 쿼리 실행 서비스
     */
    @Resource(name="commonQueryService")
	CommonQueryService commonQueryService;

    /**
     * Camel Client Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#insertCreateMembership(chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO insertCreateMembership(BlueMembershipIfParamVO paramVO) throws Exception {
        try{
            //딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 되므려 OneClick회원가입이라 한다.)
            //BlueMembership 연결 Client
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM502"); //불루 멤버십 간편회원가입
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("PhoneNumber", paramVO.getPhoneNumber()); //휴대폰번호
//            message.put("PaperWork", paramVO.getPaperWork()); //신분증 유형(신분증 =1, 여권=2, 군관증=3)
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("DealerId", paramVO.getDealerId());   //딜러번호
//            message.put("Agree", paramVO.getAgree()); //지불 여부(1: 지불 완료, 0: 미 지불 )
//            message.put("Amount", paramVO.getAmount());   //지불 금액
//            message.put("VIN", paramVO.getVin());   //VIN번호
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfInfoRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
//            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                result = new BlueMembershipIfInfoRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfInfoRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#selectMemberUserintegralInfo(chn.bhmc.dms.crm.dmm.vo.MemberUserintegralInfoVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO selectMemberUserIntegralInfo(BlueMembershipIfParamVO paramVO) throws Exception {
    //2020.08.25 tjx 屏蔽蓝缤接口CRM503(接车检查蓝缤会员信息查询返回蓝缤数据)
        try{
//            //회원 포인트 조회
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM503"); //블루멤버십 회원포인트 조회
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("identityNumber", paramVO.getIdentityNumber());   // 증서번호
//            if(StringUtils.isNotBlank(paramVO.getVin())){
//                message.put("vin", paramVO.getVin());   // vin 번호
//            }
//
//            // message add
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfInfoRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfInfoRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfInfoRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
           return result;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
   }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#selectBlueMembershipByIdentityNumber(chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO selectBlueMembershipByIdentityNumber(BlueMembershipIfParamVO paramVO) throws Exception {
        try {
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM504");
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("identityNumber", paramVO.getIdentityNumber());
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfInfoRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfInfoRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfInfoRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#insertMembershipApproval(chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO insertMembershipApproval(BlueMembershipIfParamVO paramVO) throws Exception {
        try{
            //딜러인증심사(고객이 APP, 홈페이지에서 가입을 하고 온 경우)
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM505"); //불루 멤버십 딜러인증검사
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("identityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("DealerId", paramVO.getDealerId());   //딜러번호
//            message.put("PhoneNumber", paramVO.getPhoneNumber()); //휴대폰번호
//            message.put("Vin", paramVO.getVin());   //VIN번호
//
//            // message add
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfInfoRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfInfoRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfInfoRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#selectAddMembersConsume(chn.bhmc.dms.crm.dmm.vo.AddMembersConsumeVO)
     */
    @Override
    public BlueMembershipIfConsumeRapVO insertAddMembersConsume(BlueMembershipIfParamVO paramVO) throws Exception {
        try{
            //포인트 소비 신규
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM506"); //포인트 소비 신규
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//
//            message.put("DealerId", paramVO.getDealerId());   // 딜러ID
//            message.put("ConsumeType", paramVO.getConsumeType());   // 소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금, 9:부품, 10:용품 )
//            message.put("ConsumePoints", paramVO.getConsumePoints());   // 소비 포인트 ( 적립인 경우 값을 0 )
//            message.put("TotalCost", paramVO.getTotalCost());   // 총 비용(할인 전)
//            message.put("ConsumeDate", paramVO.getConsumeDate());   // 소비시간(yyyyMMddHHmmss)
//            message.put("PhoneNumber", paramVO.getPhoneNumber());   // 휴대폰번호
//            message.put("OperatorDate", paramVO.getOperatorDate());   // 입력날짜(yyyyMMddHHmmss)
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("VIN", paramVO.getVin());   // Vin번호
//            message.put("Operator", paramVO.getOperator());   // 입력인 ID
//            message.put("DmsOrderNo", paramVO.getUseNum());//소비번호 ( RO번호 , 계약번호 등 )
//            message.put("PurchaseCost", paramVO.getPaymentCost());// 총 지불 비용 (할인 후)
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfConsumeRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
//            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfConsumeRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfConsumeRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#selectAddORConsumeintegral(chn.bhmc.dms.crm.dmm.vo.AddORConsumeintegralVO)
     */
    @Override
    public BlueMembershipIfConsumeListRapVO selectAddORConsumeintegral(BlueMembershipIfParamVO paramVO) throws Exception {

        CamelClient camelClient = new CamelClient();
        Map<String, Object> message = new HashMap<String, Object>();
        Data receiveData = new Data();

        try{
            //BM 회원 포인트 명세
//            camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM507"); //BM 회원 포인트 명세 GetAddORConsumeintegralList
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            if(StringUtils.isNotBlank(paramVO.getDealerId())){
//                message.put("DealerId", paramVO.getDealerId());   // 딜러ID
//            }
//            if(StringUtils.isNotBlank(paramVO.getBeginDate())){
//                message.put("BeginDate", paramVO.getBeginDate());   // 시작날짜(yyyyMMddHHmmss)
//            }
//            if(StringUtils.isNotBlank(paramVO.getEndDate())){
//                message.put("EndDate", paramVO.getEndDate());   // 완료날짜(yyyyMMddHHmmss)
//            }
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("BlueMembership_No", paramVO.getBlueMembershipNo());   // 회원카드번호
//            camelClient.addSendMessage(message);
//
//            receiveData = camelClient.sendRequest();
            BlueMembershipIfConsumeListRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다 ( BM 사용 목록은 계속 쌓이기 때문에 DB 컬럼 사이즈 초과해서 제외
            //insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());

            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfConsumeListRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfConsumeListRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {

            log.error("#####BM IF Exception START#####");
            log.error("BM_ID  : "+camelClient.getSendData().getHeader().getIfId());
            log.error("PARAM  : "+message.toString());
            log.error("RETURN : "+receiveData.getBody().getJsonMessage());
            log.error("#####BM IF Exception E N D#####");

            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#selectCustomCardCodeInfoByDMSInfo(chn.bhmc.dms.crm.dmm.vo.CustomCardCodeInfoByDMSInfoVO)
     */
    @Override
    public BlueMembershipIfCouponRapVO selectCustomCardCodeInfoByDMSInfo(BlueMembershipIfParamVO paramVO) throws Exception {
        try{
            //쿠폰 사용 여부 조회
            //BlueMembership 연결 Client
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM508"); //쿠폰 사용 여부 조회
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("DealerId", paramVO.getDealerId());   // 딜러ID
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("CardNo", paramVO.getCardNo());   // 쿠폰 번호(인증 번호)
//            message.put("Vin", paramVO.getVin());   // Vin번호
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfCouponRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
//            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                result = new BlueMembershipIfCouponRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfCouponRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#updateUserAwardCustomCardInfo(chn.bhmc.dms.crm.dmm.vo.UserAwardCustomCardInfoVO)
     */
    @Override
    public BlueMembershipIfCouponRapVO updateUserAwardCustomCardInfo(BlueMembershipIfParamVO paramVO) throws Exception {
        try{
            //쿠폰 사용
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM509"); //쿠폰 사용
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//            message.put("DealerId", paramVO.getDealerId());   // 딜러ID
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("CardNo", paramVO.getCardNo());   // 쿠폰 번호(인증 번호)
//            message.put("Vin", paramVO.getVin());   // Vin번호
//            message.put("CarCategory", paramVO.getCarCategory());   // 차형
//            message.put("CustName", paramVO.getCustName());   // 이름
//            message.put("MileAge", paramVO.getMileAge());   // 주행거리
//            message.put("DmsOrderNo", paramVO.getUseNum());   //소비번호
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfCouponRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
//            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                result = new BlueMembershipIfCouponRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfCouponRapVO.class);
//                if(!result.getIsSuccess() && StringUtils.isEmpty(result.getMessage())){
//                    result.setMessage(messageSource.getMessage("crm.err.couponUseFail", null, LocaleContextHolder.getLocale()));
//                }else if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#updateUserAwardCustomCardInfo(chn.bhmc.dms.crm.dmm.vo.UserAwardCustomCardInfoVO)
     */
    @Override
    public BlueMembershipIfPaymentRapVO selectPaymentAccessPoints(BlueMembershipIfParamVO paramVO) throws Exception {

        CamelClient camelClient = new CamelClient();
        Map<String, Object> message = new HashMap<String, Object>();
        Data receiveData = new Data();

        try{
//            camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM510"); //블루 멤버십 딜러인증 요청 목록
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            // 종료일은 +1 해줘야 정상조회됨.
//            if ( paramVO.getEndDate() != null ) {
//                String endDate = DateUtil.addDay(paramVO.getEndDate(), 1);
//                paramVO.setEndDate(endDate);
//            }
//
//            message.put("dealerId", LoginUtil.getDlrCd());   // 딜러ID
//            message.put("starttime", paramVO.getBeginDate());   // 시작일
//            message.put("endtime", paramVO.getEndDate());   // 종료일
//
//            // message add
//            camelClient.addSendMessage(message);
//
//            receiveData = camelClient.sendRequest();
            BlueMembershipIfPaymentRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다 20170516 size 에러
            //insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());

//            if("E".equals(receiveData.getFooter().getIfResult())){
//                result = new BlueMembershipIfPaymentRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfPaymentRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {

            log.error("#####BM IF Exception START#####");
            log.error("BM_ID  : "+camelClient.getSendData().getHeader().getIfId());
            log.error("PARAM  : "+message.toString());
            log.error("RETURN : "+receiveData.getBody().getJsonMessage());
            log.error("#####BM IF Exception E N D#####");

            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#updateUserAwardCustomCardInfo(chn.bhmc.dms.crm.dmm.vo.UserAwardCustomCardInfoVO)
     */
    @Override
    public BlueMembershipIfBaseVO updateCalcAcceptInfo(BlueMembershipIfCalcAcceptVO paramVO) throws Exception{

        CamelClient camelClient = new CamelClient();
        Map<String, Object> message = new HashMap<String, Object>();
        Data receiveData = new Data();

        try{
//            camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM511"); //정산 동의 or 미동의
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            message.put("DealerId", LoginUtil.getDlrCd());          //딜러ID
//            message.put("FromTime", paramVO.getBeginDate());        //시작일
//            message.put("EndTime", paramVO.getEndDate());           //종료일
//            message.put("TotalPoint", paramVO.getTotalPoint());     //총 포인트
//            message.put("TotalMoney", paramVO.getTotalAmt());        //총 금액
//            message.put("ISAgree", paramVO.getIsAgree());              //동의여부
//            message.put("Comment", paramVO.getComment());           //비고
//            message.put("IntegraList", paramVO.getPointUseList());  //포인트 사용목록
//
//            // message add
//            camelClient.addSendMessage(message);
//
//            receiveData = camelClient.sendRequest();
            BlueMembershipIfBaseVO result = null;

            // BM IF ERROR시 LOG 쌓는다
            /*
            @SuppressWarnings("unchecked")
            List<BlueMembershipIfCalcPointInfoVO> integraList = (List<BlueMembershipIfCalcPointInfoVO>) message.get("IntegraList");
            String integraListToString = "IntegraList : ";
            for (BlueMembershipIfCalcPointInfoVO blueMembershipIfCalcPointInfoVO : integraList) {
                integraListToString += blueMembershipIfCalcPointInfoVO.toJSONString();
            }
            integraListToString += " / message:"+message.toString();
            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), integraListToString, receiveData.getBody().getJsonMessage());
            */

//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null) {
//                    result = new BlueMembershipIfBaseVO();
//                    result.setIsSuccess(false);
//                    result.setMessage(receiveData.getFooter().getIfFailMsg());
//                }
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfBaseVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {

            String integraListToString = "IntegraList : ";
            if (paramVO.getPointUseList() != null && paramVO.getPointUseList().size() > 0 ){
                List<BlueMembershipIfCalcPointInfoVO> integraList = paramVO.getPointUseList();
                for (BlueMembershipIfCalcPointInfoVO blueMembershipIfCalcPointInfoVO : integraList) {
                    integraListToString += blueMembershipIfCalcPointInfoVO.toJSONString();
                }
                integraListToString += " / message:"+message.toString();
            }

            log.error("#####BM IF Exception START#####");
            log.error("BM_ID  : "+camelClient.getSendData().getHeader().getIfId());
            log.error("PARAM  : "+integraListToString);
            log.error("RETURN : "+receiveData.getBody().getJsonMessage());
            log.error("#####BM IF Exception E N D#####");

            throw new BizException(e.getMessage());
        }
    }

    /**
     * 블루멤버십 IF LOG 쌓는다
     * @param paramVO - dlrCd, bmIfParam, bmIfReturn
     */
    @Override
    public void insertBlueMembershipInterfaceLog(String ifId, String ifParam, String ifResult) throws Exception {

        // BM IF ERROR시 LOG 쌓는다
        BlueMembershipIfLogVO blueMembershipIfLogVO = new BlueMembershipIfLogVO();
        blueMembershipIfLogVO.setBmIfId(ifId);
        blueMembershipIfLogVO.setBmIfParam(ifParam);
        blueMembershipIfLogVO.setBmIfResult(ifResult);
        blueMembershipIfLogVO.setDlrCd(LoginUtil.getDlrCd());
        blueMembershipIfLogVO.setRegUsrId(LoginUtil.getUserId());

    	commonQueryService.execute("BLUEMEMBERSHIP_INTERFACE_LOG", LoginUtil.getDlrCd(), ifId, ifParam, ifResult, LoginUtil.getUserId());

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService#updateUseCardAndAddConsume(chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO)
     */
    @Override
    public BlueMembershipIfConsAndCopnRapVO updateUseCardAndAddConsume(BlueMembershipIfParamVO paramVO)
            throws Exception {
        try{
            //포인트 소비 신규
//            CamelClient camelClient = camelClientFactory.createCamelClient();
//            camelClient.setIfId("CRM512"); //쿠폰 + 포인트 소비 신규
//            camelClient.setSender(LoginUtil.getDlrCd());
//
//            Map<String, Object> message = new HashMap<String, Object>();
//
//            message.put("DealerId", paramVO.getDealerId());   // 딜러ID
//            message.put("ConsumeType", paramVO.getConsumeType());   // 소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금, 9:부품, 10:용품 )
//            message.put("ConsumePoints", paramVO.getConsumePoints());   // 소비 포인트 ( 적립인 경우 값을 0 )
//            message.put("PurchaseCost", paramVO.getPaymentCost());// 총 지불 비용 (할인 후)
//            message.put("TotalCost", paramVO.getTotalCost());   // 총 비용(할인 전)
//            message.put("ConsumeDate", paramVO.getConsumeDate());   // 소비시간(yyyyMMddHHmmss)
//            message.put("PhoneNumber", paramVO.getPhoneNumber());   // 휴대폰번호
//            message.put("Operator", paramVO.getOperator());   // 입력인 ID
//            message.put("OperatorDate", paramVO.getOperatorDate());   // 입력날짜(yyyyMMddHHmmss)
//            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
//            message.put("CardNo", paramVO.getCardNo());   // 쿠폰 번호(인증 번호)
//            message.put("VIN", paramVO.getVin());   // Vin번호
//            message.put("CarCategory", paramVO.getCarCategory());   // 차형
//            message.put("CustName", paramVO.getCustName());   // 이름
//            message.put("MileAge", paramVO.getMileAge());   // 주행거리
//            message.put("DmsOrderNo", paramVO.getUseNum());//소비번호 ( RO번호 , 계약번호 등 )
//            camelClient.addSendMessage(message);
//
//            Data receiveData = camelClient.sendRequest();
            BlueMembershipIfConsAndCopnRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다
//            insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());
//
//            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
//            // isSuccess : 성공: true, 실패: false
//            if("E".equals(receiveData.getFooter().getIfResult())){
//                if(result == null)
//                    result = new BlueMembershipIfConsAndCopnRapVO();
//                result.setIsSuccess(false);
//                result.setMessage(receiveData.getFooter().getIfFailMsg());
//            }else{
//                result = receiveData.readMessage(BlueMembershipIfConsAndCopnRapVO.class);
//                if(!result.getIsSuccess()){
//                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
//                }
//            }
            return result;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }
}