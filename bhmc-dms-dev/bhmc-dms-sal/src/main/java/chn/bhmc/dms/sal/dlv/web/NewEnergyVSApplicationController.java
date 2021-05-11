package chn.bhmc.dms.sal.dlv.web;


import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractProgressService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.dlv.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.dlv.vo.NewEnerVSApplicationVO;
import chn.bhmc.dms.sal.dlv.vo.NewEnergyVSApplicationSearchVO;



/**
 * 
 * @ClassName: NewEnergyVSApplicationController 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 上午11:18:11
 */

@Controller
@RequestMapping(value = "/sal/dlv/newEnergyVSApplication")
public class NewEnergyVSApplicationController extends HController {


	@Resource(name="contractProgressService")
	ContractProgressService contractProgressService;
	
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="dealerService")
    DealerService dealerService;
    
    @Resource(name="NewEnergyVSApplicationService")
    NewEnergyVSApplicationService newEnergyVSApplicationService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    
    /**
       * 新能源汽车申请列表页方法
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectNewEnergyVSApplicationMain.do", method = RequestMethod.GET)
    public String selectNewEnergyVSApplicationMain(Model model ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);
        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }
        
        //客户类型
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        model.addAttribute("statusNolist", commonCodeService.selectCommonCodesByCmmGrpCd("COM079", null, langCd));
        
        model.addAttribute("wehicleUseList", commonCodeService.selectCommonCodesByCmmGrpCd("COM076", null, langCd));
        
        model.addAttribute("wehicleUseFinalList", commonCodeService.selectCommonCodesByCmmGrpCd("COM077", null, langCd));
        
        model.addAttribute("carBuyAreaList", commonCodeService.selectCommonCodesByCmmGrpCd("COM081", null, langCd));
        
        model.addAttribute("modelCdStrList", commonCodeService.selectCommonCodesByCmmGrpCd("COM083", null, langCd));
        
        //CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 八大处共同编码 SAL015 八大处  COM020 是否
        model.addAttribute("eigFieMaList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL015", null, langCd));
        model.addAttribute("wethIsList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        return "/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationMain";
    }
    
    /**
     * 列表JQ请求返回数据方法
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectNewEnergyVSApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNewEnergyVSApplicationCanc(@RequestBody NewEnergyVSApplicationSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        result.setTotal(newEnergyVSApplicationService.selectNewEnergyVSApplicationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(newEnergyVSApplicationService.selectNewEnergyVSApplicationByCondition(searchVO));
        }

        return result;
    }
    
    
    @RequestMapping(value = "/selectNewEnergyVSApplicationPopup.do", method = RequestMethod.GET)
    public String selectNewEnergyVSApplicationPopup(HttpServletRequest request,Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);
        
        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        model.addAttribute("wehicleUseList", commonCodeService.selectCommonCodesByCmmGrpCd("COM076", null, langCd));
        
        model.addAttribute("wehicleUseFinalList", commonCodeService.selectCommonCodesByCmmGrpCd("COM077", null, langCd));

        model.addAttribute("statusNolist", commonCodeService.selectCommonCodesByCmmGrpCd("COM079", null, langCd));
        
        model.addAttribute("carRegColorlist", commonCodeService.selectCommonCodesByCmmGrpCd("COM080", null, langCd));
        
        model.addAttribute("modelCdStrList", commonCodeService.selectCommonCodesByCmmGrpCd("COM083", null, langCd));
        //产权人类型
        model.addAttribute("humanPropertyTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("COM082", null, langCd));
        
        model.addAttribute("provinceList", commonCodeService.selectProvinceList());
        
    	model.addAttribute("cityList", commonCodeService.selectCityList());
    	
    	model.addAttribute("areaList", commonCodeService.selectAreaList());
    	//CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 八大处共同编码
        model.addAttribute("eigFiesList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL015", null, langCd));
    	
        return "/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationPopup";
    }
    
    @RequestMapping(value = "/newEnergyVSApplicationMessagePopup.do", method = RequestMethod.GET)
    public String newEnergyVSApplicationMessagePopup(Model model) throws Exception{
        return "/sal/dlv/newEnergyVSApplication/newEnergyVSApplicationMessagePopup";
    }

    /**
     * 
     * @param customerInfoVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertnewEnergyVSApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertNewEnergyVSApplication(@Validated @RequestBody NewEnerVSApplicationVO newEnerVSApplicationVO) throws Exception {

    	newEnerVSApplicationVO.setRegUsrId(LoginUtil.getUserId());
    	newEnerVSApplicationVO.getNewEnergyVSApplicationVO().setDlrCd(LoginUtil.getDlrCd());
        // 随机生成6位数 暂替申请编号
    	Random random = new Random();
    	String result="";
    	for (int i=0;i<6;i++)
    	{
    		result+=random.nextInt(10);
    	}
    	newEnerVSApplicationVO.getNewEnergyVSApplicationVO().setApplicationNo(result);
        newEnergyVSApplicationService.insertNewEnVSApplication(newEnerVSApplicationVO.getNewEnergyVSApplicationVO());

        return "success";
    }
    
    @RequestMapping(value = "/updateNewEnergyVSApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateNewEnergyVSApplication(@Validated @RequestBody NewEnerVSApplicationVO newEnerVSApplicationVO) throws Exception {

    	newEnerVSApplicationVO.setRegUsrId(LoginUtil.getUserId());
    	newEnerVSApplicationVO.getNewEnergyVSApplicationVO().setDlrCd(LoginUtil.getDlrCd());
        // 신규 등록
        newEnergyVSApplicationService.updateNewEnVSApplication(newEnerVSApplicationVO.getNewEnergyVSApplicationVO());

        return "success";
    }
    
    @RequestMapping(value = "/checkVinNoIfContain.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkVinNoIfContain(
    		@RequestParam(value="vinNo",required = false, defaultValue="") String vinNo,
    		@RequestParam(value="tbSaveOrUpdate",required = false, defaultValue="") String tbSaveOrUpdate,
    		@RequestParam(value="saveOrUpdate",required = false, defaultValue="") String saveOrUpdate,
    		@RequestParam(value="flagUs",required = false, defaultValue="") String flagUs,
    		@RequestParam(value="custCd",required = false, defaultValue="") String custCd) throws Exception {

    	NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
    	
    	String flag =  this.checkContractPersonCar(vinNo,custCd);
    	searchVO.setVinNo(vinNo);
    	searchVO.setsDlrCd(LoginUtil.getDlrCd());
    	
    	int countOnly = newEnergyVSApplicationService.checkVinNoContInT(searchVO);
    	//判断当前车辆是否存在申请。false2
    	if(tbSaveOrUpdate.equals("tb")) {
    		if(saveOrUpdate.equals("save")) {
    				if(countOnly>0) {
        	    		flag = "false2";
        	    	}
    	    	
    		}else {
    			if(flagUs.equals("save")) {
    				if(countOnly>1) {
        	    		flag = "false2";
        	    	}
    			}else {
    				if(countOnly>0) {
        	    		flag = "false2";
        	    	}
    			}
    			
    		}
    	}else {
    		if(saveOrUpdate.equals("save")) {
				if(countOnly>0) {
    	    		flag = "false2";
    	    	}
	    	
		    }else {
			if(flagUs.equals("save")) {
				if(countOnly>1) {
    	    		flag = "false2";
    	    	}
			}else {
				if(countOnly>0) {
    	    		flag = "false2";
    	    	}
			}
			
		}
    	}
    	
    	//判断车架号是否存在 并且是库存车
        int count =  newEnergyVSApplicationService.checkVinNoIfContainCnt(searchVO);
        if(count<=0) {
        	flag = "false1";
        }else {
        	searchVO.setCustNm("ZFNEWSUB");
        	//判断当前车辆是否可以申请新能源补贴
            int countZf =  newEnergyVSApplicationService.checkVinNoIfContainCnt(searchVO);
            if(countZf<=0) {
            	flag = "false";
            }
        }
       
        return flag;
    }
    
    @SuppressWarnings("unchecked")
	private String checkContractPersonCar(String vinNo,String custCd) throws Exception {
    	String flag = "";
    	ContractReSearchVO searchVO = new ContractReSearchVO();
    	SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());   
        searchVO.setsVinNo(vinNo);

        result.setTotal(contractProgressService.selectContractProgressByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractProgressService.selectContractProgressByCondition(searchVO));
            List<ContractReVO> contractReVOList = (List<ContractReVO>) result.getData();
            for (ContractReVO ContractReVO : contractReVOList) {
            	 if(!ContractReVO.getContractStatCd().equals("90")&&!ContractReVO.getContractStatCd().equals("91")) {
            		 if(ContractReVO.getContractCustNo().equals(custCd)) {
            			 flag = "success";
            		 }else {
            			 flag = "false3";
            		 }
            	 }
            }
        }else {
        	flag = "false4";
        }

		return flag;
    	
    }
}
