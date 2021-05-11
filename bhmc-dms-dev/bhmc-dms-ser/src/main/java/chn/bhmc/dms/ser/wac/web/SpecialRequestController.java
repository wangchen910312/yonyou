package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SpecialRequestService;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaSaveVO;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestSearchVo;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestVo;

/**  
 * @ClassName: SpecialRequestController
 * <p>Title:DMS特殊申请（保修工单确认申请） </p >
 * @Description: controller
 * @author wangc
 * @date 2021-03-29 02:55:01 
*/  
@Controller
public class SpecialRequestController extends HController{

    @Autowired
    CommonCodeService commonCodeService;
    
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;//时间格式化工具类
    
    
    @Resource(name="specialRequestService")
    SpecialRequestService specialRequestService;//DMS特殊申请
	
	 /**
	  * 
	  * @MethodName: selectSpecialRequestMain
	  * <p>Title: 查询特殊申请工单信息(初始化)</p >
	  * @Description: 查询工单与申请单拼接信息
	  * 1、查询共同编码放入到集合里面
	  * 2、申请时间段赋值以及工单时间段赋值
	  * 3、返回JSP的url路径
	  * @author wangc
	  * @param model
	  * @return "/ser/wac/special/selectSpecialRequestMain"
	  * @throws Exception String
	  */
     @RequestMapping(value="/ser/wac/special/selectSpecialRequestMain.do" , method=RequestMethod.GET)
	 public String selectSpecialRequestMain(Model model
	           ,HttpServletRequest request)throws Exception{
		 	String langCd = LocaleContextHolder.getLocale().getLanguage();
		 	String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
		 	String reqTskNm = "";//申请人岗位
		 	String reqHpNo ="";//申请人手机
		 	
		 	//1、共同编码放入集合做返显
		 	model.addAttribute("reqStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER601", null, langCd));//单据状态
		 	model.addAttribute("reqReasonTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER602", null, langCd));//申请原因类别
		 	model.addAttribute("sreqUsrId", LoginUtil.getUserId());//申请人ID
		 	model.addAttribute("sreqUsrNm", LoginUtil.getUserNm());//申请人姓名
		 	reqTskNm = specialRequestService.selectReqTskNm(LoginUtil.getTskCd());//根据申请人岗位id查询岗位名字
		 	model.addAttribute("reqTskNm", reqTskNm);//查询申请人岗位
		 	reqHpNo = specialRequestService.selectReqHpNo(LoginUtil.getUserId());//根据申请人id查询手机号
		 	model.addAttribute("reqHpNo", reqHpNo);//申请人手机号
		 	//2、申请时间段赋值以及工单时间段赋值
		 	model.addAttribute("sToRoDt", DateUtil.getDate(dateFormat));//开单开始日期
		    model.addAttribute("sFromRoDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );//开单结束日期
		 	model.addAttribute("sToReqDt", DateUtil.getDate(dateFormat));//提报开始日期
		    model.addAttribute("sFromReqDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );//提报结束日期
		    //3、返回JSP的url路径
		 	return "/ser/wac/special/selectSpecialRequestMain";

	   }
     
     
    /**
     * 
     * @MethodName: selectSpecialRequestForSpecial
     * <p>Title: 查询特殊申请工单信息</p >
     * @Description: 1、查询列表数量;2、查询列表数据
     * @author wangc
     * @param searchVO
     * @return SearchResult
     * @throws Exception SearchResult
     * @date 2021-03-30 03:45:40 
     */
    @RequestMapping(value="/ser/wac/special/getSpecialRequest.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult getSpecialRequest(@RequestBody SpecialRequestSearchVo searchVO)throws Exception{

        SearchResult result = new SearchResult();
       
        result.setTotal(specialRequestService.selectSpecialRequestForSpecialBySpecialCnt(searchVO)); //1、查询列表数量
        if(result.getTotal() != 0){
            result.setData(specialRequestService.selectSpecialRequestForSpecialBySpecial(searchVO));//2、查询列表数据
        }

        return result;

    }
    
   /**
    * 
    * @MethodName: addSpecialRequest
    * <p>Title: 特殊申请的保存和申请</p >
    * @Description: 保存/申请到特殊申请表中；buttonFlag：save保存 apply 申请
    * @author wangc
    * @param addjson
    * @return String
    * @throws Exception String
    * @date 2021-03-31 07:47:44 
    */
   @RequestMapping(value="/ser/wac/special/addSpecialRequest.do", method=RequestMethod.POST)
   @ResponseBody
   public String addSpecialRequest(@Validated @RequestBody SpecialRequestVo addVO)throws Exception{
       String result = "";
       try{
    	   result =specialRequestService.addSpecialRequest(addVO);//保存/申请数据
       }catch(Exception e){
    	   result = e.getMessage();
    	   System.out.println(result);
       }
      
       return result;
   }
    
}
