package chn.bhmc.dms.sal.cnt.web;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;
import chn.bhmc.dms.sal.cnt.service.ContractService;
import chn.bhmc.dms.sal.cnt.vo.ContractSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.LocalOptionPriceService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;

/**
 * 계약관리 V 1.0
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
@RequestMapping(value = "/sal/cnt/contract")
public class ContractController extends HController {

    /**
     * 계약 서비스
     */
    @Resource(name="contractService")
    private ContractService contractService;

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
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 로컬옵션가격정보 서비스
     */
    @Resource(name="localOptionPriceService")
    LocalOptionPriceService localOptionPriceService;

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
     * 계약품의 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractMain.do", method = RequestMethod.GET)
    public String selectContractMain(Model model,
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

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 딜러 [TODO] HR 쪽 연동
        ArrayList<HashMap<String,?>> dlrList = new ArrayList<HashMap<String,?>>();
        HashMap<String, String> dlr = new HashMap<String, String>();
        dlr.put("dlrNm", LoginUtil.getDlrCd());
        dlr.put("dlrCd", LoginUtil.getDlrCd());
        dlrList.add(dlr);
        dlr = new HashMap<String, String>();
        dlr.put("dlrNm", LoginUtil.getDlrCd());
        dlr.put("dlrCd", LoginUtil.getDlrCd());
        dlrList.add(dlr);

        // 딜러 리스트 : [TODO] HR 쪽 연동
        model.addAttribute("dlrDSInfo", dlrList);


        // 판매사원 [TODO] HR 쪽 연동
        ArrayList<HashMap<String,String>> saleEmpList = new ArrayList<HashMap<String,String>>();
        HashMap<String, String> emp = new HashMap<String, String>();
        emp.put("saleEmpNm", LoginUtil.getUserId() + " " + LoginUtil.getUserNm());
        emp.put("saleEmpCd", LoginUtil.getUserId());
        saleEmpList.add(emp);
        emp = new HashMap<String, String>();
        emp.put("saleEmpNm", LoginUtil.getUserId() + " " + LoginUtil.getUserNm());
        emp.put("saleEmpCd", LoginUtil.getUserId());
        saleEmpList.add(emp);

        // 판매사원 리스트 : [TODO] HR 쪽 연동
        model.addAttribute("saleEmpDSInfo", saleEmpList);


        // 계약유형
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //탁송구분 : SAL125
        model.addAttribute("consTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL125", null, langCd));

        //과세구분 : SAL124
        model.addAttribute("taxTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL124", null, langCd));

        //인도금지불유형 : SAL071 , 계약금지불유형 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 자사/타사 구분 : SAL118
        model.addAttribute("corpCarDstinTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL118", null, langCd));

        // 중고차-타사-브랜드 : COM019
        model.addAttribute("brandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        // 구동방식 : SAL121
        model.addAttribute("carDrvMthCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL121", null, langCd));

        // 연료 : SAL114
        model.addAttribute("fuelCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL114", null, langCd));

        // 승용/상용 : SAL120
        model.addAttribute("pcDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));

        //보험등록유형 : SAL126  , 차량등록유형 : SAL126
        model.addAttribute("regTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL126", null, langCd));

        //차량 등록지역 : SAL086
        model.addAttribute("regDistCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL086", null, langCd));

        // 보험회사 : SAL127
        model.addAttribute("incCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 프로모션 유형 : SAL010
        model.addAttribute("promotionTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL010", null, langCd));

        // 프로모션 적용방법 : SAL132
        model.addAttribute("applyTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL132", null, langCd));


        // 금융상품 : 마스터 테이블 생성 예정  [TODO]
        ArrayList<HashMap<String,String>> fincItemList = new ArrayList<HashMap<String,String>>();
        HashMap<String, String> fincItem = new HashMap<String, String>();
        fincItem.put("fincItemNm", "金融商品01");   // 금융상품01
        fincItem.put("fincItemCd", "01");
        fincItemList.add(fincItem);
        fincItem = new HashMap<String, String>();
        fincItem.put("fincItemNm", "金融商品02");   // 금융상품02
        fincItem.put("fincItemCd", "02");
        fincItemList.add(fincItem);

        model.addAttribute("fincItemDS", fincItemList);

        /**
         * crm 판매기회 정보 셋팅
         */
        if(!"".equals(saleOpptNo)){
            SalesOpptMgmtSearchVO opptVO = new SalesOpptMgmtSearchVO();
            opptVO.setsDlrCd(LoginUtil.getDlrCd());
            opptVO.setsSaleOpptNo(saleOpptNo);
            SalesOpptMgmtVO opptMgmtVO = salesOpptMgmtService.selectSalesOpptMgmtByKey(opptVO);

            if(opptMgmtVO != null && opptMgmtVO.getCustNo() != null && !"".equals(opptMgmtVO.getCustNo()) ){
                //model.addAttribute("opptDS", JSONUtil.toJSON(opptMgmtVO));
                model.addAttribute("opptDS", opptMgmtVO);

                AddressInfoSearchVO addrSearchVO = new AddressInfoSearchVO();
                addrSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                addrSearchVO.setsRefKeyNm(opptMgmtVO.getCustNo());
                addrSearchVO.setsFlagYn("Y");

                List<AddressInfoVO> AddrList = addressInfoService.selectAddressInfoByCondition(addrSearchVO);
                if(AddrList.size() > 0){
                    model.addAttribute("opptAddr", AddrList.get(0));
                }
            }
        }


        /**
         * 넘어온 custNo에 crm사용자정보 세팅


        if(!StringUtils.isEmpty(custNo)) {
            BusinessPartnerSearchVO searchCrmVO = new BusinessPartnerSearchVO();
            searchCrmVO.setCustNo(custNo);
            List<BusinessPartnerVO> custlist = businessPartnerService.selectCustomerDmsCrm(searchCrmVO);
            if(custlist.size() > 0) {
                BusinessPartnerVO custInfo = custlist.get(0);
                model.addAttribute("custInfo", JSONUtil.toJson(custInfo));
            }
        }
         */
        model.addAttribute("orderNo", orderNo);           // 주문번호로 조회
        model.addAttribute("estimateNo", estimateNo);     // 견적번호로 조회



        return "/sal/cnt/contract/selectContractMain";
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContractSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractSearch(@RequestBody ContractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드


        result.setTotal(contractService.selectContractsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractService.selectContractsByCondition(searchVO));
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
        //searchVO.setUseYn("Y");                       // 사용여부

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

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 계약별 로컬옵션 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOptionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOptionSearch(@RequestBody ContractSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        result.setTotal(contractService.selectLocalOptionListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractService.selectLocalOptionListsByCondition(searchVO));
        }

        return result;

    }


    /**
     * 로컬옵션의 상품리스트 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionPriceLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalOptionPriceLists(@RequestBody LocalOptionPriceSearchVO searchVO){

        SearchResult result = new SearchResult();
        result.setTotal(localOptionPriceService.selectLocalOptionPriceListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(localOptionPriceService.selectLocalOptionPriceListsByCondition(searchVO));
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
    public SearchResult selectPromotionSearch(@RequestBody ContractSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractService.selectPromotionListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractService.selectPromotionListsByCondition(searchVO));
       }
        return result;
    }


    // 계약 생성
    @RequestMapping(value = "/multiContracts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContracts(@Validated @RequestBody ContractSaveVO saveVO) throws Exception {
        return contractService.multiContracts(saveVO);

    }

    // 계약삭제 : 승인전
    @RequestMapping(value = "/deleteContract.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContract(@RequestBody ContractVO contVO) throws Exception {
        return contractService.deleteContract(contVO);

    }


    // 계약 승인요청 : 승인전 [TOBE 판매 결재 popup 연동]
    @RequestMapping(value = "/conRequestAppr.do", method = RequestMethod.POST)
    @ResponseBody
    public String conRequestAppr(@RequestBody ContractVO contVO) throws Exception {
        return contractService.conRequestAppr(contVO);

    }

    // 계약 승인확정 [TOBE 판매 결재 popup 연동]
    @RequestMapping(value = "/approval.do", method = RequestMethod.POST)
    @ResponseBody
    public String approval(@RequestBody ContractVO contVO) throws Exception {
        return contractService.approval(contVO);

    }

    // 계약 승인 반려 [TOBE 판매 결재 popup 연동]
    @RequestMapping(value = "/approvalRollback.do", method = RequestMethod.POST)
    @ResponseBody
    public String approvalRollback(@RequestBody ContractVO contVO) throws Exception {
        return contractService.approvalRollback(contVO);

    }

    //
    @RequestMapping(value = "/contractMessagePopup.do", method = RequestMethod.GET)
    public String contractMessagePopup(Model model) throws Exception{
        return "/sal/cnt/contract/contractMessagePopup";
    }

}
