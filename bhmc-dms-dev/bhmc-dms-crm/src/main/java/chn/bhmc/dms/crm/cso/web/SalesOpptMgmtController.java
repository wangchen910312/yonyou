package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 판매기회 관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/salesOpptMgmt")
@Controller
public class SalesOpptMgmtController extends HController {

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

    /**
     * 영업 스케줄 관리 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * marketingCampaignService
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 리드정보 서비스
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * customerInfoOutBoundService
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 판매기회 관리 메인 화면을 출력한다. ( Old )
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptMgmtMainOld.do", method = RequestMethod.GET)
//    public String selectSalesOpptMgmtMainOld(Model model) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        model.addAttribute("sysDate", sysDate);
//        model.addAttribute("scId", LoginUtil.getUserId());
//
//        List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//        model.addAttribute("users", users);
//        //model.addAttribute("scIdList", scIdList);
//
//
//        // 차종
//        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//        carInfoSearchVO.setUseYn("Y");                       // 사용여부
//        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
//        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
//
//        model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM220", null, langCd));         // 실패유형
//        model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM221", null, langCd));       // 실패1급원인
//        model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM222", null, langCd));       // 실패2급원인
//        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));       // 등록차량 브랜드
//
//        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
//        model.addAttribute("activeContCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));      // 활동 내용
//
//        return "/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMainOld";
//    }

    /**
     * 판매기회 관리 메인 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptMgmtMain.do", method = RequestMethod.GET)
//    public String selectSalesOpptMgmtMain(Model model
//            , @RequestParam(value="leadNo", defaultValue="") String leadNo
//            , @RequestParam(value="vsitNo", defaultValue="") String vsitNo
//            , @RequestParam(value="custNo", defaultValue="") String custNo
//            ) throws Exception {
//
//
//        /*********************************************************************
//         *
//         * 수정전 : 리드 -> 내방 -> 판매기회
//         * 수정후
//         *  리드 -> 판매기회
//         *  내방 -> 판매기회
//         *
//         *  기존에는 키값을 받아서 상세조회 -> 고객번호를 가지고 고객조회 했는데..... 로직이 변경됨에 따라서 그냥 고객번호 파라미터로 받음.
//         *
//         *
//         *********** 내방고객 - 판매기회 연결 ( 고객정보만.. ) **********************
//         *  - 해당 번호로 고객정보를 가져와서 고객정보를 set 해준다.
//         *  - 리드번호 있으면 리드번호 저장
//         **********************************************************************/
//
//        //String custNo = "";
//
//        // 리드 번호 받아서 리드 상세조회 -> 고객번호 가지고 고객조회
//        // 내방번호는 고객번호가 없는경우도 있으니 내방번호 + 고객번호 두개 받아서 내방조회 -> 고객번호로 조회 -> 리드번호도 조회
//        // 그냥 조회 하지 말고 키값 받아서 설정할까???
//
//        // 리드에서 판매기회 등록
//        if( StringUtils.isNotEmpty(leadNo) || StringUtils.isNotEmpty(vsitNo) ){
//
//            if( StringUtils.isNotEmpty(leadNo) ){
//
//                LeadInfoSearchVO searchVO = new LeadInfoSearchVO();
//
//                if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//                //if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}
//
//                searchVO.setsLeadNo(leadNo);
//
//                List<LeadInfoVO> leadInfo = leadInfoService.selectLeadInfoByCondition(searchVO);
//
//                if(leadInfo.size() == 1){
//                    custNo = leadInfo.get(0).getCustNo();
//                }
//
//                model.addAttribute("leadNo", leadNo);
//
//            } else if( StringUtils.isNotEmpty(vsitNo) ){
//
//                VisitCustomerSearchVO searchVO = new VisitCustomerSearchVO();
//
//                if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//                if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}
//
//                searchVO.setsVsitNo(vsitNo);
//
//                VisitCustomerVO visitCustomerVO = new VisitCustomerVO();
//                visitCustomerVO = visitCustomerService.selectVisitCustomerMgmtByKey(searchVO);
//
//                // 내방번호 있고.. 고객번호 없는경우는 -> 고객 자동 등록.
//                if(visitCustomerVO != null ){
//
//                    /*
//                    if ( StringUtils.isNotEmpty(visitCustomerVO.getCustNo()) ){
//                        custNo = visitCustomerVO.getCustNo();
//                    }
//                    */
//                    model.addAttribute("leadNo", visitCustomerVO.getLeadNo());
//
//                }
//
//                model.addAttribute("vsitNo", vsitNo);
//                model.addAttribute("saleOpptSrcCd", "02");      // 내방에서 들어오면 판매기회출처 : 02 로 SET
//
//            }
//
//            if( StringUtils.isNotEmpty(custNo) ){
//
//                // 고객 정보 검색
//                CustomerInfoVO customerInfoVO = new CustomerInfoVO();
//                CustomerInfoSearchVO custSearchVO = new CustomerInfoSearchVO();
//                custSearchVO.setsCustNo(custNo);
//
//                 //* dlrCd 체크해서 기본 셋팅 시작
//
//                if (StringUtils.isEmpty(custSearchVO.getsDlrCd())){custSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
//                customerInfoVO.setCustInfoDS(customerInfoOutBoundService.selectCustomerInfoByCondition(custSearchVO));
//                model.addAttribute("customerInfoVO", customerInfoVO);
//
//
//            }
//
//        }
//
//        /*********************************************************************
//         *********** 내방고객 - 판매기회 연결 ( 고객정보만.. ) **********************
//         *  - 해당 번호로 고객정보를 가져와서 고객정보를 set 해준다.
//         *  - 리드번호 있으면 리드번호 저장
//         **********************************************************************/
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        model.addAttribute("sysDate", sysDate);
//        model.addAttribute("scId", LoginUtil.getUserId());
//
//        List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//        model.addAttribute("users", users);
//        //model.addAttribute("scIdList", scIdList);
//
//
//        /******************************************************
//         *********** 판매기회 그리드 및 폼 코드 **********************/
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
//        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
//        /*********** 판매기회 그리드 및 폼 코드 **********************
//        ******************************************************/
//
//        /******************************************************
//         *********** 관심차 그리드 코드****************************/
//        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//        carInfoSearchVO.setUseYn("Y");                       // 사용여부
//        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//        /*********** 관심차 그리드 코드****************************
//         ******************************************************/
//
//        /******************************************************
//         *********** 판매기회실패 그리드 정보 코드*******************/
//        model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM220", null, langCd));         // 실패유형
//        model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM221", null, langCd));       // 실패1급원인
//        model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM222", null, langCd));       // 실패2급원인
//        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));       // 등록차량 브랜드
//        /*********** 판매기회실패 그리드 정보 코드*******************
//        ******************************************************/
//
//        /******************************************************
//         *********** 활동 탭 그리드 정보 코드************************/
//        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
//        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
//        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드
//        /*********** 활동 탭 그리드 정보 코드************************
//        ******************************************************/
//
//        /******************************************************
//         *********** 메시지이력 탭 그리드 정보 코드*******************/
//        // 컨탭유형 : ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat ) // 활동형태랑 동일 (CRM321 : 활동형태 )
//        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
//        model.addAttribute("contactBizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
//        /*********** 메시지이력 탭 그리드 정보 코드*******************
//         ******************************************************/
//
//        /******************************************************
//         * 고객상세정보 탭 코드 - 시작
//         ******************************************************/
//         model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
//         model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
//         model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
//         model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
//         model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
//
//         MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
//         List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
//         model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
//         model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
//         model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
//         model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
//         model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
//         model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
//         /******************************************************
//          * 고객상세정보 탭 코드 - 끝
//          ******************************************************/
//
//
//
//
//
//        return "/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain";
//    }

