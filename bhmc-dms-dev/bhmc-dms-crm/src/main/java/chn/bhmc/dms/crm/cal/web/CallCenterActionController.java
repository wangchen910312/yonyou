package chn.bhmc.dms.crm.cal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterActionHistoryService;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.mcm.service.CampaignResultService;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;

/**
 * 콜센터실행 컨트롤러
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

@RequestMapping("/crm/cal/callCenter")
@Controller
public class CallCenterActionController extends HController {

    /**
     * 콜센터실행 서비스
     */
    @Resource(name="callCenterActionService")
    CallCenterActionService callCenterActionService;

    /**
     * 콜센터실행 히스토리 서비스
     */
    @Resource(name="callCenterActionHistoryService")
    CallCenterActionHistoryService callCenterActionHistoryService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * marketingCampaignService
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 보유차량이력 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * Group Management Service
     */
    @Resource(name = "customerGroupService")
    CustomerGroupService customerGroupService;

    /**
     * MemberShipGradeManagement Service
     */
    @Resource(name = "membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name = "satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name = "surveyQuestionService")
    SurveyQuestionService surveyQuestionService;

    /**
     * 캠페인결과 관리 서비스
     */
    @Resource(name = "campaignResultService")
    CampaignResultService campaignResultService;

    /**
     * 만족도 조사 결과관리
     */
    @Resource(name = "satisFactionResultMgmtService")
    SatisFactionResultMgmtService satisFactionResultMgmtService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name = "systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * Crm 공통 Service
     */
    @Resource(name = "crmCommonService")
    CrmCommonService crmCommonService;

    /***********************************************콜센터실행 시작
     * 콜센터실행 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionMain.do", method = RequestMethod.GET)
    public String selectCallCenterMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("bizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      //컨택업무
        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd));      //만족도 조사 타입
        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));          //마케팅 유형
        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat")));

        boolean hasRole = viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10313", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL);
        model.addAttribute("hasRole", hasRole);

        if (hasRole) {

            //VIEW-D-10647 : 기능 : CRM > OB 관리 > OB 실행
            // ob 사용자 목록
            String permissionName = "SEARCHIND,SEARCHALL";
            String[] permissionNames = permissionName.split(",");
            List<UserVO> assignUserList = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10313", null, null, permissionNames);

            model.addAttribute("assignUserList", assignUserList);

        } else {

            model.addAttribute("userNm", LoginUtil.getUserNm());
            model.addAttribute("userId", LoginUtil.getUserId());
        }

        return "/crm/cal/callCenter/selectCallCenterActionMain";
    }

    @RequestMapping(value = "/selectCallCenterActionPopup.do", method = RequestMethod.GET)
    public String selectCallCenterPopup(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("callcenterMaxCall", LoginUtil.getCallcenterMaxCall());           // 다음콜
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));           // 통화결과
        model.addAttribute("stsfIvstMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd));        //만족도 조사 유형

        // NCAR_DSTIN_CD
        model.addAttribute("ncarDstinCdList",commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        /******************************************************
         *********** 보유차량  그리드 및 폼 코드 **********************/
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        // 보유차량 - 브랜드
        /*********** 보유차량 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         * 고객상세정보 탭 코드 - 시작
         ******************************************************/

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));

        // 그룹,태그 목록
        CustomerGroupSearchVO customerGroupSearchVO = new CustomerGroupSearchVO();
        customerGroupSearchVO.setsGrpTp("001"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custGroups = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custGroups", custGroups);
        customerGroupSearchVO.setsGrpTp("002"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custTags = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custTags", custTags);

        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10649", null, Constants.PERMISSION_READ, null);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);

        /******************************************************
         * 고객상세정보 탭 코드 - 끝
         ******************************************************/


        /******************************************************
         * 캠페인 상세정보 탭 코드 - 시작
         ******************************************************/

        model.addAttribute("hostList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최
        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형
        model.addAttribute("statList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태
        /******************************************************
         * 캠페인 상세정보 탭 코드 - 끝
         ******************************************************/

        return "/crm/cal/callCenter/selectCallCenterActionPopup";
    }

    /**
     * 콜센터실행 화면 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterActions(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** OB배정(콜센터 배정) 종료일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartRegDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndRegDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** OB배정(콜센터 배정) 종료일 날짜 검색 조건 종료 ***********************
         ******************************************/

        // 콜센터실행 - 캠페인 화면 목록
        result.setTotal(callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionService.selectCallCenterActionsByCondition(searchVO));

        }

        return result;

    }

    /**
     * 콜센터실행 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    @RequestMapping(value = "/selectCallCenterActionByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CallCenterActionVO selectCallCenterActionByKey(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        //searchVO.setsBizCd("06");   // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        CallCenterActionVO vo = callCenterActionService.selectCallCenterActionByKey(searchVO);
        return vo;
    }

    /**
     * 콜센터실행 정보를 저장한다.
     * @param CallCenterActionVO - 콜센터실행 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateCallCenterAction.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterAction(/*@Validated(Modify.class)*/@RequestBody CallCenterActionVO callCenterActionVO)throws Exception {

        boolean result;
        int callCnt = 0;

        callCnt = callCenterActionService.updateCallCenterAction(callCenterActionVO);

        if ( callCnt >= 1 ) {
            result = true;
        } else {
            result = false;
        }

        return result;

    }


    /**
     * 콜센터실행 에서 방문 예약 한다.
     * @param CallCenterActionVO - 콜센터실행 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateCallCenterVsitResv.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterVsitResv(/*@Validated(Draft.class) */@RequestBody CallCenterActionVO callCenterActionVO)throws Exception {

        boolean result;
        int callCnt = 0;

        callCnt = callCenterActionService.updateCallCenterVsitResv(callCenterActionVO);

        if ( callCnt >= 1 ) {
            result = true;
        } else {
            result = false;
        }

        return result;

    }


    /**
     * 콜센터실행 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        //{고객번호}을(를) 확인하여 주세요.
        if(StringUtils.isBlank(searchVO.getsCustNo())){
            throw new BizException(
                messageSource.getMessage("global.info.confirmMsgParam",new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())},LocaleContextHolder.getLocale())
            );
        }

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행 탭 - OB이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterHistorys(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 콜센터실행 - 캠페인 화면 목록
        result.setTotal(callCenterActionHistoryService.selectCallCenterActionHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionHistoryService.selectCallCenterActionHistorysByCondition(searchVO));

        }

        return result;

    }

    /**
     * 콜센터실행[고객케어] 탭 - 보유차량 목록 데이터를 조회한다.
     * @param searchVO  - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareHaveCar.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCustomerCareHaveCar(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(vehicleMasterService.selectVehicleCustomerInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인 상세조회
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectMarketingCampaignByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public MarketingCampaignVO selectMarketingCampaignByKey(@RequestBody MarketingCampaignSearchVO searchVO)throws Exception {

        MarketingCampaignVO targetMarketingCampaignVO = new MarketingCampaignVO();
        targetMarketingCampaignVO = marketingCampaignService.selectMarketingCampaignByKey(searchVO);

        return targetMarketingCampaignVO;

    }

    /**
     * 만족도 조사 결과 데이터를 조회한다. - 만족도 조사 설문지 및 결과 조회 [OB실행>상세팝업>만족도조사탭], [캠페인결과관리>업체평가], ]캠페인관리>결과>업체평가 ]
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSatisFactionSurvey01s.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSatisFactionSurvey01s(@RequestBody CallCenterActionSearchVO callCenterActionSearchVO) throws Exception {

        CampaignResultSearchVO searchVO = new CampaignResultSearchVO();
        searchVO.setsSeq(callCenterActionSearchVO.getsSeq());
        searchVO.setsCallSeq(callCenterActionSearchVO.getsCallSeq());
        searchVO.setsStsfIvstRsltSeq(Integer.parseInt(callCenterActionSearchVO.getsRefKeyNm()));
        searchVO.setsBizCd("09");

        Map<String, Object> result = new HashMap<String, Object>();
        result = satisFactionResultMgmtService.selectSurveyAnswerResultByCodition(searchVO);

        return result;

    }

}