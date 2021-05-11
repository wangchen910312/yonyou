package chn.bhmc.dms.cmm.sci.web;
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

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.ptl.service.PortletMappingService;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 공통팝업 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class CommonPopupController extends HController {

    /**
     * 포틀릿-직무 매핑 관리 서비스
     */
    @Resource(name="portletMappingService")
    PortletMappingService portletMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 관리 서비스
     */
    @Resource (name = "dealerService")
    DealerService dealerService;

    /**
     * 우편번호 관리 서비스
     */
    @Resource(name="zipCodeService")
    ZipCodeService zipCodeService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    /**
     * 부서 관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;

    /**
     * 국가조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectCountryPopup.do", method = RequestMethod.GET)
    public String selectCountryPopup(Model model) throws Exception {
        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/cmm/sci/commonPopup/selectCountryPopup";
    }

    /**
     * 사용자조회 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectUserPopup.do", method = RequestMethod.GET)
    public String selectUserPopup() {
        return "/cmm/sci/commonPopup/selectUserPopup";
    }

    /**
     * 우편번호 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectZipCodePopup.do", method = RequestMethod.GET)
    public String selectZipCodePopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        DealerVO dealerVo = dealerService.selectDealerByKey(LoginUtil.getDlrCd());
        String sZipCd = dealerVo.getZipNo();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("zipNo", dealerVo.getZipNo());

        ZipCodeSearchVO zipCodeSearchVO = new ZipCodeSearchVO();  // make a new ZipCodesearchVO
        zipCodeSearchVO.setsZipCd(sZipCd);  // put the sZipCd para to ZipCodesearchVO for using selectZipCodesByCondition() which is in zipCodeService.
        model.addAttribute("zipInfoList",zipCodeService.selectZipCodesByCondition(zipCodeSearchVO));
        model.addAttribute("gubunList", commonCodeService.selectCommonCodesByCmmGrpCd("COM018", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        zipCodeSearchVO.setsZipCd("");
        zipCodeSearchVO.setsDistCd(dealerVo.getSaleDlrCityCd());
        List<ZipCodeVO> selectDistCdList = zipCodeService.selectDistCdsByCondition(zipCodeSearchVO);

        if ( selectDistCdList.size() > 0 ){
            model.addAttribute("sungNm",selectDistCdList.get(0).getSungNm());
        }


        return "/cmm/sci/commonPopup/selectZipCodePopup";
    }

    /**
     * 딜러조회 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectDealerPopup.do", method = RequestMethod.GET)
    public String selectDealerPopup(Model model) {
        return "/cmm/sci/commonPopup/selectDealerPopup";
    }

    /**
     * 메세지템플릿 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectMessageTemplatePopup.do", method = RequestMethod.GET)
    public String selectMessageTemplatePopup(Model model) throws Exception {
        //메세지템플릿 유형 목록
        model.addAttribute("mesgTmplTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM004", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/sci/commonPopup/selectMessageTemplatePopup";
    }

    /**
     * 포틀릿조회 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectPortletPopup.do", method = RequestMethod.GET)
    public String selectPortletPopup(Model model) {
        model.addAttribute("usrId", LoginUtil.getUserId());
        return "/cmm/sci/commonPopup/selectPortletPopup";
    }

    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param portletMappingSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectPortlets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortlets(@RequestBody PortletMappingSearchVO portletMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();

        portletMappingSearchVO.setsRefId(LoginUtil.getUserId());

        List<PortletMappingVO> list = portletMappingService.selectPortletMappingByUser(portletMappingSearchVO);
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 직무조회 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectTaskPopup.do", method = RequestMethod.GET)
    public String selectTaskPopup() {
        return "/cmm/sci/commonPopup/selectTaskPopup";
    }

    /**
     * 직무조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectTasks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTasks(@RequestBody TaskSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(taskService.selectTasksByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(taskService.selectTasksByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부서조회 팝업 화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectDepartmentPopup.do", method = RequestMethod.GET)
    public String selectDepartmentPopup() {
        return "/cmm/sci/commonPopup/selectDepartmentPopup";
    }

    /**
     * 부서조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DepartmentSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/commonPopup/selectDepartments.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDepartments(@RequestBody DepartmentSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(departmentService.selectDepartmentsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(departmentService.selectDepartmentsByCondition(searchVO));
        }

        return result;
    }
}
