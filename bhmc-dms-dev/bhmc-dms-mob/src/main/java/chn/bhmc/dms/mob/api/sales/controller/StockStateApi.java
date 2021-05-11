package chn.bhmc.dms.mob.api.sales.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesBinLocationMasterService;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesCrmCommonService;
import chn.bhmc.dms.mob.api.sales.service.SalesStockMntService;
import chn.bhmc.dms.mob.api.sales.service.SalesStorageService;
import chn.bhmc.dms.mob.api.sales.service.SalesVehicleSpecComboCommService;
import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockMntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.UserVO;
import chn.bhmc.dms.mob.api.sales.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.sal.inv.service.StockDueService;
import chn.bhmc.dms.sal.inv.service.StockMntService;
import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;
import chn.bhmc.dms.sal.inv.vo.StockMntSaveVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 재고상태관리
 *
 * @author Park Sung sin
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.21         Park Sung sin            최초 생성
 * </pre>
 */

@Api("销售-库存盘点结果接口")
@Controller
@RequestMapping(value = "/api/sales/stockState")
public class StockStateApi extends HController {

	@Autowired
	SalesCommonCodeService SalesCommonCodeService;

	@Autowired
	StockDueService stockDueService;

	@Autowired
	SalesCarInfoService SalesCarInfoService;

	@Autowired
	SalesStorageService SalesStorageService;

	@Autowired
	SalesBinLocationMasterService SalesBinLocationMasterService;

	@Autowired
	SalesCrmCommonService SalesCrmCommonService;

	@Autowired
	StockMntService stockMntService;
	
	@Autowired
	SalesStockMntService salesStockMntService;

	@Autowired
	SalesVehicleSpecComboCommService SalesVehicleSpecComboCommService;

