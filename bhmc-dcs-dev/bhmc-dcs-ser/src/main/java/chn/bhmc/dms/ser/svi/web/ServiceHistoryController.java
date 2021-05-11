package chn.bhmc.dms.ser.svi.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceHistoryController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 24.     Kwon ki hyun     최초 생성
 *  2018.06.21.     Jin JUNG        add method - selectServiceEveHistoryMain()
 * </pre>
 */
@Controller
public class ServiceHistoryController extends HController{


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 서비스 공통용 RO이력  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceHistory/selectServiceHistoryMain.do", method = RequestMethod.GET)
    public String selectServiceHistoryMain(Model model
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,@RequestParam(value="searchGubun", defaultValue="") String searchGubun
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
         //지불방식
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 검색구분
        model.addAttribute("searchTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER310", null, langCd));
        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        model.addAttribute("preFixId", "SERHIST");
        model.addAttribute("vinNo", vinNo);
        model.addAttribute("searchGubun", searchGubun);

        return "/ser/svi/serviceHistory/selectServiceHistoryMain";
    }

    /**
     * 서비스 공통용 RO 수리항목 이력  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceHistory/selectServiceLbrHistoryMain.do", method = RequestMethod.GET)
    public String selectServiceLbrHistoryMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

        model.addAttribute("userId", LoginUtil.getUserId());

        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        // 공통코드 : 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 공통코드 : 캠페인유형(리콜캠페인 구분)
        model.addAttribute("crTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER930", null, langCd));

        return "/ser/svi/serviceHistory/selectServiceLbrHistoryMain";
    }

    /**
     * 서비스 공통용 RO 고객의견 이력  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceHistory/selectServiceCustDemandHistoryMain.do", method = RequestMethod.GET)
    public String selectServiceCustDemandHistoryMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        return "/ser/svi/serviceHistory/selectServiceCustDemandHistoryMain";
    }

    /**
     * 서비스 공통용 RO 기타사항 이력  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceHistory/selectServiceEtcHistoryMain.do", method = RequestMethod.GET)
    public String selectServiceEtcHistoryMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        return "/ser/svi/serviceHistory/selectServiceEtcHistoryMain";
    }

    /**
     * 전일자 정비 현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceHistory/selectServiceEveHistoryMain.do", method = RequestMethod.GET)
    public String selectServiceEveHistoryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String previousDay = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -1), "yyyy-MM-dd"); //전날 (default 조회조건일)

        // 인터페이스 일자
        model.addAttribute("previousDay", previousDay);

        // 공통코드 : 인터페이스처리상태 (상태코드 검색 조건)
        model.addAttribute("lastAchkResCdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM073", null, langCd));

        return "/ser/svi/serviceHistory/selectServiceEveHistoryMain";
    }

}
