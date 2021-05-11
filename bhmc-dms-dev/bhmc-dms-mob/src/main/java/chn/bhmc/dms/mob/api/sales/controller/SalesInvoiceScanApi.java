package chn.bhmc.dms.mob.api.sales.controller;

import javax.annotation.Resource;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.api.sales.service.SalesInvoiceScanService;
import chn.bhmc.dms.mob.api.sales.vo.SalesInvoiceVO;
import chn.bhmc.dms.mob.config.BaseJSON;

/**
 * 销售发票扫描
 * 2021-4-13
 * @author jiaMing
 */

@Controller
@Api("销售-扫一扫-机动车统一发票 ")
@RequestMapping(value = "/api/sales/invoice")
public class SalesInvoiceScanApi {
	
	
	@Resource(name = "salesInvoiceScanService")
	SalesInvoiceScanService salesInvoiceScanService;
	
	@ApiOperation("扫描发票信息")
	@RequestMapping(value = "/processInvoiceInformation.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON processInvoiceInformation(@RequestBody SalesInvoiceVO searchVo) {
		BaseJSON baseJSON = new BaseJSON();
		//SearchResult result = new SearchResult();
		String resVal  = "";
		try {
		     resVal = salesInvoiceScanService.processInvoiceInformation(searchVo);
		     //baseJSON.setResult(resVal);
//			result.setTotal(salesInvoiceScanService.selectInvoiceInfoCnt(searchVo));
//			if(result.getTotal() != 0){
//				result.setData(salesInvoiceScanService.selectInvoiceInfo(searchVo));
//			}
		} catch (Exception e) {
			baseJSON.setResultCode(1);
			baseJSON.setResultMsg("false");
			baseJSON.setResult("false");
			e.printStackTrace();
		}
		baseJSON.setResult(resVal);
		return baseJSON;
	}
	
	@ApiOperation("查询扫描发票信息")
	@RequestMapping(value = "/insertInvoiceInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON insertInvoiceInfo(@RequestBody SalesInvoiceVO saveVo){
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		try {
			salesInvoiceScanService.insertInvoiceInfo(saveVo);
		} catch (Exception e) {
			baseJSON.setResultCode(1);
			baseJSON.setResultMsg("false");
			e.printStackTrace();
		}
		baseJSON.setResult(result);
		return baseJSON;
	}
	
	@ApiOperation("更新扫描发票信息")
	@RequestMapping(value = "/updateInvoiceInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BaseJSON updateInvoiceInfo(@RequestBody SalesInvoiceVO updaVo){
		BaseJSON baseJSON = new BaseJSON();
		SearchResult result = new SearchResult();
		try {
			salesInvoiceScanService.updateInvoiceInfo(updaVo);
		} catch (Exception e) {
			baseJSON.setResultCode(1);
			baseJSON.setResultMsg("false");
			e.printStackTrace();
		}
		baseJSON.setResult(result);
		return baseJSON;
	}
	
}