	/**
	 * 打印库存状态
	 *
	 * @return
	 */
	@ApiOperation("页面跳转筛选信息")
	@RequestMapping(value = "/selectStockStateMain.do", method = RequestMethod.GET)
	@ResponseBody
	public BaseJSON selectStockStateMain(Model model) throws Exception {

		// BaseJSON baseJSON = new BaseJSON();
		String langCd = LocaleContextHolder.getLocale().getLanguage();

		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		model.addAttribute("userId", mobLoginVO.getUserId());
		model.addAttribute("userNm", mobLoginVO.getUserNm());
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

//		model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
//		model.addAttribute("threeMonthDay", DateUtil.getDate(
//				DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));
		// 여부(Y/N) COM020
		model.addAttribute("ynDs", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
		// 손상여부 SAL049
		model.addAttribute("damageDS", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL049", null, langCd));
		// 회사차구분 SAL053
		model.addAttribute("cmpCarDstinCdDS", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));
		// 재고용차량상태 SAL192
		model.addAttribute("carStatCdDS", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL192", null, langCd));
		// 보유상태 SAL149
		model.addAttribute("ownStatCdDS", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
		// 오더상세유형(오더유형) SAL137
		model.addAttribute("ordTpDS", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
		// 창고
		StorageSearchVO storageSearchVO = new StorageSearchVO();
		storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
		model.addAttribute("storageList",
				SalesStorageService.selectStoragesByCondition(storageSearchVO));
		// 차종
		CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
		carInfoSearchVO.setUseYn("Y"); // 사용여부
		model.addAttribute("carLineCdInfo",
				SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
		// 판매사원 리스트
		// VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
		List<UserVO> saleEmpList = SalesCrmCommonService
				.selectMngScIdListByCondition(); // 판매고문 : ROLE_SALES_ADVISOR
		model.addAttribute("saleEmpDSInfo", saleEmpList);
		// 판매인 여부
		String saleEmpYn = "N";
		// VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
		if (LoginUtil.hasRole("ROLE_SALES_ADVISOR")) {
			saleEmpYn = "Y";
		}
		model.addAttribute("saleEmpYn", saleEmpYn);
		BaseJSON json = new BaseJSON();
		json.setResult(model.asMap());
		return json;
	}

	/**
	 * 재고실사결과 화면을 출력한다.
	 *
	 * @return
	 */

	/**
	 * 查询库存管理信息
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("查询库存管理信息")
	@RequestMapping(value = "/selectStockState.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectStockState(@RequestBody StockMntSearchVO searchVO)
			throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		searchVO.setsDlrCd(mobLoginVO.getDlrCd()); // 딜러코드

		result.setTotal(salesStockMntService
				.selectAppStockMntGroupsByConditionCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(salesStockMntService
					.selectAppStockMntGroupsByCondition(searchVO));
			baseJSON.setResult(result);
			return baseJSON;
		}

		return baseJSON;
	}

	/**
	 * 库存管理咨询
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("库存管理咨询")
	@RequestMapping(value = "/selectStockMntSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectStockStateSub(@RequestBody StockMntSearchVO searchVO)
			throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); // 딜러코드
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

		result.setTotal(salesStockMntService.selectStockMntsByConditionCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(salesStockMntService.selectStockMntsByCondition(searchVO));
			baseJSON.setResult(result);
			return baseJSON;
		}

		return baseJSON;
	}

	/**
	 * 재고상태관리 유형정보를 등록한다. : 상태변동유형 SAL009 에 따라 저장
	 */
	@ApiOperation("库存管理详细页修改保存功能")
	@RequestMapping(value = "/multiStockMnt.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON multiStockMnt(@RequestBody StockMntSaveVO saveVO) {
		BaseJSON baseJSON = new BaseJSON();
		try {
			stockMntService.multiStockMnt(saveVO);
			baseJSON.setResultCode(0);
			baseJSON.setResultMsg("true");
		} catch (Exception e) {
			baseJSON.setResultCode(1);
			baseJSON.setResultMsg("false");
			e.printStackTrace();
		}
		return baseJSON;
	}

	/**
	 * 贷款查询
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("贷款查询")
	@RequestMapping(value = "/selectFscList.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectFscList(@RequestBody VehicleSpecSearchVO searchVO)
			throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		result.setData(SalesVehicleSpecComboCommService
				.selectModelTypeCombo(searchVO));
		return baseJSON;
	}

	/**
	 * 位置查询
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("位置查询")
	@RequestMapping(value = "/selectLocation.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectLocation(@RequestBody String storage)
			throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
		locSearchVO.setsDlrCd(mobLoginVO.getDlrCd()); // 딜러코드
		locSearchVO.setsStrgeCd(storage);

		result.setData(SalesBinLocationMasterService
				.selectBinLocationMastersByCondition(locSearchVO));
		baseJSON.setResult(result);
		return baseJSON;
	}

	/**
	 * 清点库存功能
	 *
	 * @return
	 */
	@ApiOperation("库存清点结果功能页面显示，必须登录之后才能测试")
	@RequestMapping(value = "/selectStockStateResultMain.do", method = RequestMethod.GET)
	public String selectStockStateResultMain(Model model) throws Exception {

		// BaseJSON baseJSON=new BaseJSON();
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		String sysDate = DateUtil.getDate("yyyy-MM-dd");
		model.addAttribute("sysDate", sysDate);
		// 必须登录之后才能测试
		MobLoginVO mobLoginVO = MobUtil.getLoginVO();
		model.addAttribute("userId", mobLoginVO.getUserId());
		model.addAttribute("userNm", mobLoginVO.getUserNm());
		model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
		model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

		// 실사구분 SAL017
		model.addAttribute("stockDdDstinCdInfo", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL017", null, langCd));
		// 차량상태(재고상태) SAL001
		model.addAttribute("carStatCdInfo", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

		// 여부(Y/N) COM020
		model.addAttribute("ynDs", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
		// 창고
		StorageSearchVO storageSearchVO = new StorageSearchVO();

		storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());

		model.addAttribute("storageList",
				SalesStorageService.selectStoragesByCondition(storageSearchVO));
		// 위치
		BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();

		locSearchVO.setsDlrCd(mobLoginVO.getDlrCd());

		model.addAttribute("locDSList", SalesBinLocationMasterService
				.selectBinLocationMastersByCondition(locSearchVO));
		// 차종
		CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
		carInfoSearchVO.setUseYn("Y"); // 사용여부
		model.addAttribute("carLineCdInfo",
				SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
		// 재고월령
		model.addAttribute("agingCntDSList", SalesCommonCodeService
				.selectCommonCodesByCmmGrpCd("SAL169", null, langCd));

		// 把model中的数据都set到baseJSON的result中
		// baseJSON.setResult(model);
		model.addAttribute(
				"_urlBaseJsp",
				"/WEB-INF/jsp/ZnewMob/sal/inv/stockState/baseJsp/selectStockStateResultMain.jsp");
		return "/ZnewMob/templatesNewMob/mobTemplateA";
		// return baseJSON;
	}

	/**
	 * 库存清点结果查询
	 *
	 * @param searchVO
	 * @return
	 */
	@ApiOperation("库存清点结果")
	/*
	 * @ApiImplicitParams({
	 *
	 * @ApiImplicitParam(paramType = "query", name = "dlrCd", dataType =
	 * "String", required = true, value = "经销商Code", defaultValue = "D0103") })
	 */
	@RequestMapping(value = "/selectStockDueDetailSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectStockDueDetailSearch(
			@RequestBody StockDueSearchVO searchVO) throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		searchVO.setsDlrCd(LoginUtil.getDlrCd()); // 딜러코드

		result.setTotal(stockDueService
				.selectStockDueDetailListsByConditionCnt(searchVO));

		if (result.getTotal() != 0) {
			result.setData(stockDueService
					.selectStockDueDetailListsByCondition(searchVO));
			baseJSON.setResult(result);
			//return baseJSON;
		}
		/*baseJSON.setResultCode(1);
		baseJSON.setResultMsg("没有查到数据或者出现异常");*/
		return baseJSON;
	}

	/**
	 * 生成库存
	 *
	 * @return
	 * @throws Exception
	 */
	@ApiOperation("生成库存")
	/*
	 * @ApiImplicitParams({
	 *
	 * @ApiImplicitParam(paramType = "query", name = "dlrCd", dataType =
	 * "String", required = true, value = "经销商Code", defaultValue = "D0103") })
	 */
	@RequestMapping(value = "/CreateStockDueInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON CreateStockDueInfo(@Validated @RequestBody StockDueVO saveVO)
			throws Exception {
		BaseJSON baseJSON = new BaseJSON();
		saveVO.setDlrCd(LoginUtil.getDlrCd());
		if (stockDueService.CreateStockDueInfo(saveVO) > 0) {
			return baseJSON;
		}
		baseJSON.setResultCode(1);
		baseJSON.setResultMsg("查询失败");
		return baseJSON;
	}





/**
 *
 * @param model
 * @return
 * @throws Exception
 */
@ApiOperation("库存管理获取详细页获取动态数据")
@ResponseBody
@RequestMapping(value = "/selectStockStateMains.do", method = RequestMethod.GET)
public BaseJSON selectStockStateMains(Model model) throws Exception{

    String langCd = LocaleContextHolder.getLocale().getLanguage();

    MobLoginVO mobLoginVO = MobUtil.getLoginVO();
    model.addAttribute("userId", mobLoginVO.getUserId());
    model.addAttribute("userNm", mobLoginVO.getUserNm());
    model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
    model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


    model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
    model.addAttribute("threeMonthDay", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));
    // 여부(Y/N) COM020
    model.addAttribute("ynDs", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
    // 손상여부 SAL049
    model.addAttribute("damageDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL049", null, langCd));
    // 회사차구분 SAL053
    model.addAttribute("cmpCarDstinCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));//公司车类型
    // 재고용차량상태 SAL192
    model.addAttribute("carStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL192", null, langCd));
    // 보유상태 SAL149
    model.addAttribute("ownStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
    // 오더상세유형(오더유형) SAL137
    model.addAttribute("ordTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
    // 창고
    StorageSearchVO storageSearchVO    = new StorageSearchVO();
    storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
    model.addAttribute("storageList", SalesStorageService.selectStoragesByCondition(storageSearchVO));//仓库
    //차종
    CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
    carInfoSearchVO.setUseYn("Y");                       // 사용여부
    model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
    // 판매사원 리스트
    //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
    List<UserVO> saleEmpList = SalesCrmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR //销售顾问
    model.addAttribute("saleEmpDSInfo", saleEmpList);
    // 판매인 여부
    String saleEmpYn = "N";
    //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
    if( LoginUtil.hasRole("ROLE_SALES_ADVISOR") ) {
        saleEmpYn = "Y";
    }
    model.addAttribute("saleEmpYn", saleEmpYn);
    model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/inv/stockState/baseJsp/selectStockStateMain.jsp");

    BaseJSON baseJSON=new BaseJSON();
    baseJSON.setResult(model);
    return baseJSON;
}


}