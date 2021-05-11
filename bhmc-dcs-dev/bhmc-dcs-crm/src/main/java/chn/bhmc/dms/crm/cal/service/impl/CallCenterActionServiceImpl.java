package chn.bhmc.dms.crm.cal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterActionDAO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.vo.ContactHistoryVO;

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

@Service("callCenterActionService")
public class CallCenterActionServiceImpl extends HService implements CallCenterActionService {

    /**
     * 콜센터설정 관리 DAO
     */
	@Resource(name="callCenterActionDAO")
	CallCenterActionDAO callCenterActionDAO;

	/**
     * 컨택히스토리 등록 Service
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


	/**
     * 조회 조건에 해당하는 콜센터실행 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    @Override
    public int selectCallCenterActionsByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}


        return callCenterActionDAO.selectCallCenterActionsByConditionCnt(searchVO);

    }

    /**
     * 조회 조건에 해당하는 콜센터실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @Override
    public List<CallCenterActionVO> selectCallCenterActionsByCondition(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return callCenterActionDAO.selectCallCenterActionsByCondition(searchVO);

    }

    /**
     * 콜센터실행 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    @Override
    public CallCenterActionVO selectCallCenterActionByKey(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return callCenterActionDAO.selectCallCenterActionByKey(searchVO);

    }

    /**
     * 콜센터실행 정보 (콜센터 대상자) 를 등록한다.
     * @param CallCenterActionVO
     * @return 등록수량
     */
    public int insertCallCenterAction(CallCenterActionVO saveVO) throws Exception {

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
            // [담당업무구분]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.bizCd", null, LocaleContextHolder.getLocale())});
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

        /*
        if( StringUtils.isEmpty(saveVO.getTelNo()) ) {
            // [전화번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.telNo", null, LocaleContextHolder.getLocale())});
        };
        */

        if( StringUtils.isEmpty(saveVO.getHpNo()) ) {
            // [휴대전화]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
        };

        /*
        if( StringUtils.isEmpty(saveVO.getWechatId()) ) {
            // [Wechat ID]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.wechatId", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getEmailNm()) ) {
            // [이메일]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.emailNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getSungNm()) ) {
            // [성 이름]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.sungNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getCityNm()) ) {
            // [도시명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.cityNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getDistNm()) ) {
            // [지역명]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.distNm", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getZipCd()) ) {
            // [우편번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.zipCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getExtZipCd()) ) {
            // [확장우편번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.extZipCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getAddrNm()) ) {
            // [주소]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.addr", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getAddrDetlCont()) ) {
            // [상세주소]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.detlAddr", null, LocaleContextHolder.getLocale())});
        };
        */

        return callCenterActionDAO.insertCallCenterAction(saveVO);
    }

