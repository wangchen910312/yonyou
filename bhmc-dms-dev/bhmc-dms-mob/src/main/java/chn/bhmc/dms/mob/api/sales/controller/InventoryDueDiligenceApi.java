package chn.bhmc.dms.mob.api.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.api.sales.service.SalesBinLocationMasterService;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesStockDueService;
import chn.bhmc.dms.mob.api.sales.service.SalesStorageService;
import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockDueSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StorageSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 재고실사
 *
 * @author park mi yeon
 * @since 2016. 07. 15
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.15         park mi yeon    최초생성
 * </pre>
 */
@Api("销售-库存盘点接口")
@Controller
@RequestMapping(value = "/api/sales/inventoryDueDiligence")
public class InventoryDueDiligenceApi extends HController {

	@Autowired
    SalesCommonCodeService SalesCommonCodeService;

	@Autowired
    SalesCarInfoService SalesCarInfoService;

	@Autowired
    SalesStorageService SalesStorageService;

	@Autowired
    SalesBinLocationMasterService SalesBinLocationMasterService;

	@Autowired
    SalesStockDueService SalesStockDueService;

	/**
	 * 库存清点屏幕输出
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ApiOperation("页面跳转筛选信息")
    @RequestMapping(value = "/selectInventoryDueDiligenceMain.do", method = RequestMethod.GET)
	@ResponseBody
    public BaseJSON selectInventoryDueDiligenceMain(Model model) throws Exception{

		//BaseJSON baseJSON=new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
//        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        model.addAttribute("sysDate", sysDate);

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 실사구분 SAL017
        model.addAttribute("stockDdDstinCdInfo", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL017", null, langCd));
        // 차량상태(재고상태) SAL001
        model.addAttribute("carStatCdInfo", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));


        // 여부(Y/N) COM020
        model.addAttribute("ynDs", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("storageList", SalesStorageService.selectStoragesByCondition(storageSearchVO));
        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("locDSList", SalesBinLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        //재고월령
        model.addAttribute("agingCntDSList", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL169", null, langCd));

      //把model中的数据都set到baseJSON的result中
        //baseJSON.setResult(model);
        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/inv/inventoryDueDiligence/baseJsp/selectInventoryDueDiligenceMain.jsp");
        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON json = new BaseJSON();
        json.setResult(model.asMap());
        return json;
    }

	 /**
     * 库存查询列表
     * @param ConfirmWearingVehicleSearchVO : barcodeList - 바코드 값
     * @param bindingResult
     * @return
     */
	@ApiOperation("库存查询列表")
    @RequestMapping(value = "/selectStockDueDetailMobSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectStockDueDetailMobSearch(@RequestBody StockDueSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();

        result.setTotal(SalesStockDueService.selectStockDueDetailMobsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(SalesStockDueService.selectStockDueDetailMobsByCondition(searchVO));
            baseJSON.setResult(result);
            return baseJSON;
        }
        baseJSON.setResultCode(1);
        baseJSON.setResultMsg("没有数据或者查询失败");

        return baseJSON;
    }

	/**
     * 成品入库-条码信息上交
     * @param ConfirmWearingVehicleSearchVO : barcodeList - 바코드 값
     * @param bindingResult
     * @return
     */
	@ApiOperation("成品入库-条码信息上交")
    @RequestMapping(value = "/getCarNameByBarcode.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON getCarNameByBarcode(@RequestBody String barcode) throws Exception {
		BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();
        CarInfoSearchVO searchVO=new CarInfoSearchVO();
        searchVO.setBarCode(barcode);
        result.setData(SalesCarInfoService.selectBarcodeCarNmByCondition(searchVO));
        baseJSON.setResult(result);
        return baseJSON;
    }

}
