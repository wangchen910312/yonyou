package chn.bhmc.dms.mob.par.pmm.web;

import java.util.ArrayList;
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

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.ComItemMasterService;
import chn.bhmc.dms.par.pmm.service.ItemGroupLevelService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupLevelVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobItemMasterController.java
 * @Description : 품목마스터 조회 Controller
 * @author JongHee Lim
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     JongHee Lim     최초 생성
 * </pre>
 */

@Controller
public class MobItemMasterController extends HController {

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="comItemMasterService")
    ComItemMasterService comItemMasterService;

    /**
     * 품목그룹레벨 서비스
     */
    @Resource(name="itemGroupLevelService")
    ItemGroupLevelService itemGroupLevelService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 판매가 생성 대상선정 마스터 서비스
     */
    @Resource(name="partsVenderSalPriceTargetMasterService")
    PartsVenderSalPriceTargetMasterService partsVenderSalPriceTargetMasterService;

    /**
     * 품목마스터조회 메인
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/__selectItemMasterMain.do", method = RequestMethod.GET)
    public String __selectItemMasterMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        ItemGroupSearchVO itemGroupVO      = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList    = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList     = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(mobLoginVO.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(mobLoginVO.getPltCd());
        locationSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(mobLoginVO.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",    mobLoginVO.getDlrCd());
        model.addAttribute("regUsrId", mobLoginVO.getUserId());


        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("stockUnitList", stockUnitList);
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("weightUnitCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));


        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //model.addAttribute("pCallMenu", pCallMenu);

        //1차분류코드
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin1stCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //2차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin2ndCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(4);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin3rdCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

      //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));

        return "/mob/par/pmm/itemMaster/selectItemMasterMain";
    }

    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterMain.do", method = RequestMethod.GET)
    public String selectItemMasterMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        ItemGroupSearchVO itemGroupVO      = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList    = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList     = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(mobLoginVO.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(mobLoginVO.getPltCd());
        locationSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(mobLoginVO.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",    mobLoginVO.getDlrCd());
        model.addAttribute("regUsrId", mobLoginVO.getUserId());


        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("stockUnitList", stockUnitList);
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("weightUnitCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));


        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //model.addAttribute("pCallMenu", pCallMenu);

        //1차분류코드
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin1stCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //2차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin2ndCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsLvlVal(4);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin3rdCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

      //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/baseJsp/selectItemMasterMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 품목마스터 목록
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterList.do", method = RequestMethod.GET)
    public String selectItemMasterList(Model model) throws Exception  {
        return "/mob/par/pmm/itemMaster/selectItemMasterList";
    }

    /**
     * 품목마스터 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemMasters(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(itemMasterService.selectItemMastersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemMastersByCondition(searchVO));
        }
        return result;
    }

    /**
     * 품목마스터 상세 [조회]
     */
    //@RequestMapping(value = "/mob/par/pmm/itemMaster/selectMobileItemMasterByKey.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public ItemMasterVO selectMobileItemMasterByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {
        ItemMasterVO itemMasterVO = new ItemMasterVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        itemMasterVO = itemMasterService.selectMobileItemMasterByKey(searchVO);
        return itemMasterVO;
    }



    /**
     * 품목그룹레벨 목록
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubItemDstinInfoList.do", method = RequestMethod.GET)
    public String selectItemMasterSubItemDstinInfoList(Model model) throws Exception  {
        return "/mob/par/pmm/itemMaster/selectItemMasterSubItemDstinInfoList";
    }
    /**
     * ItemGroupController.java
     * 품목그룹레벨 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return
     */
    //@RequestMapping(value = "/par/pmm/itemGroup/selectItemGroupLevelsItemGroup.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubItemDstinInfoData.do", method = RequestMethod.POST)
    @ResponseBody
    //public SearchResult selectItemGroupLevelsItemGroup(@RequestBody ItemGroupSearchVO searchVO) throws Exception{
    public SearchResult selectItemMasterSubItemDstinInfoData(@RequestBody ItemGroupSearchVO searchVO) throws Exception{
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        SearchResult result = new SearchResult();
        List<ItemGroupLevelVO> itemGroupLevelVOList = new ArrayList<ItemGroupLevelVO>();
        itemGroupLevelVOList = itemGroupLevelService.selectItemGroupLevelsItemGroupByCondition(searchVO);

        result.setData(itemGroupLevelVOList);
        result.setTotal(itemGroupLevelVOList.size());

        return result;
    }

    /**
     *  공용부품 마스터 목록
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubComItemList.do", method = RequestMethod.GET)
    public String selectItemMasterSubComItemList(Model model) throws Exception  {
        return "/mob/par/pmm/itemMaster/selectItemMasterSubComItemList";
    }
    /**
     * ItemMasterController.java
     * Key에 해당하는 공용부품 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    //@RequestMapping(value = "/par/pmm/comItemMaster.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubComItemData.do", method = RequestMethod.POST)
    @ResponseBody
    //public SearchResult comItemMaster(@RequestBody ComItemMasterSearchVO searchVO)  throws Exception  {
    public SearchResult selectItemMasterSubComItemData(@RequestBody ComItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(comItemMasterService.comItemMasterByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(comItemMasterService.comItemMasterByKey(searchVO));
        }

        return result;

    }

    /**
     *  판매가 생성 대상선정 목록
     */
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceList.do", method = RequestMethod.GET)
    public String selectItemMasterSubItemPriceList(Model model) throws Exception  {
        return "/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceList";
    }

    /**
     * PartsSalePriceTargetMasterController.java
     * 판매가 생성 대상선정  목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
     * @return
     */
    //@RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceData.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemMasterSubItemPriceData(@RequestBody PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 딜러코드 검색 VO
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(partsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByCondition(searchVO));
        }

        return result;
    }
}