    /**
     * 콜센터실행 정보를 수정한다.
     * @param CallCenterActionVO
     * @return 수정수량
     */
    @Override
    public int updateCallCenterAction(CallCenterActionVO callCenterActionVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        String regUsrId = userId;
        String updtUsrId = userId;

        callCenterActionVO.setDlrCd(dlrCd);
        callCenterActionVO.setUpdtUsrId(updtUsrId);
        int updateCnt = 0;

        if ( callCenterActionVO.getScheCallDt() != null ) {
            if (  callCenterActionVO.getCallCnt() >=  Integer.parseInt(systemConfigInfoService.selectStrValueByKey("callcenterMaxCall")) ) {
                // maxCall 을 초과하여 다음콜을 등록할 수 없습니다.
                throw processException("crm.err.maxCallChk");
            }
        }

        updateCnt = callCenterActionDAO.updateCallCenterAction(callCenterActionVO);

        // 수정후 컨택히스토리 등록
        if ( updateCnt == 1 ) {

            String contactStatCd = "OUT";   // IN/OUT
            String contactTp = "01";        // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )

            ContactHistoryVO contactHistoryVO = new ContactHistoryVO();
            contactHistoryVO.setDlrCd(dlrCd);
            contactHistoryVO.setCustNo(callCenterActionVO.getCustNo());
            contactHistoryVO.setContactStatCd(contactStatCd);
            contactHistoryVO.setContactTp(contactTp);
            contactHistoryVO.setContactBizCd(callCenterActionVO.getBizCd());    // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08)
            contactHistoryVO.setContactCont(callCenterActionVO.getCallCont());  // 접촉내용
            contactHistoryVO.setRefTableNm(callCenterActionVO.getRefTableNm());
            contactHistoryVO.setRefKeyNm(callCenterActionVO.getRefKeyNm());
            contactHistoryVO.setRegUsrId(regUsrId);

            contactHistoryService.insertContactHistory(contactHistoryVO);

            // 수정후 예정콜일자가 있는경우 인서트
            if ( callCenterActionVO.getScheCallDt() != null ) {

                CallCenterActionVO saveVO = new CallCenterActionVO();
                CallCenterActionSearchVO searchVO = new CallCenterActionSearchVO();

                searchVO.setsDlrCd(dlrCd);
                searchVO.setsCallSeq(callCenterActionVO.getCallSeq());
                searchVO.setsBizCd(callCenterActionVO.getBizCd());

                // 정보가 많아서.. 그냥 기존 콜센터실행 조회후 해당 결과를 인서트 한다
                saveVO = selectCallCenterActionByKey(searchVO);

                if ( saveVO == null ) {
                    // [콜정보]을(를) 확인하여 주세요.
                    throw processException("crm.title.callInfo", new String[]{messageSource.getMessage("global.info.confirmMsgParam", null, LocaleContextHolder.getLocale())});

                } else {

                    int callCnt = callCenterActionVO.getCallCnt();
                    callCnt = callCnt + 1;
                    saveVO.setCallCnt(callCnt);                                     // CALL 횟수
                    saveVO.setCallRsltCd("");                                       // 통화결과코드
                    saveVO.setCallCont("");                                         // 통화내용
                    saveVO.setScheCallDt(callCenterActionVO.getScheCallDt());       // 다음콜시간
                    saveVO.setCallPrsnId(userId);                                   // TODO 콜담당자 누구???? 로그인유저??? 아니면 필수값에서 제외해야 하나???

                    updateCnt =+ insertCallCenterAction(saveVO);

                }

            }

        }

        return updateCnt;
    }

    /**
     * 조회 조건에 해당하는 콜센터실행 [ 전체 - 배정에서 사용 ] 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @Override
    public SearchResult selectCallCenterAssigns(CallCenterActionSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        // 콜센터 전체 목록
        List<CallCenterActionVO> callCenterTotalList = new ArrayList<CallCenterActionVO>();


        int resultCnt;

        if ( searchVO.getsBizCd() == null || searchVO.getsBizCd() == "" ) {

            // 고객케어
            searchVO.setsBizCd("09");
            int customerCareCnt = selectCallCenterActionsByConditionCnt(searchVO);
            if(customerCareCnt > 0){
                List<CallCenterActionVO> customerCareList = selectCallCenterActionsByCondition(searchVO);
                callCenterTotalList.addAll(customerCareList);

            }

            // 캠페인
            searchVO.setsBizCd("06");
            int campaignCnt = selectCallCenterActionsByConditionCnt(searchVO);
            if(campaignCnt > 0){
                List<CallCenterActionVO> campaignList = selectCallCenterActionsByCondition(searchVO);
                callCenterTotalList.addAll(campaignList);
            }

            // 만족도조사
            searchVO.setsBizCd("06");
            int satisFactionCnt = selectCallCenterActionsByConditionCnt(searchVO);
            if(satisFactionCnt > 0){
                List<CallCenterActionVO> satisFaction = selectCallCenterActionsByCondition(searchVO);
                callCenterTotalList.addAll(satisFaction);
            }

            resultCnt = customerCareCnt + campaignCnt + satisFactionCnt;

        } else {

            int totalCnt = selectCallCenterActionsByConditionCnt(searchVO);
            if(totalCnt > 0){
                List<CallCenterActionVO> totalList = selectCallCenterActionsByCondition(searchVO);
                callCenterTotalList.addAll(totalList);
            }

            resultCnt = totalCnt;

        }

        result.setTotal(resultCnt);
        result.setData(callCenterTotalList);

        return result;
    }

}
