package chn.bhmc.dms.cmm.ath.web;

import java.util.ArrayList;
import java.util.Comparator;
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

import chn.bhmc.dms.cmm.ath.service.MobileMainMappingService;
import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.RoleService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.MobileMainMappingVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingVO;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;
import chn.bhmc.dms.cmm.ath.vo.ViewPermissionVO;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.tree.KendoTreeModel;
import chn.bhmc.dms.core.support.tree.KendoTreeModelBuilder;
import chn.bhmc.dms.core.support.tree.KendoTreeSpriteCssClassBuilder;
import chn.bhmc.dms.core.support.tree.Tree;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.security.service.ViewResourceAccessService;

/**
 * 화면정보 관리 컨트롤러
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
public class UserPermissionController extends HController {

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 역할-직무/사용자 매핑 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 화면-권한 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 화면-권한 서비스
     */
    @Resource(name="viewResourceAccessService")
    ViewResourceAccessService viewResourceAccessService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    /**
     * 역할 관리 서비스
     */
    @Resource(name="roleService")
    RoleService roleService;

    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;

    /**
     * 모바일메인화면-사용자 매핑 서비스
     */
    @Resource(name="mobileMainMappingService")
    MobileMainMappingService mobileMainMappingService;

    /**
     * 사용자 권한관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectUserPermissionMain.do", method = RequestMethod.GET)
    public String selectUserPermissionMain(Model model, HttpServletRequest request) throws Exception {

        //직무구분(딜러/제조사)
        String cmpTp = null;
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            cmpTp = Constants.CMP_TP_CORP;
        }else{
            cmpTp = Constants.CMP_TP_DLR;
        }

        //시스템코드 'D':딜러, 'I':임포터
        model.addAttribute("sysCd", sysCd);
        //웹/모바일 구분 'W':웹, 'M':모바일
        model.addAttribute("webMobileDstinCd", Constants.WEB_MOBILE_DSTIN_CD_WEB);

        //웹/모바일 구분목록
        model.addAttribute("webMobileDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM056", null, LocaleContextHolder.getLocale().getLanguage()));

        //모바일메인화면 구분목록
        model.addAttribute("mobMainTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM066", null, LocaleContextHolder.getLocale().getLanguage()));

        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(cmpTp);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //퍼미션 목록
        model.addAttribute("registeredPermissions", viewResourceAccessService.getRegisteredPermissionList());

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(cmpTp);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));

        //회사구분
        model.addAttribute("cmpTp", cmpTp);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        return "/cmm/ath/userPermission/selectUserPermissionMain";
    }

    /**
     * 역할-사용자 매핑 정보를 변경한다.
     * @param roleUserMappingSaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/userPermission/deleteAndInsertRoleMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteAndInsertRoleMapping(@RequestBody RoleMappingSaveVO roleMappingSaveVO) throws Exception {
        roleMappingSaveVO.setRegUsrId(LoginUtil.getUserId());

        //일반사용자 역할은 기본적으로 포함되어야 한다.
        roleMappingSaveVO.getRoles().add("ROLE_USER");

        roleMappingService.deleteAndInsertRoleMapping(roleMappingSaveVO);
        return true;
    }

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제후 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/multiViewMappings.do", method = RequestMethod.POST)
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
    @RequestMapping(value = "/cmm/ath/userPermission/selectSearchPermissions.do", method = RequestMethod.POST)
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
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectButtonPermissions.do", method = RequestMethod.POST)
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
     * 화면계층 목록을 조회한다.
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/cmm/ath/userPermission/selectViewInfoTree.do", method = RequestMethod.POST)
    @ResponseBody
    public List<KendoTreeModel<ViewHierarchyVO>> selectViewInfoTree(@RequestBody ViewInfoSearchVO searchVO) throws Exception {
        List<ViewHierarchyVO> list = viewInfoService.selectViewInfoTreeAll(searchVO.getsSysCd(), searchVO.getsWebMobileDstinCd(), searchVO.getsDisplayYn(), searchVO.getsViewTp());

        Tree<ViewHierarchyVO> tree = new Tree<ViewHierarchyVO>();
        tree.addNode(Constants.ROOT_VIEW_ID, null, new ViewHierarchyVO(null, "", Constants.ROOT_VIEW_ID, ""));

        for(ViewHierarchyVO vo: list){
            tree.addNode(vo.getChildViewId(), vo.getParentViewId(), vo);
        }

        KendoTreeModelBuilder<ViewHierarchyVO> treeModelBuilder = new KendoTreeModelBuilder<ViewHierarchyVO>(0);
        treeModelBuilder.setComparator(new Comparator<KendoTreeModel<ViewHierarchyVO>>(){
            @Override
            public int compare(KendoTreeModel<ViewHierarchyVO> o1, KendoTreeModel<ViewHierarchyVO> o2) {
                return o1.getData().getChildSortOrder() - o2.getData().getChildSortOrder();
            }
        });
        treeModelBuilder.setKendoTreeSpriteCssClassBuilder(new KendoTreeSpriteCssClassBuilder<KendoTreeModel<ViewHierarchyVO>>(){
           @Override
           public String build(boolean isRoot, boolean isLeaf, KendoTreeModel<ViewHierarchyVO> model){
               String spriteCssClass = null;

               if(isRoot){
                   spriteCssClass = "rootFolder";
               }else if(isLeaf){
                   if("02".equals(model.getData().getChildViewTp())){
                       spriteCssClass = "btn";
                   }else{
                       spriteCssClass = "item";
                   }
               }else{
                   //하위가 버튼인 경우
                   if("02".equals(model.getChildren().get(0).getData().getChildViewTp())){
                       spriteCssClass = "item";
                   }else{
                       spriteCssClass = "folder";
                   }
               }

               return spriteCssClass;
           }
        });

        KendoTreeModel<ViewHierarchyVO> kendoTreeModel = (KendoTreeModel<ViewHierarchyVO>)tree.buildTreeModel(Constants.ROOT_VIEW_ID, null, treeModelBuilder);

        List<KendoTreeModel<ViewHierarchyVO>> kendoTreeModelList = new ArrayList<KendoTreeModel<ViewHierarchyVO>>();
        kendoTreeModelList.add(kendoTreeModel);

        return kendoTreeModelList;
    }

    /**
     * 사용자권한설정 메뉴구성을 위한 화면계층 목록을 조회한다.
     *
     * @return
     * @throws Exception
     *
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/cmm/ath/userPermission/selectViewInfoTree.do", method = RequestMethod.POST)
    @ResponseBody
    public List<KendoTreeModel<ViewHierarchyVO>> selectViewInfoTreeWithUser(@RequestBody ViewInfoSearchVO searchVO) throws Exception {
        List<ViewHierarchyVO> list = viewInfoService.selectViewInfoTreeAllWithUser(searchVO.getsSysCd(), searchVO.getsWebMobileDstinCd(), searchVO.getsDisplayYn(), searchVO.getsViewTp(), searchVO.getsRefId());

        Tree<ViewHierarchyVO> tree = new Tree<ViewHierarchyVO>();
        tree.addNode(Constants.ROOT_VIEW_ID, null, new ViewHierarchyVO(null, "", Constants.ROOT_VIEW_ID, ""));

        for(ViewHierarchyVO vo: list){
            tree.addNode(vo.getChildViewId(), vo.getParentViewId(), vo);
        }

        KendoTreeModelBuilder<ViewHierarchyVO> treeModelBuilder = new KendoTreeModelBuilder<ViewHierarchyVO>(0);
        treeModelBuilder.setComparator(new Comparator<KendoTreeModel<ViewHierarchyVO>>(){
            @Override
            public int compare(KendoTreeModel<ViewHierarchyVO> o1, KendoTreeModel<ViewHierarchyVO> o2) {
                return o1.getData().getChildSortOrder() - o2.getData().getChildSortOrder();
            }
        });
        treeModelBuilder.setKendoTreeSpriteCssClassBuilder(new KendoTreeSpriteCssClassBuilder<KendoTreeModel<ViewHierarchyVO>>(){
           @Override
           public String build(boolean isRoot, boolean isLeaf, KendoTreeModel<ViewHierarchyVO> model){
               String spriteCssClass = null;

               if(isRoot){
                   spriteCssClass = "rootFolder";
               }else if(isLeaf){
                   if("02".equals(model.getData().getChildViewTp())){
                       spriteCssClass = "btn";
                   }else{
                       spriteCssClass = "item";
                   }
               }else{
                   //하위가 버튼인 경우
                   if("02".equals(model.getChildren().get(0).getData().getChildViewTp())){
                       spriteCssClass = "item";
                   }else{
                       spriteCssClass = "folder";
                   }
               }

               return spriteCssClass;
           }
        });

        KendoTreeModel<ViewHierarchyVO> kendoTreeModel = (KendoTreeModel<ViewHierarchyVO>)tree.buildTreeModel(Constants.ROOT_VIEW_ID, null, treeModelBuilder);

        List<KendoTreeModel<ViewHierarchyVO>> kendoTreeModelList = new ArrayList<KendoTreeModel<ViewHierarchyVO>>();
        kendoTreeModelList.add(kendoTreeModel);

        return kendoTreeModelList;
    }
    */

    /**
     * 역할-사용자 매핑 여부 목록을 조회한다
     * @param RoleMappingSearchVO - 조회 조건을 포함하는 RoleMappingSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectUserRoleMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserRoleMappings(@RequestBody RoleMappingSearchVO roleMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();

        //시스템에서 기본적으로 사용되는 역할은 조회 목록에서 제외한다.
        List<String> sExcludeRoles = new ArrayList<String>();
        sExcludeRoles.add("ROLE_USER");
        sExcludeRoles.add("ROLE_ADMIN");

        roleMappingSearchVO.setsExcludeRoles(sExcludeRoles);

        List<RoleMappingVO> roleMappingList = roleMappingService.selectUserRoleMappings(roleMappingSearchVO);

        result.setTotal(roleMappingList.size());
        result.setData(roleMappingList);

        return result;
    }

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제후 등록한다.
     * @param ViewMappingSaveVO 화면-사용자/직무/부서 매핑 일괄저장 정보를 포함하는 ViewMappingSaveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/deleteAndInsertViewMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteAndInsertViewMappings(@RequestBody ViewMappingSaveVO viewMappingSaveVO) throws Exception {
        viewMappingSaveVO.setRegUsrId(LoginUtil.getUserId());

        viewMappingService.deleteAndInsertViewMapping(viewMappingSaveVO);
        return true;
    }

    /**
     * 사용자-화면 매핑 정보를 다른 사용자에게 복사한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectAndInsertViewMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectAndInsertViewMapping(@RequestBody Map<String, String> map) throws Exception {
        String sysCd = map.get("sysCd");
        String refTp = map.get("refTp");
        String srcRefId = map.get("srcRefId");
        String destRefId = map.get("destRefId");

        viewMappingService.selectAndInsertViewMapping(sysCd, refTp, srcRefId, destRefId, LoginUtil.getUserId());

        return true;
    }

    /**
     * 사용자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsers(@RequestBody UserSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsDelYn("N");

        result.setTotal(userService.selectUsersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userService.selectUsersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 사용자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectUsersForSuggest.do", method = RequestMethod.POST)
    public @ResponseBody List<UserVO> selectUsersForSuggest(@RequestBody UserSearchVO searchVO) throws Exception {
        return userService.selectUsersForSuggest(LoginUtil.getDlrCd(), searchVO.getsText(), searchVO.getRecordCountPerPage());
    }

    /**
     * 화면-사용자 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectUserViewMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ViewMappingVO> selectUserViewMappings(@RequestBody ViewMappingSearchVO viewMappingSearchVO) throws Exception {
        return viewMappingService.selectViewMappingsByCondition(viewMappingSearchVO);
    }

    /**
     * 모바일메인화면-사용자 매핑 목록을 조회한다.
     * @param mobileMainMappingVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/selectMobileMainMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public MobileMainMappingVO selectMobileMainMapping(@RequestBody MobileMainMappingVO mobileMainMappingVO) throws Exception {
        MobileMainMappingVO obj = mobileMainMappingService.selectMobileMainMapping(mobileMainMappingVO.getUsrId());
        if(obj != null){
            return obj;
        }

        return mobileMainMappingVO;
    }

    /**
     * 모바일메인화면-사용자 매핑정보 저장
     * @param mobileMainMappingVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/userPermission/insertOrUpdateMobileMainMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertOrUpdateMobileMainMapping(@RequestBody MobileMainMappingVO mobileMainMappingVO) throws Exception {
        mobileMainMappingService.insertOrUpdateMobileMainMapping(mobileMainMappingVO);
        return true;
    }
}
