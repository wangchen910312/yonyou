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

import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.PreRepairOrderService;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderVO;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreRepairOrderController.java
 * @Description : RO미리점검 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class PreRepairOrderController extends HController {

    /**
     * RO미리점검 서비스
     */
    @Autowired
    PreRepairOrderService preRepairOrderService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 임률 마스터 서비스
     */
    @Autowired
    RateManageService rateManageService;

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
     * RO미리점검 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrderMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,@RequestParam(value="preRoDocNo", defaultValue="") String preRoDocNo
            ,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        Device device = DeviceUtils.getCurrentDevice(request);

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
        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRC");
        model.addAttribute("vinNo", vinNo);
        model.addAttribute("preRoDocNo", preRoDocNo);

        model.addAttribute("sPreRoToDt", sysDate);
        model.addAttribute("sPreRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

        return "/ser/ro/repairOrder/selectPreRepairOrderMain";

    }

    /**
     * RO미리점검 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrders.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectPreRepairOrders(@RequestBody PreRepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(preRepairOrderService.selectPreRepairOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(preRepairOrderService.selectPreRepairOrderByCondition(searchVO));
        }

        return result;

     }

    /**
     * RO미리점검 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrdersList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectPreRepairOrdersList(@RequestBody PreRepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(preRepairOrderService.selectPreRepairOrderListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(preRepairOrderService.selectPreRepairOrderListByCondition(searchVO));
        }

        return result;

    }

    /**
     * RO미리점검를 등록/수정 한다.
     * @param saveVO - RO접수 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/multiPreRepairOrder.do", method = RequestMethod.POST)
    public @ResponseBody String multiPreRepairOrder(@Validated @RequestBody PreRepairOrderSaveVO preRepairOrderSaveVO, BindingResult bindingResult) throws Exception {

        String roDocNo = preRepairOrderService.multiPreRepairOrder(preRepairOrderSaveVO);

        return roDocNo;

    }

    /**
     * RO미리점검 수정/취소한다.
     * @param saveVO - RO 수정/취소 목록을 포함하는 PreRepairOrderVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/updatePreRepairOrder.do", method = RequestMethod.POST)
    public @ResponseBody String updateReservationReceipt(@Validated @RequestBody PreRepairOrderVO preRepairOrderVO, BindingResult bindingResult) throws Exception {

        preRepairOrderService.updatePreRepairOrder(preRepairOrderVO);

        return "OK";

    }



    /**
     * RO미리점검 상세 데이터를 조회한다. (사전점검 테이블 조인)
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrderByKey.do",  method = RequestMethod.POST)
    public @ResponseBody PreRepairOrderVO selectPreRepairOrderByKey(@RequestBody PreRepairOrderSearchVO searchVO) throws Exception {

        PreRepairOrderVO resultVO = preRepairOrderService.selectPreRepairOrderByKey(searchVO);

        if(resultVO == null){
            resultVO = new PreRepairOrderVO();
        }
        return resultVO;

     }

    /**
     * RO미리점검 상세 데이터를 조회한다.(ro 테이블만 검색)
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrderInfoByKey.do",  method = RequestMethod.POST)
    public @ResponseBody PreRepairOrderVO selectPreRepairOrderInfoByKey(@RequestBody PreRepairOrderSearchVO searchVO) throws Exception {

        PreRepairOrderVO resultVO = preRepairOrderService.selectPreRepairOrderInfoByKey(searchVO);

        if(resultVO == null){
            resultVO = new PreRepairOrderVO();
        }
        return resultVO;

     }

    /**
     * RO미리점검 상세 데이터 존재여부 체크
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrderExistByKey.do",  method = RequestMethod.POST)
    public @ResponseBody Boolean selectPreRepairOrderExistByKey(@RequestBody PreRepairOrderSearchVO searchVO) throws Exception {

        PreRepairOrderVO result = preRepairOrderService.selectPreRepairOrderByKey(searchVO);
        return result == null ? false : true;

    }

    /**
     * RO미리점검 취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/repairOrder/selectPreRepairOrderCancelPopup.do", method = RequestMethod.GET)
    public String selectPreRepairOrderCancelPopup(Model model) throws Exception {

        // 공통코드 : RO구분
        model.addAttribute("roCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER014", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/ro/repairOrder/selectPreRepairOrderCancelPopup";
    }

    /**
     * RO미리점검현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrderStatusMain.do", method = RequestMethod.GET)
    public String selectPreRepairOrderStatusMain(Model model
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,@RequestParam(value="preRoDocNo", defaultValue="") String preRoDocNo
            ,@RequestParam(value="parReqStatCd", defaultValue="") String parReqStatCd
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

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

        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));

        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRC");
        model.addAttribute("preFixTp", "PRCSTATUS");

        model.addAttribute("sPreRoToDt", sysDate);
        model.addAttribute("sPreRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        return "/ser/ro/repairOrder/selectPreRepairOrderStatusMain";

    }


}
