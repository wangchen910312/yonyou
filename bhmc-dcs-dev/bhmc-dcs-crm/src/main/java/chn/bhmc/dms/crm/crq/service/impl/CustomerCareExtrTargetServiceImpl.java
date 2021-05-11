package chn.bhmc.dms.crm.crq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.service.dao.CustomerCareExtrTargetDAO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
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
     * 고객케어 대상자 목록 - 콜센터 전송.  ( 1. 고객케어 대상자 추출시 콜센터 전송 / 2. 배치 스케줄러에서 자동으로 대상자 추출 또는 콜센터 전송 )
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    @Override
    public boolean insertExtrTargetTrsfCallCenter(CustomerCareExtrTargetVO saveVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String custExtrTermNo = saveVO.getCustExtrTermNo();
        String refKeyNm = String.valueOf(saveVO.getCustCareSeq());
        int extrDgreCnt = saveVO.getExtrDgreCnt();
        String bizCd = "09";
        String userId = LoginUtil.getUserId();

        if( StringUtils.isEmpty(saveVO.getCustExtrTermNo()) ){
            // [고객추출조건]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermNo", null, LocaleContextHolder.getLocale())});
        };

        if( saveVO.getCustCareSeq() <= 0  ){
            // [고객케어일련번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        };

        if( saveVO.getExtrDgreCnt() < 0 ){
            // [추출차수]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        };

        CampaignActionVO campaignActionVO = new CampaignActionVO();

        campaignActionVO.setDlrCd(dlrCd);                   // 딜러코드
        campaignActionVO.setCustExtrTermNo(custExtrTermNo); // 고객추출조건번호
        campaignActionVO.setRefKeyNm(refKeyNm);             // 고객케어 일련번호
        campaignActionVO.setExtrDgreCnt(extrDgreCnt);       // 추출차수
        campaignActionVO.setBizCd(bizCd);                   // 업무코드
        campaignActionVO.setRegUsrId(userId);               // 등록자
        campaignActionVO.setUpdtUsrId(userId);              // 수정자

        // 콜센터 전송 프로시저 호출
        CampaignActionVO  result  = campaignActionService.selectCallCenterSends(campaignActionVO);

        boolean sendResult = false;


        // TODO 추출완료 - 추출된 대상자가 없는경우????
        if ( result != null ) {

            if ( result.getResult().equals("00") ) {
                sendResult = true;

                // 콜센터 전송 완료후 콜센터 전송일 업데이트 ( 프로시저에서 처리해줌. )
                //customerCareExtrTargetDAO.updateCallCenSendDt(saveVO);

            } else {
                sendResult = false;
            }

        } else {

            sendResult = false;
        }

        return sendResult;
    }

    /**
     * 고객케어 대상자 삭제
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    @Override
    public boolean deleteExtrTarget(CustomerCareExtrTargetVO saveVO) throws Exception {

        boolean delResult = false;
        int delCnt = customerCareExtrTargetDAO.deleteExtrTarget(saveVO);

        if ( delCnt > 0 ) {
            delResult = true;
        }
        return delResult;
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

        CustomerCareExtrTargetSearchVO searchVO = new CustomerCareExtrTargetSearchVO();

        // TODO 그리드 선택된 리스트 조회
        if( Integer.parseInt(params.get("sCustCareSeq").toString()) < 1  ){
            // [고객케어일련번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        };


        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");


        List<CustomerCareExtrTargetVO> list = selectCustomerCareExtrTargetsByCondition(searchVO);
        context.putVar("items", list);

    }

}
