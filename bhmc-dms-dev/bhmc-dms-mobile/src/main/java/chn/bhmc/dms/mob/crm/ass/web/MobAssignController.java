package chn.bhmc.dms.mob.crm.ass.web;

import java.util.Date;
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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.LeadAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobAssignController.java
 * @Description : 배정관리 Controller
 * @author JongHee Lim
 * @since 2016. 6. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 15.     JongHee Lim     최초 생성
 * </pre>
 */
@RequestMapping("/mob/crm/ass/assign")
@Controller
public class MobAssignController extends HController {

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

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * [4.9.2.001-01] 리드배분 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadAssignMain.do", method = RequestMethod.GET)
    public String selectLeadAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);
        //model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));  //리드출처 CRM209
        //model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));  //리드상태 CRM210
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return "/mob/crm/ass/assign/selectLeadAssignMain";

    }

    // 리드배분 목록
    @RequestMapping(value = "/selectLeadAssignList.do", method = RequestMethod.GET)
    public String selectLeadAssignList(Model model) throws Exception {
        return "/mob/crm/ass/assign/selectLeadAssignList";
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





    // 판매고문 메인
    @RequestMapping(value = "/selectAssignUserPopMain.do", method = RequestMethod.GET)
    public String selectAssignUserMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);

        return "/mob/crm/ass/assign/selectAssignUserPopMain";

    }

    // 판매고문 목록
    @RequestMapping(value = "/selectAssignUserPopList.do", method = RequestMethod.GET)
    public String selectAssignUserList(Model model) throws Exception {
        return "/mob/crm/ass/assign/selectAssignUserPopList";
    }


    // 판매고문 목록 조회
    @RequestMapping(value = "/selectAssignUserPopLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAssignUserPopLists(@RequestBody UserSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);


        if(assignUserList != null){
            result.setTotal(assignUserList.size());

            if(assignUserList.size() > 0){
                result.setData(assignUserList);
            }
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

    @RequestMapping(value = "/updateSalesOpptAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSalesOpptAssign(@RequestBody SalesOpptProcessSaveVO saveVO) throws Exception {

        assignService.updateSalesOpptAssign(saveVO);

        return true;

    }

}
