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

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.vo.CallCenterAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionSearchVO;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
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
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * Crm 공통 Service
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 20170314 모바일에서 사용중
     */
    @RequestMapping(value = "/updateCustomerInfoAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCustomerInfoAssign(@RequestBody CustomerInfoAssignSaveVO saveVO) throws Exception {

        assignService.updateCustomerInfoAssign(saveVO);

        return true;

    }

    /**
     *  20170314 판매기회 / 모바일 에서 사용중.
     */
    @RequestMapping(value = "/updateSalesOpptAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSalesOpptAssign(@RequestBody SalesOpptProcessSaveVO saveVO) throws Exception {

        assignService.updateSalesOpptAssign(saveVO);

        return true;

    }

    /**
     *  20170314 모바일에서 사용
     */
    @RequestMapping(value = "/selectLeadAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeadAssigns(@RequestBody LeadInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        return result;

    }

    /**
     * [4.8.2.001-01] OB배정(콜센터 배정) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOBAssignMain.do", method = RequestMethod.GET)
    public String selectOBAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //VIEW-D-10647 : 기능 : CRM>OB 관리>OB 실행>콜센터실행
        String permissionName = "SEARCHIND,SEARCHALL";
        String[] permissionNames = permissionName.split(",");
        List<UserVO> assignUserList = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10313", null, null, permissionNames);
        model.addAttribute("assignUserList", assignUserList);

        model.addAttribute("bizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무

        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd));      //만족도 조사 타입
        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));          //마케팅 유형

        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat")));

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

        result.setTotal(callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCenterActionService.selectCallCenterActionsByCondition(searchVO));
        }

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

        assignService.updateCallCenterAssign(saveVO);

        return true;

    }


    /**
     * 엑셀Export 수량 데이터를 조회한다. [OB배정, OB실행 동시에 사용]
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCallCenterAssignsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCallCenterAssignsExcelExportCnt(@RequestBody CallCenterActionSearchVO searchVO, Model model) throws Exception {

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

        return callCenterActionService.selectCallCenterActionsByConditionCnt(searchVO);

    }


}
