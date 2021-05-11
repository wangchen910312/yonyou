package chn.bhmc.dms.sal.lom.web;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.lom.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.lom.vo.NewEnerVSApplicationVO;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;



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


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 고객인도 서비스
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * Customer Information Management Service
     * CRM PAPRT
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;



    /**
     * 계약출고관리 서비스
     */


    /**
     * 마감시간관리 관리 서비스
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;


    @Resource(name="dealerService")
    DealerService dealerService;
    
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;
    
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;
    
    
    @Resource(name="NewEnergyVSApplicationService")
    NewEnergyVSApplicationService newEnergyVSApplicationService;
    

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;
    
    /**
     * R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;
    
    /**
     * 출고관리 - 출고취소관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectNewEnergyVSApplicationMain.do", method = RequestMethod.GET)
    public String selectContractMntMain(Model model,
            @RequestParam(value="orderNo",    required = false, defaultValue="") String orderNo,
            @RequestParam(value="estimateNo", required = false, defaultValue="") String estimateNo,
            @RequestParam(value="saleOpptNo", required = false, defaultValue="") String saleOpptNo
    ) throws Exception{

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
        // 판매인 여부
        String saleEmpYn = "N";
        model.addAttribute("saleEmpYn", saleEmpYn);
        String saleAdminYn = "N";
        //VIEW-D-10634 : 화면 : 판매>계약관리>계약체결관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10634", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));

        // 2급딜러
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);
        
        //客户类型
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        model.addAttribute("statusNolist", commonCodeService.selectCommonCodesByCmmGrpCd("COM079", null, langCd));
        
        model.addAttribute("wehicleUseList", commonCodeService.selectCommonCodesByCmmGrpCd("COM076", null, langCd));
        
        model.addAttribute("wehicleUseFinalList", commonCodeService.selectCommonCodesByCmmGrpCd("COM077", null, langCd));
        
        model.addAttribute("modelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM083", null, langCd));
        
        //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30
        model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));
        //CSR 111新能源申请流程增加八大领域功能选择项，DMS、接口、DCS均增加，不光在明细界面、列表显示、excel下载都加 贾明 2020-6-18 八大处共同编码 SAL015 八大处  COM020 是否
        model.addAttribute("eigFieMaList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL015", null, langCd));
        model.addAttribute("wethIsList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //model.addAttribute("carBuyAreaList", commonCodeService.selectCommonCodesByCmmGrpCd("COM081", null, langCd));
        /**
         * crm 판매기회
         */
        if(!"".equals(saleOpptNo)){
            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsSaleOpptNo( saleOpptNo );         // 판매기회번호

        }

        model.addAttribute("estimateNo", estimateNo);     // 견적번호로 조회
        model.addAttribute("orderNo", orderNo);           // 주문번호로 조회

        return "/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationMain";
    }
    /**
     * 출고관리 - 출고취소 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectNewEnergyVSApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContDeliveryCanc(@RequestBody NewEnergyVSApplicationSearchVO searchVO) throws Exception {
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
    public String selectContMntPopup(HttpServletRequest request,Model model) throws Exception{
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

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
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

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn(null);                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(null));



        String saleAdminYn = "N";
        //VIEW-D-10634 : 화면 : 판매>계약관리>계약체결관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10634", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //주소유형 : CRM033
        model.addAttribute("addrTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        //용품판매품목상태
        model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd));

        //서비스고문
        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("eqipPrsnList", bayManageService.selectBayDetailsByCondition(searchVO));


        // 대행업무유형 : SAL021
        model.addAttribute("aapWorkDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", null, langCd));

        // 보험회사 : SAL127
        model.addAttribute("incCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        // 보험유형 : SAL019, SAL088
        List<CommonCodeVO> incTpList = new ArrayList<CommonCodeVO>();
        incTpList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incTpList.add(vo);}}
        model.addAttribute("insTpDS", incTpList);

        // 3자보험유형 - 금액 : SAL197
        model.addAttribute("threeIncTpAmtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL197", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 금융상품 : SA_0117T
        //model.addAttribute("fincItemDS", financialProductsManagementService.selectFinancialProductAmtListsByCondition("01"));

        // 금융상품 - Bhaf

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));

        // 사용자의 채널유형
        ContractReSearchVO sEmpChannelVO = new ContractReSearchVO();
        sEmpChannelVO.setsSaleEmpNo(LoginUtil.getUserId());
        sEmpChannelVO.setsLangCd(langCd);

        // 2급딜러

        // 블루멤버십 회원등급 유형 CRM806
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        
        model.addAttribute("wehicleUseList", commonCodeService.selectCommonCodesByCmmGrpCd("COM076", null, langCd));
        
        model.addAttribute("wehicleUseFinalList", commonCodeService.selectCommonCodesByCmmGrpCd("COM077", null, langCd));

        model.addAttribute("statusNolist", commonCodeService.selectCommonCodesByCmmGrpCd("COM079", null, langCd));
        
        model.addAttribute("carRegColorlist", commonCodeService.selectCommonCodesByCmmGrpCd("COM080", null, langCd));
        model.addAttribute("modelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM083", null, langCd));
        
        //产权人类型
        model.addAttribute("humanPropertyTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("COM082", null, langCd));
        return "/sal/dlv/newEnergyVSApplication/selectNewEnergyVSApplicationPopup";
    }
    
    @RequestMapping(value = "/newEnergyVSApplicationMessagePopup.do", method = RequestMethod.GET)
    public String contractMessagePopup(Model model) throws Exception{
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

    	newEnerVSApplicationVO.setUpdtUsrId(LoginUtil.getUserId());
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

    	newEnerVSApplicationVO.setUpdtUsrId(LoginUtil.getUserId());
        // 신규 등록
        newEnergyVSApplicationService.updateNewEnVSApplication(newEnerVSApplicationVO.getNewEnergyVSApplicationVO());

        return "success";
    }
    /**
     * 列表批量审核
     * @param newEnerVSApplicationVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/passNewEnergyVSApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public String passNewEnergyVSApplication(@Validated @RequestBody NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception {
    	String applicationNo = newEnergyVSApplicationVO.getApplicationNo();
    	String[] split = applicationNo.split(",");
    	newEnergyVSApplicationService.passNewEnergyVSApplication(split,newEnergyVSApplicationVO);
    	
    	return "success";
    }
}
