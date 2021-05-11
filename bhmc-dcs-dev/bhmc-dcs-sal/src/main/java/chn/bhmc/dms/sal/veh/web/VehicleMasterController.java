package chn.bhmc.dms.sal.veh.web;


import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;



/**
 * 차량마스터(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 29
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자               수정내용
 *  -------------    ------------    ---------------------------
 *   2016.01.29       Kim yewon             최초 생성
 *   2013.03.30       Kim Jin Suk             수정
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleMaster")
public class VehicleMasterController extends HController {

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

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
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * RO접수 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;


    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;


    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;


    /**
     * 차량마스터  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterMain.do", method = RequestMethod.GET)
    public String selectVehicleMasterMain(Model model,
            @RequestParam(value="sVinNo",    required = false, defaultValue="") String sVinNo,
            @RequestParam(value="sCarId",    required = false, defaultValue="") String sCarId,
            @RequestParam(value="sSerFg",    required = false, defaultValue="N") String sSerFg
        ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());

        String sysDate     = DateUtil.getDate("yyyy-MM-dd");
        String oneDay      = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //차량보유상태 SAL007
        model.addAttribute("asignYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL007", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //차량보유상태 SAL149
        model.addAttribute("ownStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //차량그레이여부 SAL024
        model.addAttribute("greyDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL112", null, langCd));
        //보증기준 SAL016
        model.addAttribute("grteStdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL016", null, langCd));
        //자사차량구분 SAL118
        model.addAttribute("corpCarDstinDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL118", null, langCd));
        //브랜드 COM019
        model.addAttribute("carBrandDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //손상여부 SAL049
        model.addAttribute("damageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL049", null, langCd));
        //공개여부 SAL047
        model.addAttribute("openYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL047", null, langCd));
        //합격증상태 SAL052
        model.addAttribute("certSecu2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL052", null, langCd));
        //조건기간구분 SAL061
        model.addAttribute("searchDtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL061", null, langCd));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));
        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        //상태변동유형 SAL009
        model.addAttribute("statChgDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL009", null, langCd));

        //공통코드 : RO유형 SER031
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //공통코드 : 여부 COM020
        model.addAttribute("ynList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        //CRM에서 넘어오는 VIN NO
        model.addAttribute("sVinNo", sVinNo);

        //정비에서 넘어오는 CAR ID
        model.addAttribute("sCarId", sCarId);
        //정비에서 넘어오는 정비호출 구분
        model.addAttribute("sSerFg", sSerFg);

        //판매취소사유 SAL129
        model.addAttribute("deliveryCnclCusDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));

        //판매사원 리스트
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));

        //입출고구분 SAL187
        model.addAttribute("deliveryTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL187", null, langCd));

        return "/sal/veh/vehicleMaster/selectVehicleMasterMain";
    }


    /**
     * 차량마스터목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMaster(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();

        result.setTotal(vehicleMasterService.selectVehicleMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterByCondition(searchVO));
        }

        return result;
    }

    /**
     * 보증종료일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectWrrntEndDt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWrrntEndDt(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleMasterService.selectWrrntEndDt(searchVO));
        return result;
    }

    /**
     * 차량마스터 메인 저장
     */
    @RequestMapping(value = "/saveVehicleMasterMain.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveVehicleMasterMain(@RequestBody VehicleMasterSaveVO saveVO) throws Exception {
        vehicleMasterService.saveVehicleMasterMain(saveVO);

        return true;
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
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel2.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel2(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            //result.setData(carInfoService.selectModelListsByCondition(searchVO));
            result.setData(carInfoService.selectModelListsByCondition2(searchVO));
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
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn2.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn2(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();

        //log.info("ph1---------------------------------");
        //result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));
       // log.info("ph2---------------------------------");
        //if(result.getTotal() != 0){
            //result.setData(carInfoService.selectOcnListsByCondition(searchVO));
            log.info("ph3---------------------------------");
            result.setData(carInfoService.selectOcnListsByCondition2(searchVO));

       // }
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

        //20170318 hg 모델코드 가져오기
        String modelCd = "";
        modelCd = carInfoService.selectModelCdByCondition(searchVO);

        searchVO.setModelCd(modelCd);

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

        //20170318 hg 모델코드 가져오기
        String modelCd = "";
        modelCd = carInfoService.selectModelCdByCondition(searchVO);

        searchVO.setModelCd(modelCd);

        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 차량소유자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterOwner.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterOwner(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterOwnerByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterOwnerByCondition(searchVO));
        }

        return result;
    }



    /**
     * 차량운전자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterDriver.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterDriver(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterDriverByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterDriverByCondition(searchVO));
        }

        return result;
    }



    /**
     * 서비스 탭 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectServiceRepairOrders.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;
    }

    /**
     * 옵션 탭 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterOption.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterOption(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterOptionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterOptionsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 옵션 저장한다.
     */
    @RequestMapping(value = "/saveVehicleMasterOption.do", method = RequestMethod.POST)
    @ResponseBody
    public int saveVehicleMasterOption(@RequestBody VehicleMasterSaveVO saveVO) throws Exception {
        return vehicleMasterService.saveVehicleMasterOption(saveVO);
    }

    /**
     * 옵션 자재 리스트를 가져온다.
     */
    @RequestMapping(value = "/selectOptionList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOptionList(@RequestBody CarInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectMapOptionListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectMapOptionListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 계약 탭을 조회한다.
     */
    @RequestMapping(value = "/selectVehicleMasterContract.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterContract(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterContractsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterContractsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 주문 탭을 조회한다.
     */
    @RequestMapping(value = "/selectVehicleMasterOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterOrder(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterOrdersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterOrdersByCondition(searchVO));
        }

        return result;
    }


    /**
     * 재고 리스트를 가져온다.
     */
    @RequestMapping(value = "/selectVehicleMasterStock.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterStock(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterStocksByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterStocksByCondition(searchVO));
        }

        return result;
    }

    /**
     * 정비에서 사용되는 신차 등록하는 로직.
     */
    @RequestMapping(value = "/saveNewCar.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> saveNewCar(@RequestBody VehicleMasterVO saveVO) throws Exception {

    	Map<String, Object> result = new HashMap<String, Object>();

    	String carId = vehicleMasterService.saveNewCar(saveVO);

    	VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();
    	vehicleMasterVO.setCarId(carId);

    	result.put("vehicleMasterVO", vehicleMasterVO);

        return result;
    }

    /**
     * 출입고이력 리스트를 가져온다.
     */
    @RequestMapping(value = "/selectVehicleMasterDeliveryHist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterDeliveryHist(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterDeliveryHistCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(vehicleMasterService.selectVehicleMasterDeliveryHist(searchVO));
        }

        return result;
    }

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectModelTypeCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFscList(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectModelTypeCombo(searchVO));
        return result;
    }

    /**
     * OCN콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectOcnCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFscOcnList(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectOcnCombo(searchVO));
        return result;
    }

    /**
     * 외색콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectExtColorCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNewCarLooksExtClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectExtColorCombo(searchVO));
        return result;
    }

    /**
     * 내색콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectIntColorCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNewCarLooksIntClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectIntColorCombo(searchVO));
        return result;
    }
}