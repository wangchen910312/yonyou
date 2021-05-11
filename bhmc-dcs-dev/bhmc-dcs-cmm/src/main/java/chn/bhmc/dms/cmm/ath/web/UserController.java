package chn.bhmc.dms.cmm.ath.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSaveVO;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.SalesMgrDetlService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;

/**
 * 사용자 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 2. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.022         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class UserController extends HController {

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 공통코드관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 테마목록
     */
    @Resource(name="themeNames")
    List<String> themeNames;

    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;
    
    /**
     * 판매고문 직무상세 관리 서비스
     */
    @Resource(name="salesMgrDetlService")
    SalesMgrDetlService salesMgrDetlService;

    /**
     * 사용자 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/user/selectUserMain.do", method = RequestMethod.GET)
    public String selectUserMain(Model model, HttpServletRequest request) throws Exception {

        //직무구분(딜러/제조사)
//        String cmpTp = null;
        //시스템구분
//        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
//
//        if(Constants.SYS_CD_CORP.equals(sysCd)){
//            cmpTp = Constants.CMP_TP_CORP;
//        }else{
//            cmpTp = Constants.CMP_TP_DLR;
//        }

        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
//        departmentSearchVO.setsCmpTp(cmpTp);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
//        taskSearchVO.setsCmpTp(cmpTp);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));
        
        //지원언어목록
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //테마목록
        model.addAttribute("themeNames", themeNames);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        return "/cmm/sci/user/selectUserMain";
    }

    /**
     * 사용자 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/user/selectUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsers(@RequestBody UserSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(userService.selectUsersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(userService.selectUsersByCondition(searchVO));
        }
        return result;
    }

    /**
     * 로그인 사용자가 속한 딜러의 사용자 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/user/selectUsersForDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsersForDealer(@RequestBody UserSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(userService.selectUsersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(userService.selectUsersByCondition(searchVO));
        }
        return result;
    }

    /**
     * 사용자 정보를 조회한다.
     * @param searchVO 사용자 조회 조건
     * @return 사용자 조건을 만족하는 사용자 정보를 반환한다.
     */
    @RequestMapping(value="/cmm/sci/user/selectUser.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectUserer(@RequestBody UserSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        UserVO userVO = userService.selectUserByKey(searchVO.getsUsrId());
        result.put("user", userVO);
        return result;
    }

    /**
     * 사용자 정보 등록 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/sci/user/insertUserPopup.do",  method = RequestMethod.GET)
    public String insertUserPopup(Model model) throws Exception {
        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직급목록
        model.addAttribute("pstnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM027", "Y", LocaleContextHolder.getLocale().getLanguage()));

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));
        
        //직무상세목록
        SalesMgrDetlSearchVO salesMgrDetlSearchVO = new SalesMgrDetlSearchVO();
        salesMgrDetlSearchVO.setsUseYn("Y");
        model.addAttribute("salesMgrDetlList", salesMgrDetlService.selectSalesMgrDetlsByCondition(salesMgrDetlSearchVO));

        //지원언어목록
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //기본언어
        model.addAttribute("defaultLang", systemConfigInfoService.selectStrValueByKey("defaultLang"));
        //BHMC 딜러코드를 설정한다.
        model.addAttribute("dlrCd", Constants.DLR_CD_CORP);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        return "/cmm/sci/user/insertUserPopup";
    }

    /**
     * 사용자 정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/sci/user/insertUser.do",  method = RequestMethod.POST)
    @ResponseBody
    public Boolean insertUser(@Validated(Draft.class) @RequestBody UserVO userVO) throws Exception {
        userVO.setDssUsrYn("N");
        userVO.setDelYn("Y".equals(userVO.getEnabledYn())? "N":"Y");
        userVO.setThemeId("default");
        userVO.setRegUsrId(LoginUtil.getUserId());
        userVO.setUpdtUsrId(LoginUtil.getUserId());

        userService.insertUser(Constants.SYS_CD_CORP, userVO);
        return true;
    }

    /**
     * 사용자 정보 변경 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/sci/user/updateUserPopup.do",  method = RequestMethod.GET)
    public String updateUserPopup(@RequestParam(value="usrId") String usrId, Model model) throws Exception {
        UserVO user = userService.selectUserByKey(usrId);
        model.addAttribute("user", user);

        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직급목록
        model.addAttribute("pstnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM027", "Y", LocaleContextHolder.getLocale().getLanguage()));

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));
        
        //직무상세목록
        SalesMgrDetlSearchVO salesMgrDetlSearchVO = new SalesMgrDetlSearchVO();
        model.addAttribute("salesMgrDetlList", salesMgrDetlService.selectSalesMgrDetlsByCondition(salesMgrDetlSearchVO));

        //지원언어목록
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //기본언어
        model.addAttribute("defaultLang", systemConfigInfoService.selectStrValueByKey("defaultLang"));
        //BHMC 딜러코드를 설정한다.
        model.addAttribute("dlrCd", Constants.DLR_CD_CORP);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        return "/cmm/sci/user/updateUserPopup";
    }

    /**
     * 사용자 정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/sci/user/updateUser.do",  method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateUser(@Validated(Modify.class) @RequestBody UserVO userVO) throws Exception {
        userVO.setDelYn("Y".equals(userVO.getEnabledYn())? "N":"Y");
        userVO.setThemeId("default");
        userVO.setUpdtUsrId(LoginUtil.getUserId());
        userVO.setDssUsrYn("N");

        userService.updateUser(userVO);
        return true;
    }

    /**
     * 사용자 정보 변경 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/sci/user/selectUserPopup.do",  method = RequestMethod.GET)
    public String selectUserPopup(@RequestParam(value="usrId") String usrId, Model model) throws Exception {
        UserVO user = userService.selectUserByKey(usrId);
        model.addAttribute("user", user);

        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직급목록
        model.addAttribute("pstnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM027", "Y", LocaleContextHolder.getLocale().getLanguage()));

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));
        
        //직무상세목록
        SalesMgrDetlSearchVO salesMgrDetlSearchVO = new SalesMgrDetlSearchVO();
        model.addAttribute("salesMgrDetlList", salesMgrDetlService.selectSalesMgrDetlsByCondition(salesMgrDetlSearchVO));

        //지원언어목록
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //기본언어
        model.addAttribute("defaultLang", systemConfigInfoService.selectStrValueByKey("defaultLang"));
        //BHMC 딜러코드를 설정한다.
        model.addAttribute("dlrCd", Constants.DLR_CD_CORP);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        return "/cmm/sci/user/selectUserPopup";
    }

    /**
     * 사용자 정보를 가져온다.
     * @param searchVO 사용자 조회 조건
     * @return 사용자 조건을 만족하는 사용자 정보를 반환한다.
     */
    @RequestMapping(value = "/cmm/sci/user/selectUsersForSuggest.do", method = RequestMethod.POST)
    public @ResponseBody SearchResult selectUsersForSuggest(@RequestBody UserSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(userService.selectUsersForSuggest(LoginUtil.getDlrCd(), searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 사용자 정보를 등록한다.
     * @param saveVO - 사용자정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/user/multiUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUsers(@Validated @RequestBody UserSaveVO saveVO) throws Exception {
        userService.multiUsers(saveVO);
        return true;
    }
}
