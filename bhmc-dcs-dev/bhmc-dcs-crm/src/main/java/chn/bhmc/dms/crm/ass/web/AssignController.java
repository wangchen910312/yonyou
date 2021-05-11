package chn.bhmc.dms.crm.ass.web;

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
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.vo.CallCenterAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.LeadAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.VocStaffAssignSaveVO;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignController.java
 * @Description : 배정 관리 화면.
 * @author In moon Lee
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     In moon Lee     최초 생성
 * </pre>
 */
@RequestMapping("/crm/ass/assign")
@Controller
public class AssignController extends HController {

    /**
     *VOC 배정 서비스
     */
    @Resource(name="assignService")
    AssignService assignService;

    /**
     * VOC관리 서비스
     */
    @Resource(name="vocMgmtService")
    VocMgmtService vocMgmtService;


    /**
     * 고객 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 리드 서비스
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * 콜센터 서비스
     */
    @Resource(name="callInfoService")
    CallInfoService callInfoService;

    /**
     * 콜센터 서비스
     */
    @Resource(name="callCenterActionService")
    CallCenterActionService callCenterActionService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * [4.12.5.001-01] VOC 배정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVocStaffAssignMain.do", method = RequestMethod.GET)
    public String selectVocStaffAssignMain(Model model) throws Exception {

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);

        model.addAttribute("users", users);
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, LocaleContextHolder.getLocale().getLanguage()));  // 잠재,보유고객

        return "/crm/ass/assign/selectVocStaffAssignMain";

    }

    /**
     * [4.12.5.001-01] VOC 배정 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVocStaffAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocStaffAssigns(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(vocMgmtService.selectVocMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * [4.12.5.001-01] VOC 배정 .
     * @param VocStaffAssignSaveVO - 배정목록
     * @return
     */
    @RequestMapping(value = "/updateVocStaffAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVocStaffAssign(@RequestBody VocStaffAssignSaveVO saveVO) throws Exception {

        assignService.updateVocStaffAssign(saveVO);

        return true;

    }



    /**
     * [4.1.3.001-01] 고객 담당 영업사원 배정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCustomerInfoAssignMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);

        model.addAttribute("users", users);
        model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));       // 고객유형
        model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return "/crm/ass/assign/selectCustomerInfoAssignMain";

    }

    /**
     * [4.1.3.001-01] 고객 담당 영업사원 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerInfoAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO selectCustomerInfoAssigns(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        CustomerInfoVO customerInfoVO = new CustomerInfoVO();

        result.setTotal(customerInfoService.selectCustomerInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            customerInfoVO.setCustInfoDS(customerInfoService.selectCustomerInfoByCondition(searchVO));
            //customerInfoVO.setGroupDS(customerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "001"));
            //customerInfoVO.setTagDS(customerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "002"));

        }

        return customerInfoVO;

    }

    /**
     * [4.1.3.001-01] 고객 담당 영업사원 배정 .
     * @param CustomerInfoAssignSaveVO - 배정목록
     * @return
     */
    @RequestMapping(value = "/updateCustomerInfoAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCustomerInfoAssign(@RequestBody CustomerInfoAssignSaveVO saveVO) throws Exception {

        assignService.updateCustomerInfoAssign(saveVO);

        return true;

    }


    /**
     * [4.9.2.001-01] 리드배분 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadAssignMain.do", method = RequestMethod.GET)
    public String selectLeadAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);
        model.addAttribute("leadSrcList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처
        model.addAttribute("statList",       commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd));  //리드상태
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return "/crm/ass/assign/selectLeadAssignMain";

    }

    /**
     * [4.9.2.004-01] IDCC 리드배분 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadIDCCAssignMain.do", method = RequestMethod.GET)
    public String selectLeadIDCCAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);
        model.addAttribute("leadSrcList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처
        model.addAttribute("statList",       commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd));  //리드상태
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return "/crm/ass/assign/selectLeadIDCCAssignMain";

    }

    /**
     * [4.9.2.001-01] 리드배분 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeadInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLeadAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeadAssigns(@RequestBody LeadInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();



        /******************************************
         *** 배정일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        int year;
        int month;
        int day;
        if(searchVO.getsAllocDtFrom() != null || searchVO.getsAllocDtTo() != null ){


            if(searchVO.getsAllocDtFrom() == searchVO.getsAllocDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsAllocDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsAllocDtTo(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsAllocDtTo() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsAllocDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsAllocDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 배정일 날짜 검색 조건 종료 ***********************
         ******************************************/

        /******************************************
         *** 등록일 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){

            if(searchVO.getsRegDtFrom() == searchVO.getsRegDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsRegDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsRegDtTo() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 등록일 날짜 검색 조건 종료 ***********************
         ******************************************/

        /******************************************
         *** 날짜 검색 조건 시작  ( 스케줄러에서.. 당일 검색 )
         ******************************************/
//        if(searchVO.getsAllocDtFrom() != null ){
//            Calendar startCal = Calendar.getInstance();
//
//            int year;
//            int month;
//            int day;
//
//            startCal.setTime(searchVO.getsAllocDtFrom());
//            year = startCal.get(Calendar.YEAR);
//            month = startCal.get(Calendar.MONTH);
//            day = startCal.get(Calendar.DATE);
//
//            startCal.set(year, month, day, 00, 00, 00);
//            searchVO.setsAllocDtFrom(startCal.getTime());             // 시작일 설정
//        }
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        // IDCC 리드.
        //searchVO.setsLeadTp("IDCC");

        result.setTotal(leadInfoService.selectLeadInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(leadInfoService.selectLeadInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * [4.9.2.001-01] 리드배분.
     * @param LeadAssignSaveVO - 배정목록
     * @return
     */
    @RequestMapping(value = "/updateLeadAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCustomerInfoAssign(@RequestBody LeadAssignSaveVO saveVO) throws Exception {

        assignService.updateLeadAssign(saveVO);

        return true;

    }

    /**
     * [4.8.2.001-01] OB배정(콜센터 배정) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOBAssignMain.do", method = RequestMethod.GET)
    public String selectOBAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);
        model.addAttribute("bizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return "/crm/ass/assign/selectOBAssignMain";

    }

    /**
     * [4.8.2.001-01] OB배정(콜센터 배정) 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeadInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCenterAssigns(@RequestBody CallCenterActionSearchVO searchVO) throws Exception {

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

        // TODO 콜센터는 본인 콜 목록만 보는데.. 배정에서는 해당 조건 줘야함?? 말아야함???
        //searchVO.setsCallPrsnId(LoginUtil.getUserId());

        result =  callCenterActionService.selectCallCenterAssigns(searchVO);

        return result;

    }

    /**
     * [4.8.2.001-01] OB배정(콜센터 배정).
     * @param CallCenterAssignSaveVO - 배정목록
     * @return
     */
    @RequestMapping(value = "/updateCallCenterAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCallCenterAssign(@RequestBody CallCenterAssignSaveVO saveVO) throws Exception {

        // TODO OB 배정 추가
        assignService.updateCallCenterAssign(saveVO);

        return true;

    }


}
