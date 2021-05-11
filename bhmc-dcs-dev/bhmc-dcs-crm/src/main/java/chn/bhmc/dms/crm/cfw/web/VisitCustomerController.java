package chn.bhmc.dms.crm.cfw.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cfw.service.VisitCustomerService;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSaveVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSearchVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 내방 예약 컨트롤러
 *
 * @author in moon lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cfw/visitCustomer")
@Controller
public class VisitCustomerController extends HController {
    /**
     * 내방 예약 서비스
     */
    @Resource(name="visitCustomerService")
    VisitCustomerService visitCustomerService;

    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;


    /**
     * Customer Information Management Service
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시승 관리 서비스
     */
    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;


    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 마케팅 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 판매기회 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;


    /**
     * 내방 예약 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerMain.do", method = RequestMethod.GET)
    public String selectVisitCustomerMain(Model model
                                            //,@RequestParam(value="custNo", defaultValue="") String custNo
                                            ,@RequestParam(value="leadNo", defaultValue="") String leadNo
                                            ) throws Exception {

        if( StringUtils.isNotEmpty(leadNo) ){

            String custNo = null;

            LeadInfoSearchVO searchVO = new LeadInfoSearchVO();

            if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

            searchVO.setsLeadNo(leadNo);

            List<LeadInfoVO> leadInfo = leadInfoService.selectLeadInfoByCondition(searchVO);

            if(leadInfo.size() == 1 ){
                custNo = leadInfo.get(0).getCustNo();

                // 고객 정보 검색
                CustomerInfoVO customerInfoVO = new CustomerInfoVO();
                CustomerInfoSearchVO custSearchVO = new CustomerInfoSearchVO();
                custSearchVO.setsCustNo(custNo);

                /*
                 * dlrCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(custSearchVO.getsDlrCd())){custSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
                customerInfoVO.setCustInfoDS(customerInfoService.selectCustomerInfoByCondition(custSearchVO));

                model.addAttribute("customerInfoVO", customerInfoVO);
                model.addAttribute("saleOpptSrcCd", "02");      // 내방에서 들어오면 판매기회출처 : 02 로 SET

                model.addAttribute("leadNo", leadNo);

            }

        }

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("vsitSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM202", null, langCd));           // 내방출처


        return "/crm/cfw/visitCustomer/selectVisitCustomerMain";
    }

    /**
     * 내방 예약 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVisitCustomers(@RequestBody VisitCustomerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 스케줄러에서.. 당일 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = startCal.get(Calendar.DATE);

        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정

        startCal.set(year, month, day+1, 00, 00, 00);
        searchVO.setsEndDt(startCal.getTime());               // 종료일 설정( 시작일 + 1일 )
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        result.setTotal(visitCustomerService.selectVisitCustomersByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<VisitCustomerVO> VisitCustomersByCondition = visitCustomerService.selectVisitCustomersByCondition(searchVO);

            /*
            for (VisitCustomerVO visitCustomerVO : VisitCustomersByCondition) {

                // 고객명은 로그인한 SC 고객일경우에만 보인다.
                if(!LoginUtil.getUserId().equals(visitCustomerVO.getScId())){
                    visitCustomerVO.setCustNm("***");
                }
            }
            */

