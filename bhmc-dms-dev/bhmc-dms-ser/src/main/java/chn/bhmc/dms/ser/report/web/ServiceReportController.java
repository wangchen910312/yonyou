package chn.bhmc.dms.ser.report.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkProcessController.java
 * @Description : 작업진도관리 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class ServiceReportController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 애프터경영현황통계분서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectServiceMisListMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectServiceMisListMain";

    }

    /**
     * 수리입장차수통계분서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectRoCntListMain.do", method = RequestMethod.GET)
    public String selectRoCntListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectRoCntListMain";

    }

    /**
     * 서비스고문성과통계 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectSaIncomeListMain.do", method = RequestMethod.GET)
    public String selectSaIncomeListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectSaIncomeListMain";

    }

    /**
     * 수리기사작업시간통계보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectTecLbrHmListMain.do", method = RequestMethod.GET)
    public String selectTecLbrHmListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectTecLbrHmListMain";

    }

    /**
     * 예약재방문율보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectRevRevisitListMain.do", method = RequestMethod.GET)
    public String selectRevRevisitListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectRevRevisitListMain";

    }

    /**
     * 수리이이율통계분석 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectRepairProfitListMain.do", method = RequestMethod.GET)
    public String selectRepairProfitListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectRepairProfitListMain";

    }

    /**
     * 수리공헌통계분석 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectRepairSicenceListMain.do", method = RequestMethod.GET)
    public String selectRepairSicenceListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectRepairSicenceListMain";

    }

    /**
     * 수리항목분석 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectRepairItemListMain.do", method = RequestMethod.GET)
    public String selectRepairItemListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectRepairItemListMain";

    }

    /**
     * 일차복구율통계 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectOneTimeRestoreListMain.do", method = RequestMethod.GET)
    public String selectOneTimeRestoreListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectOneTimeRestoreListMain";

    }

    /**
     * 애프터플로우업재방율통계 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectFcallSuccesRateListMain.do", method = RequestMethod.GET)
    public String selectFcallSuccesRateListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectFcallSuccesRateListMain";

    }

    /**
     * PWA일차심사통과율 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectPwaOneTimePassRateListMain.do", method = RequestMethod.GET)
    public String selectPwaOneTimePassRateListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectPwaOneTimePassRateListMain";

    }

    /**
     * 클레임일차심사통과율 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectClaimOneTimePassRateListMain.do", method = RequestMethod.GET)
    public String selectClaimOneTimePassRateListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectClaimOneTimePassRateListMain";

    }

    /**
     * 정시일러버리율보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectKeepDeliveryListMain.do", method = RequestMethod.GET)
    public String selectKeepDeliveryListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectKeepDeliveryListMain";

    }

    /**
     * 단위작업공정이용율분석보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectLbrUseRateListMain.do", method = RequestMethod.GET)
    public String selectLbrUseRateListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectLbrUseRateListMain";

    }

    /**
     * 엔진니어작업통계보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectTecRepairCountListMain.do", method = RequestMethod.GET)
    public String selectTecRepairCountListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectTecRepairCountListMain";

    }

    /**
     * 수리공정시간보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectLbrHmCountListMain.do", method = RequestMethod.GET)
    public String selectLbrHmCountListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectLbrHmCountListMain";

    }

    /**
     * 품질검사리워크비율보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/report/selectQtChkReworkListMain.do", method = RequestMethod.GET)
    public String selectQtChkReworkListMain(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/report/selectQtChkReworkListMain";

    }

}
