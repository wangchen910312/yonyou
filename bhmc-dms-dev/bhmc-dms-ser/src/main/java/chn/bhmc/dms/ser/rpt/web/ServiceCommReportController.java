package chn.bhmc.dms.ser.rpt.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommReportController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 2. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 27.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/ser/rpt/")
public class ServiceCommReportController {

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="serviceSettingService")
    ServiceSettingService serviceSettingService;

    @RequestMapping(value = "/selectRoReportMain.do", method = RequestMethod.GET)
    public String selectRoReportMain(Model model) throws Exception{
        return "/ser/rpt/selectRoReportMain";
    }

    @RequestMapping(value = "/selectRoTimeSearchReport.do", method = RequestMethod.GET)
    public String selectRoTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/ser/rpt/selectRoTimeSearchReport";
    }

    @RequestMapping(value = "/selectRoCarLineTpReport.do", method = RequestMethod.GET)
    public String selectCarLineTpReportMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);

        return "/ser/rpt/selectRoCarLineTpReport";
    }

    @RequestMapping(value = "/selectRoRepairOrderManReport.do", method = RequestMethod.GET)
    public String selectRepairOrderManReportMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);

        return "/ser/rpt/selectRoRepairOrderManReport";
    }

    @RequestMapping(value = "/selectRoRepairTpReport.do", method = RequestMethod.GET)
    public String selectRepairTpReportMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);

        return "/ser/rpt/selectRoRepairTpReport";
    }

    //보증클레임리포트 메인
    @RequestMapping(value = "/selectWarrCliReportMain.do", method = RequestMethod.GET)
    public String selectWarrCliReportMain(Model model) throws Exception{

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);

        return "/ser/rpt/selectWarrCliReportMain";
    }

    //보증클레임리포트 -시간조회
    @RequestMapping(value = "/selectWarrCliTimeSearchReport.do", method = RequestMethod.GET)
    public String selectWarrCliTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectWarrCliTimeSearchReport";
    }

    //보증클레임리포트 -차종명
    @RequestMapping(value = "/selectWarrCliCarlineNmReport.do", method = RequestMethod.GET)
    public String selectWarrCliCarlineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectWarrCliCarlineNmReport";
    }

    //서비스종합리포트 메인
    @RequestMapping(value = "/selectSerTotReportMain.do", method = RequestMethod.GET)
    public String selectSerTotReportMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // RO유형(위탁유형)
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 자체정의유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));

        return "/ser/rpt/selectSerTotReportMain";
    }

    //서비스종합리포트 - 시간조회
    @RequestMapping(value = "/selectSerTotTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSerTotTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectSerTotTimeSearchReport";
    }

    //서비스종합리포트 - 차종명
    @RequestMapping(value = "/selectSerTotCarLineNmReport.do", method = RequestMethod.GET)
    public String selectSerTotCarLineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectSerTotCarLineNmReport";
    }

    //서비스종합리포트 - 위탁유형
    @RequestMapping(value = "/selectSerTotFosterTpReport.do", method = RequestMethod.GET)
    public String selectSerTotFosterTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerTotFosterTpReport";
    }

    //서비스종합리포트 - 수리유형
    @RequestMapping(value = "/selectSerTotRepairTpReport.do", method = RequestMethod.GET)
    public String selectSerTotRepairTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerTotRepairTpReport";
    }

    //서비스종합리포트 - 자체정의유형
    @RequestMapping(value = "/selectSerTotSelfDefineTpReport.do", method = RequestMethod.GET)
    public String selectSerTotSelfDefineTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerTotSelfDefineTpReport";
    }

    //서비스효과리포트 메인
    @RequestMapping(value = "/selectSerEffectReportMain.do", method = RequestMethod.GET)
    public String selectSerEffectReportMain(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));        // RO유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));      // 수리유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));  // 자체정의유형

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/ser/rpt/selectSerEffectReportMain";
    }

    //서비스효과리포트 - 시간조회
    @RequestMapping(value = "/selectSerEffectTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSerEffectTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerEffectTimeSearchReport";
    }

    //서비스효과리포트 - 차종명
    @RequestMapping(value = "/selectSerEffectCarLineNmReport.do", method = RequestMethod.GET)
    public String selectSerEffectCarLineNmReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerEffectCarLineNmReport";
    }

    //서비스효과리포트 - 위탁유형
    @RequestMapping(value = "/selectSerEffectFosterTpReport.do", method = RequestMethod.GET)
    public String selectSerEffectFosterTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerEffectFosterTpReport";
    }

    //서비스효과리포트 - 수리유형
    @RequestMapping(value = "/selectSerEffectRepairTpReport.do", method = RequestMethod.GET)
    public String selectSerEffectRepairTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerEffectRepairTpReport";
    }

    //서비스효과리포트 - 자체정의유형
    @RequestMapping(value = "/selectSerEffectSelfDefineTpReport.do", method = RequestMethod.GET)
    public String selectSerEffectSelfDefineTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerEffectSelfDefineTpReport";
    }

    //서비스생산액리포트 메인
    @RequestMapping(value = "/selectSerPrdAmtReportMain.do", method = RequestMethod.GET)
    public String selectSerPrdAmtReportMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // RO유형(위탁유형)
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 자체정의유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));

        return "/ser/rpt/selectSerPrdAmtReportMain";
    }

    //서비스생산액리포트 - 시간조회
    @RequestMapping(value = "/selectSerPrdAmtTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSerPrdAmtTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectSerPrdAmtTimeSearchReport";
    }

    //서비스생산액리포트 - 차종명
    @RequestMapping(value = "/selectSerPrdAmtCarLineNmReport.do", method = RequestMethod.GET)
    public String selectSerPrdAmtCarLineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectSerPrdAmtCarLineNmReport";
    }

    //서비스생산액리포트 - 위탁유형
    @RequestMapping(value = "/selectSerPrdAmtFosterTpReport.do", method = RequestMethod.GET)
    public String selectSerPrdAmtFosterTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerPrdAmtFosterTpReport";
    }

    //서비스생산액리포트 - 수리유형
    @RequestMapping(value = "/selectSerPrdAmtRepairTpReport.do", method = RequestMethod.GET)
    public String selectSerPrdAmtRepairTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerPrdAmtRepairTpReport";
    }

    //서비스생산액리포트 - 자체정의유형
    @RequestMapping(value = "/selectSerPrdAmtSelfDefineTpReport.do", method = RequestMethod.GET)
    public String selectSerPrdAmtSelfDefineTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSerPrdAmtSelfDefineTpReport";
    }

  //접대실적리포트 메인
    @RequestMapping(value = "/selectSupportPerfReportMain.do", method = RequestMethod.GET)
    public String selectSupportPerfReportMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("startDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));        // RO유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));      //수리유형
        //자체정의유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/ser/rpt/selectSupportPerfReportMain";
    }

  //접대실적리포트 - 접대실적
    @RequestMapping(value = "/selectSupportPerfSupportPerfReport.do", method = RequestMethod.GET)
    public String selectSupportPerfSupportPerfReport(Model model) throws Exception{
        return "/ser/rpt/selectSupportPerfSupportPerfReport";
    }

    //접대실적리포트 - 시간조회
    @RequestMapping(value = "/selectSupportPerfTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSupportPerfTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectSupportPerfTimeSearchReport";
    }

    //접대실적리포트 - 차종명
    @RequestMapping(value = "/selectSupportPerfCarLineNmReport.do", method = RequestMethod.GET)
    public String selectSupportPerfCarLineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectSupportPerfCarLineNmReport";
    }

    //접대실적리포트 - 위탁유형
    @RequestMapping(value = "/selectSupportPerfFosterTpReport.do", method = RequestMethod.GET)
    public String selectSupportPerfFosterTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSupportPerfFosterTpReport";
    }

    //접대실적리포트 - 수리유형
    @RequestMapping(value = "/selectSupportPerfRepairTpReport.do", method = RequestMethod.GET)
    public String selectSupportPerfRepairTpReport(Model model) throws Exception{
        return "/ser/rpt/selectSupportPerfRepairTpReport";
    }

    //서비스시간 메인
    @RequestMapping(value = "/selectSerTimeReportMain.do", method = RequestMethod.GET)
    public String selectSerTimeReportMain(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // RO유형(위탁유형)
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 자체정의유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));

        return "/ser/rpt/selectSerTimeReportMain";
    }

    //서비스시간 - 시간조회
    @RequestMapping(value = "/selectSerTimeTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSerTimeTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerTimeTimeSearchReport";
    }

    //서비스시간 - 차종명
    @RequestMapping(value = "/selectSerTimeCarLineNmReport.do", method = RequestMethod.GET)
    public String selectSerTimeCarLineNmReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerTimeCarLineNmReport";
    }

    //서비스시간 - 위탁유형
    @RequestMapping(value = "/selectSerTimeFosterTpReport.do", method = RequestMethod.GET)
    public String selectSerTimeFosterTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerTimeFosterTpReport";
    }

    //서비스시간 - 수리유형
    @RequestMapping(value = "/selectSerTimeRepairTpReport.do", method = RequestMethod.GET)
    public String selectSerTimeRepairTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerTimeRepairTpReport";
    }

    //서비스시간 - 자체정의유형
    @RequestMapping(value = "/selectSerTimeSelfDefineTpReport.do", method = RequestMethod.GET)
    public String selectSerTimeSelfDefineTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerTimeSelfDefineTpReport";
    }

  //고객서비스 메인
    @RequestMapping(value = "/selectCustSerReportMain.do", method = RequestMethod.GET)
    public String selectCustSerReportMain(Model model) throws Exception{
        return "/ser/rpt/selectCustSerReportMain";
    }

    //고객서비스 - 고객서비스
    @RequestMapping(value = "/selectCustSerCustSerReport.do", method = RequestMethod.GET)
    public String selectCustSerCustSerReport(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("oneDay", oneDay);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        //고객유형
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        return "/ser/rpt/selectCustSerCustSerReport";
    }

    //고객추적 메인
    @RequestMapping(value = "/selectCustTraceReportMain.do", method = RequestMethod.GET)
    public String selectCustTraceReportMain(Model model) throws Exception{
        return "/ser/rpt/selectCustTraceReportMain";
    }

    //고객추적 - 고객추적
    @RequestMapping(value = "/selectCustTraceCustTraceReport.do", method = RequestMethod.GET)
    public String selectCustTraceCustTraceReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectCustTraceCustTraceReport";
    }

    //고객추적 - 차종명
    @RequestMapping(value = "/selectCustTraceCarLineNmReport.do", method = RequestMethod.GET)
    public String selectCustTraceCarLineNmReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectCustTraceCarLineNmReport";
    }

    //예약서비스 메인
    @RequestMapping(value = "/selectResvSerReportMain.do", method = RequestMethod.GET)
    public String selectResvSerReportMain(Model model) throws Exception{
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String dateYy       = DateUtil.getDate("yyyy");
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 서비스운영관리 정보(칸반)
        ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
        model.addAttribute("serSetInfo", serviceSettingService.selectServiceSettingByKey(serSetSearchVO));

        model.addAttribute("dateYy", dateYy);
        model.addAttribute("sysDate", sysDate);
        return "/ser/rpt/selectResvSerReportMain";
    }

    //예약서비스 - 시간조회
    @RequestMapping(value = "/selectResvSerTimeSearchReport.do", method = RequestMethod.GET)
    public String selectResvSerTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectResvSerTimeSearchReport";
    }

    //예약서비스 - 차종명
    @RequestMapping(value = "/selectResvSerCarLineNmReport.do", method = RequestMethod.GET)
    public String selectResvSerCarLineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectResvSerCarLineNmReport";
    }

    //서비스활동 메인
    @RequestMapping(value = "/selectSerActiveReportMain.do", method = RequestMethod.GET)
    public String selectSerActiveReportMain(Model model) throws Exception{
        return "/ser/rpt/selectSerActiveReportMain";
    }

    //서비스활동 - 시간조회
    @RequestMapping(value = "/selectSerActiveTimeSearchReport.do", method = RequestMethod.GET)
    public String selectSerActiveTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerActiveTimeSearchReport";
    }

    //서비스활동 - 활동명칭
    @RequestMapping(value = "/selectSerActiveActiveNmReport.do", method = RequestMethod.GET)
    public String selectSerActiveActiveNmReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectSerActiveActiveNmReport";
    }

    //보험업무 메인
    @RequestMapping(value = "/selectIncWrkReportMain.do", method = RequestMethod.GET)
    public String selectIncWrkReportMain(Model model) throws Exception{
        return "/ser/rpt/selectIncWrkReportMain";
    }

    //보험업무 - 시간조회
    @RequestMapping(value = "/selectIncWrkTimeSearchReport.do", method = RequestMethod.GET)
    public String selectIncWrkTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectIncWrkTimeSearchReport";
    }

    //보험업무 - 차종명
    @RequestMapping(value = "/selectIncWrkCarLineNmReport.do", method = RequestMethod.GET)
    public String selectIncWrkCarLineNmReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectIncWrkCarLineNmReport";
    }

    //수리항목 메인
    @RequestMapping(value = "/selectRpirItemReportMain.do", method = RequestMethod.GET)
    public String selectRpirItemReportMain(Model model) throws Exception{
        return "/ser/rpt/selectRpirItemReportMain";
    }

    //수리항목 - 시간조회
    @RequestMapping(value = "/selectRpirItemTimeSearchReport.do", method = RequestMethod.GET)
    public String selectRpirItemTimeSearchReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectRpirItemTimeSearchReport";
    }

    //수리항목 - 차종유형
    @RequestMapping(value = "/selectRpirItemCarLineTpReport.do", method = RequestMethod.GET)
    public String selectRpirItemCarLineTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectRpirItemCarLineTpReport";
    }

    //수리항목 - 위탁유형
    @RequestMapping(value = "/selectRpirItemFosterTpReport.do", method = RequestMethod.GET)
    public String selectRpirItemFosterTpReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectRpirItemFosterTpReport";
    }

    //수리항목 - 정비위탁자
    @RequestMapping(value = "/selectRpirItemRepairOrderManReport.do", method = RequestMethod.GET)
    public String selectRpirItemRepairOrderManReport(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";

        model.addAttribute("oneDay", oneDay);
        return "/ser/rpt/selectRpirItemRepairOrderManReport";
    }


  //수리실적리포트 메인
    @RequestMapping(value = "/selectRepairPerfReportMain.do", method = RequestMethod.GET)
    public String selectRepairPerfReportMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));        // RO유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));      //수리유형
        model.addAttribute("selfDefineCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));  //자체정의유형

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/ser/rpt/selectRepairPerfReportMain";
    }

    //수리실적리포트 - 수리실적
    @RequestMapping(value = "/selectRepairPerfRpirPerfReport.do", method = RequestMethod.GET)
    public String selectRepairPerfRpirPerfReport(Model model) throws Exception{
        return "/ser/rpt/selectRepairPerfRpirPerfReport";
    }

    //수리실적리포트 - 시간조회
    @RequestMapping(value = "/selectRepairPerfTimeSearchReport.do", method = RequestMethod.GET)
    public String selectRepairPerfTimeSearchReport(Model model) throws Exception{
        return "/ser/rpt/selectRepairPerfTimeSearchReport";
    }

    //수리실적리포트 - 차종명
    @RequestMapping(value = "/selectRepairPerfCarLineNmReport.do", method = RequestMethod.GET)
    public String selectRepairPerfCarLineNmReport(Model model) throws Exception{
        return "/ser/rpt/selectRepairPerfCarLineNmReport";
    }

    //수리실적리포트 - 위탁유형
    @RequestMapping(value = "/selectRepairPerfFosterTpReport.do", method = RequestMethod.GET)
    public String selectRepairPerfFosterTpReport(Model model) throws Exception{
        return "/ser/rpt/selectRepairPerfFosterTpReport";
    }

    //수리실적리포트 - 수리유형
    @RequestMapping(value = "/selectRepairPerfRepairTpReport.do", method = RequestMethod.GET)
    public String selectRepairPerfRepairTpReport(Model model) throws Exception{
        return "/ser/rpt/selectRepairPerfRepairTpReport";
    }
}