            result.setData(VisitCustomersByCondition);
        }

        return result;

    }

    /**
     * 내방 예약 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerPopup.do", method = RequestMethod.GET)
    public String selectVisitCustomerPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> vsitSrcDetlContList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);

        model.addAttribute("csltTmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM201", null, langCd));    // 상담시간
        model.addAttribute("vsitSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM202", null, langCd)); // 내방출처
        model.addAttribute("vsitSrcDetlContList", vsitSrcDetlContList); // 내방출처상세
        model.addAttribute("vsitStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM207", null, langCd)); // 내방상태

        return "/crm/cfw/visitCustomer/selectVisitCustomerPopup";
    }


    /**
     * 내방 예약 정보를 저장 한다.
     * @param visitCustomerVO - 내방 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiVisitCustomers.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertVisitCustomers(@Validated(Draft.class) @RequestBody VisitCustomerVO visitCustomerVO)throws Exception {

        /*
        visitCustomerVO.setRegUsrId(LoginUtil.getUserId());
        visitCustomerVO.setUpdtUsrId(LoginUtil.getUserId());


        if(StringUtils.isNotEmpty(visitCustomerVO.getVsitNo())){
            visitCustomerService.updateVisitCustomer(visitCustomerVO);
        } else {
            visitCustomerService.insertVisitCustomer(visitCustomerVO);
        }
        return true;
        */

        // 내방관리에서 등록후 내방번호를 return;
        String vsitNo;

        vsitNo = visitCustomerService.multiVisitCustomer(visitCustomerVO);

        return vsitNo;



    }






    /**
     * 전시장유동량 결과입력 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerResultMain.do", method = RequestMethod.GET)
    public String selectVisitCustomerResultMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> vsitSrcDetlContList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);

        // 내방 공통 코드
        model.addAttribute("vsitSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM202", null, langCd)); // 내방출처
        model.addAttribute("vsitSrcDetlContList", vsitSrcDetlContList); // 내방출처상세
        model.addAttribute("vsitStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM207", null, langCd)); // 내방상태
        model.addAttribute("vsitGoalCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM203", null, langCd)); // 내방목적
        model.addAttribute("compareBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd)); // 비교타사브랜드
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd)); // 고객유형 ( 보유 : 01 / 잠재 : 02 )
        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);


        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/crm/cfw/visitCustomer/selectVisitCustomerResultMain";

    }

    /**
     * 전시장유동량 결과입력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVisitCustomerResults(@RequestBody VisitCustomerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 내방일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartVsitDt() != null || searchVO.getsEndVsitDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartVsitDt() == searchVO.getsEndVsitDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartVsitDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndVsitDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndVsitDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndVsitDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndVsitDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 내방일 날짜 검색 조건 종료 ***********************
         ******************************************/

        /******************************************
         *** 등록일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startRegCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startRegCal.setTime(searchVO.getsStartRegDt());
                year = startRegCal.get(Calendar.YEAR);
                month = startRegCal.get(Calendar.MONTH);
                day = startRegCal.get(Calendar.DATE);
                startRegCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startRegCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endRegCal = Calendar.getInstance();
                endRegCal.setTime(searchVO.getsEndRegDt());
                year = endRegCal.get(Calendar.YEAR);
                month = endRegCal.get(Calendar.MONTH);
                day = endRegCal.get(Calendar.DATE);
                endRegCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endRegCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 등록일 날짜 검색 조건 시작 ***********************
         ******************************************/

        /**
         * 목록조건
         *  1. 상태가 내방인것
         *  2. 판매고문이 있는것. ( TODO 추후 판매 고문 조건 달기 )
         */
        searchVO.setsVsitStatCd("03");
        searchVO.setsVsitListTp("R");

        result.setTotal(visitCustomerService.selectVisitCustomersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(visitCustomerService.selectVisitCustomersByCondition(searchVO));

        }

        return result;

    }





    /**
     * 내방 예약 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerMgmtHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVisitCustomerMgmtHistorys(@RequestBody VisitCustomerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 내방 예약 이력 목록
        result.setTotal(visitCustomerService.selectVisitCustomersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(visitCustomerService.selectVisitCustomersByCondition(searchVO));

        }

        return result;

    }

    /**
     * TODO 20160517 전시장유동량 결과입력 추가하면사 삭제
     * 시승 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmtHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveMgmtHistorys(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 시승 이력 목록
        result.setTotal(testDriveMgmtService.selectTestDriveResvsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveMgmtService.selectTestDriveResvsByCondition(searchVO));
        }

        return result;

    }


    /**
     * TODO 20160517 전시장유동량 결과입력 추가하면사 삭제
     * 리드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLeadHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeadHistorys(@RequestBody LeadInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 리드 정보를 조회 한다.
        result.setTotal(leadInfoService.selectLeadInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(leadInfoService.selectLeadInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * TODO 20160517 전시장유동량 결과입력 추가하면사 삭제
     * 판매기회 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptMgmtHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptMgmtHistorys(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 판매기회 이력 목록
        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }



    /**
     * 전시장 유동량 관리 결과 정보를 저장 한다.
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    @RequestMapping(value = "/multiVisitCustomerResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiVisitCustomerResultMgmt(@Validated(Modify.class) @RequestBody VisitCustomerSaveVO saveVO)throws Exception {

        // 내방관리에서 등록후 내방번호를 return;
        String vsitNo;

        vsitNo = visitCustomerService.multiVisitCustomerMgmt(saveVO);

        return vsitNo;
    }

    /**
     * 전시장 유동량 관리 정보를 저장 한다.
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    @RequestMapping(value = "/multiVisitCustomerMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiVisitCustomerMgmt(/*@Validated(Modify.class)*/ @RequestBody VisitCustomerSaveVO saveVO)throws Exception {

        // 내방관리에서 등록후 내방번호를 return;
        String vsitNo;

        vsitNo = visitCustomerService.multiVisitCustomerMgmt(saveVO);

        return vsitNo;
    }


    /**
     * 내방 예약 상세 정보를 조회한다.
     * @param VisitCustomerSearchVO - 내방 예약 번호
     * @return 내방 예약 정보
     */
    @RequestMapping(value = "/selectVisitCustomerMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public VisitCustomerVO selectVisitCustomerMgmtByKey(@RequestBody VisitCustomerSearchVO searchVO) throws Exception {
        VisitCustomerVO vo = visitCustomerService.selectVisitCustomerMgmtByKey(searchVO);
        return vo;
    }



    /**
     * 전시장유동량 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerMgmtMain.do", method = RequestMethod.GET)
    public String selectVisitCustomerMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd HH:mm");
        model.addAttribute("sysDate", sysDate);

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> vsitSrcDetlContList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);

        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd)); // 고객유형 ( 보유 : 01 / 잠재 : 02 )

        // 내방 공통 코드
        model.addAttribute("vsitSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM202", null, langCd)); // 내방출처
        model.addAttribute("vsitSrcDetlContList", vsitSrcDetlContList); // 내방출처상세
        model.addAttribute("vsitStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM207", null, langCd)); // 내방상태
        model.addAttribute("vsitGoalCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM203", null, langCd)); // 내방목적

        // 판매기회단계 공통코드
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계

        // 판매고문
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);

        return "/crm/cfw/visitCustomer/selectVisitCustomerMgmtMain";
    }

    /**
     * 전시장유동량 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVisitCustomerMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVisitCustomerMgmts(@RequestBody VisitCustomerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 내방일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartVsitDt() != null || searchVO.getsEndVsitDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartVsitDt() == searchVO.getsEndVsitDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartVsitDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndVsitDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndVsitDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndVsitDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndVsitDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 내방일 날짜 검색 조건 종료 ***********************
         ******************************************/

        /******************************************
         *** 등록일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startRegCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startRegCal.setTime(searchVO.getsStartRegDt());
                year = startRegCal.get(Calendar.YEAR);
                month = startRegCal.get(Calendar.MONTH);
                day = startRegCal.get(Calendar.DATE);
                startRegCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startRegCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endRegCal = Calendar.getInstance();
                endRegCal.setTime(searchVO.getsEndRegDt());
                year = endRegCal.get(Calendar.YEAR);
                month = endRegCal.get(Calendar.MONTH);
                day = endRegCal.get(Calendar.DATE);
                endRegCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endRegCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 등록일 날짜 검색 조건 시작 ***********************
         ******************************************/

        // 정렬 : 예약 했는데 아직 안온사람.
        result.setTotal(visitCustomerService.selectVisitCustomersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(visitCustomerService.selectVisitCustomersByCondition(searchVO));

        }

        return result;

    }

    /**
     * 내방 -> 판매기회 이동시 고객 자동등록 프로세스.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/customerInfoReg.do", method = RequestMethod.POST)
    @ResponseBody
    public String customerInfoReg(@RequestParam(value="vsitNo", defaultValue="") String vsitNo)throws Exception {

        return visitCustomerService.customerInfoReg(vsitNo);

    }

}