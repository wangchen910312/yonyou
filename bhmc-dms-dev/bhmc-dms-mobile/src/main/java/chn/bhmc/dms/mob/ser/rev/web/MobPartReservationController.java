package chn.bhmc.dms.mob.ser.rev.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.rev.service.PartReservationService;
import chn.bhmc.dms.ser.rev.vo.PartReservationSaveVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobPartReservationController.java
 * @Description : 부품 예약현황 Controller
 * @author JongHee Lim
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobPartReservationController extends HController {

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

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 부품예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/partReservation/__selectPartReservationMain.do", method = RequestMethod.GET)
    public String __selectPartReservationMain(Model model, @RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {


        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

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

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRE");
        model.addAttribute("preFixTp", "PRESTATUS");
        model.addAttribute("sVinNo", sVinNo);

        return "/mob/ser/rev/partReservation/selectPartReservationMain";

    }


    @RequestMapping(value="/mob/ser/rev/partReservation/selectPartReservationMain.do", method = RequestMethod.GET)
    public String selectPartReservationMain(Model model, @RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {


        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

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

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRE");
        model.addAttribute("preFixTp", "PRESTATUS");
        model.addAttribute("sVinNo", sVinNo);
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/rev/partReservation/baseJsp/selectPartReservationMain.jsp");
        model.addAttribute("fromWhere", "selectPartReservationMain");
        model.addAttribute("partsTemplate", "subTemplate3-a");

        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }

    @RequestMapping(value="/mob/ser/rev/partReservation/selectPartReservationList.do", method = RequestMethod.GET)
    public String selectPartReservationList(Model model) throws Exception {
        return "/mob/ser/rev/partReservation/selectPartReservationList";
    }

    @RequestMapping(value="/mob/ser/rev/partReservation/selectPartReservationSubList1.do", method = RequestMethod.GET)
    public String selectPartReservationSubList1(Model model) throws Exception {
        return "/mob/ser/rev/partReservation/selectPartReservationSubList1";
    }


    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/partReservation/selectPartReservations.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceipts(@RequestBody PartReservationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(partReservationService.selectPartReservationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partReservationService.selectPartReservationByCondition(searchVO));
        }

        return result;

     }

    /**
     * 예약,부품,공임을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/ser/rev/partReservation/multiPartReservation.do", method = RequestMethod.POST)
    public @ResponseBody String multiReservationReceipt(@Validated @RequestBody PartReservationSaveVO partRreservationSaveVO, BindingResult bindingResult) throws Exception {

        String resvDocNo = partReservationService.multiPartReservation(partRreservationSaveVO);

        return resvDocNo;

    }

    /**
     * 예약접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/partReservation/selectPartReservationByKey.do",  method = RequestMethod.POST)
    public @ResponseBody PartReservationVO selectReservationReceiptByKey(@RequestBody PartReservationSearchVO searchVO) throws Exception {

        return partReservationService.selectPartReservationByKey(searchVO);

     }

}