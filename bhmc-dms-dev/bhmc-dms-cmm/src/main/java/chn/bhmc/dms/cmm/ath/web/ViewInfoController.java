package chn.bhmc.dms.cmm.ath.web;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.exception.BizException;
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

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyUpdateVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.tree.KendoTreeModel;
import chn.bhmc.dms.core.support.tree.KendoTreeModelBuilder;
import chn.bhmc.dms.core.support.tree.KendoTreeSpriteCssClassBuilder;
import chn.bhmc.dms.core.support.tree.Tree;

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
public class ViewInfoController extends HController {

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 화면정보 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/selectViewInfoMain.do", method = RequestMethod.GET)
    public String selectViewInfoMain(Model model, HttpServletRequest request) throws Exception {
        //시스템구분
        model.addAttribute("sysCd", request.getServletContext().getInitParameter("SYS_CD"));
        //웹/모바일구분
        model.addAttribute("webMobileDstinCd", Constants.WEB_MOBILE_DSTIN_CD_WEB);

        //시스템구분 목록
        model.addAttribute("sysCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM055", null, LocaleContextHolder.getLocale().getLanguage()));
        //웹/모바일구분 목록
        model.addAttribute("webMobileDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM056", null, LocaleContextHolder.getLocale().getLanguage()));
        //화면유형 목록
        model.addAttribute("viewTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM007", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/ath/viewInfo/selectViewInfoMain";
    }

    /**
     * 신규화면ID를 반환한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/selectNextViewId.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> selectNextViewId(@RequestParam(value="sysCd") String sysCd) throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        result.put("viewId", viewInfoService.selectNextViewId(sysCd));

        return result;
    }

    /**
     * 화면계층 목록을 조회한다.
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/cmm/ath/viewInfo/selectViewInfoTree.do", method = RequestMethod.POST)
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
     * 하위화면 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/selectViewInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectViewInfos(@RequestBody ViewInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<ViewInfoVO> list = viewInfoService.selectViewInfosByCondition(searchVO);
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 화면 계층 정보를 수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/updateViewInfoTree.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateViewInfoTree(@RequestBody ViewHierarchyUpdateVO obj) throws Exception {
        viewInfoService.updateViewHierarchy(obj);
        return true;
    }

    /**
     * 화면 정보를 저장한다.
     * @param saveVO - 화면정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/multiViewInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiViewInfos(@Validated @RequestBody ViewInfoSaveVO saveVO) throws Exception {
        viewInfoService.multiViewInfos(saveVO);
        return true;
    }

    /**
     * T코드에 해당하는 화면정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/viewInfo/selectViewInfoByTcd.do", method = RequestMethod.POST)
    @ResponseBody
    public ViewInfoVO selectViewInfoByTcd(@RequestBody ViewInfoVO obj) throws Exception {
        String tCd = obj.gettCd();

        //T코드 체크
        if(StringUtils.isBlank(tCd)){
            throw new BizException(
                messageSource.getMessage("global.err.undefined",new String[]{messageSource.getMessage("global.lbl.tCd", null, LocaleContextHolder.getLocale())},LocaleContextHolder.getLocale())
            );
        }

        ViewInfoVO viewInfo = viewInfoService.selectViewInfoByTcd(tCd.toUpperCase());

        if(viewInfo == null){
            throw new BizException(
                messageSource.getMessage("global.err.undefined",new String[]{messageSource.getMessage("global.lbl.tCd", null, LocaleContextHolder.getLocale())},LocaleContextHolder.getLocale())
            );
        }

        String viewNm = "";
        if(!StringUtils.isBlank(viewInfo.getMesgKey())){
            viewNm = messageSource.getMessage(viewInfo.getMesgKey(), null, viewInfo.getViewNm(), LocaleContextHolder.getLocale());
        }else{
            viewNm = viewInfo.getViewNm();
        }

        if(!StringUtils.isBlank(viewInfo.gettCd())){
            viewNm = "<span title=\""+viewInfo.gettCd()+"\">"+viewNm+"</span>";
        }

        viewInfo.setViewNm(viewNm);
        return viewInfo;
    }
}
