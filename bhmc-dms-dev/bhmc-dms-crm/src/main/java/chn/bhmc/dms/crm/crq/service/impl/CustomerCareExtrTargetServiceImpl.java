package chn.bhmc.dms.crm.crq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.service.dao.CustomerCareExtrTargetDAO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

/**
 * 대상자 목록 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.25         in moon lee            최초 생성
 * </pre>
 */

@Service("customerCareExtrTargetService")
public class CustomerCareExtrTargetServiceImpl extends HService implements CustomerCareExtrTargetService, JxlsSupport{

    /**
     * 대상자 목록 관리 DAO
     */
	@Resource(name="customerCareExtrTargetDAO")
	CustomerCareExtrTargetDAO customerCareExtrTargetDAO;

	/**
	 * 캠페인 대상자 관리 Service
	 */
	@Resource(name="campaignActionService")
	CampaignActionService campaignActionService;

    /**
     * 대상자 목록 관리 목록 수량 조회
     * @param CustomerCareExtrTargetSearchVO -
     */
    @Override
    public int selectCustomerCareExtrTargetsByConditionCnt(CustomerCareExtrTargetSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        // 엑셀 export때문에 추가..  ( 공통코드명 조회시 langCd 있어야함 )
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return customerCareExtrTargetDAO.selectCustomerCareExtrTargetsByConditionCnt(searchVO);
    }

    /**
     * 대상자 목록 관리 목록 조회
     * @param CustomerCareExtrTargetSearchVO -
     */
    @Override
    public List<CustomerCareExtrTargetVO> selectCustomerCareExtrTargetsByCondition(CustomerCareExtrTargetSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        // 엑셀 export때문에 추가..  ( 공통코드명 조회시 langCd 있어야함 )
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return customerCareExtrTargetDAO.selectCustomerCareExtrTargetsByCondition(searchVO);
    }

