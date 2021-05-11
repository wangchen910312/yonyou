package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

import java.util.Date;

import able.com.web.HController;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceReceptionService;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
/**
 * 
 *<p>Title:索赔发票创建</p>
 * @author yixd 2021年4月7日23:00:52
 * @param
 * @return
 */
@Controller
public class ClaimInvoiceReceptionController extends HController{
	//索赔发票业务层
	@Resource(name="claimInvoiceReceptionService")
	ClaimInvoiceReceptionService claimInvoiceReceptionService;
	//页面下拉选框业务层
	@Resource(name="commonCodeService")
	CommonCodeService commonCodeService;
	//查询经销商信息业务层
	@Resource(name="dealerService")
    DealerService dealerService;
	
	 /**
	  * 
	  *<p>Title:索赔发票创建页面跳转</p>
	  * @author yixd
	  * @serialData 2021年4月8日
	  * @method 
	  * 1、页面时间赋值，
	  * 2、页面下拉选赋值
	  * 3、返回页面路径
	  * @param model
	  * @return String
	  * @throws Exception
	  */
	 @RequestMapping(value="/ser/wac/claimlnvoice/selectClaimInvoiceReceptionMain.do")
	 public String selectLaborManageMain(Model model)throws Exception{
		 String langCd = LocaleContextHolder.getLocale().getLanguage();
		 //1、页面时间赋值
		// model.addAttribute("sinvcsFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );//结算报表年月日开始时间
	    // model.addAttribute("sinvcsToDt", DateUtil.getDate("yyyy-MM-dd"));//结算报表年月日结束时间
		
		//判断是否过了9号 Y是 N否
		String tday = DateUtil.getDate(new Date(), "yyyymmdd");
		String tday09 = DateUtil.getDate(new Date(), "yyyymm09");
		String flag09 = "";
		
		if(Long.parseLong(tday)>Long.parseLong(tday09)){//9号后
			flag09 = "Y";
		}else{//9号及9号前 
			flag09 = "N";
		}
		model.addAttribute("flag09", flag09);
		
		//获取经销商信息
		DealerVO dealerVO = dealerService.selectDealerByKey(LoginUtil.getDlrCd());

	 	model.addAttribute("senderNmDefault", LoginUtil.getUserNm());//寄件人姓名
	 	model.addAttribute("senderTelnoDefault", LoginUtil.getPrefixCustNo());//寄件人联系电话
	 	model.addAttribute("senderAddrDefault", dealerVO.getAddr1Nm());//寄件人地址
		
		 //页面下拉选赋值
		 model.addAttribute("receiptTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF004", null, langCd));//发票状态
		 model.addAttribute("trsfTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF005", null, langCd));//快递状态
		 model.addAttribute("paymTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF006", null, langCd));//汇(收)款状态
		 model.addAttribute("failMsgDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF007", null, langCd));//退票原因
		 model.addAttribute("cancelYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF008", null, langCd));//是否取消
		 model.addAttribute("expsCmpNmDs", commonCodeService.selectCommonCodesByCmmGrpCd("SEF009", null, langCd));//快递公司
		 return "/ser/wac/claimlnvoice/selectClaimInvoiceReceptionMain";
	 }
	 
	   /**
	    * 
	    *<p>Title:获取索赔发票结算单列表数据</p>
	    * @author yixd
		* @serialData 2021年4月8日
		* @method 
		* 1、查询列表数量
		* 2、查询列表数据
	    * @param searchVO
	    * @return SearchResult
	    * @throws Exception
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/selectClaimInvoiceReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public SearchResult selectClaimInvoiceReception(@RequestBody ClaimInvoiceSearchVO searchVO)throws Exception{

	        SearchResult result = new SearchResult();
	        
	        result.setTotal(claimInvoiceReceptionService.selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(searchVO)); //1、查询列表数量
	        if(result.getTotal() != 0){
	            result.setData(claimInvoiceReceptionService.selectClaimInvoiceReceptionForInvoiceByInvoicel(searchVO));//2、查询列表数据
	        }

	      return result;

	   }
	   
	   
	   
	   /**
	    * 
	    *<p>Title:获取索赔发票单列表数据</p>
	    * @author yixd
		* @serialData 2021年4月8日
		* @method 
		* 1、查询列表数量
		* 2、查询列表数据（根据备注单号进行查询）
	    * @param searchVO
	    * @return SearchResult
	    * @throws Exception
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/selectClaimInvoiceDetail.do", method = RequestMethod.POST)
	   @ResponseBody
	   public SearchResult selectClaimInvoiceDetail(@RequestBody ClaimInvoiceDetailSearchVO searchVO)throws Exception{

	        SearchResult result = new SearchResult();
	        
	        result.setTotal(claimInvoiceReceptionService.selectClaimInvoiceDetailForInvoiceByInvoiceCnt(searchVO)); //1、查询列表数量
	        if(result.getTotal() != 0){
	            result.setData(claimInvoiceReceptionService.selectClaimInvoiceDetailForInvoiceByInvoicel(searchVO));//2、查询列表数据
	        }

	      return result;

	   }
	   
	   /**
	    * 
	    *<p>Title:取消、退票接收、保存、提报操作</p>
	    * @author yixd
	    * @serialData 2021年4月14日
		* @method 
		* 09 取消、 04退票接收、10保存、20提报
	    * @param searchVO
	    * @return String
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/updateClaimInvoiceReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public String updateClaimInvoiceReception(@RequestBody ClaimInvoiceSearchVO searchVO){
		   String result = "success";//返回退票结果
		   String invcNo = searchVO.getSinvcNo();//索赔结算单信息
		   try{
			   //09 取消操作 04退票接收 10保存 20提报
			   if("09".equals(searchVO.getSreceiptTp())){
				   result = claimInvoiceReceptionService.cancelClaimInvoiceReception(invcNo);//取消操作
			   }else if("04".equals(searchVO.getSreceiptTp())){
				   result = claimInvoiceReceptionService.quitReceiveClaimInvoiceReception(invcNo);//退票接收操作
			   }else if("10".equals(searchVO.getSreceiptTp())){
				   result = claimInvoiceReceptionService.saveReceiveClaimInvoiceReception(searchVO);//保存操作
			   }else if("20".equals(searchVO.getSreceiptTp())){
				   result = claimInvoiceReceptionService.submitReceiveClaimInvoiceReception(searchVO);//提报操作
			   }
		   }catch(Exception e){
			   System.out.println(e.getMessage());
			   result = e.getMessage();
		   }
		   return 	result;   
	   }
	   
	    
	    /**
	    * 
	    *<p>Title:删除发票子表操作</p>
	    * @author yixd
	    * @serialData 2021年4月14日
		* @method 
	    * @param searchVO
	    * @return String
	    */
	   @RequestMapping(value = "/ser/wac/claimlnvoice/delClaimInvoiceDetailReception.do", method = RequestMethod.POST)
	   @ResponseBody
	   public String delClaimInvoiceDetailReception(@RequestBody ClaimInvoiceDetailVO searchVO){
		   String result = "success";//返回退票结果
		   try{
			   result = claimInvoiceReceptionService.delClaimInvoiceDetailReception(searchVO);//删除
		   }catch(Exception e){
			   System.out.println(e.getMessage());
			   result = e.getMessage();
		   }
		   return 	result;   
	   }
	    
	 
}
