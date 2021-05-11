package chn.bhmc.dms.cmm.log.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.log.service.LogManagementService;
import chn.bhmc.dms.cmm.log.vo.ReceiveInterfaceLogSearchVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllReceiveInterfaceLogVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllSendInterfaceLogVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogManagementController.java
 * @Description : 日志管理controller层
 * @author chen shengan
 * @since 2021. 04. 28
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 28   chen shengan       日志管理controller层
 * </pre>
 */
@Controller
public class LogManagementController extends HController {

	
	@Resource(name = "logManagementService")
	LogManagementService logManagementService;
	
	/**
     * 跳转到接收接口日志页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectLogManagementMain.do", method = RequestMethod.GET)
	public String selectOrderConfirmMain(Model model) throws Exception {
		return "/cmm/log/logManagement/selectLogManagementMain";
	}
	
	/**
     * 跳转到接收接口日志详情页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectReceiveInterfaceLogEdit.do", method = RequestMethod.GET)
	public String selectReceiveInterfaceLogEdit(Model model) throws Exception {
		return "/cmm/log/logManagement/selectReceiveInterfaceLogEdit";
	}
	
	/**
     * 查询所有接收接口日志
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectReceiveInterfaceLog.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectReceiveInterfaceLog (@RequestBody ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO ) throws Exception {
		SearchResult result = new SearchResult();
		
		result.setTotal(logManagementService.selectReceiveInterfaceLogCnt(receiveInterfaceLogSearchVO));
		
		if (result.getTotal() != 0){ // 判断日志信息数量是否为零
			result.setData(logManagementService.selectReceiveInterfaceLog(receiveInterfaceLogSearchVO));
		}
		return result;
	}
	
	/**
     * 根据接收接口日志id查询详细信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectReceiveInterfaceLogById.do", method = RequestMethod.POST)
	@ResponseBody
	public List<SelectAllReceiveInterfaceLogVO> selectReceiveInterfaceLogById (@RequestBody ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO ) throws Exception {
		List<SelectAllReceiveInterfaceLogVO> list = logManagementService.selectReceiveInterfaceLogById(receiveInterfaceLogSearchVO);
		return list;
	}
	
	/**
     * 查询所有发送接口日志
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectSendInterfaceLog.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectSendInterfaceLog (@RequestBody ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO ) throws Exception {
		SearchResult result = new SearchResult();
		
		result.setTotal(logManagementService.selectSendInterfaceLogCnt(receiveInterfaceLogSearchVO));
		
		if (result.getTotal() != 0){ // 判断日志信息数量是否为零
			result.setData(logManagementService.selectSendInterfaceLog(receiveInterfaceLogSearchVO));
		}
		return result;
	}
	
	/**
     * 根据发送接口日志id查询详细信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/cmm/log/logManagement/selectSendInterfaceLogById.do", method = RequestMethod.POST)
	@ResponseBody
	public List<SelectAllSendInterfaceLogVO> selectSendInterfaceLogById (@RequestBody ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO ) throws Exception {
		List<SelectAllSendInterfaceLogVO> list = logManagementService.selectSendInterfaceLogById(receiveInterfaceLogSearchVO);
		return list;
	}
	
}
