package chn.bhmc.dms.sal.cmm.web;


import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.cnt.service.ContractReService;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.usc.service.UsedCarMasterService;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;

/**
 * Sale 공통 컨트롤러
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
@RequestMapping(value = "/sal/cmm")
public class SalesCommonController extends HController {

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name="progressStsService")
    ProgressStsService progressStsService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 중고차 - 차량마스터 서비스
     */
    @Resource(name="usedCarMasterService")
    UsedCarMasterService usedCarMasterService;

    /**
     * 계약품의 서비스
     */
    @Resource(name="contractReService")
    private ContractReService contractReService;

    /**
     * 판매카멜-공통 서비스
     */
    @Resource(name="salesCommonCamelService")
    private SalesCommonCamelService salesCommonCamelService;



    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 고객조회팝업 서비스
     */
    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 계약조회 팝업 (계약품의현황 동일)
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectProgressStsPopup.do", method = RequestMethod.GET)
    public String selectProgressStsPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn(null);                       // 사용여부

        // 현재일자 DateUtil
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
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDay",     sysDate);
        model.addAttribute("oneDay",    oneDay);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));        //계약유형
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));    //계약상태

        return "/sal/cmm/selectProgressStsPopup";
    }

    /**
     * 계약품위현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectProgressSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProgressSts(@RequestBody ContractSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();
        result.setTotal(progressStsService.selectProgressStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(progressStsService.selectProgressStsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 차량마스터 조회 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectVehicleMasterPopup.do", method = RequestMethod.GET)
    public String selectVehicleMasterPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //차량보유상태 SAL149
        model.addAttribute("ownStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));

        // 재고유형 SAL074
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));

        // 회사차구분 SAL053 / 2016.04.21 kimyewon 추가
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        return "/sal/cmm/selectVehicleMasterPopup";
    }

    /**
     * 차량마스터 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterSts(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(vehicleMasterService.selectVehicleMasterStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterStsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 중고차 - 계약품의관리 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectUsedCarProgPopup.do", method = RequestMethod.GET)
    public String selectUsedCarProgPopup(Model model) throws Exception{
        return "/sal/cmm/selectUsedCarProgPopup";
    }

    /**
     * 중고차 - 계약차량 조회 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectUsedCarMasterPopup.do", method = RequestMethod.GET)
    public String selectUsedCarMasterPopup(Model model) throws Exception{

        //차종
        //CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setUseYn("Y");                       // 사용여부
        //model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //차량상태 SAL157
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL157", null, langCd));
        // 자사차량구분 SAL118
        model.addAttribute("corpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL118", null, langCd));
        // 브랜드 COM019
        model.addAttribute("carBrandDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/cmm/selectUsedCarMasterPopup";
    }

    /**
     * 중고차 - 계약할수 있는 차량 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarMasterPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarMasterPopupSearch(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(usedCarMasterService.selectUsedCarContsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarMasterService.selectUsedCarContsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 용품조회 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectGoodsSearchPopup.do", method = RequestMethod.GET)
    public String selectGoodsSearchPopup(Model model) throws Exception{
        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //구매단가유형 : PAR131
        model.addAttribute("prcTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, LocaleContextHolder.getLocale().getLanguage()));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/cmm/selectGoodsSearchPopup";
    }

    /**
     * 용품조회 팝업 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectGoodsSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGoodsSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(contractReService.selectItemSalePrcPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractReService.selectItemSalePrcPopupByCondition(searchVO));
        }
        return result;
    }

    /**
     * 스캔 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectScanSearchPopup.do", method = RequestMethod.GET)
    public String selectScanSearchPopup(Model model) throws Exception{
        return "/sal/cmm/selectScanSearchPopup";
    }

    /**
     * 타사차량 고객등록 팝업 (보험관리/중고차관리)
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCustInfoCratePopup.do", method = RequestMethod.GET)
    public String selectCustInfoCratePopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        return "/sal/cmm/selectCustInfoCratePopup";
    }

    /**
     * 타사차량 고객등록
     **/
    @RequestMapping(value = "/multiVehOfCustInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiVehOfCustInfo(@Validated @RequestBody VehOfCustInfoVO vehOfCustInfoVO) throws Exception {

        //String carId = vehOfCustInfoService.multiVehOfCustInfo(vehOfCustInfoVO);

        /**
         * 정비 고객등록 서비스
         * : vehOfCustInfoService.multiVehOfCustInfo(vehOfCustInfoVO);
         * 그대로 복사. return 값만 다름.
         */
         String custNo = salesCommonService.multiVehOfCustInfo(vehOfCustInfoVO);
        return custNo;
    }




    /**
     * 용품판매번호 조회팝업 (용품출고
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectAccessoryItemSaleMngSearchPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemSaleMngSearchPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        return "/sal/cmm/selectAccessoryItemSaleMngSearchPopup";
    }

    /**
     * 판매 - Camel 호출
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeSalesCamel.do", method = RequestMethod.GET)
    public void executeSalesCamel(String sid) throws Exception{
        salesCommonCamelService.executeCamel(sid);
    }

    /**
     * 판매 - 프로시져 호출
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeSalesProcedure.do", method = RequestMethod.GET)
    public void executeSalesProcedure(String proId) throws Exception{
        salesCommonCamelService.executeSalesProcedure(proId);
    }




    /**
     * 로그인된 딜러로 사업부,사업소,성,시를 조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value="selectDealerInfo.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectDealerInfo(@RequestBody DealerSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        DealerVO dealerVO = salesCommonService.selectDealerInfo(searchVO);

        result.put("dealerVO", dealerVO);

        return result;

    }



    /**
     * 딜러마스터에서 사업부 조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "selectDealerSdpt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerSdpt(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesCommonService.selectDealerSdptCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(salesCommonService.selectDealerSdpt(searchVO));
        }

        return result;
    }



    /**
     * 딜러마스터에서 사무소 조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "selectDealerOffice.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerOffice(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesCommonService.selectDealerOfficeCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(salesCommonService.selectDealerOffice(searchVO));
        }

        return result;
    }




    /**
     * 딜러마스터에서 성조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "selectDealerSung.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerSung(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesCommonService.selectDealerSungCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(salesCommonService.selectDealerSung(searchVO));
        }

        return result;
    }





    /**
     * 딜러마스터에서 도시조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "selectDealerCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerCity(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesCommonService.selectDealerCityCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(salesCommonService.selectDealerCity(searchVO));
        }

        return result;
    }




    /**
     * 딜러마스터에서 딜러조회.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "selectDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealer(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesCommonService.selectDealerCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(salesCommonService.selectDealer(searchVO));
        }

        return result;
    }

    /**
     * 판매 - Camel 호출
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeSalesCamelForDcsSrch.do", method = RequestMethod.GET)
    public void executeSalesCamelForDcsSrch() throws Exception{
        VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
        searchVO.setsDlrCd("D0101");
        searchVO.setsVinNo("LBEHDAEA7GZ325696");

        vehicleMasterService.selectDcsVehicleInfoGathering(searchVO);
    }

    /**
     * 차종 조건으로 차관(모델명) 검색
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCarLooksFscListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarLooksFscListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectCarLooksFscListForCom(carInfoSearchVO));

        return result;
    }

    /**
     * 차관(모델명) 조건으로 OCN 검색 - 전체
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOcnListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcnListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectOcnListForCom(carInfoSearchVO));

        return result;
    }

    /**
     * 차관(모델명) 조건으로 OCN 검색 - 정규오더
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBtoOcnListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoOcnListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectBtoOcnListForCom(carInfoSearchVO));

        return result;
    }

    /**
     * 차관(모델명) 조건으로 OCN 검색 - 전략오더
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectStrOcnListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStrOcnListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectStrOcnListForCom(carInfoSearchVO));

        return result;
    }

    /**
     * OCN 조건으로 외장색 검색
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectExtColorListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColorListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectExtColorListForCom(carInfoSearchVO));

        return result;
    }

    /**
     * 외장색 조건으로 내장색 검색
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIntColorListForCom.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColorListForCom(@RequestBody CarInfoSearchVO carInfoSearchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesCommonService.selectIntColorListForCom(carInfoSearchVO));

        return result;
    }
}
