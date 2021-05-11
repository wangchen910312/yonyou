package chn.bhmc.dms.mob.api;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import chn.bhmc.dms.mob.config.BaseJSON;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/api/carInfo")
@Api("车辆相关信息")
public class VehicleMasterApi {

	/**
	 * 차관적용차량스펙콤보서비스
	 */
	@Resource(name = "vehicleSpecComboCommService")
	VehicleSpecComboCommService vehicleSpecComboCommService;

	/**
	 * @Title: selectCarLinCdInfoList
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return SearchResult
	 * @throws
	 */
	@ApiOperation("车种")
	@RequestMapping(value = "/selectCarlineCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectCarLinCdInfoList( @RequestBody VehicleSpecSearchVO searchVO) {
		BaseJSON baseJ = new BaseJSON();
		SearchResult result = new SearchResult();
		try {
			result.setData(vehicleSpecComboCommService
					.selectCarlineCombo(searchVO));
			baseJ.setResultCode(0);
			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
		baseJ.setResult(result);
		return baseJ;
	}

	/**
	 *
	 * @Title: selectFscList
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return BaseJSON
	 * @throws
	 */
	@ApiOperation("车款")
	@RequestMapping(value = "/selectModelTypeCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectFscList(@RequestBody VehicleSpecSearchVO searchVO) {
		BaseJSON baseJ = new BaseJSON();
		SearchResult result = new SearchResult();
		try {
			result.setData(vehicleSpecComboCommService.selectModelTypeCombo(searchVO));
			baseJ.setResultCode(0);
			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
		baseJ.setResult(result);
		return baseJ;
	}

	/**
	 *
	 * @Title: selectFscOcnList
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return BaseJSON
	 * @throws
	 */
	@ApiOperation("OCN")
	@RequestMapping(value = "/selectOcnCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectFscOcnList(@RequestBody VehicleSpecSearchVO searchVO) {
		SearchResult result = new SearchResult();
		BaseJSON baseJ = new BaseJSON();
		try {
			result.setData(vehicleSpecComboCommService.selectOcnCombo(searchVO));
			baseJ.setResultCode(0);
			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
		baseJ.setResult(result);
		return baseJ;
	}

	/**
	 *
	 * @Title: selectNewCarLooksExtClrListByCondition
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return BaseJSON
	 * @throws
	 */
	@ApiOperation("外色")
	@RequestMapping(value = "/selectExtColorCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectNewCarLooksExtClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO)  {
		SearchResult result = new SearchResult();
		BaseJSON baseJ = new BaseJSON();
		try {
			result.setData(vehicleSpecComboCommService.selectExtColorCombo(searchVO));
			baseJ.setResultCode(0);
			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
		baseJ.setResult(result);
		return baseJ;
	}

	/**
	 *
	 * @Title: selectNewCarLooksIntClrListByCondition
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return BaseJSON
	 * @throws
	 */
	@ApiOperation("内色")
	@RequestMapping(value = "/selectIntColorCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON selectNewCarLooksIntClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO)  {
		SearchResult result = new SearchResult();
		BaseJSON baseJ = new BaseJSON();
		try {
			result.setData(vehicleSpecComboCommService.selectIntColorCombo(searchVO));
			baseJ.setResultCode(0);
			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

		baseJ.setResult(result);
		return baseJ;
	}
	 /**
     * CustomerInfoOutBoundService
     */
    @Resource(name = "customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

	/**
	 *
	 * @Title: customerListSearch
	 * @Description: TODO
	 * @param @param searchVO
	 * @param @return
	 * @return BaseJSON
	 * @throws
	 */
    @ApiOperation("客户列表")
    @RequestMapping(value = "/customerListSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON customerListSearch(@RequestBody CustomerInfoSearchVO searchVO)  {
        SearchResult result = new SearchResult();
        BaseJSON baseJ = new BaseJSON();
        try {
        	 result.setTotal(customerInfoOutBoundService.selectCustomerListByConditionCnt(searchVO));
             if (result.getTotal() != 0) {
                 result.setData(customerInfoOutBoundService.selectCustomerListByCondition(searchVO));
             }
            baseJ.setResultCode(0);
 			baseJ.setResultMsg("成功");
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
        baseJ.setResult(result);
		return baseJ;
    }


}



