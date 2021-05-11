package chn.bhmc.dms.sal.com.web;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.com.service.CommercialInsuranceService;
import chn.bhmc.dms.sal.com.vo.CommercialInsuranceVO;

/**
 * 商业保险查询
 *
 * @author wushibin
 * @since 2019.7. 4
 * @version 1.0
 * @see
 */

@Controller
@RequestMapping(value = "/sal/com")
public class CommercialInsuranceController extends HController {
	
	
    @Resource(name="commercialInsuranceService")
    CommercialInsuranceService commercialInsuranceService;


    //商业保险查询 jsp地址
    @RequestMapping(value = "/selectCommercialInsuranceMain.do", method = RequestMethod.GET)
    public String selectFinancialProductMngMain(Model model) throws Exception {
        return "/sal/com/selectCommercialInsuranceMain";
    }
    
    
    //保险历史查询 jsp地址
    @RequestMapping(value = "/selectInsuranceHistoryMain.do", method = RequestMethod.GET)
    public String selectInsuranceHistoryMain(Model model) throws Exception {
        return "/sal/com/selectInsuranceHistoryMain";
    }

    
	/**
	 * 保险历史查询 （20190731确认查询数据表COMMERCIAL_INSURANCE）
	 * 
	 * @param commercialInsuranceVO
	 * @return
	 */
	@RequestMapping(value = "/selectCommercialInsurance.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectCommercialInsurance(@RequestBody CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		SearchResult result = new SearchResult();
		commercialInsuranceVO.setNote3("2");
		result.setTotal(commercialInsuranceService.selectcontByCarNo(commercialInsuranceVO));
		if(result.getTotal() != 0){
            result.setData(commercialInsuranceService.sendPostReq(commercialInsuranceVO));
        }
		return result;
	}
	
	
	
	
	/**
	 * 商业保险查询 （20190808 保留原有功能）
	 * 
	 * @param commercialInsuranceVO
	 * @return
	 */
	@RequestMapping(value = "/selectInfoByCarRegNo.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectInfoByCarRegNo(@RequestBody CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		SearchResult result = new SearchResult();
		List<CommercialInsuranceVO> selectInfoByCarRegNo = commercialInsuranceService.selectInfoByCarRegNo(commercialInsuranceVO);
		if (selectInfoByCarRegNo==null) {
			result.setTotal(0);
		}else {
			result.setTotal(selectInfoByCarRegNo.size());
		}
		if(result.getTotal() != 0){
            result.setData(selectInfoByCarRegNo);
        }
		return result;
	}
	

	
	/**
	 * 保险提醒（查询+插入数据表）
	 * 
	 * @param searchVO
	 * @return
	 */
	@RequestMapping(value = "/selectInsuranceExpires.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectInsuranceExpires(@RequestBody CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		SearchResult result = new SearchResult();
		List<CommercialInsuranceVO> commercialInsuranceVOs = commercialInsuranceService.insuranceExpires(commercialInsuranceVO);
		if (commercialInsuranceVOs==null) {
			result.setTotal(0);
		}else {
			result.setTotal(commercialInsuranceVOs.size());
		}
		if(result.getTotal() != 0){
            result.setData(commercialInsuranceVOs);
        }
		return result;
	}
	
	
	
}
