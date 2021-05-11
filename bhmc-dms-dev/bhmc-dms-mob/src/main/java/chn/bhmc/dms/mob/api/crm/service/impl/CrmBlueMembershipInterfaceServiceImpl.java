package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.exception.BizException;
import able.com.service.HService;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.service.CrmBlueMembershipInterfaceService;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfParamVO;

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

@Service("CrmblueMembershipInterfaceService")
public class CrmBlueMembershipInterfaceServiceImpl extends HService implements CrmBlueMembershipInterfaceService {

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * Camel Client Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

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
            camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("CRM507"); //BM 회원 포인트 명세 GetAddORConsumeintegralList
            camelClient.setSender(LoginUtil.getDlrCd());

            if(StringUtils.isNotBlank(paramVO.getDealerId())){
                message.put("DealerId", paramVO.getDealerId());   // 딜러ID
            }
            if(StringUtils.isNotBlank(paramVO.getBeginDate())){
                message.put("BeginDate", paramVO.getBeginDate());   // 시작날짜(yyyyMMddHHmmss)
            }
            if(StringUtils.isNotBlank(paramVO.getEndDate())){
                message.put("EndDate", paramVO.getEndDate());   // 완료날짜(yyyyMMddHHmmss)
            }
            message.put("IdentityNumber", paramVO.getIdentityNumber());   // 증서번호
            message.put("BlueMembership_No", paramVO.getBlueMembershipNo());   // 회원카드번호
            camelClient.addSendMessage(message);

            receiveData = camelClient.sendRequest();
            BlueMembershipIfConsumeListRapVO result = null;

            // BM IF ERROR시 LOG 쌓는다 ( BM 사용 목록은 계속 쌓이기 때문에 DB 컬럼 사이즈 초과해서 제외
            //insertBlueMembershipInterfaceLog(camelClient.getSendData().getHeader().getIfId(), message.toString(), receiveData.getBody().getJsonMessage());

            // success : Z, error : E ( ifResult : 성공여부는 확인 해야함.)
            // isSuccess : 성공: true, 실패: false
            if("E".equals(receiveData.getFooter().getIfResult())){
                if(result == null)
                    result = new BlueMembershipIfConsumeListRapVO();
                result.setIsSuccess(false);
                result.setMessage(receiveData.getFooter().getIfFailMsg());
            }else{
                result = receiveData.readMessage(BlueMembershipIfConsumeListRapVO.class);
                if(!result.getIsSuccess()){
                    result.setMessage(messageSource.getMessage("crm.lbl.blueMembers", null, LocaleContextHolder.getLocale())+":"+result.getMessage());
                }
            }
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
}