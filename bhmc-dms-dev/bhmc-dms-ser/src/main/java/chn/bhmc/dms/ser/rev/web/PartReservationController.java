package chn.bhmc.dms.ser.rev.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.rev.service.PartReservationService;
import chn.bhmc.dms.ser.rev.vo.PartReservationSaveVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationController.java
 * @Description : 부품예약 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class PartReservationController extends HController {

    /**
     * 부품예약 서비스
     */
    @Autowired
    PartReservationService partReservationService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

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
     * 부품예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/selectPartReservationMain.do", method = RequestMethod.GET)
    public String selectPartReservationMain(Model model, HttpServletRequest request, @RequestParam(value="sVinNo", defaultValue="") String sVinNo
            , @RequestParam(value="parResvDocNo", defaultValue="") String parResvDocNo
        ) throws Exception {

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

        // 공통코드 : 부품예약유형
        model.addAttribute("partResvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER016", null, langCd));
        // 공통코드 : 부품예약상태
        model.addAttribute("partResvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER019", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
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
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //부품판매가격유형
        model.addAttribute("partPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        model.addAttribute("sToDt", sysDate);
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRE");
        model.addAttribute("sVinNo", sVinNo);
        model.addAttribute("parResvDocNo", parResvDocNo);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

        return "/ser/rev/partReservation/selectPartReservationMain";

    }

    /**
     * 부품예약접수 리스트 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/selectPartReservationListMain.do", method = RequestMethod.GET)
    public String selectPartReservationListMain(Model model, @RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        // 공통코드 : 부품예약유형
        model.addAttribute("partResvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER016", null, langCd));
        // 공통코드 : 부품예약상태
        model.addAttribute("partResvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER019", null, langCd));
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

        model.addAttribute("sParResvEndDt", sysDate);
        model.addAttribute("sParResvStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRE");
        model.addAttribute("preFixTp", "PRESTATUS");
        model.addAttribute("sVinNo", sVinNo);

        return "/ser/rev/partReservation/selectPartReservationListMain";

    }

    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/selectPartReservations.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceipts(@RequestBody PartReservationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        result.setTotal(partReservationService.selectPartReservationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partReservationService.selectPartReservationByCondition(searchVO));
        }

        return result;

     }

    /**
     * 예약접수 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/selectPartReservationListCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectPartReservationListCnt(@RequestBody PartReservationSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(partReservationService.selectPartReservationByConditionCnt(searchVO));
        return result;
    }

    /**
     * 예약,부품,공임을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/rev/partReservation/multiPartReservation.do", method = RequestMethod.POST)
    public @ResponseBody String multiReservationReceipt(@Validated @RequestBody PartReservationSaveVO partRreservationSaveVO, BindingResult bindingResult) throws Exception {

        String resvDocNo = partReservationService.multiPartReservation(partRreservationSaveVO);

        return resvDocNo;

    }

    /**
     * 예약접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/selectPartReservationByKey.do",  method = RequestMethod.POST)
    public @ResponseBody PartReservationVO selectReservationReceiptByKey(@RequestBody PartReservationSearchVO searchVO) throws Exception {

        PartReservationVO resultVO = partReservationService.selectPartReservationByKey(searchVO);

        if(resultVO == null){
            resultVO = new PartReservationVO();
        }

        return resultVO;

     }

    /**
     * 부품도착 알람
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/partArrivalAlramCall.do", method = RequestMethod.POST)
    public @ResponseBody String partArrivalAlramCall(@RequestBody PartReservationVO partReservationVO) throws Exception {

        partReservationService.partArrivalAlramCall(partReservationVO);

        return "OK";

    }

    /**
     * 예약을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 ReservationReceiptVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/rev/partReservation/updatePartReservationReceipt.do", method = RequestMethod.POST)
    public @ResponseBody String updateReservationReceipt(@Validated @RequestBody PartReservationVO reservationReceiptVO, BindingResult bindingResult) throws Exception {

        partReservationService.updatePartReservation(reservationReceiptVO);

        return "OK";

    }

    /**
     * 예약접수 취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/rev/partReservation/selectPartReservationCancelPopup.do", method = RequestMethod.GET)
    public String selectReservationCancelPopup(Model model) throws Exception {

        // 공통코드 : 취소사유코드
        model.addAttribute("resvCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER018", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/rev/partReservation/selectPartReservationCancelPopup";
    }

    /**
     * 부품예약완료한다
     * @return
     */
    @RequestMapping(value="/ser/rev/partReservation/completePartReservation.do", method = RequestMethod.POST)
    public @ResponseBody String completePartReservation(@Validated @RequestBody PartReservationVO partReservationVO) throws Exception {
        partReservationService.completePartReservation(partReservationVO);

        return "OK";
    }

}