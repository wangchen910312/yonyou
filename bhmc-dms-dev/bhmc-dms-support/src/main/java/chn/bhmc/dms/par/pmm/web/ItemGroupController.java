package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupLevelService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.vo.ItemGroupLevelVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;

/**
 * 품목그룹 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. xx. xx.
 * @version 1.0
 * * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Controller
public class ItemGroupController extends HController {

    /**
     * 품목그룹 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 품목그룹레벨 서비스
     */
    @Resource(name="itemGroupLevelService")
    ItemGroupLevelService itemGroupLevelService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 품목그룹 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectItemGroupMain.do", method = RequestMethod.GET)
    public String selectItemGroupMain(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 품목구분
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/par/pmm/itemGroup/selectItemGroupMain";

    }

    /**
     * 품목그룹 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectItemGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemGroups(@RequestBody ItemGroupSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();

        result.setTotal(itemGroupService.selectItemGroupsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemGroupService.selectItemGroupsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목그룹 콤보 목록 데이터를 조회한다.(작업자: Ju Won Lee)
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectComboItemGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectComboItemGroups(@RequestBody ItemGroupSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        result.setData(itemGroupService.selectItemGroupCodesByCondition(searchVO));

        return result;

    }

    /**
     * 품목그룹 정보를 저장한다.
     * @param saveVO - 저장 할 ItemGroupSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/multiItemGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItemGroups(@Validated @RequestBody BaseSaveVO<ItemGroupVO> itemGroupSaveVO, BindingResult bindingResult) throws Exception
    {
        itemGroupService.multiItemGroups(itemGroupSaveVO);
        return true;

    }

    /**
     * 품목그룹레벨 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectItemGroupLevelMain.do", method = RequestMethod.GET)
    public String selectItemGroupLevelMain(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 품목구분
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //1차분류코드
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(1);
        searchVO.setsUseYn("Y");
        //2차분류코드
        model.addAttribute("partItemGrpTypeOneCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("partItemGrpTypeTwoCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("partItemGrpTypeThreeCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

        return "/par/pmm/itemGroup/selectItemGroupLevelMain";

    }

    /**
     * 품목그룹레벨 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectItemGroupLevels.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemGroupLevels(@RequestBody ItemGroupSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();

        result.setTotal(itemGroupLevelService.selectItemGroupLevelsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목그룹레벨 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectItemGroupLevelsItemGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemGroupLevelsItemGroup(@RequestBody ItemGroupSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();
        List<ItemGroupLevelVO> itemGroupLevelVOList = new ArrayList<ItemGroupLevelVO>();
        itemGroupLevelVOList = itemGroupLevelService.selectItemGroupLevelsItemGroupByCondition(searchVO);

        result.setData(itemGroupLevelVOList);
        result.setTotal(itemGroupLevelVOList.size());

        return result;
    }

    /**
     * 품목그룹레벨 정보를 저장한다.
     * @param saveVO - 저장 할 ItemGroupSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/multiItemGroupLevels.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItemGroupLevels(@Validated @RequestBody BaseSaveVO<ItemGroupLevelVO> itemGroupSaveVO, BindingResult bindingResult) throws Exception
    {
        itemGroupLevelService.multiItemGroupLevels(itemGroupSaveVO);
        return true;

    }

    /**
     * 품목그룹 레벨 별 콤보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemGroup/selectComboItemGroupLevels.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ItemGroupLevelVO> selectComboItemGroupLevels(@RequestBody ItemGroupSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO);

    }

}
