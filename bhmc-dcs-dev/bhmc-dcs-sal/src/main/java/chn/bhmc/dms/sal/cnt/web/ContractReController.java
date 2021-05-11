package chn.bhmc.dms.sal.cnt.web;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.sal.bsc.service.FinancialProductsManagementService;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;
import chn.bhmc.dms.sal.cmm.service.UserInfoService;
import chn.bhmc.dms.sal.cnt.service.ContractReService;
import chn.bhmc.dms.sal.cnt.vo.ContractRePayInfoSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 계약관리
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractRe")
public class ContractReController extends HController {

    /**
     * 계약 서비스
     */
    @Resource(name="contractReService")
    private ContractReService contractReService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스 - 판매사원
     */
    @Resource(name="userInfoService")
    UserInfoService userInfoService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 판매기회 관리 서비스
     */
/*    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;*/

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;
    /**
     * crm 주소정보 관리 서비스
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * CRM 고객 정보 재조회
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 금융상품관리 서비스
     */
    @Resource(name="financialProductsManagementService")
    FinancialProductsManagementService financialProductsManagementService;

    /**
     * 계약품의 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractReMain.do", method = RequestMethod.GET)
    public String selectContractReMain(Model model,
            @RequestParam(value="orderNo",    required = false, defaultValue="") String orderNo,
            @RequestParam(value="estimateNo", required = false, defaultValue="") String estimateNo,
            @RequestParam(value="saleOpptNo", required = false, defaultValue="") String saleOpptNo
    ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 판매사원 리스트
        model.addAttribute("saleEmpDSInfo", userInfoService.selectUserInfoListsByCndition(LoginUtil.getDlrCd(), "13"));
        // 영업대표 리스트

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //탁송구분 : SAL125 - 방문/탁송
        //대행구분 : SAL126 - 대행/본인

        // 차량등록지역 : SAL086
        model.addAttribute("regDistCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL086", null, langCd));

        // 보험회사 : SAL127
        model.addAttribute("incCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        // 보험유형 : SAL019
        model.addAttribute("insTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 금융상품 : SA_0117T
        model.addAttribute("fincItemDS", financialProductsManagementService.selectFinancialProductAmtListsByCondition("01"));

        // 프로모션 유형 : SAL010
        //model.addAttribute("promotionTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL010", null, langCd));

        // 프로모션 적용방법 : SAL132
        //model.addAttribute("applyTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL132", null, langCd));

        // 수납유형 : SAL011
        model.addAttribute("rectTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL011", null, langCd));

        // 입출금유형 : SAL012
        model.addAttribute("ioTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL012", null, langCd));

        // 입출금대상유형 : SAL013
        model.addAttribute("ioTargetTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL013", null, langCd));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 출고상태

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        /**
         * crm 판매기회
         */
        if(!"".equals(saleOpptNo)){
            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsSaleOpptNo( saleOpptNo );         // 판매기회번호

            List<ContractReVO> opptList = contractReService.selectContractResByCondition(searchVO);
            if(opptList != null && opptList.size() > 0){
                model.addAttribute("saleOpptNo", opptList.get(0).getContractNo());
            }
        }

        model.addAttribute("orderNo", orderNo);           // 주문번호로 조회
        //model.addAttribute("estimateNo", estimateNo);     // 견적번호로 조회

        return "/sal/cnt/contractRe/selectContractReMain";
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContractReSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractReSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractReService.selectContractResByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractReService.selectContractResByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * CRM 고객 데이터 재조회
     */
    @RequestMapping(value = "/selectCrmCustomerInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(customerInfoService.selectCustomerInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerInfoService.selectCustomerInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 금융서비스 - 모델에 따른 상품조회
     */
    @RequestMapping(value = "/selectFinancialProductModelSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFinancialProductModelSearch(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        List<FinancialProductsManagementVO> fList = financialProductsManagementService.selectFinancialProductModelListsByCondition(searchVO.getModelCd());

        SearchResult result = new SearchResult();
        result.setTotal(fList.size());

        if(result.getTotal() != 0){
            result.setData(fList);
        }
        return result;
    }


    /**
     * 계약별 프로모션 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPromotionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPromotionSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectPromotionListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectPromotionListsByCondition(searchVO));
       }
        return result;
    }

    /**
     * 계약별 입/출금내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPayInfoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPayInfoSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectPayInfoListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectPayInfoListsByCondition(searchVO));
       }
        return result;
    }

    // 계약별 입/출금내역 저장
    @RequestMapping(value = "/savePayInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int savePayInfo(@RequestBody ContractRePayInfoSaveVO payInfoVO) throws Exception {
        return contractReService.savePayInfo(payInfoVO);
    }


    /**
     * 계약별 보험내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectIncSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectIncListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectIncListsByCondition(searchVO));
       }
        return result;
    }

    /**
     * 계약별 용품 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGoodsSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGoodsSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectGoodsListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectGoodsListsByCondition(searchVO));
       }
        return result;
    }


    /**
     * 계약별 부가비용 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOptionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOptionSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectOptionListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectOptionListsByCondition(searchVO));
       }
        return result;
    }

    // 계약 저장
    @RequestMapping(value = "/multiContractRes.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContractRes(@Validated @RequestBody ContractReSaveVO saveVO) throws Exception {
        saveVO.getContractReVO().setDlrCd(LoginUtil.getDlrCd());
        return contractReService.multiContracts(saveVO);
    }


    // 계약 생성
    @RequestMapping(value = "/approval.do", method = RequestMethod.POST)
    @ResponseBody
    public String approval(@RequestBody ContractReVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractReService.approval(contVO);
    }

    // 계약삭제 : 승인전
    @RequestMapping(value = "/deleteContract.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContract(@RequestBody ContractReVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractReService.deleteContract(contVO);
    }

    // 계약취소 : 승인후
    @RequestMapping(value = "/cancelContract.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelContract(@RequestBody ContractReVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractReService.cancelContract(contVO);
    }

    // 딜러 프로모션에 대한 할인 레벨을 조회한다.
    @RequestMapping(value = "/selectDlrDcLevel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrDcLevel(@RequestBody ContractReSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(contractReService.selectDlrDcLevelCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractReService.selectDlrDcLevel(searchVO));
        }

         return result;
    }

    /**
     * 미배정된 차량조회 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContractReVinNoSearchPopup.do", method = RequestMethod.GET)
    public String selectContractReVinNoSearchPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //차량보유상태 SAL149
        model.addAttribute("ownStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/cnt/contractRe/selectContractReVinNoSearchPopup";
    }

    /**
     * 미배정 차량 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContractReVinNoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractReVinNoSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractReService.selectContractReVinNosByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractReService.selectContractReVinNosByCondition(searchVO));
       }
        return result;
    }

    /**
     * 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectItemSalePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcPopupByCondition(@RequestBody ContractReSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contractReService.selectItemSalePrcPopupByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(contractReService.selectItemSalePrcPopupByCondition(searchVO));
        }
        return result;
    }

    //
    @RequestMapping(value = "/contractMessagePopup.do", method = RequestMethod.GET)
    public String contractMessagePopup(Model model) throws Exception{
        return "/sal/cnt/contract/contractMessagePopup";
    }

}
