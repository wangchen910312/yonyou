package chn.bhmc.dms.crm.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterActionHistoryService;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterActionHistoryDAO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;

/**
 * 콜센터실행 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.17         in moon lee            최초 생성
 * </pre>
 */

@Service("callCenterActionHistoryService")
public class CallCenterActionServiceHistoryImpl extends HService implements CallCenterActionHistoryService {

	/**
	 * 콜센터설정 히스토리 DAO
	 */
	@Resource(name="callCenterActionHistoryDAO")
	CallCenterActionHistoryDAO callCenterActionHistoryDAO;

    /**
     * 콜센터실행 히스토리 를 등록한다.
     * @param CallCenterActionVO
     * @return 등록수량
     */
    public int insertCallCenterActionHistory(CallCenterActionVO saveVO) throws Exception {

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getCallTp() ) ){
            // [콜유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callTp", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getRefTableNm() ) ){
            // [출처테이블]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getRefKeyNm() ) ){
            // [출처키]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refKeyNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getBizCd() ) ){
            // [업무구분]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.bizCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getCallPrsnId() ) ){
            // [콜담당자]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callPrsnId", null, LocaleContextHolder.getLocale())});
        };

        if( saveVO.getExtrDgreCnt() == 0 ){
            // [추출차수]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getCustNo()) ) {
            // [고객번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getTelNo()) ) {
            // [전화번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.telNo", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getHpNo()) ) {
            // [휴대전화]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
        };

        return callCenterActionHistoryDAO.insertCallCenterActionHistory(saveVO);
    }


    /**
     * 조회 조건에 해당하는 콜센터실행 히스토리 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    @Override
    public int selectCallCenterActionHistorysByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}


        return callCenterActionHistoryDAO.selectCallCenterActionHistorysByConditionCnt(searchVO);

    }

    /**
     * 조회 조건에 해당하는 콜센터실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @Override
    public List<CallCenterActionVO> selectCallCenterActionHistorysByCondition(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return callCenterActionHistoryDAO.selectCallCenterActionHistorysByCondition(searchVO);

    }



}
