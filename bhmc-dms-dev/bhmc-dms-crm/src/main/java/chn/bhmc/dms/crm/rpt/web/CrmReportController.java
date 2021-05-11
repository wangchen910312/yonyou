package chn.bhmc.dms.crm.rpt.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CrmReportController.java
 * @Description : CRM 레포투 컨트롤러
 * @author In Moon Lee
 * @since 2016.08.30.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.30.     In Moon Lee     최초 생성
 * </pre>
 */

@Controller
public class CrmReportController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name = "viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 멤버십 등급관리 서비스
     */
    @Resource(name = "membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 차종, 모델, 옵션 정보 관리 서비스
     */
    @Resource(name = "carInfoService")
    CarInfoService carInfoService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name = "systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * CRM 공통 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;


    /**
     * 고객 리포트 Main
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectMain.do", method = RequestMethod.GET)
    public String selectCustReportMain(Model model) throws Exception {
        return "/crm/rpt/custReport/selectMain";
    }

    /**
     * 77. 增换购 추가교체구매
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectCarSalesReport.do", method = RequestMethod.GET)
    public String selectCustSalesReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd)
            throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        // 차형
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -12), dateFormat)); // 시작일 설정 : 2017.05.12 LEE.K 검색날짜시작 1년전으로 수정함.
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/custReport/selectCarSalesReport";
    }

    /**
     * 93. 无效客户数量统计表 무효고객수 통계리포트
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectCustHpNoValidReport.do", method = RequestMethod.GET)
    public String selectCustHpNoValidReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));// 고객유형
        model.addAttribute( "userList", crmCommonService.selectMngScIdListByCondition() );// 판매고문
        return "/crm/rpt/custReport/selectCustHpNoValidReport";
    }


    /**
     * 客户数量统计고객 수량 통계
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectCustCntReport.do", method = RequestMethod.GET)
    public String selectCustCntReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/custReport/selectCustCntReport";
    }



    /**
     * 86. 客户特征 고객특성
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectCharacterReport.do", method = RequestMethod.GET)
    public String selectCustCharacterReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        // 차형
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -365), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/custReport/selectCharacterReport";
    }

    /**
     *  11.流失率分析_유실율 분석(정비)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectAttritionRateAnalysisReport.do", method = RequestMethod.GET)
    public String selectAttritionRateAnalysisReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/custReport/selectAttritionRateAnalysisReport";
    }

    /**
     * 12、返厂频次分析_수리 주기 분석(정비)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectReturnFactoryFrequencyAnalysisReport.do", method = RequestMethod.GET)
    public String selectReturnFactoryFrequencyAnalysisReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

     // 차형 (Car Line)
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/custReport/selectReturnFactoryFrequencyAnalysisReport";
    }



    /**
     * 13、单车产值分析_차량 생산액 분석(정비)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/custReport/selectOneCarValueOutputAnalysis.do", method = RequestMethod.GET)
    public String selectOneCarValueOutputAnalysis(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

     // 차형 (Car Line)
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -365), dateFormat));
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정


        return "/crm/rpt/custReport/selectOneCarValueOutputAnalysis";
    }

    /**
     * IDCC 정보 레포트 - Main
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccReportMain.do", method = RequestMethod.GET)
    public String selectIdccReportMain(Model model) throws Exception {
        return "/crm/rpt/idccReport/selectIdccReportMain";
    }

    /**
     * 9-渠道效益分析(채널이익분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccChannelProfit.do", method = RequestMethod.GET)
    public String selectChannelProfit(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/idccReport/selectIdccChannelProfit";
    }

    /**
     * 10-意向车型分析(의향차형분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccIntentionCarlineReport.do", method = RequestMethod.GET)
    public String selectIdccIntentionCarlineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/idccReport/selectIdccIntentionCarlineReport";
    }


    /**
     * 11.-意向级别分析(의향등급분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccIntentionClassReport.do", method = RequestMethod.GET)
    public String selectIdccIntentionClassReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/idccReport/selectIdccIntentionClassReport";
    }

    /**
     * 12.-通话时长分析(통화시간분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccCallDtReport.do", method = RequestMethod.GET)
    public String selectIdccCallDtReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        model.addAttribute("sLeadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("sValidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)

        return "/crm/rpt/idccReport/selectIdccCallDtReport";
    }

    /**
     * 13. -邀约到店率分析(내방예약율분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccVisitResvRateReport.do", method = RequestMethod.GET)
    public String selectIdccVisitResvRateReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/idccReport/selectIdccVisitResvRateReport";
    }

    /**
     * 14. -成交率分析(거래율분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccDealRateReport.do", method = RequestMethod.GET)
    public String selectIdccDealRateReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/idccReport/selectIdccDealRateReport";
    }

    /**
     * 15. IDCC邀约能力(IDCC예약능력 분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/idccReport/selectIdccResvAbilityReport.do", method = RequestMethod.GET)
    public String selectIdccResvAbilityReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sDt", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        return "/crm/rpt/idccReport/selectIdccResvAbilityReport";
    }


    /**
     * 전시장 레포트 : Main
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectCustomerInfoReportMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoReportMain(Model model) throws Exception {
        return "/crm/rpt/customerInfoReport/selectCustomerInfoReportMain";
    }

    /**
     * 16.销售顾问个人战力分析(판매고문개인능력분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectAdvisorAbilityReport.do", method = RequestMethod.GET)
    public String selectAdvisorAbilityReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectAdvisorAbilityReport";
    }

    /**
     * 17. 车型战力分析 (차형 능력분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectCarlineReport.do", method = RequestMethod.GET)
    public String selectCarlineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectCarlineReport";
    }

    /**
     * 18.渠道分析(채널 분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectChannelReport.do", method = RequestMethod.GET)
    public String selectChannelReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectChannelReport";
    }

    /**
     * 19.意向车型分析(의향차형 분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectIntentionCarlineReport.do", method = RequestMethod.GET)
    public String selectIntentionCarlineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectIntentionCarlineReport";
    }

    /**
     * 20.销售顾问特定车型级别分析 (판매고문 차형 등급분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectPrsnIntentionCarlineReport.do", method = RequestMethod.GET)
    public String selectPrsnIntentionCarlineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        // 차형 (Car Line)
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        return "/crm/rpt/customerInfoReport/selectPrsnIntentionCarlineReport";
    }

    /**
     * 21.客流时段分析(고객흐름 시간단위분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectCustomerProcessTimeReport.do", method = RequestMethod.GET)
    public String selectCustomerProcessTimeReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectCustomerProcessTimeReport";
    }

    /**
     * 22.意向级别分析(의향등급분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectIntentionClassReport.do", method = RequestMethod.GET)
    public String selectIntentionClassReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectIntentionClassReport";
    }

    /**
     * 23. 销售顾问各意向级别分布量分析 (판매고문 의향 등급별 분포량 분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectPrsnIntentionClassReport.do", method = RequestMethod.GET)
    public String selectPrsnIntentionClassReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectPrsnIntentionClassReport";
    }

    /**
     * 24.平均接待时长分析 (평균대응시간분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectAvrResponseTimeReport.do", method = RequestMethod.GET)
    public String selectAvrResponseTimeReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectAvrResponseTimeReport";
    }

    /**
     * 25.接待时长满足率分析 (대응시간 만족률 분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectResponseTimeStsfRateReport.do", method = RequestMethod.GET)
    public String selectResponseTimeStsfRateReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectResponseTimeStsfRateReport";
    }

    /**
     * 26.再次进店率分析(재방문율분석)
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/customerInfoReport/selectReVisitRateReport.do", method = RequestMethod.GET)
    public String selectReVisitRateReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/customerInfoReport/selectReVisitRateReport";
    }

    /**
     * 리드 리포트 Main
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectMain.do", method = RequestMethod.GET)
    public String selectOpptReportMain(Model model) throws Exception {
        return "/crm/rpt/opptReport/selectMain";
    }

    /**
     * 98"销售线索跟进报表-按线索来源 판매기회 F/U 통계표 -리드 출처 별"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectHoldTpReport.do", method = RequestMethod.GET)
    public String selectOpptHoldTpReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));// 리드출저
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/opptReport/selectHoldTpReport";
    }

    /**
     * 99"销售线索跟进统计表-分特约店 판매기회 F/U 통계표 - 판매고문별"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectManagerReport.do", method = RequestMethod.GET)
    public String selectOpptManagerReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));// 리드출저
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/opptReport/selectManagerReport";
    }

    /**
     * 100"销售线索跟进统计表-分车型 판매기회 F/U 통계표 - 차형별"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectCarLineReport.do", method = RequestMethod.GET)
    public String selectOpptCarLineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd)  throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));// 리드출저
        model.addAttribute("userList", crmCommonService.selectMngScIdListByCondition() );// 판매고문
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));// 차종코드
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/opptReport/selectCarLineReport";
    }

    /**
     * 102"销售线索跟进统计表-分线索类型 판매기회 F/U 통계표-리드유형별 "
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectOpptTpReport.do", method = RequestMethod.GET)
    public String selectOpptOpptTpReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));// 리드출저
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/opptReport/selectOpptTpReport";
    }

    /**
     * 105"跟踪促成阶段商机数量表 추적추진단계 판매기회수량표"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectFourthReport.do", method = RequestMethod.GET)
    public String selectOpptFourthReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sDt", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        return "/crm/rpt/opptReport/selectFourthReport";
    }

    /**
     * 106"跟踪促成阶段数量表-按来源/车种 추적추진단계 판매기회-루트별/차종"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectFourthHoldTpReport.do", method = RequestMethod.GET)
    public String selectOpptFourthHoldTpReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/opptReport/selectFourthHoldTpReport";
    }

    /**
     * 107"跟踪促成阶段新增/战败数量-车种 추적추진 단계 신규추가/전패수량-차종"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectFourthCarLineReport.do", method = RequestMethod.GET)
    public String selectOpptFourthCarLineReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/opptReport/selectFourthCarLineReport";
    }

    /**
     * 108"跟踪促成阶段新增/战败数量-销售顾问 추적추진단계 신규추가/전패수량-판매고문"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectFourthManagerReport.do", method = RequestMethod.GET)
    public String selectOpptFourthManagerReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/opptReport/selectFourthManagerReport";
    }

    /**
     * 110"当前跟踪线索数 현재추적리드수"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectIngReport.do", method = RequestMethod.GET)
    public String selectOpptIngReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd)  throws Exception {
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        return "/crm/rpt/opptReport/selectIngReport";
    }

    /**
     * 111"战败明细 전패명세"
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/opptReport/selectFailReport.do", method = RequestMethod.GET)
    public String selectOpptFailReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("failCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));// 전패사유
        model.addAttribute( "userList", crmCommonService.selectMngScIdListByCondition() );// 판매고문
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));// 차종코드

        return "/crm/rpt/opptReport/selectFailReport";
    }

    /**
     * 30.쿠폰
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/couponReport/selectCouponHistroyReport.do", method = RequestMethod.GET)
    public String selectCouponHistroyReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM051", null, langCd)); // 할인방식
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sPubliStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat));
        model.addAttribute("sPubliEndDt", DateUtil.getDate(dateFormat));

        return "/crm/rpt/couponReport/selectCouponHistoryReport";
    }

    /**
     * 만족도 조사 진행 :Main
     * @return
     */
    @RequestMapping(value = "/crm/rpt/satisfactionReport/satisfactionReportMain.do", method = RequestMethod.GET)
    public String selectSatisfactionReportMain(Model model) throws Exception {
        return "/crm/rpt/satisfactionReport/satisfactionReportMain";
    }

    /**
     * 만족도 통합 분석 현황
     * @return
     */
    @RequestMapping(value = "/crm/rpt/satisfactionReport/satisfactionTotalReport.do", method = RequestMethod.GET)
    public String selectSatisfactionTotalReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd)); // 만족도 조사 타입
        model.addAttribute("stsfIvstExpdCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd)); // 만족도 조사 수단
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/satisfactionReport/satisfactionTotalReport";
    }

    /**
     * 만족도 조사 담당자별 현황
     * @return
     */
    @RequestMapping(value = "/crm/rpt/satisfactionReport/satisfactionPersonReport.do", method = RequestMethod.GET)
    public String selectSatisfactionReportPerson(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd)); // 만족도 조사 타입
        model.addAttribute("stsfIvstExpdCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd));// 만족도 조사 수단
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/satisfactionReport/satisfactionPersonReport";
    }

    /**
     * 94. 캠페인 결과현황
     * @return
     */
    @RequestMapping(value = "/crm/rpt/campaignReport/selectCampaignReport.do", method = RequestMethod.GET)
    public String selectCampaignReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("makTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd)); // 유형
        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd)); // 상태
        model.addAttribute("hostList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd)); // 주최
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/campaignReport/selectCampaignReport";
    }

    /**
     * 멤버십 (회원) : Main
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipReportMain.do", method = RequestMethod.GET)
    public String selectMembershipReportMain(Model model) throws Exception {
        return "/crm/rpt/membershipReport/selectMembershipReportMain";
    }

    /**
     * 32. 회원정보현황 리포트
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipInfoReport.do", method = RequestMethod.GET)
    public String selectMembershipInfoReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sRegStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sRegEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/membershipReport/selectMembershipInfoReport";
    }

    /**
     * 31.포인트 사용 현황
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipPointHistoryReportQuarter.do", method = RequestMethod.GET)
    public String selectMembershipPointHistoryReportQuarter(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat));
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );
        return "/crm/rpt/membershipReport/selectMembershipPointHistoryReportQuarter";
    }

    /**
     * 33.딜러 충전카드 사용현황
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipRechargeReport.do", method = RequestMethod.GET)
    public String selectMembershipRechargeReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat));
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );
        return "/crm/rpt/membershipReport/selectMembershipRechargeReport";
    }

    /**
     * 28.회원등급 통계 현황 리포트
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipGradeReport.do", method = RequestMethod.GET)
    public String selectMembershipGradeReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sRegStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat));// 시작일 설정
        model.addAttribute("sRegEndDt", DateUtil.getDate(dateFormat));// 종료일 설정
        return "/crm/rpt/membershipReport/selectMembershipGradeReport";
    }

    /**
     * 29.회원등급 통계 현황 리포트
     * @return
     */
    @RequestMapping(value = "/crm/rpt/membershipReport/selectMembershipStatsReport.do", method = RequestMethod.GET)
    public String selectMembershipStatsReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        model.addAttribute("sRegStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat));
        model.addAttribute("sRegEndDt", DateUtil.getDate(dateFormat));
        return "/crm/rpt/membershipReport/selectMembershipStatsReport";
    }

    /**
     * BM 현황 : Main
     * @return
     */
    @RequestMapping(value = "/crm/rpt/BMReport/selectBMMain.do", method = RequestMethod.GET)
    public String selectBMMain(Model model) throws Exception {
        return "/crm/rpt/BMReport/selectBMMain";
    }

    /**
     * 50. 蓝缤会员-车型入会现况 회원차량
     * @return
     */
    @RequestMapping(value = "/crm/rpt/BMReport/selectBMOwnCarReport.do", method = RequestMethod.GET)
    public String selectBMOwnCarReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat));// 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat));// 종료일 설정
        return "/crm/rpt/BMReport/selectBMOwnCarReport";
    }

    /**
     * 56. 返厂报表 정비받은 리포트
     * @return
     */
    @RequestMapping(value = "/crm/rpt/BMReport/selectRepairOrderInfoReport.do", method = RequestMethod.GET)
    public String selectBMRoReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat));// 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat));// 종료일 설정
        model.addAttribute("sMembershipStan", LoginUtil.getMembershipPolicy());
        return "/crm/rpt/BMReport/selectRepairOrderInfoReport";
    }

    /**
     * 15 返厂入会率 수리 가입율
     * @return
     */
    @RequestMapping(value = "/crm/rpt/BMReport/selectRepairOrderSingInReport.do", method = RequestMethod.GET)
    public String selectBMCouponReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat));// 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat));// 종료일 설정
        return "/crm/rpt/BMReport/selectRepairOrderSingInReport";
    }

    /**
     * OB 진행현황 : Main
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/OBReport/selectOBReportMain.do", method = RequestMethod.GET)
    public String selectOBReportMain(Model model) throws Exception {
        return "/crm/rpt/OBReport/selectOBReportMain";
    }

    /**
     * OB 이력현황(유형별)
     * @return
     */
    @RequestMapping(value = "/crm/rpt/OBReport/selectCallCenterReportType.do", method = RequestMethod.GET)
    public String selectCallCenterReportType(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("bizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));
        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd));
        model.addAttribute("makTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));

        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/OBReport/selectCallCenterReportType";
    }

    /**
     * OB 이력현황(콜담당자별)
     * @return
     */
    @RequestMapping(value = "/crm/rpt/OBReport/selectCallCenterReportPerson.do", method = RequestMethod.GET)
    public String selectCallCenterReportHistory(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("bizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));
        model.addAttribute("stsfIvstTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd));
        model.addAttribute("makTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));
        model.addAttribute("callRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));

        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정

        return "/crm/rpt/OBReport/selectCallCenterReportPerson";
    }

    /**
     * 97. sms report
     * @return
     */
    @RequestMapping(value = "/crm/rpt/smsReport/selectSmsReport.do", method = RequestMethod.GET)
    public String selectSmsReport(Model model, @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("wrkTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM065", null, langCd));// 업무유형
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtils.setDays(new Date(), 1), dateFormat)); // 시작일 설정
        model.addAttribute("sEndDt", DateUtil.getDate(dateFormat) );// 종료일 설정
        return "/crm/rpt/smsReport/selectSmsReport";
    }

    /**
     * 판매기회 리포트 Main
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectMain.do", method = RequestMethod.GET)
    public String selectSalesOpptReportMain(Model model) throws Exception {
        return "/crm/rpt/salesOpptReport/selectMain";
    }

    /**
     * 5、线索跟踪统计表_리드 F U 통계표
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectSalesOpptLeadFUReport.do", method = RequestMethod.GET)
    public String selectSalesOpptLeadFUReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 시작일 - 매월1일
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 종료일 - 매월말일
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/salesOpptReport/selectSalesOpptLeadFUReport";
    }
    
    // 业务督导科DMS系统需求 2018-6-19 start
    
    
    /**
     * 展厅  Main
     *
     * @return  
     *    
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectMain.do", method = RequestMethod.GET)
    public String selectExhiHallReportMain(Model model) throws Exception {
        return "/crm/rpt/exhiHallReport/selectMain";
    }
    
    /**
     * 试驾率
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectTestDriveRate.do", method = RequestMethod.GET)
    public String selectTestDriveRate(Model model,@RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 开始时间
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 结束时间
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/exhiHallReport/selectTestDriveRate";
    }
    
    
    /**
     * 再次到店率
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectAgainStoreRate.do", method = RequestMethod.GET)
    public String selectAgainStoreRate(Model model,@RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 开始时间
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 结束时间
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/exhiHallReport/selectAgainStoreRate";
    }
    
    /**
     * 首次留档率
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectInitialRetentionrate.do", method = RequestMethod.GET)
    public String selectInitialRetentionrate(Model model,@RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 开始时间
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 结束时间
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/exhiHallReport/selectInitialRetentionrate";
    }
    
    
    /**
     * 成交率
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectEfficiency.do", method = RequestMethod.GET)
    public String selectEfficiency(Model model,@RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 开始时间
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 结束时间
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/exhiHallReport/selectEfficiency";
    }
    
    /**
     * 接待时长满足率
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/exhiHallReport/selectReceptionTimeSatisfyRate.do", method = RequestMethod.GET)
    public String selectReceptionTimeSatisfyRate(Model model,@RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 开始时间
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 结束时间
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/exhiHallReport/selectReceptionTimeSatisfyRate";
    }
    // 业务督导科DMS系统需求 2018-6-19 end
    
    /**
     * 6、展厅接待统计_전시장 응대 통계
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectShowRoomResponseStatisticReport.do", method = RequestMethod.GET)
    public String selectShowRoomResponseStatisticReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 시작일 - 매월1일
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 종료일 - 매월말일
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/salesOpptReport/selectShowRoomResponseStatisticReport";
    }

    /**
     * 7、展厅客流时段分析_전시장 고객 흐름 시간대 분석
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectShowRoomCustTimeAnalysisReport.do", method = RequestMethod.GET)
    public String selectShowRoomCustTimeAnalysisReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sStartDt", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"))); // 시작일 설정

        return "/crm/rpt/salesOpptReport/selectShowRoomCustTimeAnalysisReport";
    }

    /**
     * 8、当前线索意向级别分析_현재 리드 응향 등급 분석
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectCurrentLeadLevelAnalysisReport.do", method = RequestMethod.GET)
    public String selectCurrentLeadLevelAnalysisReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/salesOpptReport/selectCurrentLeadLevelAnalysisReport";
    }

    /**
     * 9、成交率分析_거래율 분석
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectSalesOpptDealRateReport.do", method = RequestMethod.GET)
    public String selectSalesOpptDealRateReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 시작일 - 매월1일
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 종료일 - 매월말일
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");// 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/salesOpptReport/selectSalesOpptDealRateReport";
    }

    /**
     * 10、战败明细_전페 상세
     *
     * @return
     */
    @RequestMapping(value = "/crm/rpt/salesOpptReport/selectSalesOpptFailDtlReport.do", method = RequestMethod.GET)
    public String selectSalesOpptFailDtlReport(Model model,
            @RequestParam(value = "sDlrCd", defaultValue = "") String sDlrCd) throws Exception {

        SimpleDateFormat dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        int year;
        int month;

        // 시작일 - 매월1일
        Calendar startCal = Calendar.getInstance();
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        startCal.set(year, month, 1, 00, 00, 00);

        // 종료일 - 매월말일
        Calendar endCal = Calendar.getInstance();
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        endCal.set(year, month, endCal.getMaximum(Calendar.DAY_OF_MONTH), 00, 00, 00);

        model.addAttribute("sStartDt", dateFormat.format(startCal.getTime())); // 종료일 설정
        model.addAttribute("sEndDt", dateFormat.format(endCal.getTime())); // 종료일 설정
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());

        return "/crm/rpt/salesOpptReport/selectSalesOpptFailDtlReport";
    }

}
