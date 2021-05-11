package chn.bhmc.dms.cmm.ath.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;
import chn.bhmc.dms.cmm.ath.vo.ViewPermissionVO;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.security.service.ViewResourceAccessService;

/**
 * 화면-사용자/직무/부서 매핑관리
 *
 * @author Kang Seok Han
 * @since 2017. 03. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.03.03         Kang Seok Han            최초 생성
 * </pre>
 */
@Controller
public class ViewMappingController extends HController {

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 화면-사용자/직무/부서 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;

    /**
     * 화면-권한 서비스
     */
    @Resource(name="viewResourceAccessService")
    ViewResourceAccessService viewResourceAccessService;

    /**
     * DMS 화면-사용자/직무/부서 매핑 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectViewMappingMainForDms.do", method = RequestMethod.GET)
    public String selectViewMappingMainForDms(Model model, HttpServletRequest request) throws Exception {
        //웹/모바일 구분목록
        model.addAttribute("webMobileDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM056", null, LocaleContextHolder.getLocale().getLanguage()));

        //웹-모바일구분 'W':웹, 'M':모바일
        model.addAttribute("webMobileDstinCd", Constants.WEB_MOBILE_DSTIN_CD_WEB);

        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        //회사구분-딜러
        model.addAttribute("cmpTpDlr", Constants.CMP_TP_DLR);

        return "/cmm/ath/viewMapping/selectViewMappingMainForDms";
    }

    /**
     * DCS 화면-사용자/직무/부서 매핑 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectViewMappingMainForDcs.do", method = RequestMethod.GET)
    public String selectViewMappingMainForDcs(Model model, HttpServletRequest request) throws Exception {
        //웹/모바일 구분목록
        model.addAttribute("webMobileDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM056", null, LocaleContextHolder.getLocale().getLanguage()));

        //웹-모바일구분 'W':웹, 'M':모바일
        model.addAttribute("webMobileDstinCd", Constants.WEB_MOBILE_DSTIN_CD_WEB);

        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        //회사구분-딜러
        model.addAttribute("cmpTpDlr", Constants.CMP_TP_DLR);

        return "/cmm/ath/viewMapping/selectViewMappingMainForDcs";
    }

    /**
     * 부서 목록을 조회한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectDepartmentList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDepartmentList(@RequestBody DepartmentSearchVO searchVO) throws Exception {
        SearchResult searchResult = new SearchResult();
        List<DepartmentVO> list = departmentService.selectDepartmentsByCondition(searchVO);
        searchResult.setTotal(list.size());
        searchResult.setData(list);

        return searchResult;
    }

    /**
     * 직무 목록을 조회한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectTaskList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTaskList(@RequestBody TaskSearchVO searchVO) throws Exception {
        SearchResult searchResult = new SearchResult();
        List<TaskVO> list = taskService.selectTasksByCondition(searchVO);
        searchResult.setTotal(list.size());
        searchResult.setData(list);

        return searchResult;
    }

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제후 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/deleteAndInsertViewMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAndInsertViewMappings(@RequestBody ViewMappingSaveVO viewMappingSaveVO) throws Exception {
        viewMappingSaveVO.setRegUsrId(LoginUtil.getUserId());

        viewMappingService.deleteAndInsertViewMapping(viewMappingSaveVO);
        return true;
    }

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제후 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/multiViewMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiViewMappings(@RequestBody ViewMappingSaveVO viewMappingSaveVO) throws Exception {
        viewMappingSaveVO.setRegUsrId(LoginUtil.getUserId());

        viewMappingService.multiViewMappings(viewMappingSaveVO);
        return true;
    }

    /**
     * 화면 조회권한 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewMappingSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectSearchPermissions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSearchPermissions(@RequestBody ViewMappingSearchVO viewMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<Map<String, Object>> registeredPermissions = viewResourceAccessService.getRegisteredPermissionList();
        List<ViewPermissionVO> viewPermissions = new ArrayList<ViewPermissionVO>();

        for(Map<String, Object> permission : registeredPermissions){

            String permissionName = permission.get("permissionName").toString();

            //READ 퍼미션이 아닌경우가 조회관련 퍼미션 임
            if(!Constants.PERMISSION_READ.equals(permissionName)){
                ViewPermissionVO viewPermissionVO = new ViewPermissionVO();
                viewPermissionVO.setPermissionName(permissionName);

                if(Constants.PERMISSION_SEARCHIND.equals(permissionName)){
                    viewPermissionVO.setPermissionDisplayName(messageSource.getMessage("global.lbl.permissionSearchIndivisual", null, LocaleContextHolder.getLocale()));
                }else if(Constants.PERMISSION_SEARCHALL.equals(permissionName)){
                    viewPermissionVO.setPermissionDisplayName(messageSource.getMessage("global.lbl.permissionSearchAll", null, LocaleContextHolder.getLocale()));
                }

                viewPermissionVO.setPermYn("N");
                viewPermissionVO.setRefId(viewMappingSearchVO.getsRefId());
                viewPermissionVO.setViewId(viewMappingSearchVO.getsViewId());

                if(viewMappingService.hasPermission(viewMappingSearchVO.getsSysCd(), viewMappingSearchVO.getsViewId(), viewMappingSearchVO.getsRefTp(), viewMappingSearchVO.getsRefId(), permissionName)){
                    viewPermissionVO.setPermYn("Y");
                }

                viewPermissions.add(viewPermissionVO);
            }
        }

        result.setTotal(viewPermissions.size());
        result.setData(viewPermissions);

        return result;
    }

    /**
     * 버튼 권한 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectButtonPermissions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectButtonPermissions(@RequestBody ViewMappingSearchVO viewMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();
        viewMappingSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ViewMappingVO> list = viewMappingService.selectViewMappingsWithPermission(viewMappingSearchVO);

//        for(ViewMappingVO viewMappingVO : list){
//            if(StringUtils.isNotBlank(viewMappingVO.getMesgKey())){
//                viewMappingVO.setViewNm(messageSource.getMessage(viewMappingVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
//            }
//        }

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 화면-사용자/직무/부서 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/viewMapping/selectViewMappingsByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ViewMappingVO> selectViewMappingsByCondition(@RequestBody ViewMappingSearchVO viewMappingSearchVO) throws Exception {
        return viewMappingService.selectViewMappingsByCondition(viewMappingSearchVO);
    }
}