    /**
     * 대상자에게 SMS 전송후 SMS 전송일을 수정한다.
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    @Override
    public int updateCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception {

        if( StringUtils.isEmpty(customerCareExtrTargetVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( customerCareExtrTargetVO.getCustCareSeq() == 0 ){
            // [출처테이블]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(customerCareExtrTargetVO.getCustNo()) ) {
            // [고객번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        };

        return customerCareExtrTargetDAO.updateCustomerCareExtrTargetSmsSendDt(customerCareExtrTargetVO);
    }


    /**
     * [그룹전송] 대상자에게 SMS 전송후 SMS 전송일을 수정한다. ( SMS 전송 대상자 임시 테이블에서 select insert )
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    @Override
    public int updateGroupCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception {

        if( StringUtils.isEmpty(customerCareExtrTargetVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( customerCareExtrTargetVO.getCustCareSeq() == 0 ){
            // [출처테이블]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        };

        if( customerCareExtrTargetVO.getSmsTmplUserSeq() < 0 ) {
            // [메시지전송 대상자번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.smsTmplUserSeq", null, LocaleContextHolder.getLocale())});
        };

        return customerCareExtrTargetDAO.updateGroupCustomerCareExtrTargetSmsSendDt(customerCareExtrTargetVO);
    }

    /**
     * 고객케어 대상자 목록 -> 콜센터 전송. ( 고객케어 대상자 화면에서 콜센터 전송 )
     * 콜센터 전송시 추출차수 상관없이 전송 안된 대상자를 전송한다. 필수 파라미터 : 고객케어번호, 다른파라미터는 프로시저 호출하는데 필요하기 때문에 그냥 set 한다.
     * 전송 안된 대상자 : 실행유형은 SMS 또는 전화 둘중 하나이기 때문에 CALL_CEN_SEND_DT IS NULL 인 조건을 걸면 된다.
     * @param CustomerCareVO - custCareSeq
     * @return
     */
    @Override
    public String insertExtrTargetTrsfCallCenter(CustomerCareVO saveVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String refKeyNm = String.valueOf(saveVO.getCustCareSeq());
        String bizCd = "09";
        //int extrDgreCnt = saveVO.getExtrDgreCnt();
        String userId = LoginUtil.getUserId();

        if( !"01".equals(saveVO.getActiveTpCd()) ){
            // 실행유형이 전화인경우에만 콜센터 전송이 가능합니다.
            throw processException("crm.info.callSendChk");
        };

        if( "Y".equals(saveVO.getCustExtrAutoYn()) ){
            // [대상자자동추출] 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrAutoYn", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtil.isEmpty(refKeyNm) ){
            // [고객케어일련번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        };

//        if( saveVO.getExtrDgreCnt() < 0 ){
//            // [추출차수]을(를) 확인하여 주세요.
//            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
//        };

        CampaignActionVO campaignActionVO = new CampaignActionVO();

        campaignActionVO.setDlrCd(dlrCd);                   // 딜러코드
        campaignActionVO.setRefKeyNm(refKeyNm);             // 고객케어 일련번호
        //campaignActionVO.setExtrDgreCnt(extrDgreCnt);       // 추출차수
        campaignActionVO.setBizCd(bizCd);                   // 업무코드
        campaignActionVO.setRegUsrId(userId);               // 등록자
        campaignActionVO.setUpdtUsrId(userId);              // 수정자

        // 콜센터 전송 프로시저 호출
        campaignActionService.selectCallCenterSends(campaignActionVO);

        String result = campaignActionVO.getResult();

        return result;
    }

    /**
     * 추출대상자 -> 고객테어 대상자 테이블 인서트
     *
     * @param customerCareExtrTargetVO
     * @return
     */
    @Override
    public int insertTargExtract(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception {
        return customerCareExtrTargetDAO.insertTargExtract(customerCareExtrTargetVO);
    }

    /*  고객케어 대상자 엑셀 export
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {


        // 엑셀 export는 a href 이기 때문에 exception 메시지는 notification 이 아닌 json 새창으로 나옴 앞단에서 처리해야함.
        CustomerCareExtrTargetSearchVO searchVO = new CustomerCareExtrTargetSearchVO();

        if( Integer.parseInt(params.get("sCustCareSeq").toString()) < 1  ){
            // [고객케어일련번호]을(를) 확인하여 주세요.
            //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        };

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<CustomerCareExtrTargetVO> list = selectCustomerCareExtrTargetsByCondition(searchVO);

        if( list.size() == 0 ){

            // 추출할 대상자가 존재하지 않습니다.
            //throw processException("crm.err.targetEmptyUsr");

        } else {

            context.putVar("items", list);

        }

    }

    /*
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     */
    @Override
    public int updateCallCenRsltCont(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception {

        return customerCareExtrTargetDAO.updateCallCenRsltCont(customerCareExtrTargetVO);

    }



    /**
     * 고객케어 대상자 삭제
     * @param List<CustomerCareExtrTargetVO> - targCustSeq
     * @return
     */
    @Override
    public int deleteExtrTarget(BaseSaveVO<CustomerCareExtrTargetVO> saveVO) throws Exception {

        int resultCnt = 0;
        for (CustomerCareExtrTargetVO customerCareExtrTargetVO : saveVO.getDeleteList()) {

            if( StringUtils.isEmpty(customerCareExtrTargetVO.getDlrCd()) ){
                // [딜러코드]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
            };

            if( customerCareExtrTargetVO.getTargCustSeq() < 0 ){
                // [대상고객일련번호]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.targCustSeq", null, LocaleContextHolder.getLocale())});
            };

            if( customerCareExtrTargetVO.getSmsSendDt() != null ){
                // [SMS전송일자]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.smsSendDt", null, LocaleContextHolder.getLocale())});
            };

            if( customerCareExtrTargetVO.getCallCenSendDt() != null ){
                // [콜센터 전송일]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callCenSendDt", null, LocaleContextHolder.getLocale())});
            };

            resultCnt =+ deleteExtrTarget(customerCareExtrTargetVO);
        }

        return resultCnt;

    }

    /**
     * 고객케어 대상자 삭제
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    public int deleteExtrTarget(CustomerCareExtrTargetVO saveVO) throws Exception {
        return customerCareExtrTargetDAO.deleteExtrTarget(saveVO);
    }

    /**
     * 고객케어 대상자 전체 삭제
     * @param CustomerCareSearchVO - dlrCd, custCareSeq
     * @return
     */
    @Override
    public int deleteExtrTargetAll(CustomerCareSearchVO searchVO) throws Exception {
        return customerCareExtrTargetDAO.deleteExtrTargetAll(searchVO);
    }


}