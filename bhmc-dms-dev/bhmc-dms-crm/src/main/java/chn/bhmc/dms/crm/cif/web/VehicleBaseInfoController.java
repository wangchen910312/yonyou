package chn.bhmc.dms.crm.cif.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;


import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.crm.cif.service.VehicleBaseInfoService;
import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import able.com.web.HController;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : VehicleBaseInfoController.java
 * @Description :车辆基础画面查询
 * @author Jia Ming
 * @since 2019. 1. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since     author             description
 *  ===========    =============    ===========================
 *  2019. 1. 9.     Jia Ming        车辆基础画面查询
 * </pre>
 */

@Controller
public class VehicleBaseInfoController extends HController{
	
	
	/**
	 * 车辆基础画面查询
	 */
	 @Resource(name = "vehicleBaseInfoService")
	 VehicleBaseInfoService vehicleBaseInfoService;
	
	
	
	
	/**
     * 公共组件名称查询
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    
    /**
     * 车种名称
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;
    
    
    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;
    
    
    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    
	/**
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crm/cif/customerInfo/selectVehicleBaseInfoMain.do", method = RequestMethod.GET)
    public String selectVehicleBaseInfoMain(Model model) throws Exception {
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
	    model.addAttribute("sCustToSaveDt", sysDate);
	    model.addAttribute("sCustFromSaveDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );
		model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));//客户类型
		model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));//潜客保客
		
		VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
	    model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));//车种名称 
	    CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));//车种名称
	    model.addAttribute("searchTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER310", null, langCd));//销售特约店 （本店/他店）
	    model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));//自店会员、蓝缤会员（是/否）
	    model.addAttribute("VehBra", commonCodeService.selectCommonCodesByCmmGrpCd("CRM009", null, langCd));//车辆品牌
	    model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));//证件类型
	    model.addAttribute("userId", LoginUtil.getUserId());
	    model.addAttribute("userNm", LoginUtil.getUserNm());
	    model.addAttribute("dlrCd", LoginUtil.getDlrCd());
	    model.addAttribute("dlrNm", LoginUtil.getDlrNm());
		return "/crm/cif/customerInfo/selectVehicleBaseInfoMain";
		
	}
	
	/**
	 * 查询数据
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping(value = "/crm/cif/customerInfo/selectVehicleBaseInfoSearch.do", method = RequestMethod.POST)
	 @ResponseBody
	public SearchResult selectVehicleBaseInfoSearch(@RequestBody VehicleBaseInfoSearchVO searchVO) throws Exception{
		 String langCd = LocaleContextHolder.getLocale().getLanguage();
		 searchVO.setsLangCd(langCd);
		 searchVO.setsDlrCd(LoginUtil.getDlrCd());
		 SearchResult result = new SearchResult();
		 result.setTotal(vehicleBaseInfoService.selectVehicleBaseinfoConditionCnt(searchVO));
		 if(result.getTotal() != 0){
			 result.setData(vehicleBaseInfoService.selectVehicleBaseinfoCondition(searchVO));
		 }
		 return result;
	}
	 
	 /**
	  * 计算查询多少条
	  * @param searchVO
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/crm/cif/customerInfo/selectVehicleBaseInfoSearchCnt.do", method = RequestMethod.POST)
	 @ResponseBody
	public int selectVehicleBaseInfoSearchCnt(@RequestBody VehicleBaseInfoSearchVO searchVO) throws Exception{
		 String langCd = LocaleContextHolder.getLocale().getLanguage();
		 searchVO.setsLangCd(langCd);
		 searchVO.setsDlrCd(LoginUtil.getDlrCd());
		return  vehicleBaseInfoService.selectVehicleBaseinfoConditionCnt(searchVO);
	}
}
