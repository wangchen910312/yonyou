package chn.bhmc.dms.mob.api.sales.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesContractMntService;
import chn.bhmc.dms.mob.api.sales.service.SalesContractProgressService;
import chn.bhmc.dms.mob.api.sales.service.SalesCrmCommonService;
import chn.bhmc.dms.mob.api.sales.service.SalesDealerService;
import chn.bhmc.dms.mob.api.sales.service.SalesViewMappingService;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReVO;
import chn.bhmc.dms.mob.api.sales.vo.DealerSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DealerVO;
import chn.bhmc.dms.mob.api.sales.vo.UserVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractMntSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;



/**
 * 계약종합조회
 *
 * @author HG
 * @since 2017. 2. 21
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.02.21           HG                   최초 생성
 * </pre>
 */

@Controller
@Api("销售-合同管理-合同综合查询 ")
@RequestMapping(value = "/api/sales/contractProgress")
public class ContractProgressApi extends HController {

	/**
     * 계약종합조회 서비스q
     */
    @Resource(name="SalesContractProgressService")
    SalesContractProgressService SalesContractProgressService;

    /**
     * 계약 서비스
     */
    @Resource(name="SalesContractMntService")
    SalesContractMntService SalesContractMntService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="SalesCommonCodeService")
    SalesCommonCodeService SalesCommonCodeService;


    /**
     * 딜러 관리 서비스
     */
    @Resource(name="SalesDealerService")
    SalesDealerService SalesDealerService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="SalesViewMappingService")
    SalesViewMappingService SalesViewMappingService;

    /**
     * CRM 공통 관리 서비스
     */
    @Resource(name="SalesCrmCommonService")
    SalesCrmCommonService SalesCrmCommonService;
    
    /**
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;
    
    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="SalesCarInfoService")
    SalesCarInfoService salesCarInfoService;
    

    /**
     * 계약종합조회 Main View 을 출력한다.
     * @return
     */
    @ApiOperation("页面跳转筛选信息")
    @RequestMapping(value = "/selectContractProgressMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectContractProgressMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

//        model.addAttribute("userId", LoginUtil.getUserId());
//        model.addAttribute("userNm", LoginUtil.getUserNm());
//        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        /*MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());*/


        //DateUtil
//        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
//        String sysDate      = DateUtil.getDate(dateFormat);
//
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(DateUtil.convertToDate(sysDate));
//        int year = cal.get(Calendar.YEAR);
//        int month = cal.get(Calendar.MONTH);
//        cal.set(year, month, 1, 00, 00, 00);
//        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);
//
//        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
//            cal.set(year, month, lastDay, 00, 00, 00);
//        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);
//
//        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
//        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
//        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
//        model.addAttribute("toDay", sysDate);
//        model.addAttribute("oneDay", oneDay);
//        model.addAttribute("sevenDay", sevenDtBf);
//        model.addAttribute("lastDay", lastDate);
//        model.addAttribute("nextMonthDay", nextMonthDay);
//        model.addAttribute("threeMonthDay", threeMonthBf);

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  SalesDealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            //model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
            model.addAttribute("dlrNm", dlrList.get(0).getDlrCd());//메뉴에 딜러코드가 나와야 해서 이렇게 한다 문제시 원복!!! khskhs
        }else{
            model.addAttribute("dlrNm", "");
        }

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = SalesCrmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        // VIEW-D-10636 : 화면 : 판매>계약관리>계약종합조회
        if(SalesViewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12577", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 계약상태 : SAL002
        model.addAttribute("contractStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 할인레벨 SAL156
        //model.addAttribute("dcLvlCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        //model.addAttribute("ynDs", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 주요인증문서유형(신분증유형) : CRM024
        //model.addAttribute("mathDocTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

      //지불방식 : SAL071
        //model.addAttribute("amtPayTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

      //주소유형 : CRM033
        //model.addAttribute("addrTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/cnt/contractCondition/baseJsp/selectContractProgressMain.jsp");
        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON json = new BaseJSON();
        json.setResult(model.asMap());
        return json;
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @ApiOperation("合同综合查询")
    @RequestMapping(value = "/selectContractProgressSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectContractProgressSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {
        BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        //List list = null;
        //Map map = null;
        try {
        	 result.setTotal(SalesContractProgressService.selectContractProgressByConditionCnt(searchVO));

             if(result.getTotal() != 0){
                 result.setData(SalesContractProgressService.selectContractProgressByCondition(searchVO));
                 //list = new ArrayList();
                 //Map map  = new HashMap();
                 ContractReVO  crv = new ContractReVO();
                 for(int i=0;i < result.getData().size();i++){

                	 crv = (ContractReVO) result.getData().get(i);
                	// regDt
                	System.out.println(crv.getRegDt()+"/"+crv.getDlrCd());

                 }
             }
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

        baseJ.setResult(result);
        return baseJ;
    }


    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @ApiOperation("合同综合查询详情页")
    @RequestMapping(value = "/selectContractReSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectContractReSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {
    	 BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        try {
        	result.setTotal(SalesContractMntService.selectContractResByConditionCnt(searchVO));
            if(result.getTotal() != 0) {
                result.setData(SalesContractMntService.selectContractResByCondition(searchVO));
            }

		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
        baseJ.setResult(result);
        return baseJ;
    }
    
    /**
     * 계약관리 상세화면
     * @param model
     * @return
     * @throws Exception
     */
    @ApiOperation("合同综合查询详情页")
    @RequestMapping(value = "/selectContractMntPopup.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectContractMntPopup(Model model) throws Exception{
    	BaseJSON baseJSON = new BaseJSON();
    	
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", salesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        baseJSON.setResult(model);
        return baseJSON;
    }

 // 계약 멀티 계약취소, 계약삭제
    @ApiOperation("合同作废")
    @RequestMapping(value = "/deleteContractMnt.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON deleteContractMnt(@RequestBody ContractMntSaveVO saveVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	baseJ.setResult(contractMntService.deleteContractMnt(saveVO));
    	baseJ.setResultCode(0);
        return baseJ;
    }
    
    @ApiOperation("合同取消保存")
    @RequestMapping(value = "/multiContractMnts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiContractMnts(@Validated @RequestBody ContractReSaveVO saveVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	saveVO.getContractReVO().setDlrCd(LoginUtil.getDlrCd());
    	baseJ.setResult(contractMntService.multiContractMnts(saveVO));
    	baseJ.setResultCode(0);
        return baseJ;
    }
    
    @ApiOperation("合同生成即退订")
    @RequestMapping(value = "/approvalContractMnts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON approvalContractMnts(@Validated @RequestBody ContractReSaveVO saveVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	saveVO.getContractReVO().setDlrCd(LoginUtil.getDlrCd());
    	String result = contractMntService.multiContractMnts(saveVO);
        baseJ.setResult(result);
        baseJ.setResultCode(0);
        return baseJ;
    }

    
}
