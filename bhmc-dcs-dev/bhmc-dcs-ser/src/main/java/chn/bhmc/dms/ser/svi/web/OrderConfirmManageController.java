package chn.bhmc.dms.ser.svi.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.OrderConfirmManageService;
import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinSaveVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrSearchVO;
import chn.bhmc.dms.ser.svi.vo.OfficeTableVO;
import chn.bhmc.dms.ser.svi.vo.RegionTableVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderConfirmManageController.java
 * @Description : 工单确认条件设置controller层
 * @author chen shengan
 * @since 2021. 04. 01
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 01   chen shengan       工单确认条件设置controller层
 * </pre>
 */
@Controller
public class OrderConfirmManageController extends HController {
	
	@Resource(name = "orderConfirmManageService")
	OrderConfirmManageService orderConfirmManageService;

	/**
     * 跳转到工单确认条件设置主页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/selectOrderConfirmMain.do", method = RequestMethod.GET)
	public String selectOrderConfirmMain(Model model) throws Exception {
		model.addAttribute("officeList", orderConfirmManageService.findOffice(null));
		model.addAttribute("regionList", orderConfirmManageService.findRegion(null));
		return "/ser/svi/orderConfirm/selectOrderConfirmMain";
	}
	
	/**
     * 跳转到经销商车种设置页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/selectOrderConfirmToCarline.do", method = RequestMethod.GET)
	public String selectOrderConfirmToCarline(Model model) throws Exception {
		return "/ser/svi/orderConfirm/selectOrderConfirmToCarline";
	}
	
	/**
     * 跳转到经销商车辆用途设置页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/selectOrderConfirmToPcDstin.do", method = RequestMethod.GET)
	public String selectOrderConfirmToPcDstin(Model model) throws Exception {
		return "/ser/svi/orderConfirm/selectOrderConfirmToPcDstin";
	}
	
	/**
     * 查询所有经销商信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/findAllDlr.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult findAllDlr (@RequestBody FindAllDlrSearchVO findAllDlrSearchVO ) throws Exception {
		SearchResult result = new SearchResult();
		
		result.setTotal(orderConfirmManageService.findAllDlrCnt(findAllDlrSearchVO));
		
		if (result.getTotal() != 0){
			result.setData(orderConfirmManageService.findAllDlr(findAllDlrSearchVO));
		}
		return result;
	}
	
	/**
     * 查询区域信息
     * @param offCd 办事处代码
     * @return List<RegionTableVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/findRegion.do", method = RequestMethod.POST)
	@ResponseBody
	public List<RegionTableVO> findRegion (String offCd) throws Exception{
		return orderConfirmManageService.findRegion(offCd);
	}
	
	/**
     * 查询办事处信息
     * @param diviCd 区域代码
     * @return List<RegionTableVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/findOffice.do", method = RequestMethod.POST)
	@ResponseBody
	public List<OfficeTableVO> findOffice (String diviCd) throws Exception{
		return orderConfirmManageService.findOffice(diviCd);
	}
	
	/**
     * 查询车辆用途信息
     * @param 
     * @return List<FindAllCarlineAndPcDstinVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/finAllPcDstin.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult finAllPcDstin () throws Exception{
		SearchResult result = new SearchResult();
		result.setData(orderConfirmManageService.findAllPcDstin());
		return result;
	}
	
	/**
     * 查询车种信息
     * @param 
     * @return List<FindAllCarlineAndPcDstinVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/finAllCarline.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult finAllCarline (@RequestBody FindAllDlrSearchVO findAllDlrSearchVO ) throws Exception{
		SearchResult result = new SearchResult();
		result.setData(orderConfirmManageService.findAllCarline(findAllDlrSearchVO));
		result.setTotal(orderConfirmManageService.findAllCarlineCnt(findAllDlrSearchVO));
		return result;
	}
	
	/**
     * 根据经销商代码查询车辆用途信息
     * @param 
     * @return List<FindAllCarlineAndPcDstinVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/finPcDstinByDlr.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult finPcDstinByDlr (@RequestBody FindAllDlrSearchVO findAllDlrSearchVO) throws Exception{
		SearchResult result = new SearchResult();
		result.setData(orderConfirmManageService.findPcDstinByDlr(findAllDlrSearchVO));
		return result;
	}
	
	/**
     * 根据经销商代码查询车种信息
     * @param 
     * @return List<FindAllCarlineAndPcDstinVO>
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/finCarlineByDlr.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult finCarlineByDlr (@RequestBody FindAllDlrSearchVO findAllDlrSearchVO ) throws Exception{
		SearchResult result = new SearchResult();
		result.setData(orderConfirmManageService.findCarlineByDlr(findAllDlrSearchVO));
		result.setTotal(orderConfirmManageService.findCarlineCntByDlr(findAllDlrSearchVO));
		return result;
	}
	
	/**
     * 根据经销商代码修改工单确认条件
     * @param 
     * @return Boolean
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/updateOrderConfirmByDlr.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean updateOrderConfirmByDlr (@Validated @RequestBody FindAllCarlineAndPcDstinSaveVO saveVo ) throws Exception{
		orderConfirmManageService.updateOrderConfirmByDlr(saveVo);
		return true;
	}
	
	/**
     * 修改全网工单确认条件
     * @param 
     * @return Boolean
     */
	@RequestMapping(value = "/ser/svi/orderConfirm/updateAllOrderConfirm.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean updateAllOrderConfirm (@Validated @RequestBody FindAllCarlineAndPcDstinSaveVO saveVo ) throws Exception{
		return orderConfirmManageService.updateAllOrderConfirm(saveVo);
	}
	
}
