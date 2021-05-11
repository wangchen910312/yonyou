package chn.bhmc.dms.crm.cal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchVO.SortDescriptor;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterActionDAO;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterActionHistoryDAO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService;
import chn.bhmc.dms.crm.cso.vo.ContactHistoryVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

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
public class CallCenterActionServiceImpl extends HService implements CallCenterActionService , JxlsSupport{

    /**
     * 콜센터설정 관리 DAO
     */
	@Resource(name="callCenterActionDAO")
	CallCenterActionDAO callCenterActionDAO;

	/**
	 * 콜센터설정 히스토리 DAO
	 */
	@Resource(name="callCenterActionHistoryDAO")
	CallCenterActionHistoryDAO callCenterActionHistoryDAO;

	/**
     * 컨택히스토리 등록 Service
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 고객케어 대상자 목록 Service
     */
    @Resource(name="customerCareExtrTargetService")
    CustomerCareExtrTargetService customerCareExtrTargetService;

    /**
     * 만족도 결과(대상자) 목록  Service
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 마캐팅 캠페인 대상자 목록  Service
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptTraceMgmtService")
    SalesOpptTraceMgmtService salesOpptTraceMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOnDutyMgmtService")
    SalesOnDutyMgmtService salesOnDutyMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 고객정보 관리 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 화면-사용자/직무/부서 매핑 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

	/**
     * 콜센터 목록 파라미터 설정( OB실행, OB배정, 엑셀Export 에서 사용하기 때문에 파라미터 설정부분을 따로 뺌 )
     * @param searchVO
     * @return
     */
    public CallCenterActionSearchVO setCallCenterActionSearchVO(CallCenterActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        // [20170831 이인문 ] 엑셀Export 조회조건때문에 서비스에서 퍼미션 관련 조회조건 설정함.
        String viewId = "";

        if ( "A".equals(searchVO.getsListTp()) ) {
            viewId = "VIEW-D-10295";    // OB배정
        }else if ( "R".equals(searchVO.getsListTp()) ) {
            viewId = "VIEW-D-10313";    // OB실행
            searchVO.setsAssignYn("Y"); // OB실행 목록은 배정 완료된 목록이어야함.
        };

        // 콜 목록은 콜센터 관리자는 전체 조회 가능, sAllView : Y인경우 전체 조회, N인경우 아이디 조회
        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, viewId, Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)) {
            searchVO.setsAllView("Y");
        } else {
            searchVO.setsAllView("N");
            searchVO.setsCallPrsnId(LoginUtil.getUserId());
        }

        return searchVO;

    }

    /**
     * 조회 조건에 해당하는 콜센터실행 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    @Override
    public int selectCallCenterActionsByConditionCnt(CallCenterActionSearchVO searchVO) throws Exception {

        searchVO = setCallCenterActionSearchVO(searchVO);
        return callCenterActionDAO.selectCallCenterActionsByConditionCnt(searchVO);

    }

    /**
     * 조회 조건에 해당하는 콜센터실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @Override
    public List<CallCenterActionVO> selectCallCenterActionsByCondition(CallCenterActionSearchVO searchVO) throws Exception {

        searchVO = setCallCenterActionSearchVO(searchVO);
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

        if( StringUtils.isEmpty(searchVO.getsBizCd()) ){
            // [업무구분]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.bizCd", null, LocaleContextHolder.getLocale())});
        };

        CallCenterActionVO obj = callCenterActionDAO.selectCallCenterActionByKey(searchVO);

        if(obj == null) {
            // 조회된 데이터가 없습니다.
            throw processException("global.info.noSearchDataMsg");
        }


        return  obj;

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

        if( StringUtils.isEmpty(saveVO.getHpNo()) ) {
            // [휴대전화]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
        };

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
        int updateCnt = 0;
        int maxCallCnt = LoginUtil.getCallcenterMaxCall();
        boolean maxCallChk = false;

        if( StringUtils.isEmpty(callCenterActionVO.getCallSeq() ) ){
            // [콜번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callSeq", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(callCenterActionVO.getBizCd() ) ){
            // [업무구분]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.bizCd", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(callCenterActionVO.getRefTableNm() ) ){
            // [출처테이블]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(callCenterActionVO.getRefKeyNm() ) ){
            // [출처키]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.refKeyNm", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(callCenterActionVO.getCustNo()) ) {
            // [고객번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        };
        if( callCenterActionVO.getCallStartDt() == null ) {
            // [통화시작시간]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callStartDt", null, LocaleContextHolder.getLocale())});
        };
        if( callCenterActionVO.getCallEndDt() == null ) {
            // [통화종료시간]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callEndDt", null, LocaleContextHolder.getLocale())});
        };
        if( StringUtils.isEmpty(callCenterActionVO.getHpNo()) ) {
            // [휴대전화]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
        };
        // 최초 max콜 설정이 나중 max콜 설정보다 높았을경우 validation 이 걸릴수 있음. 따라서 service 에서 maxCall validation은 빼자
//        if (  callCenterActionVO.getCallCnt() >  maxCallCnt ) {
//            // maxCall 을 초과하여 다음콜을 등록할 수 없습니다.
//            throw processException("crm.err.maxCallChk");
//        }

        callCenterActionVO.setDlrCd(dlrCd);
        callCenterActionVO.setUpdtUsrId(updtUsrId);
        callCenterActionVO.setRegUsrId(regUsrId);
        callCenterActionVO.setCallCnt(callCenterActionVO.getCallCnt()+1);       // CALL 횟수 + 1

        if (  callCenterActionVO.getCallCnt() == maxCallCnt ) {

            callCenterActionVO.setCallRsltCd("06");     // 맥스콜 지나면 연결안됨.
            callCenterActionVO.setCallProcEndYn("Y");
            callCenterActionVO.setScheCallDt(null);
            maxCallChk = true;

        }

        if(!maxCallChk){

            if ( callCenterActionVO.getCallProcEndYn().equals("Y") ) {

                // [콜센터처리완료여부]을(를) 확인하여 주세요.
                if ( callCenterActionVO.getScheCallDt() != null ) {
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callProcEndYn", null, LocaleContextHolder.getLocale())});
                };

            }

        }

        updateCnt = callCenterActionDAO.updateCallCenterAction(callCenterActionVO);

        // 콜센터 업무 완료 처리시 각 업무에 call_cen_rslt_cont 업데이트 해줘라.
        if ( "Y".equals(callCenterActionVO.getCallProcEndYn()) ){

            if ( "CR_0502T".equals(callCenterActionVO.getRefTableNm()) && "09".equals(callCenterActionVO.getBizCd())) {

                CustomerCareExtrTargetVO customerCareExtrTargetVO = new CustomerCareExtrTargetVO();
                customerCareExtrTargetVO.setUpdtUsrId(userId);
                customerCareExtrTargetVO.setDlrCd(dlrCd);
                customerCareExtrTargetVO.setCallRsltCd(callCenterActionVO.getCallRsltCd());        // 콜결과
                customerCareExtrTargetVO.setTargCustSeq(Integer.parseInt(callCenterActionVO.getRefKeyNm()));

                customerCareExtrTargetService.updateCallCenRsltCont(customerCareExtrTargetVO);

                /**
                 * 내방 예약시
                 *  > 판매기회 번호 확인
                 *      N : 신규 생성
                 *      Y : 방문|면담 제출
                 *              N : 추적 추가
                 *              Y : 내방일 업데이트 ( 조건 확인 )
                 */

            } else if ( "CR_0905T".equals(callCenterActionVO.getRefTableNm()) && "05".equals(callCenterActionVO.getBizCd())) {

                SatisFactionMobileResultVO satisFactionMobileResultVO = new SatisFactionMobileResultVO();
                satisFactionMobileResultVO.setUpdtUsrId(userId);
                satisFactionMobileResultVO.setDlrCd(dlrCd);
                satisFactionMobileResultVO.setCallRsltCd(callCenterActionVO.getCallRsltCd());        // 콜결과
                satisFactionMobileResultVO.setStsfIvstRsltSeq((Integer.parseInt(callCenterActionVO.getRefKeyNm())));
                satisFactionMobileResultService.updateCallCenRsltCont(satisFactionMobileResultVO);

            } else if ( "CR_0710T".equals(callCenterActionVO.getRefTableNm()) && "06".equals(callCenterActionVO.getBizCd())) {

                CampaignActionVO campaignActionVO = new CampaignActionVO();
                campaignActionVO.setUpdtUsrId(userId);
                campaignActionVO.setDlrCd(dlrCd);
                campaignActionVO.setCallRsltCd(callCenterActionVO.getCallRsltCd());        // 콜결과
                campaignActionVO.setTargCustSeq(Integer.parseInt(callCenterActionVO.getRefKeyNm()));
                campaignActionService.updateCallCenRsltCont(campaignActionVO);

            }

        }

        // 콜히스토리 등록시 동시에 저장해서 PK 중복 나는 경우가 있으므로 예외처리 해줘야함
        CallCenterActionSearchVO searchVO = new CallCenterActionSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsCallSeq(callCenterActionVO.getCallSeq());
        searchVO.setsCallCnt(callCenterActionVO.getCallCnt());

        if (callCenterActionHistoryDAO.selectCallCenterActionHistoryByKey(searchVO) != null ) {

            // 변경된 정보가 있습니다. 새로고침후 다시 저장해주세요.
            throw processException("crm.info.changedInfoMsg");

        } else {

            // 콜 히스토리 등록
            if ( updateCnt == 1 ) {

                int validCheckCallSecond = LoginUtil.getValidCheckCallSecond();
                int callDiffSecond = (int) ((int)(callCenterActionVO.getCallEndDt().getTime() - callCenterActionVO.getCallStartDt().getTime())/1000);

                if ( validCheckCallSecond >= callDiffSecond ) {
                    callCenterActionVO.setCallValidYn("N");
                } else {
                    callCenterActionVO.setCallValidYn("Y");
                }

                updateCnt += callCenterActionHistoryDAO.insertCallCenterActionHistory(callCenterActionVO);
            }

            // 수정후 컨택히스토리 등록
            if ( updateCnt == 2 ) {

                String contactStatCd = "OUT";   // IN/OUT
                String contactTp = "01";        // 메시지 타입 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
                String contactBizCd = "10";     // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,'23''admin':08,고객케어:09,콜센터:10)
                String refTableNm = "CR_0606T";
                String refKeyNm = callCenterActionVO.getCallSeq();

                ContactHistoryVO contactHistoryVO = new ContactHistoryVO();
                contactHistoryVO.setDlrCd(dlrCd);
                contactHistoryVO.setCustNo(callCenterActionVO.getCustNo());
                contactHistoryVO.setContactStatCd(contactStatCd);
                contactHistoryVO.setContactTp(contactTp);
                contactHistoryVO.setContactBizCd(contactBizCd);
                contactHistoryVO.setContactCont(callCenterActionVO.getCallCont());  // 접촉내용
                contactHistoryVO.setRefTableNm(refTableNm);
                contactHistoryVO.setRefKeyNm(refKeyNm);
                contactHistoryVO.setRegUsrId(regUsrId);

                contactHistoryService.insertContactHistory(contactHistoryVO);

            }

        }


        return updateCnt;
    }

    /**
     * 콜센터실행 에서 방문 예약 한다.
     * @param CallCenterActionVO
     * @return 예약 수량.
     */
    @Override
    public int updateCallCenterVsitResv(CallCenterActionVO callCenterActionVO) throws Exception {

        String holdTp = "";
        Integer holdDtlSeq = 0;

        if ( "09".equals(callCenterActionVO.getBizCd()) ) {         // 고객케어인경우

            holdTp = "01";

        } else if ( "06".equals(callCenterActionVO.getBizCd()) ) {  // 캠페인

            holdTp = "03";

            CampaignActionSearchVO campaignActionSearchVO = new CampaignActionSearchVO();
            campaignActionSearchVO.setsDlrCd(callCenterActionVO.getDlrCd());
            campaignActionSearchVO.setsTargCustSeq(Integer.parseInt(callCenterActionVO.getRefKeyNm()));

            CampaignActionVO campaignActionVO = campaignActionService.selectActionByKey(campaignActionSearchVO);

            if ( campaignActionVO != null ) {

                SalesOpptHoldTypeMgmtSearchVO searchVO = new SalesOpptHoldTypeMgmtSearchVO();
                searchVO.setsDlrCd(callCenterActionVO.getDlrCd());
                searchVO.setsHoldTp(holdTp);
                searchVO.setsRemark(campaignActionVO.getMakCd());
                searchVO.setsStartDt(campaignActionVO.getStartDt());
                searchVO.setsEndDt(campaignActionVO.getEndDt());

                List<SalesOpptHoldTypeMgmtVO> salesOpptHoldType = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(searchVO);

                if ( salesOpptHoldType.size() > 0 ) {
                    holdDtlSeq = salesOpptHoldType.get(0).getHoldSeq();
                } else {
                    // [리드출처 캠페인] 정보가 없습니다.
                    throw processException("crm.info.noinfoData", new String[]{messageSource.getMessage("crm.lbl.leadSrcCamp", null, LocaleContextHolder.getLocale())});
                }

            } else {
                // [리드출처 캠페인] 정보가 없습니다.
                throw processException("crm.info.noinfoData", new String[]{messageSource.getMessage("crm.lbl.leadSrcCamp", null, LocaleContextHolder.getLocale())});
            }

        };

        int result = 0;
        // 콜 내방 예약 시간이 있는경우 내방 예약 ( 판매기회 -> 방문|면담 으로 등록 )
        if ( callCenterActionVO.getCallVsitResvDt() != null ) {

            // 판매기회관리 등록 확인.
            String salesOpptProcNo = null;
            String custNo = callCenterActionVO.getCustNo();

            SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
            salesOpptProcessMgmtSearchVO.setsCustNo(custNo);
            List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtListVO  = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);

            /**
             * 판매 기회 등록 확인 후
             *  1. 판매기회 등록
             *  2. 유효성 등록
             *  3. 배정
             *  4. 판매기회 단계를 03으로 업데이트
             */

            // 판매기회 등록이 안된경우 판매기회 등록
            if ( salesOpptProcessMgmtListVO.size() == 0 ) {

                String custTp = null;

                if ( StringUtils.isNoneEmpty(custNo) ) {

                    CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
                    searchVO.setsDlrCd(callCenterActionVO.getDlrCd());
                    searchVO.setsCustNo(custNo);
                    CustomerInfoVO customerInfoVO = customerInfoService.selectCustomerInfoByKey(searchVO);

                    if ( customerInfoVO != null ) {
                        custTp = customerInfoVO.getCustTp();
                    }

                }

                // 판매기회 등록.
                SalesOpptProcessMgmtVO salesOpptProcessMgmtSaveVO = new SalesOpptProcessMgmtVO();
                salesOpptProcessMgmtSaveVO.setCustNo(custNo);
                salesOpptProcessMgmtSaveVO.setHpNo(callCenterActionVO.getHpNo());
                salesOpptProcessMgmtSaveVO.setTelNo(callCenterActionVO.getTelNo());
                salesOpptProcessMgmtSaveVO.setBhmcYn("N");
                salesOpptProcessMgmtSaveVO.setCustTp(custTp);                           // TODO 고객 유형(법인|개인) 콜센터에서는 모르는데??
                salesOpptProcessMgmtSaveVO.setHoldTp(holdTp);                           // 리드출처 : 고객케어 (01) 캠페인 : (03) ( 02.22 출처 변경 )
                salesOpptProcessMgmtSaveVO.setHoldDetlTpSeq(holdDtlSeq);                // 리드출처가 캠페인인경우 캠페인 번호
                salesOpptProcessMgmtSaveVO.setInfoTp("02");                             // TODO 리드유형
                salesOpptProcessMgmtSaveVO.setLeadStatCd("02");
                salesOpptProcessMgmtSaveVO.setLocalCarRegNoYn("N");


                salesOpptProcessMgmtService.insertSalesOpptProcessMgmt(salesOpptProcessMgmtSaveVO);
                salesOpptProcNo = salesOpptProcessMgmtSaveVO.getSeq();

                // 주소정보가 있으면 주소 등록.
                if ( StringUtils.isNoneEmpty(callCenterActionVO.getSungNm())
                        && StringUtils.isNoneEmpty(callCenterActionVO.getCityNm())
                        && StringUtils.isNoneEmpty(callCenterActionVO.getDistNm())
                        && StringUtils.isNoneEmpty(callCenterActionVO.getZipCd())
                        && StringUtils.isNoneEmpty(callCenterActionVO.getExtZipCd())
                        && StringUtils.isNoneEmpty(callCenterActionVO.getAddrNm())
                        //&& StringUtils.isNoneEmpty(callCenterActionVO.getAddrDetlCont())
                ) {

                    BaseSaveVO<AddressInfoVO> addressSaveVO = new BaseSaveVO<AddressInfoVO>();
                    addressSaveVO.getInsertList().get(0).setRefTableNm("CR_0606T");
                    addressSaveVO.getInsertList().get(0).setrefKeyNm(salesOpptProcNo);
                    addressSaveVO.getInsertList().get(0).setSungNm(callCenterActionVO.getSungNm());
                    addressSaveVO.getInsertList().get(0).setCityNm(callCenterActionVO.getCityNm());
                    addressSaveVO.getInsertList().get(0).setDistNm(callCenterActionVO.getDistNm());
                    addressSaveVO.getInsertList().get(0).setZipCd(callCenterActionVO.getZipCd());
                    addressSaveVO.getInsertList().get(0).setExtZipCd(callCenterActionVO.getExtZipCd());
                    addressSaveVO.getInsertList().get(0).setAddrNm(callCenterActionVO.getAddrNm());
                    addressSaveVO.getInsertList().get(0).setAddrDetlCont(callCenterActionVO.getAddrDetlCont());
                    addressInfoService.multiAddressInfo(addressSaveVO);

                }

            } else {
                salesOpptProcNo = salesOpptProcessMgmtListVO.get(0).getSeq();
            }

            // 판매기회 번호 존재할경우 판매기회 상태 변경
            if ( StringUtils.isNotEmpty(salesOpptProcNo) ) {

                // 판매기회관리 등록 확인.
                salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
                salesOpptProcessMgmtSearchVO.setsCustNo(custNo);
                List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtVO  = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);

                /**
                *
                * 등록 안되어있으면
                *  1. 판매기회 등록 후
                *  2. 유효성 등록
                *  3. 배정 >
                *  4. 단계를 03으로 업데이트 ( multiSalesOpptProcMgmts )
                *
                * 등록되어있으면
                *  1. 유효성 2번 등록 확인후
                *      > 없으면 등록
                *  2. 배정???
                *  3. 유효성 등롣 되어있으면 바로 3단계 업데이트 ( 날짜 업데이트 , multiSalesOpptProcMgmts )
                *
                */

                // 판매기회 등록 되어있고 유효성 이 02가 아닌경우 등록해준다.
                if ( salesOpptProcessMgmtVO.size() == 1  ) {

                    if ( !"02".equals(salesOpptProcessMgmtVO.get(0).getValidGradeCd()) ) {

                        // 유효성 등록
                        SalesOpptTraceMgmtVO saveVO = new SalesOpptTraceMgmtVO();
                        saveVO.setDlrCd(LoginUtil.getDlrCd());
                        saveVO.setSaleOpptSeq(salesOpptProcNo);                     // TODO 추적 등급 / 내용 어떻게???
                        saveVO.setTraceCont(callCenterActionVO.getCallCont());      // 추적내용 - 콜센터 내용
                        saveVO.setTraceGradeCd("A");                                // 추적등급 코드
                        saveVO.setTraceDt(callCenterActionVO.getCallVsitResvDt());  // 추적일자 - 콜센터 예약방문일자
                        saveVO.setTraceMthCd("03");                                 // 추적방법코드 (OB)
                        saveVO.setValidGradeCd("02");                               // 유효등급코드
                        saveVO.setDelYn("N");
                        saveVO.setLeadStatCd(salesOpptProcessMgmtVO.get(0).getLeadStatCd());

                        salesOpptTraceMgmtService.multiSalesOpptTraceMgmts(saveVO);

                    }

                    // 판매기회 배정 - 당직사용여부 param 을 가지고 담당자 배정을 해준다.
                    SalesOnDutyMgmtSearchVO searchVO = new SalesOnDutyMgmtSearchVO();
                    if (StringUtils.isEmpty(searchVO.getsOndutyYn())){
                        searchVO.setsDlrCd(LoginUtil.getDlrCd());
//                        searchVO.setsOndutyYn(LoginUtil.getOnDutyYn());
                    }

                    // 담당자 당직자에서 자동으로 배정  TODO mnsScId 파람으로
                    String mngScId = callCenterActionVO.getMngScId();

                    // 판매기회 상태 업데이트
                    SalesOpptProcessMgmtSaveVO saveVO = new SalesOpptProcessMgmtSaveVO();
                    salesOpptProcessMgmtVO.get(0).setLeadStatCd("03");                                      // 03 : 방문|면담,
                    salesOpptProcessMgmtVO.get(0).setVsitResvDt(callCenterActionVO.getCallVsitResvDt());    // 콜센터 방문시간
                    salesOpptProcessMgmtVO.get(0).setMngScId(mngScId);                                      // 당직에서 배정된 담당자
                    salesOpptProcessMgmtVO.get(0).setHoldTp(holdTp);                                        // 리드출처 : 고객케어 (01) 캠페인 : (03) ( 02.22 출처 변경 )
                    salesOpptProcessMgmtVO.get(0).setHoldDetlTpSeq(holdDtlSeq);                             // 캠페인인경우 캠페인 번호.
                    saveVO.setSalesOpptProcessMgmtVO(salesOpptProcessMgmtVO.get(0));
                    salesOpptProcessMgmtService.multiSalesOpptProcMgmts(saveVO);

                } else {

                    // TODO 판매기회 번호를 찾는데 실패하였습니다.

                }

            }

            if ( StringUtils.isEmpty(salesOpptProcNo) ) {

                // [내방예약]에 실패하였습니다.
                throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("global.lbl.visitResv", null, LocaleContextHolder.getLocale())});

            } else {

                result = 1;
            }

        }

        return result;

    }


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        // 엑셀 export는 a href 이기 때문에 exception 메시지는 notification 이 아닌 json 새창으로 나옴 앞단에서 처리해야함.
        CallCenterActionSearchVO searchVO = new CallCenterActionSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        // [20170911-이인문] OB 배정, 실행에서 excelExport 할때 grid default sort 랑 excel sort 랑 동일하게 맞춤.
        String field = (String)params.get("field");
        String dir = (String)params.get("dir");
        if ( StringUtils.isNotEmpty(field) && StringUtils.isNotEmpty(dir) ) {
            List<SortDescriptor> sort = new ArrayList<SortDescriptor>();
            SortDescriptor sortValue = new SortDescriptor();
            sortValue.setField(field);
            sortValue.setDir(dir);
            sort.add(sortValue);
            searchVO.setSort(sort);
        }

        if ( !"null".equals((String)params.get("sStartRegDt")) && params.get("sStartRegDt") != null  ) {
            searchVO.setsStartRegDt(DateUtil.convertToDate((String)params.get("sStartRegDt")));
        }
        if ( !"null".equals((String)params.get("sEndRegDt")) && params.get("sEndRegDt") != null ) {
            searchVO.setsEndRegDt(DateUtil.convertToDate((String)params.get("sEndRegDt")));
        }

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startStartCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startStartCal.setTime(searchVO.getsStartRegDt());
                year = startStartCal.get(Calendar.YEAR);
                month = startStartCal.get(Calendar.MONTH);
                day = startStartCal.get(Calendar.DATE);
                startStartCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar startEndCal = Calendar.getInstance();
                startEndCal.setTime(searchVO.getsEndRegDt());
                year = startEndCal.get(Calendar.YEAR);
                month = startEndCal.get(Calendar.MONTH);
                day = startEndCal.get(Calendar.DATE);
                startEndCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        List<CallCenterActionVO> list = selectCallCenterActionsByCondition(searchVO);

        if( list.size() == 0 ){

            // 추출할 대상자가 존재하지 않습니다.
            //throw processException("crm.err.targetEmptyUsr");

        } else {

            context.putVar("items", list);

        }

    }

}