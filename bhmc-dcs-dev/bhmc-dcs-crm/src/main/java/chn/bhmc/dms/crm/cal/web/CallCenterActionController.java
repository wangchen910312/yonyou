package chn.bhmc.dms.crm.cal.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

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
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 서비스
     */
    @Resource(name="userService")
    UserService userService;


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
     * 정비이력 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /***********************************************콜센터실행[캠페인] 시작
     * 콜센터실행[캠페인] 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionCampaignMain.do", method = RequestMethod.GET)
    public String selectCallCenterActionCampaignMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("callcenterMaxCall", systemConfigInfoService.selectStrValueByKey("callcenterMaxCall"));           // 다음콜
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));           // 콜결과코드

        /******************************************************
         *********** 보유차량  그리드 및 폼 코드 **********************/
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        // 보유차량 - 브랜드
        /*********** 보유차량 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 정비이력 그리드 및 폼 코드 **********************/
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));      // RO유형
        /*********** 정비이력 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 판매기회 그리드 및 폼 코드 **********************/
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
        /*********** 판매기회 그리드 및 폼 코드 **********************
        ******************************************************/

        /******************************************************
         *********** 메시지이력 탭 그리드 정보 코드*******************/
        // 컨탭유형 : ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat ) // 활동형태랑 동일 (CRM321 : 활동형태 )
        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
        model.addAttribute("contactBizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
        /*********** 메시지이력 탭 그리드 정보 코드*******************
         ******************************************************/

        /******************************************************
        * 고객상세정보 탭 코드 - 시작
        ******************************************************/
        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        /******************************************************
         * 고객상세정보 탭 코드 - 끝
         ******************************************************/

        return "/crm/cal/callCenter/selectCallCenterActionCampaignMain";
    }

    /**
     * 콜센터실행[캠페인] 화면 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionCampaigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterActionCampaigns(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 본인 콜 목록만 보임 TODO 추후 권한설정할때 수정
        //searchVO.setsCallPrsnId(LoginUtil.getUserId());
        searchVO.setsBizCd("06");       // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        // 콜센터실행 - 캠페인 화면 목록
        result.setTotal(callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionService.selectCallCenterActionsByCondition(searchVO));

        }

        return result;

    }

    /**
     * 콜센터실행[캠페인] 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    @RequestMapping(value = "/selectCallCenterActionCampaignByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CallCenterActionVO selectCallCenterActionCampaignByKey(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        searchVO.setsBizCd("06");   // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        CallCenterActionVO vo = callCenterActionService.selectCallCenterActionByKey(searchVO);
        return vo;
    }


    /**
     * 콜센터실행[캠페인] 정보를 입력한다.
     * @param CallCenterActionVO - 콜센터실행 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateCallCenterActionCampaign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterActionCampaign(/*@Validated(Draft.class) */@RequestBody CallCenterActionVO callCenterActionVO)throws Exception {

        boolean result;
        int callCnt = 0;

        callCenterActionVO.setBizCd("06");  // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        callCnt = callCenterActionService.updateCallCenterAction(callCenterActionVO);

        if ( callCnt >= 1 ) {
            result = true;
        } else {
            result = false;
        }

        return result;

    }

    /**
     * 콜센터실행[캠페인] 탭 - 보유차량 목록 데이터를 조회한다.
     * @param searchVO  - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCampaignHaveCar.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCampaignHaveCar(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(vehicleMasterService.selectVehicleCustomerInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[캠페인] 탭 - RO접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCampaignRepairOrders.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCampaignRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[캠페인] 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCampaignMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 검색조건 : dlr, ref_table_nm, key
        searchVO.setsRefTableNm("CR_0701T");
        searchVO.setsContactBizCd("06");         // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[캠페인] 탭 - 판매기회 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCampaignSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }
    /***********************************************콜센터실행[캠페인] 종료***********************/

    /***********************************************콜센터실행[고객케어] 시작
     * 콜센터실행[고객케어] 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionCustomerCareMain.do", method = RequestMethod.GET)
    public String selectCallCenterActionCustomerCareMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("callcenterMaxCall", systemConfigInfoService.selectStrValueByKey("callcenterMaxCall"));           // 다음콜
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));           // 콜결과코드

        /******************************************************
         *********** 보유차량  그리드 및 폼 코드 **********************/
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        // 보유차량 - 브랜드
        /*********** 보유차량 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 정비이력 그리드 및 폼 코드 **********************/
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));      // RO유형
        /*********** 정비이력 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 판매기회 그리드 및 폼 코드 **********************/
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
        /*********** 판매기회 그리드 및 폼 코드 **********************
        ******************************************************/

        /******************************************************
         *********** 메시지이력 탭 그리드 정보 코드*******************/
        // 컨탭유형 : ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat ) // 활동형태랑 동일 (CRM321 : 활동형태 )
        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
        model.addAttribute("contactBizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
        /*********** 메시지이력 탭 그리드 정보 코드*******************
         ******************************************************/

        /******************************************************
        * 고객상세정보 탭 코드 - 시작
        ******************************************************/
        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        /******************************************************
         * 고객상세정보 탭 코드 - 끝
         ******************************************************/

        return "/crm/cal/callCenter/selectCallCenterActionCustomerCareMain";
    }

    /**
     * 콜센터실행[고객케어] 화면 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionCustomerCares.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterActionCustomerCares(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 본인 콜 목록만 보임 TODO 추후 권한설정할때 수정
        //searchVO.setsCallPrsnId(LoginUtil.getUserId());
        searchVO.setsBizCd("09");       // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        // 콜센터실행 - 고객케어 화면 목록
        result.setTotal(callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionService.selectCallCenterActionsByCondition(searchVO));

        }

        return result;

    }

    /**
     * 콜센터실행[고객케어] 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    @RequestMapping(value = "/selectCallCenterActionCustomerCareByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CallCenterActionVO selectCallCenterActionCustomerCareByKey(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        searchVO.setsBizCd("09");   // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        CallCenterActionVO vo = callCenterActionService.selectCallCenterActionByKey(searchVO);
        return vo;
    }


    /**
     * 콜센터실행[고객케어] 정보를 입력한다.
     * @param CallCenterActionVO - 콜센터실행 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateCallCenterActionCustomerCare.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterActionCustomerCare(/*@Validated(Draft.class) */@RequestBody CallCenterActionVO callCenterActionVO)throws Exception {

        boolean result;
        int callCnt = 0;

        callCenterActionVO.setBizCd("09");  // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        callCnt = callCenterActionService.updateCallCenterAction(callCenterActionVO);

        if ( callCnt >= 1 ) {
            result = true;
        } else {
            result = false;
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
     * 콜센터실행[고객케어] 탭 - RO접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareRepairOrders.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCustomerCareRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[고객케어] 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerCareMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 검색조건 : dlr, ref_table_nm, key
        searchVO.setsRefTableNm("CR_0501T");
        searchVO.setsContactBizCd("09");         // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[고객케어] 탭 - 판매기회 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerCareSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }
    /***********************************************콜센터실행[고객케어] 종료***********************/


    /***********************************************콜센터실행[만족도조사] 시작
     * 콜센터실행[만족도조사] 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionSatisFactionMain.do", method = RequestMethod.GET)
    public String selectCallCenterActionSatisFactionMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("callcenterMaxCall", systemConfigInfoService.selectStrValueByKey("callcenterMaxCall"));           // 다음콜
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));           // 콜결과코드
        model.addAttribute("stsfIvstMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd));        //만족도 조사 유형

        /******************************************************
         *********** 보유차량  그리드 및 폼 코드 **********************/
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        // 보유차량 - 브랜드
        /*********** 보유차량 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 정비이력 그리드 및 폼 코드 **********************/
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));      // RO유형
        /*********** 정비이력 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 판매기회 그리드 및 폼 코드 **********************/
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
        /*********** 판매기회 그리드 및 폼 코드 **********************
        ******************************************************/

        /******************************************************
         *********** 메시지이력 탭 그리드 정보 코드*******************/
        // 컨탭유형 : ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat ) // 활동형태랑 동일 (CRM321 : 활동형태 )
        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
        model.addAttribute("contactBizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
        /*********** 메시지이력 탭 그리드 정보 코드*******************
         ******************************************************/

        /******************************************************
        * 고객상세정보 탭 코드 - 시작
        ******************************************************/
        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        /******************************************************
         * 고객상세정보 탭 코드 - 끝
         ******************************************************/

        return "/crm/cal/callCenter/selectCallCenterActionSatisFactionMain";
    }


    /**
     * 콜센터실행[만족도조사] 화면 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCenterActionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterActionSatisFactions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterActionSatisFactions(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 만족도조사 종료일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartStftDt() != null || searchVO.getsEndStftDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartStftDt() == searchVO.getsEndStftDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartStftDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndStftDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndStftDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndStftDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndStftDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 만족도조사 종료일 날짜 검색 조건 종료 ***********************
         ******************************************/

        // 본인 콜 목록만 보임 TODO 추후 권한설정할때 수정
        //searchVO.setsCallPrsnId(LoginUtil.getUserId());
        searchVO.setsBizCd("05");       // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        // 콜센터실행 - 만족도 조사 화면 목록
        result.setTotal(callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionService.selectCallCenterActionsByCondition(searchVO));

        }

        return result;

    }

    /**
     * 콜센터실행[만족도조사] 상세 정보를 조회한다.
     * @param CallCenterActionSearchVO - 콜번호
     * @return 콜센터실행 정보
     */
    @RequestMapping(value = "/selectCallCenterActionSatisFactionByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CallCenterActionVO selectCallCenterActionSatisFactionByKey(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

        searchVO.setsBizCd("05");   // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        CallCenterActionVO vo = callCenterActionService.selectCallCenterActionByKey(searchVO);
        return vo;
    }


    /**
     * 콜센터실행[만족도조사] 정보를 입력한다.
     * @param CallCenterActionVO - 콜센터실행 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateCallCenterActionSatisFaction.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterActionSatisFaction(/*@Validated(Draft.class) */@RequestBody CallCenterActionVO callCenterActionVO)throws Exception {

        boolean result;
        int callCnt = 0;

        callCenterActionVO.setBizCd("05");  // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)

        callCnt = callCenterActionService.updateCallCenterAction(callCenterActionVO);

        if ( callCnt >= 1 ) {
            result = true;
        } else {
            result = false;
        }

        return result;

    }


    /**
     * 콜센터실행[만족도조사] 탭 - 보유차량 목록 데이터를 조회한다.
     * @param searchVO  - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSatisFactionHaveCar.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectSatisFactionHaveCar(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(vehicleMasterService.selectVehicleCustomerInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[만족도조사] 탭 - RO접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSatisFactionRepairOrders.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectSatisFactionRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[만족도조사] 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSatisFactionMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 검색조건 : dlr, ref_table_nm, key
        searchVO.setsRefTableNm("CR_0901T");
        searchVO.setsContactBizCd("05");         // 업무구분 CRM361 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,내방:08,09:고객케어)
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 콜센터실행[만족도조사] 탭 - 판매기회 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSatisFactionSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }
    /***********************************************콜센터실행[만족도조사] 종료***********************/

}