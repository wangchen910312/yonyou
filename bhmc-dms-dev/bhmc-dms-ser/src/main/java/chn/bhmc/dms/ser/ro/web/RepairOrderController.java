package chn.bhmc.dms.ser.ro.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.qir.LinkUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderController.java
 * @Description : RO발행 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.   KyungMok Kim     최초 생성
 * </pre>
 */

@SuppressWarnings("restriction")
@Controller
public class RepairOrderController extends HController {

    /**
     * RO접수 서비스
     */
    @Autowired
    RepairOrderService repairOrderService;

    /**
     * BAY관리 마스터 서비스
     */
    @Autowired
    BayManageService bayManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 임률코드 마스터 서비스
     */
    @Autowired
    RateManageService rateManageService;

    /**
     * 서비스운영 마스터 서비스
     */
    @Autowired
    ServiceSettingService serviceSettingService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * RO발행 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model,HttpServletRequest request
            ,@RequestParam(value="roDocNo", defaultValue="") String roDocNo
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,@RequestParam(value="carId", defaultValue="") String carId
            ,@RequestParam(value="parReqStatCd", defaultValue="") String parReqStatCd
            ,@RequestParam(value="diagDocNo", defaultValue="") String diagDocNo
            ,@RequestParam(value="resvDocNo", defaultValue="") String resvDocNo
            ,@RequestParam(value="estDocNo", defaultValue="") String estDocNo
            ,@RequestParam(value="roGrpNo", defaultValue="") String roGrpNo
            ,@RequestParam(value="runDistVal", defaultValue="") String runDistVal
            ,@RequestParam(value="infoType", defaultValue="") String infoType
            ,@RequestParam(value="roTp", defaultValue="") String roTp
            ,@RequestParam(value="carAcptTp", defaultValue="") String carAcptTp
            ,@RequestParam(value="remark", defaultValue="") String remark) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        Device device = DeviceUtils.getCurrentDevice(request);
        String sysDateTime = sysDate + " HH:mm:ss";

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 품질검사
        model.addAttribute("qtTestMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 견적유형
        model.addAttribute("estTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        //딜러자체 유형
        model.addAttribute("dlrRoTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));
        // 서비스운영관리 정보(칸반)
        ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
        model.addAttribute("serSetInfo", serviceSettingService.selectServiceSettingByKey(serSetSearchVO));
        //수불공임편집여부
        model.addAttribute("lbrHmEditYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER069", null, langCd));
        //부품판매가격유형
        model.addAttribute("partPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //인쇄리포트명
        model.addAttribute("rptNm", serviceSettingService.getRptNm(1)); //pageNo (1:RO문서, 2:정비정산서)

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("sysDateTime", sysDateTime);
        model.addAttribute("preFixId", "RO");
        model.addAttribute("roDocNo", roDocNo);
        model.addAttribute("vinNo", vinNo);
        model.addAttribute("carId", carId);
        model.addAttribute("diagDocNo", diagDocNo);
        model.addAttribute("resvDocNo", resvDocNo);
        model.addAttribute("estDocNo", estDocNo);
        model.addAttribute("roGrpNo", roGrpNo);
        model.addAttribute("parReqStatCd", parReqStatCd);
        model.addAttribute("runDistVal", runDistVal);
        model.addAttribute("infoType", infoType);
        model.addAttribute("roTp", roTp);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("carAcptTp", carAcptTp);
        model.addAttribute("remark", remark);
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());
        
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // if(device.isTablet()){
       	if(device.isTablet()||device.isMobile()){
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
            return "/ser/ro/repairOrder/selectRepairOrderMainWa";
        }else{
            return "/ser/ro/repairOrder/selectRepairOrderMain";
        }
    }

    /**
     * RO접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrders.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;

     }

    /**
     * RO접수 목록 데이터 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectDeliveryCheckCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectDeliveryCheckCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));
        return result;
     }

    /**
     * RO접수 현황 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderListByCondition(searchVO));
        }

        return result;

    }

    /**
     * RO접수 현황 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderStatusCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrderStatusCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderListByConditionCnt(searchVO));
        return result;

    }


    /**
     * RO정보 현황 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderInfoList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrderInfoList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderInfoListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderInfoListByCondition(searchVO));
        }

        return result;

    }

    /**
     * RO정보 현황 목록 데이터 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectWorkProcessListCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectWorkProcessListCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderInfoListByConditionCnt(searchVO));
        return result;
    }

    /**
     * RO접수를 등록/수정 한다.
     * @param saveVO - RO접수 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/multiRepairOrder.do", method = RequestMethod.POST)
    public @ResponseBody String multiRepairOrder(@Validated @RequestBody RepairOrderSaveVO repairOrderSaveVO) throws Exception {

        String roDocNo = repairOrderService.multiRepairOrder(repairOrderSaveVO);

        return roDocNo;

    }

    /**
     * RO를 수정/취소한다.
     * @param saveVO - RO 수정/취소 목록을 포함하는 RepairOrderVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/updateRepairOrder.do", method = RequestMethod.POST)
    public @ResponseBody String updateReservationReceipt(@Validated @RequestBody RepairOrderVO repairOrderVO, BindingResult bindingResult) throws Exception {

        repairOrderService.updateRepairOrder(repairOrderVO);

        return "OK";

    }

    /**
     *
     * @param saveVO - RO 수정/취소 목록을 포함하는 RepairOrderVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/updateDelivery.do", method = RequestMethod.POST)
    public @ResponseBody String updateDelivery(@Validated @RequestBody RepairOrderVO repairOrderVO, BindingResult bindingResult) throws Exception {

        return repairOrderService.updateDelivery(repairOrderVO);

    }

    /**
     * Bay관리 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectBayManages.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayManages(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayMastersByCondition(searchVO));
        }

        return result;

     }

    /**
     * RO접수 상세 데이터를 조회한다. (사전점검 테이블 조인)
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderByKey.do",  method = RequestMethod.POST)
    public @ResponseBody RepairOrderVO selectRepairOrderByKey(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        RepairOrderVO resultVO = repairOrderService.selectRepairOrderByKey(searchVO);

        if(resultVO == null){
            resultVO = new RepairOrderVO();
        }

        return resultVO;

     }

    /**
     * RO접수 상세 데이터를 조회한다.(ro 테이블만 검색)
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderInfoByKey.do",  method = RequestMethod.POST)
    public @ResponseBody RepairOrderVO selectRepairOrderInfoByKey(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        return repairOrderService.selectRepairOrderInfoByKey(searchVO);

    }

    /**
     * RO취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/selectRepairOrderCancelPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderCancelPopup(Model model) throws Exception {

        // 공통코드 : RO취소원인
        model.addAttribute("roCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER014", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/ro/repairOrder/selectRepairOrderCancelPopup";
    }

    /**
     * RO현황 화면을 출력한다
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderStatusMain.do", method = RequestMethod.GET)
    public String selectRepairOrderStatusMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        Device device = DeviceUtils.getCurrentDevice(request);

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 견적유형
        model.addAttribute("estTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : RO취소원인
        model.addAttribute("roCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER014", null, langCd));
        // 공통코드 : 자체정의RO유형
        model.addAttribute("dlrRoTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));
        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));

        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "RO");
        model.addAttribute("preFixTp", "ROSTATUS");

        //tablet
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/ro/repairOrder/selectRepairOrderStatusMain";

    }

    /**
     * 인도현황보드 화면을 출력한다
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectCarDeliveryBoard.do", method = RequestMethod.GET)
    public String selectCarDeliveryBoard(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);

        return "/ser/ro/repairOrder/selectCarDeliveryBoard";

    }

    /**
     * 인도현황 칸반  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectDeliveryKanban.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectDeliveryKanban(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(repairOrderService.selectDeliveryKanban(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 인도현황 칸반 컬럼 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectDeliveryKanbanRows.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectDeliveryKanbanRows(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(repairOrderService.selectDeliveryKanbanRowsByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }



    /**
     * RO히스토리  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersHistory.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersHistory(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(repairOrderService.selectRepairOrdersHistory(searchVO));

        return result;

    }


    /**
     * RO 수리항목 히스토리  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersLbrHistory.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersLbrHistory(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectLbrHistListByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectLbrHistListByCondition(searchVO));
        }

        return result;

    }

    /**
     * RO 수리항목 히스토리  목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersLbrHistoryCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersLbrHistoryCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectLbrHistListByConditionCnt(searchVO));
        return result;

    }

    /**
     * RO히스토리  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/getQirSendData.do",  method = RequestMethod.POST)
    public @ResponseBody String getQirSendData(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        String endCodeParam = LinkUtil.getLinkEncode(searchVO.getsBayNo());
        endCodeParam = Base64.encode(endCodeParam.getBytes());

        return endCodeParam;
    }

    /**
     * RO접수 공임 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrderProcess.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrderProcess(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderProcessByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderProcessByCondition(searchVO));
        }

        return result;

     }

    /**
     * RO변경알람
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/roChangeAlramCall.do", method = RequestMethod.POST)
    public @ResponseBody String roChangeAlramCall(@RequestBody RepairOrderVO repairOrderVO) throws Exception {

        repairOrderService.roChangeAlramCall(repairOrderVO);

        return "OK";

    }

    /**
     * 고객의견 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersCustDemandHistory.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersCustDemandHistory(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectCustDmndHistListByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectCustDmndHistListByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고객의견 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectServiceCustDemandHistoryCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectServiceCustDemandHistoryCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectCustDmndHistListByConditionCnt(searchVO));
        return result;
    }

    /**
     * 기타사항 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersEtcHistory.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersEtcHistory(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectEtcHistListByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectEtcHistListByCondition(searchVO));
        }

        return result;

    }

    /**
     * 기타사항 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectSerivceEtcHistoryCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectSerivceEtcHistoryCnt(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectEtcHistListByConditionCnt(searchVO));
        return result;
    }
    
    /**
     * 2020.09.25
     * 查看DMS登陆用户是否有维修委托权限,没有则不能从维修委托查询页面跳转
     * TJX
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectUsrServicePower.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectUsrServicePower() throws Exception {
    	SearchResult result = new SearchResult();
    	String userId = LoginUtil.getUserId();
    	result.setTotal(repairOrderService.selectUsrServicePower(userId));
    	return result;
    }

}