    /**
     * 판매기회 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
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
                searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndRegDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 판매기회 관리 정보를 저장한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/multiSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesOpptMgmts(@Validated(Draft.class) @RequestBody SalesOpptMgmtSaveVO saveVO)throws Exception {

        String saleOpptNo;

        saveVO.getSalesOpptMgmtVO().setBhmcYn("N");        //
        saleOpptNo = salesOpptMgmtService.multiSalesOpptMgmts(saveVO);

        return saleOpptNo;
    }

    /**
    * 판매기회 관리 상세 정보를 조회한다.
    * @param TestDriveResvSearchVO searchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesOpptMgmtByKey.do", method = RequestMethod.POST)
   @ResponseBody
   public SalesOpptMgmtVO selectSalesOpptMgmtByKey(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

       SalesOpptMgmtVO vo = salesOpptMgmtService.selectSalesOpptMgmtByKey(searchVO);
       return vo;

   }

   /**
    * 판매기회 관리 탭 - 활동 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesActives.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesActives(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(salesActiveMgmtService.selectSalesActiveMgmtsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(salesActiveMgmtService.selectSalesActiveMgmtsByCondition(searchVO));
       }

       return result;

   }

   /**
    * 판매기회 관리 탭 - 메시지이력 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/selectMsgHistorys.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       // 검색조건 : dlr, ref_table_nm, key

       searchVO.setsRefTableNm("CR_0201T");
       searchVO.setsContactBizCd("03");         // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
       }

       return result;

   }

   /**
    * 판매기회 관리 탭 - 판매기회 히스토리 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesOpptHistorys.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesOpptHistorys(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(salesOpptMgmtService.selectSalesOpptHistorysByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(salesOpptMgmtService.selectSalesOpptHistorysByCondition(searchVO));
       }

       return result;

   }

   /**
    * 판매기회 조회 메인 화면을 출력한다.
    * @return
    */
//   @RequestMapping(value = "/selectSalesOpptMain.do", method = RequestMethod.GET)
//   public String selectSalesOpptMain(Model model) throws Exception {
//
//       String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//       model.addAttribute("sysDate", sysDate);
//       model.addAttribute("scId", LoginUtil.getUserId());
//
//       List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//       model.addAttribute("users", users);
//       //model.addAttribute("scIdList", scIdList);
//
//       // 차종
//       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//       carInfoSearchVO.setUseYn("Y");                       // 사용여부
//       model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//
//       model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//       model.addAttribute("saleOpptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM215", null, langCd));      // 판매기회상태
//       model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));           // 판매기회출처
//       model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
//       model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));           // 전출상태
//
//       model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM220", null, langCd));         // 실패유형
//       model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM221", null, langCd));       // 실패1급원인
//       model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM222", null, langCd));       // 실패2급원인
//       model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));       // 등록차량 브랜드
//
//       model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
//       model.addAttribute("activeContCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));      // 활동 내용
//
//
//       return "/crm/cso/salesOpptMgmt/selectSalesOpptMain";
//   }

