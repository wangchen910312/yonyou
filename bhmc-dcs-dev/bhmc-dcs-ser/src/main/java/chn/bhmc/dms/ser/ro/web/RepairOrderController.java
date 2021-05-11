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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.ro.service.RepairOrderLaborService;
import chn.bhmc.dms.ser.ro.service.RepairOrderPartService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;

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
 *  2018.06.21.     Jin JUNG        add method - selectRepairOrdersEveStatus()
 * </pre>
 */

@Controller
public class RepairOrderController extends HController {

    /**
     * RO접수 서비스
     */
    @Autowired
    RepairOrderService repairOrderService;

    /**
     * RO부품 서비스
     */
    @Autowired
    RepairOrderPartService repairOrderPartService;

    /**
     * RO공임 서비스
     */
    @Autowired
    RepairOrderLaborService repairOrderLaborService;

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
        model.addAttribute("isTablet", device.isTablet());

        return "/ser/ro/repairOrder/selectRepairOrderStatusMain";

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
     * 전일자 정비 현황을 조회 한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectRepairOrdersEveStatus.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrdersEveStatus(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectROCntByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectROCntByCondition(searchVO));
        }

        return result;

    }

}
