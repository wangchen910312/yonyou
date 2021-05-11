package chn.bhmc.dms.mob.crm.slm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSaveVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobLeadInfoController.java
 * @Description : 리드관리 Controller
 * @author JongHee Lim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobLeadInfoController extends HController{



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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * MarketingCampaign Management Service
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 권한 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 권한 관리 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;


    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 리드관리 메인 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeadInfoMain.do", method = RequestMethod.GET)
//    public String selectLeadInfoMain(@RequestParam(value="callType",defaultValue="OB") String callType, @RequestParam(value="telNo",defaultValue="") String telNo, Model model) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        model.addAttribute("userId", mobLoginVO.getUserId());
//        model.addAttribute("userNm", mobLoginVO.getUserNm());
//        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
//        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
//
//        //Today
//
//        //String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        //model.addAttribute("sysDate", sysDate);
//
//        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
//        String sysDate     = DateUtil.getDate(dateFormat);
//        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
//        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);
//        model.addAttribute("toDt",            sysDate);
//        model.addAttribute("sevenDtBf",       sevenDtBf);
//
//        //로그인 정보 : 딜러코드
//        model.addAttribute("callType", callType);
//        model.addAttribute("telNo", telNo);
//        model.addAttribute("dlrCd",                 mobLoginVO.getDlrCd());
//        model.addAttribute("userId",                mobLoginVO.getUserId());
//        model.addAttribute("leadSrcList",           commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처
//        model.addAttribute("statList",              commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd));  //리드상태
//        model.addAttribute("callStatCdList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));  //통화상태
//        //model.addAttribute("ynCdList",              commonCodeService.selectCommonCodesByCmmGrpCd("COM020"));  //여부
//
//        /******************************************************
//        * 고객상세정보 탭 코드 - 시작
//        ******************************************************/
//        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
//        model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
//        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
//        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
//        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
//
//        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
//        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
//        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
//        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
//        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
//        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
//        model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
//        model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
//        /******************************************************
//         * 고객상세정보 탭 코드 - 끝
//         ******************************************************/
//
//        /******************************************************
//         * 메시지 탭 코드 - 시작
//         ******************************************************/
//        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
//        /******************************************************
//         * 메시지 탭 코드 - 끝
//         ******************************************************/
//
//        // 사용자
//        UserSearchVO searchVO = new UserSearchVO();
//        List<UserVO> users = userService.selectUsersByCondition(searchVO);
//        model.addAttribute("users", users);
//
//        // 권한 사용자
//        List<UserVO> roleUsers = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, mobLoginVO.getDlrCd(), "ROLE_SC");
//        model.addAttribute("roleUsers", roleUsers);
//
//        // 차종
//        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//        carInfoSearchVO.setUseYn("Y");                       // 사용여부
//        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//
//        return "/mob/crm/slm/leadInfo/selectLeadInfoMain";
//    }



    /**
     * 리드관리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeadInfoList.do", method = RequestMethod.GET)
    public String selectLeadInfoList(Model model) throws Exception {
        return "/mob/crm/slm/leadInfo/selectLeadInfoList";
    }


    /**
     * 리드관리 상세 - 관심차종 목록
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeadInfoSub1List.do", method = RequestMethod.GET)
    public String selectLeadInfoSub1List(Model model) throws Exception {
        return "/mob/crm/slm/leadInfo/selectLeadInfoSub1List";
    }


    /**
     * 리드관리 상세 - 메시지이력 목록
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeadInfoSub2List.do", method = RequestMethod.GET)
    public String selectLeadInfoSub2List(Model model) throws Exception {
        return "/mob/crm/slm/leadInfo/selectLeadInfoSub2List";
    }




    /**
     * 리드관리 메인(IDCC) 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeadIDCCInfoMain.do", method = RequestMethod.GET)
//    public String selectLeadIDCCInfoMain(@RequestParam(value="callType",defaultValue="OB") String callType, @RequestParam(value="telNo",defaultValue="") String telNo, Model model) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        //Today
//        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        model.addAttribute("sysDate", sysDate);
//        //로그인 정보 : 딜러코드
//        model.addAttribute("callType", callType);
//        model.addAttribute("telNo", telNo);
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        model.addAttribute("dlrCd",                 mobLoginVO.getDlrCd());
//        model.addAttribute("userId",                mobLoginVO.getUserId());
//
//        model.addAttribute("leadSrcList",           commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처
//        model.addAttribute("statList",              commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd));  //리드상태
//        model.addAttribute("callStatCdList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));  //통화상태
//        //model.addAttribute("ynCdList",              commonCodeService.selectCommonCodesByCmmGrpCd("COM020"));  //여부
//
//        /******************************************************
//        * 고객상세정보 탭 코드 - 시작
//        ******************************************************/
//        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
//        model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
//        model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
//        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
//        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
//
//        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
//        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
//        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
//        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
//        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
//        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
//        model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
//        model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
//        /******************************************************
//         * 고객상세정보 탭 코드 - 끝
//         ******************************************************/
//
//        /******************************************************
//         * 메시지 탭 코드 - 시작
//         ******************************************************/
//        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
//        /******************************************************
//         * 메시지 탭 코드 - 끝
//         ******************************************************/
//
//        // 사용자
//        UserSearchVO searchVO = new UserSearchVO();
//        List<UserVO> users = userService.selectUsersByCondition(searchVO);
//        model.addAttribute("users", users);
//
//        // 권한 사용자
//        List<UserVO> roleUsers = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, mobLoginVO.getDlrCd(), "ROLE_SC");
//        model.addAttribute("roleUsers", roleUsers);
//
//        // 차종
//        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//        carInfoSearchVO.setUseYn("Y");                       // 사용여부
//        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//
//        return "/mob/crm/slm/leadInfo/selectLeadIDCCInfoMain";
//    }

    /**
     * 리드 정보를 저장 한다.
     * @param leadInfoVO - 리드 정보
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/multiLeads.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiLeads(@Validated @RequestBody LeadInfoSaveVO saveVO)throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        saveVO.getLeadInfoVO().setDlrCd(mobLoginVO.getDlrCd());
        //saveVO.getLeadInfoVO().setPltCd(mobLoginVO.getPltCd());

        return leadInfoService.multiLeads(saveVO);
    }

    /**
     * 리드(IDCC) 정보를 저장 한다.
     * @param leadInfoVO - 리드 정보
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/multiIDCCLeads.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiIDCCLeads(@Validated @RequestBody LeadInfoSaveVO saveVO)throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        saveVO.getLeadInfoVO().setDlrCd(mobLoginVO.getDlrCd());
        //saveVO.getLeadInfoVO().setPltCd(mobLoginVO.getPltCd());

        return leadInfoService.multiIDCCLeads(saveVO);
    }

    /**
     * 중복 리드 정보를 조회 한다.
     * @param dlrCd     - 딜러정보 (로그인 사용자의 딜러정보 사용)
     * @param custNo    - 리드 정보
     * @param leadTp    - 리드타입 (COMMON/IDCC)
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectDupLeads.do", method = RequestMethod.POST)
    public String selectDupLeads(String custNo, String leadTp)throws Exception {

        return leadInfoService.selectLeadDupByKey(custNo, leadTp);
    }

    /**
     * 리드 정보를 조회 한다.
     * @param leadInfoVO - 리드 정보
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectLeads.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeads(@RequestBody LeadInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if(searchVO.getsAllocDtFrom() != null || searchVO.getsAllocDtTo() != null ){

            // 시작일
            startCal.setTime(searchVO.getsAllocDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsAllocDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsAllocDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsAllocDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/
        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if(searchVO.getsNextCallDtFrom() != null || searchVO.getsNextCallDtTo() != null ){

            // 시작일
            startCal.setTime(searchVO.getsNextCallDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsNextCallDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsNextCallDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsNextCallDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(leadInfoService.selectLeadInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(leadInfoService.selectLeadInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회를 생성한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/insertLeadToSalesOppt.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertLeadToSalesOppt(@RequestBody SalesOpptMgmtSaveVO saveVO)throws Exception {
        return leadInfoService.insertLeadToSalesOppt(saveVO);
    }


    /**
     * 판매기회 관리 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/slm/leadInfo/selectMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 검색조건 : dlr, ref_table_nm, key

        searchVO.setsRefTableNm("CR_0202T");
        searchVO.setsContactBizCd("02");         // 업무 구분 (고객,리드,기회,VOC,만족도,캠페인,멤버십)
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }



}