   /**
    * 판매기회 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesOppts.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesOppts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       /******************************************
        *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
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
        *** 날짜 검색 조건 종료 ***********************
        ******************************************/

       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
       }

       return result;

   }

   /**
    * 판매기회단계 상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateSalesOpptStep.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateSalesOpptStep(@Validated(Modify.class)@RequestBody SalesOpptMgmtVO saveVO)throws Exception {

       saveVO.setUpdtUsrId(LoginUtil.getUserId());
       saveVO.setDlrCd(LoginUtil.getDlrCd());

       salesOpptMgmtService.updateSalesOpptStep(saveVO);
       return true;

   }

   /**
    * 전출상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateTrsfStat.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateTrsfStat(@Validated(Modify.class)@RequestBody SalesOpptMgmtVO saveVO)throws Exception {

       /**
        * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
        **/

       saveVO.setScId(LoginUtil.getUserId());
       saveVO.setUpdtUsrId(LoginUtil.getUserId());
       saveVO.setDlrCd(LoginUtil.getDlrCd());        //

       salesOpptMgmtService.updateTrsfStat(saveVO);
       return true;

   }

   /**
    * 판매기회 관리 상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateSalesOpptFail.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateSalesOpptFail(@RequestBody String[] saleOpptNos )throws Exception {

       /**
        * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
        **/
       salesOpptMgmtService.updateSalesOpptFail(saleOpptNos);

       return true;

   }

   /**
    * 판매기회 관리 상태알림 팝업 화면을 출력한다.
    * @return
    */

   @RequestMapping(value = "/selectSalesOpptStatPopup.do", method = RequestMethod.GET)
   public String selectSalesOpptMgmtPopup(Model model) throws Exception {

       return "/crm/cso/salesOpptMgmt/selectSalesOpptStatPopup";
   }

    /**
    * 판매기회 관리 실패등록 팝업 화면을 출력한다.
    * @return
    */
    @RequestMapping(value = "/selectSalesOpptFailPopup.do", method = RequestMethod.GET)
    public String selectSalesOpptFailPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

//        model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));         // 실패유형  CRM220
//        model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패1급원인 CRM221
//        model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패2급원인 CRM222
        model.addAttribute("failBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));      // 등록차량 브랜드

        return "/crm/cso/salesOpptMgmt/selectSalesOpptFailPopup";
    }

   /**
    * 판매기회 관리 실패를 등록한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
    @RequestMapping(value = "/insertSalesOpptFail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesOpptFail(@Validated @RequestBody SalesOpptFailMgmtVO saveVO)throws Exception {

        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        salesOpptMgmtService.insertSalesOpptFail(saveVO);
        return true;

    }


    /**
     * 리드 - 판매기회 : 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadSalesOpptMain.do", method = RequestMethod.GET)
    public String selectLeadSalesOpptMain(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectLeadSalesOpptMain";
    }

    /**
     * 리드 - 판매기회 : 리드 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadPopup.do", method = RequestMethod.GET)
    public String selectLeadPopup(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectLeadPopup";
    }


    /**
     * 리드 - 판매기회 : 판매기회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptPopup.do", method = RequestMethod.GET)
    public String selectSalesOpptPopup(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectSalesOpptPopup";
    }


    /**
     * 리드 - 판매기회 : 활동 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectActivePopup.do", method = RequestMethod.GET)
    public String selectActivePopup(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectActivePopup";
    }

    /**
     * 전시장유동량관리 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVsitMgmtPopup.do", method = RequestMethod.GET)
    public String selectVsitMgmtPopup(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectVsitMgmtPopup";
    }

    /**
     * 전시장유동량관리 결과입력 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVsitResultPopup.do", method = RequestMethod.GET)
    public String selectVsitResultPopup(Model model) throws Exception {

        return "/crm/cso/salesOpptMgmt/selectVsitResultPopup";
    }

}