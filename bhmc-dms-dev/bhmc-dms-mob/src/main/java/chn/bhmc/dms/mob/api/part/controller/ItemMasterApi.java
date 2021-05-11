package chn.bhmc.dms.mob.api.part.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationMasterService;
import chn.bhmc.dms.mob.api.part.service.PartCarInfoService;
import chn.bhmc.dms.mob.api.part.service.PartComItemMasterService;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartItemGroupService;
import chn.bhmc.dms.mob.api.part.service.PartItemGroupLevelService;
import chn.bhmc.dms.mob.api.part.service.PartItemMasterService;
import chn.bhmc.dms.mob.api.part.service.PartPartsVenderSalPriceTargetMasterService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartUnitInfoService;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupLevelVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : MobItemMasterController.java
 * @Description : 품목마스터 조회 Controller
 * @author JongHee Lim
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 */

@Controller
@RequestMapping("/api/part/ItemMaster")
@Api("配件管理")
public class ItemMasterApi extends HController {

	/**
	 * 품목마스터 관리 서비스
	 */
	@Resource(name = "PartItemMasterService")
	PartItemMasterService partItemMasterService;

	/**
	 * 품목그룹 관리 서비스
	 * use
	 */
	@Resource(name = "PartItemGroupService")
	PartItemGroupService partItemGroupService;

	/**
	 * 공통코드 관리 서비스
	 */
	@Resource(name = "PartCommonCodeService")
	PartCommonCodeService partCommonCodeService;

	/**
	 * 창고 관리 서비스
	 */
	@Resource(name = "PartStorageService")
	PartStorageService partStorageService;

	/**
	 * 단위정보 관리 서비스
	 */
	@Resource(name = "PartUnitInfoService")
	PartUnitInfoService partUnitInfoService;

	/**
	 * 차량,모델,OCN, 로컬옵션 정보 서비스
	 */
	@Resource(name = "PartCarInfoService")
	PartCarInfoService partCarInfoService;

	/**
	 * 품목마스터 관리 서비스
	 */
	@Resource(name = "PartComItemMasterService")
	PartComItemMasterService PartComItemMasterService;

	/**
	 * 품목그룹레벨 서비스
	 */
	@Resource(name = "PartItemGroupLevelService")
	PartItemGroupLevelService PartItemGroupLevelService;

	/**
	 * 로케이션 마스터 서비스
	 */
	@Resource(name = "PartBinLocationMasterService")
	PartBinLocationMasterService PartBinLocationMasterService;

	/**
	 * 판매가 생성 대상선정 마스터 서비스
	 */
	@Resource(name = "PartPartsVenderSalPriceTargetMasterService")
	PartPartsVenderSalPriceTargetMasterService PartPartsVenderSalPriceTargetMasterService;

	/**
	 * 품목마스터조회 메인
	 */
	// @RequestMapping(value = "/mob/par/pmm/itemMaster/__selectItemMasterMain",
	// method = RequestMethod.GET)

