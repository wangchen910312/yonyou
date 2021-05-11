package chn.bhmc.dms.ser.rev.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSaveVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptController.java
 * @Description : 예약접수 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class ReservationReceiptController extends HController {
    /**
     * 예약접수 서비스
     */
    @Autowired
    ReservationReceiptService reservationReceiptService;

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
     * 임률 마스터 서비스
     */
    @Autowired
    RateManageService rateManageService;

    /**
     * 서비스운영 마스터 서비스
     */
    @Autowired
    ServiceSettingService serviceSettingService;

    /**
     * 알람 서비스
     */
    @Autowired
    NotificationMessageService notificationMessageService;

    @Autowired
    TechManFnMasterService techManFnMasterService;

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
     * 예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptMain.do", method = RequestMethod.GET)
    public String selectReservationReceiptMain(Model model,HttpServletRequest request, @RequestParam(value="sVinNo", defaultValue="") String sVinNo
            ,@RequestParam(value="sResvDocNo", defaultValue="") String sResvDocNo
            ,@RequestParam(value="sCarRegNo", defaultValue="") String sCarRegNo
            ,@RequestParam(value="sCarOwnerNm", defaultValue="") String sCarOwnerNm
            ,@RequestParam(value="sLinkType", defaultValue="") String sLinkType
            ,@RequestParam(value="sResvTp", defaultValue="") String sResvTp) throws Exception {

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

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
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
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
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
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        //서비스예약알람설정
        model.addAttribute("resvSerAlarmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER067", null, langCd));
        //부품판매가격유형
        model.addAttribute("partPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));
        // 서비스운영관리 정보(칸반)
        ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
        model.addAttribute("serSetInfo", serviceSettingService.selectServiceSettingByKey(serSetSearchVO));


        TechManFnMasterSearchVO techMansearchVO = new TechManFnMasterSearchVO();
        techMansearchVO.setsWrkTp("05");
        List<TechManFnMasterVO> techManList = techManFnMasterService.selectTechManFnMasterByCondition(techMansearchVO);
        model.addAttribute("techManList", techManList);

        techMansearchVO = new TechManFnMasterSearchVO();
        techMansearchVO.setsWrkTp("01");
        List<TechManFnMasterVO> saList = techManFnMasterService.selectTechManFnMasterByCondition(techMansearchVO);
        model.addAttribute("saList", saList);


        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sVinNo", sVinNo);
        model.addAttribute("sCarRegNo", sCarRegNo);
        model.addAttribute("sCarOwnerNm", sCarOwnerNm);
        model.addAttribute("sResvDocNo", sResvDocNo);
        model.addAttribute("sLinkType", sLinkType);
        model.addAttribute("sResvTp", sResvTp);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

        return "/ser/rev/reservationReceipt/selectReservationReceiptMain";

    }

    /**
     * 예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptMain_New.do", method = RequestMethod.GET)
    public String selectReservationReceiptMain_New(Model model,@RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
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
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));

        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sVinNo", sVinNo);

        return "/ser/rev/reservationReceipt/selectReservationReceiptMain_New";

    }

    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceipts.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceipts(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(reservationReceiptService.selectReservationReceiptByConditionCnt(searchVO));
        result.setData(reservationReceiptService.selectReservationReceiptByCondition(searchVO));

        return result;

     }

    /**
     * 칸반 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectKanbanReservation.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectKanbanReservationByCondition(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(reservationReceiptService.selectKanbanReservationByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptsList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceiptsList(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        result.setTotal(reservationReceiptService.selectReservationReceiptListByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(reservationReceiptService.selectReservationReceiptListByCondition(searchVO));
        }


        return result;

    }

    /**
     * 예약접수 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptStatusCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceiptStatusCnt(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(reservationReceiptService.selectReservationReceiptListByConditionCnt(searchVO));
        return result;
    }

    /**
     * 예약,부품,공임을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/rev/reservationReceipt/multiReservationReceipt.do", method = RequestMethod.POST)
    public @ResponseBody String multiReservationReceipt(@Validated @RequestBody ReservationReceiptSaveVO reservationReceiptSaveVO) throws Exception {

        String resvDocNo = reservationReceiptService.multiReservationReceipt(reservationReceiptSaveVO);

        return resvDocNo;

    }

    /**
     * 예약을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 ReservationReceiptVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/rev/reservationReceipt/updateReservationReceipt.do", method = RequestMethod.POST)
    public @ResponseBody String updateReservationReceipt(@Validated @RequestBody ReservationReceiptVO reservationReceiptVO, BindingResult bindingResult) throws Exception {

        reservationReceiptService.updateReservationReceipt(reservationReceiptVO);

        return "OK";

    }

    /**
     * Bay관리 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectBayManages.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayManages(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayMastersByCondition(searchVO));
        }

        return result;

     }

    /**
     * 예약접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptByKey.do",  method = RequestMethod.POST)
    public @ResponseBody ReservationReceiptVO selectReservationReceiptByKey(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

        ReservationReceiptVO resultVO = reservationReceiptService.selectReservationReceiptByKey(searchVO);

        if(resultVO == null){
            resultVO = new ReservationReceiptVO();
        }
        return resultVO;

     }

    /**
     * 예약준수 상태 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptByStats.do",  method = RequestMethod.POST)
    public @ResponseBody ReservationReceiptVO selectReservationReceiptByStats(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

        return reservationReceiptService.selectReservationReceiptByStats(searchVO);

    }

    /**
     * 예약접수 취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/rev/reservationReceipt/selectReservationCancelPopup.do", method = RequestMethod.GET)
    public String selectReservationCancelPopup(Model model) throws Exception {

        // 공통코드 : 예약구분
        model.addAttribute("resvCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER014", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/rev/reservationReceipt/selectReservationCancelPopup";
    }

    /**
     * 예약접수 현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationReceiptStatusMain.do", method = RequestMethod.GET)
    //public String selectReservationReceipStatusMain(Model model) throws Exception {
    public String selectReservationReceipStatusMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        Device device = DeviceUtils.getCurrentDevice(request);
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);

        // 2016.09.22 태블릿 분기처리 추가(jhlim)
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        if (device.isTablet()||device.isMobile()) {  // 태블릿화면
        //if (device.isTablet()) {  // 태블릿화면
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end


            /* 20170427 테블릿하면 WEB으로 전환
            String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
            model.addAttribute("toDt",            sysDate);
            model.addAttribute("sevenDtBf",       sevenDtBf);

            // 공통코드 : 예약상태
            model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
            // 공통코드 : 예약구분
            model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
            // 공통코드 : RO유형
            model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
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

            //공통코드 : 승/상용 구분
            model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));

            // 공통코드 : 예약상태
            model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));
            model.addAttribute("dlrCd", LoginUtil.getDlrCd());
            model.addAttribute("sysDate", sysDate);
            model.addAttribute("preFixId", "RE");
            //model.addAttribute("sVinNo", sVinNo);

            ServiceSettingSearchVO searchVO2 = new ServiceSettingSearchVO();
            searchVO2.setsDlrCd(LoginUtil.getDlrCd());
            List<ServiceSettingVO> list2 =  serviceSettingService.selectServiceSettingByCondition(searchVO2);
            if(list2 != null && list2.size() > 0){
                model.addAttribute("resvAvlbStartHm", list2.get(0).getResvAvlbStartHm());
                model.addAttribute("resvAvlbEndHm", list2.get(0).getResvAvlbEndHm());
            }

            return "/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptMain";
            */

            // 공통코드 : 예약상태
            model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
            // 공통코드 : 예약구분
            model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
            // 공통코드 : RO유형
            model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
            // 캠페인 구분코드
            model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
            //브랜드 코드
            model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
            // 공통코드 : 예약상태
            model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));
            //공통코드 : 승/상용 구분
            model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
            //서비스예약알람설정
            model.addAttribute("resvSerAlarmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER067", null, langCd));

            model.addAttribute("sResvToDt", sysDate);
            model.addAttribute("sResvFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
            model.addAttribute("preFixId", "RE");
            model.addAttribute("dlrCd", LoginUtil.getDlrCd());
            model.addAttribute("sysDate", sysDate);
          //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
            //model.addAttribute("isTablet", device.isTablet());
            model.addAttribute("isTablet", device.isTablet()||device.isMobile());
          //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

            return "/ser/rev/reservationReceipt/selectReservationReceiptStatusMain";

        }else{ // 웹화면

            // 공통코드 : 예약상태
            model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
            // 공통코드 : 예약구분
            model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
            // 공통코드 : RO유형
            model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
            // 캠페인 구분코드
            model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
            //브랜드 코드
            model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
            // 공통코드 : 예약상태
            model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));
            //공통코드 : 승/상용 구분
            model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
            //서비스예약알람설정
            model.addAttribute("resvSerAlarmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER067", null, langCd));

            model.addAttribute("sResvToDt", sysDate);
            model.addAttribute("sResvFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
            model.addAttribute("preFixId", "RE");
            model.addAttribute("dlrCd", LoginUtil.getDlrCd());
            model.addAttribute("sysDate", sysDate);

            return "/ser/rev/reservationReceipt/selectReservationReceiptStatusMain";
        }

    }

    /**
     * 예약계획보드 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationPlanBoard.do", method = RequestMethod.GET)
    public String selectReservationKanbanBoard(Model model
            ,@RequestParam(value="dlrCd", defaultValue="") String dlrCd) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("sysDate", sysDate);

        // 서비스운영관리 정보(칸반)
        ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
        serSetSearchVO.setsDlrCd(dlrCd);
        model.addAttribute("serSetInfo", serviceSettingService.selectServiceSettingByKey(serSetSearchVO));

        return "/ser/rev/reservationReceipt/selectReservationPlanBoard";

    }

    /**
     * 예약서비스보드 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/selectReservationServiceBoard.do", method = RequestMethod.GET)
    public String selectReservationPlanBoard(Model model
            ,@RequestParam(value="dlrCd", defaultValue="") String dlrCd) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("sysDate", sysDate);

        return "/ser/rev/reservationReceipt/selectReservationServiceBoard";

    }

    /**
     * 예약접수 알람
     * @return
     */
    @RequestMapping(value="/ser/rev/reservationReceipt/resvRegAlramCall.do", method = RequestMethod.POST)
    public @ResponseBody String resvRegAlramCall(@RequestBody List<ReservationReceiptVO> resvList) throws Exception {

        reservationReceiptService.resvRegAlramCall(resvList);

        return "OK";

    }

    /**
     * 예약접수 알람 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/rev/reservationReceipt/selectReservationAlramPopup.do", method = RequestMethod.GET)
    public String selectReservationAlramPopup(Model model) throws Exception {
        return "/ser/rev/reservationReceipt/selectReservationAlramPopup";
    }

}