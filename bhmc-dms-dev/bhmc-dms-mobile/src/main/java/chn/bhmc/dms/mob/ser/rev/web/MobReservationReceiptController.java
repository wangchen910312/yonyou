package chn.bhmc.dms.mob.ser.rev.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobReservationReceiptController.java
 * @Description : 예약현황 컨트롤러
 * @author JongHee Lim
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobReservationReceiptController extends HController {
    /**
     * 예약접수 서비스
     */
    @Autowired
    ReservationReceiptService reservationReceiptService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * Bay캘린더 Service
     */
    //@Resource(name="bayCalendarService")
    //BayCalendarService bayCalendarService;

    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * 예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/reservationReceipt/__selectReservationReceiptMain.do", method = RequestMethod.GET)
    public String __selectReservationReceiptMain(Model model,@RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        String sysDate2 = DateUtil.getDate("yyyy-MM-dd");
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

        // 공통코드 : 예약상태
        model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));


        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate2);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sVinNo", sVinNo);

        model.addAttribute("sResvToDt", sysDate);
        model.addAttribute("sResvFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        return "/mob/ser/rev/reservationReceipt/selectReservationReceiptMain";

    }

    @RequestMapping(value="/mob/ser/rev/reservationReceipt/selectReservationReceiptMain.do", method = RequestMethod.GET)
    public String selectReservationReceiptMain(Model model,@RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        String sysDate2 = DateUtil.getDate("yyyy-MM-dd");
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

        // 공통코드 : 예약상태
        model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));


        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate2);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sVinNo", sVinNo);

        model.addAttribute("sResvToDt", sysDate);
        model.addAttribute("sResvFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/rev/reservationReceipt/baseJsp/selectReservationReceiptMain.jsp");
        model.addAttribute("fromWhere", "selectReservationReceiptMain");
        model.addAttribute("laborsTemplate", "subTemplate2");
        model.addAttribute("partsTemplate", "subTemplate3");

        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }


    /**
     * 예약접수 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/reservationReceipt/selectReservationReceiptList.do", method = RequestMethod.GET)
    public String selectReservationReceiptList(Model model,@RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        return "/mob/ser/rev/reservationReceipt/selectReservationReceiptList";
    }


    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/rev/reservationReceipt/selectReservationReceipts.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectReservationReceipts(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(reservationReceiptService.selectReservationReceiptByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(reservationReceiptService.selectReservationReceiptByCondition(searchVO));
        }
        return result;
     }


    /**
     * 예약접수 목록 - bayNo 리스트 리턴
     */
    @RequestMapping(value = "/mob/ser/rev/reservationReceipt/selectReservationReceiptsBayCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationMasterByItemCd(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        String dlrCd = mobLoginVO.getDlrCd();
        BayManageSearchVO calSearchVO = new BayManageSearchVO();
        calSearchVO.setsDlrCd(dlrCd);
        List<BayMasterVO> bayList = bayManageService.selectBayMastersByCondition(calSearchVO);
        result.setData(bayList);
        return result;
    }


}