	@RequestMapping(value = "/__selectItemMasterMain.do", method = RequestMethod.GET)
	public BaseJSON __selectItemMasterMain(Model model) throws Exception {

		String langCd = LocaleContextHolder.getLocale().getLanguage();

		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		model.addAttribute("userId", mobLoginVO.getUserId());
		model.addAttribute("userNm", mobLoginVO.getUserNm());
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

		ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
		List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

		StorageSearchVO storageSearchVO = new StorageSearchVO();
		List<StorageVO> storageList = new ArrayList<StorageVO>();

		UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
		List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

		itemGroupVO.setsDlrCd(mobLoginVO.getDlrCd());
		itemGroupList = partItemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

		storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
		storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
		storageList = partStorageService.selectStoragesByCondition(storageSearchVO);

		// 로케이션 코드정보 조회.
		BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
		locationSearchVO.setsPltCd(mobLoginVO.getPltCd());
		locationSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
		locationSearchVO.setsMainLocYn("N");
		locationSearchVO.setsLastLvlYn("Y");
		model.addAttribute("giLocCdList",
				PartBinLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

		unitInfoSearchVO.setsUseYn("Y");
		stockUnitList = partUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

		// 차종 , 중고차-자사-차종
		CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
		carInfoSearchVO.setDlrCd(mobLoginVO.getDlrCd());
		carInfoSearchVO.setUseYn("Y");
		model.addAttribute("carlineCdList", partCarInfoService.selectCarListsByCondition(carInfoSearchVO));

		// 차종 , 중고차-자사-차종
		model.addAttribute("modelCdList", partCarInfoService.selectModelListsByCondition(carInfoSearchVO));

		// 로그인 정보: 딜러코드
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("regUsrId", mobLoginVO.getUserId());

		model.addAttribute("itemGroupList", itemGroupList);
		model.addAttribute("storageList", storageList);
		model.addAttribute("stockUnitList", stockUnitList);
		model.addAttribute("spyrCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

		// 부품구분 공통코드 조회.
		CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
		itemDistinCdSearchVO.setsLangCd(langCd);
		itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
		itemDistinCdSearchVO.setsUseYn("Y");
		itemDistinCdSearchVO.setsRemark1("PAR");

		model.addAttribute("itemDstinCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
		model.addAttribute("weightUnitCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
		model.addAttribute("brandCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
		model.addAttribute("abcIndList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
		model.addAttribute("sucList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
		model.addAttribute("parSpecCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
		model.addAttribute("mobisImpLocalYnTpList",
				partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

		CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
		commonCodeSearchVO.setsCmmGrpCd("PAR121");
		commonCodeSearchVO.setsRemark2("01");// 구매처
		model.addAttribute("bpTpList", partCommonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

		// useYnList
		model.addAttribute("useYnList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
		// model.addAttribute("pCallMenu", pCallMenu);

		// 1차분류코드
		ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(2);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin1stCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
		// 2차분류코드
		searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(3);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin2ndCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
		// 3차분류코드
		searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(4);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin3rdCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

		// 가격계산유형
		model.addAttribute("basePriceCalTpList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));

		// return "/mob/par/pmm/itemMaster/selectItemMasterMain";
		BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(model);
		return baseJSON;
	}

	// @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterMain",
	// method = RequestMethod.GET)

	@RequestMapping(value = "/selectItemMasterMain.do", method = RequestMethod.GET)
	@ApiOperation("项目主查询页面加载")
	@ResponseBody
	public BaseJSON selectItemMasterMain(Model model) throws Exception {

		String langCd = LocaleContextHolder.getLocale().getLanguage();

		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		model.addAttribute("userId", mobLoginVO.getUserId());
		model.addAttribute("userNm", mobLoginVO.getUserNm());
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

		ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
		List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

		StorageSearchVO storageSearchVO = new StorageSearchVO();
		List<StorageVO> storageList = new ArrayList<StorageVO>();

		UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
		List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

		itemGroupVO.setsDlrCd(mobLoginVO.getDlrCd());
		itemGroupList = partItemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

		storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
		storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
		storageList = partStorageService.selectStoragesByCondition(storageSearchVO);

		// 로케이션 코드정보 조회.
		BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
		locationSearchVO.setsPltCd(mobLoginVO.getPltCd());
		locationSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
		locationSearchVO.setsMainLocYn("N");
		locationSearchVO.setsLastLvlYn("Y");
		model.addAttribute("giLocCdList",
				PartBinLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

		unitInfoSearchVO.setsUseYn("Y");
		stockUnitList = partUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

		// 차종 , 중고차-자사-차종
		CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
		carInfoSearchVO.setDlrCd(mobLoginVO.getDlrCd());
		carInfoSearchVO.setUseYn("Y");
		model.addAttribute("carlineCdList", partCarInfoService.selectCarListsByCondition(carInfoSearchVO));

		// 차종 , 중고차-자사-차종
		model.addAttribute("modelCdList", partCarInfoService.selectModelListsByCondition(carInfoSearchVO));

		// 로그인 정보: 딜러코드
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("regUsrId", mobLoginVO.getUserId());

		model.addAttribute("itemGroupList", itemGroupList);
		model.addAttribute("storageList", storageList);
		model.addAttribute("stockUnitList", stockUnitList);
		model.addAttribute("spyrCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

		// 부품구분 공통코드 조회.
		CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
		itemDistinCdSearchVO.setsLangCd(langCd);
		itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
		itemDistinCdSearchVO.setsUseYn("Y");
		itemDistinCdSearchVO.setsRemark1("PAR");

		model.addAttribute("itemDstinCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
		model.addAttribute("weightUnitCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
		model.addAttribute("brandCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
		model.addAttribute("abcIndList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
		model.addAttribute("sucList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
		model.addAttribute("parSpecCdList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
		model.addAttribute("mobisImpLocalYnTpList",
				partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

		CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
		commonCodeSearchVO.setsCmmGrpCd("PAR121");
		commonCodeSearchVO.setsRemark2("01");// 구매처
		model.addAttribute("bpTpList", partCommonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

		// useYnList
		model.addAttribute("useYnList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
		// model.addAttribute("pCallMenu", pCallMenu);

		// 1차분류코드
		ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(2);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin1stCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
		// 2차분류코드
		searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(3);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin2ndCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
		// 3차분류코드
		searchVO = new ItemGroupSearchVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());
		searchVO.setsLvlVal(4);
		searchVO.setsUseYn("Y");
		model.addAttribute("itemDstin3rdCdList", PartItemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

		// 가격계산유형
		model.addAttribute("basePriceCalTpList", partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));
		model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/pmm/itemMaster/baseJsp/selectItemMasterMain.jsp");
		// return "/ZnewMob/templatesNewMob/mobTemplateA";
		BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(model);
		return baseJSON;
	}

	/**
	 * 품목마스터 목록
	 */
	// @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterList",
	// method = RequestMethod.GET)
	@RequestMapping(value = "/selectItemMasterList.do", method = RequestMethod.GET)
	public String selectItemMasterList(Model model) throws Exception {
		return "/mob/par/pmm/itemMaster/selectItemMasterList";
	}

	/**
	 * 품목마스터 목록 [조회]
	 */
	// @RequestMapping(value = "/mob/par/pmm/itemMaster/selectItemMasterLists",
	// method = RequestMethod.POST)
	@RequestMapping(value = "/selectItemMasters.do", method = RequestMethod.POST)
	@ApiOperation("配件信息查询")
	@ResponseBody
	public BaseJSON selectItemMasters(@RequestBody ItemMasterSearchVO searchVO) {
		BaseJSON json = new BaseJSON();
		SearchResult result = new SearchResult();
		try {
			MobLoginVO mobLoginVO = MobUtil.getLoginVO();
			searchVO.setsDlrCd(mobLoginVO.getDlrCd());
			result.setTotal(partItemMasterService.selectItemMastersByConditionCnt(searchVO));
			if (result.getTotal() != 0) {
				result.setData(partItemMasterService.selectItemMastersByCondition(searchVO));
			}
		} catch (Exception e) {
			json.setResultCode(1);
			json.setResultMsg("无数据");
			e.printStackTrace();
		}
		json.setResult(result);
		return json;
	}

	/**
	 * 품목마스터 상세 [조회]
	 */
	// @RequestMapping(value =
	// "/mob/par/pmm/itemMaster/selectMobileItemMasterByKey", method =
	// RequestMethod.POST)
	@RequestMapping(value = "/selectMobileItemMasterByKey.do", method = RequestMethod.POST)
	@ApiOperation("配件信息查询（库存信息）")
	@ResponseBody
	public BaseJSON selectItemMasterByKey(@RequestBody ItemMasterSearchVO searchVO) throws Exception {

		ItemMasterVO itemMasterVO = new ItemMasterVO();

		searchVO.setsDlrCd(LoginUtil.getDlrCd());
		searchVO.setsPltCd(LoginUtil.getPltCd());

		itemMasterVO = partItemMasterService.selectItemMasterByKey(searchVO);
		BaseJSON json = new BaseJSON();
		json.setResult(itemMasterVO);
		return json;

	}

	/**
	 * 품목그룹레벨 목록
	 */
	@RequestMapping(value = "/selectItemMasterSubItemDstinInfoList.do", method = RequestMethod.GET)
	public String selectItemMasterSubItemDstinInfoList(Model model) throws Exception {
		return "/mob/par/pmm/itemMaster/selectItemMasterSubItemDstinInfoList";
	}

	/**
	 * ItemGroupController.java 품목그룹레벨 목록 데이터를 조회한다.
	 *
	 * @param searchVO
	 *            - 조회 조건을 포함하는 ItemGroupSearchVO
	 * @return
	 */
	// @RequestMapping(value =
	// "/par/pmm/itemGroup/selectItemGroupLevelsItemGroup", method =
	// RequestMethod.POST)
	@RequestMapping(value = "/selectItemMasterSubItemDstinInfoData.do", method = RequestMethod.POST)
	@ApiOperation("配件信息（通用配件）")
	@ResponseBody
	// public SearchResult selectItemGroupLevelsItemGroup(@RequestBody
	// ItemGroupSearchVO searchVO) throws Exception{
	public BaseJSON selectItemMasterSubItemDstinInfoData(@RequestBody ItemGroupSearchVO searchVO) throws Exception {
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());

		SearchResult result = new SearchResult();
		List<ItemGroupLevelVO> itemGroupLevelVOList = new ArrayList<ItemGroupLevelVO>();
		itemGroupLevelVOList = PartItemGroupLevelService.selectItemGroupLevelsItemGroupByCondition(searchVO);

		result.setData(itemGroupLevelVOList);
		result.setTotal(itemGroupLevelVOList.size());

		BaseJSON json = new BaseJSON();
		json.setResult(result);

		return json;
	}

	/**
	 * 공용부품 마스터 목록
	 */
	@RequestMapping(value = "/selectItemMasterSubComItemList.do", method = RequestMethod.GET)
	public String selectItemMasterSubComItemList(Model model) throws Exception {
		return "/mob/par/pmm/itemMaster/selectItemMasterSubComItemList";
	}

	/**
	 * ItemMasterController.java Key에 해당하는 공용부품 마스터 정보를 조회한다.
	 *
	 * @param searchVO
	 *            - 조회 조건을 포함하는 ComItemMasterSearchVO
	 * @return
	 */
	// @RequestMapping(value = "/par/pmm/comItemMaster", method =
	// RequestMethod.POST)
	@RequestMapping(value = "/selectItemMasterSubComItemData.do", method = RequestMethod.POST)
	@ApiOperation("配件信息（通用配件）")
	@ResponseBody
	// public SearchResult comItemMaster(@RequestBody ComItemMasterSearchVO
	// searchVO) throws Exception {
	public BaseJSON selectItemMasterSubComItemData(@RequestBody ComItemMasterSearchVO searchVO) throws Exception {

		SearchResult result = new SearchResult();
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());

		result.setTotal(PartComItemMasterService.comItemMasterByKeyCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(PartComItemMasterService.comItemMasterByKey(searchVO));
		}
		BaseJSON json = new BaseJSON();
		json.setResult(result);
		return json;

	}

	/**
	 * 판매가 생성 대상선정 목록
	 */
	@RequestMapping(value = "/selectItemMasterSubItemPriceList.do", method = RequestMethod.GET)
	public String selectItemMasterSubItemPriceList(Model model) throws Exception {
		return "/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceList";
	}

	/**
	 * PartsSalePriceTargetMasterController.java 판매가 생성 대상선정 목록 데이타를 조회한다.
	 *
	 * @param searchVO
	 *            - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
	 * @return
	 */
	// @RequestMapping(value =
	// "/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters", method
	// = RequestMethod.POST)
	@RequestMapping(value = "/selectItemMasterSubItemPriceData.do", method = RequestMethod.POST)
	@ApiOperation("销售对象创建选定列表数据查询")
	@ResponseBody
	public BaseJSON selectItemMasterSubItemPriceData(@RequestBody PartsVenderSalPriceTargetMasterSearchVO searchVO)
			throws Exception {
		SearchResult result = new SearchResult();
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		// 딜러코드 검색 VO
		searchVO.setsDlrCd(mobLoginVO.getDlrCd());

		result.setTotal(
				PartPartsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(
					PartPartsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByCondition(searchVO));
		}
		BaseJSON json = new BaseJSON();
		json.setResult(result);
		return json;
	}

	/**
	 * 품목그룹레벨 목록 데이터를 조회한다.
	 *
	 * @param searchVO
	 *            - 조회 조건을 포함하는 ItemGroupSearchVO
	 *            
	
	 * @return
	 */
	@RequestMapping(value = "/selectItemGroupLevelsItemGroup.do", method = RequestMethod.POST)
	@ApiOperation("配件信息（配件类别）")
	@ResponseBody
	public BaseJSON selectItemGroupLevelsItemGroup(@RequestBody ItemGroupSearchVO searchVO) throws Exception {

		searchVO.setsDlrCd(LoginUtil.getDlrCd());

		SearchResult result = new SearchResult();
		List<ItemGroupLevelVO> itemGroupLevelVOList = new ArrayList<ItemGroupLevelVO>();
		itemGroupLevelVOList = PartItemGroupLevelService.selectItemGroupLevelsItemGroupByCondition(searchVO);

		result.setData(itemGroupLevelVOList);
		result.setTotal(itemGroupLevelVOList.size());

		BaseJSON json = new BaseJSON();
		json.setResult(result);
		return json;
	}

	/**
	 * 판매가 생성 대상선정 목록 데이타를 조회한다.
	 *
	 * @param searchVO
	 *            - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
	 * @return
	 */
	@RequestMapping(value = "/selectPartsVenderSalPriceTargetMasters.do", method = RequestMethod.POST)
	@ApiOperation("配件信息（配件价格）")
	@ResponseBody
	public BaseJSON selectPartsVenderSalPriceTargetMasters(
			@RequestBody PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception {
		SearchResult result = new SearchResult();

		// 딜러코드 검색 VO
		searchVO.setsDlrCd(LoginUtil.getDlrCd());

		result.setTotal(
				PartPartsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(
					PartPartsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByCondition(searchVO));
		}

		BaseJSON json = new BaseJSON();
		json.setResult(result);
		return json;
	}
}
