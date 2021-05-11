package chn.bhmc.dms.sal.rpt.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.cnt.service.ContractMntService;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.rpt.service.SalesReportService;
import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsSearchVO;
import chn.bhmc.dms.sal.rpt.vo.SalesReportVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * [DMS] 판매 레포트
 * </pre>
 *
 * @ClassName   : SalesReportController.java
 * @Description : [DMS] 판매 레포트
 * @author chibeom.song
 * @since 2017. 1. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 24.   chibeom.song     최초 생성
 * </pre>
 */

@Controller
public class SalesReportController extends HController {

    @Resource(name="salesReportService")
    SalesReportService salesReportService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    /**
     * 판매가능재고집계 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesPossibleStockRpt.do", method = RequestMethod.GET)
    public String selectSalesPossibleStockRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesPossibleStockRpt";
    }

    /**
     * 재고통계표 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesStockStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesStockStatsRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesStockStatsRpt";
    }

    /**
     * 금융 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesFincRpt.do", method = RequestMethod.GET)
    public String selectSalesFincRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesFincRpt";
    }

    /**
     * 보험 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesInsuranceRpt.do", method = RequestMethod.GET)
    public String selectSalesInsuranceRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesInsuranceRpt";
    }

    /**
     * 루트별 판매통계 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesRootStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesRootStatsRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesRootStatsRpt";
    }

    /**
     * 거래고객정보표 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesCustomerInfoRpt.do", method = RequestMethod.GET)
    public String selectSalesCustomerInfoRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesCustomerInfoRpt";
    }

    /**
     * 판매고문 총이윤집계 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesScIdAllProfitAmtRpt.do", method = RequestMethod.GET)
    public String selectSalesScIdAllProfitAmtRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesScIdAllProfitAmtRpt";
    }

    /**
     * 판매고문 실적집계 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesDealerResultRpt.do", method = RequestMethod.GET)
    public String selectSalesDealerResultRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesDealerResultRpt";
    }

    /**
     * 판매차량월간리포트 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesCarMonthRpt.do", method = RequestMethod.GET)
    public String selectSalesCarMonthRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesCarMonthRpt";
    }

    /**
     * 판매집계분석표 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesSummaryAnalyzeRpt.do", method = RequestMethod.GET)
    public String selectSalesSummaryAnalyzeRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesSummaryAnalyzeRpt";
    }

    /**
     * 중고차 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesUsedCarsRpt.do", method = RequestMethod.GET)
    public String selectSalesUsedCarsRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesUsedCarsRpt";
    }

    /**
     * 일간판매명세 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesCarDaysRpt.do", method = RequestMethod.GET)
    public String selectSalesCarDaysRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesCarDaysRpt";
    }

    /**
     * 오더통계표 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesOrderStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesOrderStatsRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesOrderStatsRpt";
    }

    /**
     * 완성차판매리포트 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesVehicleStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesVehicleStatsRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesVehicleStatsRpt";
    }

    /**
     * 용품리포트 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesGoodsStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesGoodsStatsRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesGoodsStatsRpt";
    }

    /**
     * 인도임무리포트 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesDeliveryedPlanActTpRpt.do", method = RequestMethod.GET)
    public String selectSalesDeliveryedPlanActTpRpt(Model model, SalesReportVO searchVO) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesDeliveryedPlanActTpRpt";
    }

    /**
     * 종합통계표 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesTotalStatsRpt.do", method = RequestMethod.GET)
    public String selectSalesTotalStatsRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesTotalStatsRpt";
    }

    /**
     * 차량판매명세 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesCarDetailRpt.do", method = RequestMethod.GET)
    public String selectSalesCarDetailRpt(Model model) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/rpt/selectSalesCarDetailRpt";
    }

    /**
     * 차량유형별출입고 보고서  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesCarTypeInOutRpt.do", method = RequestMethod.GET)
    public String selectSalesCarTypeInOutRpt(Model model) throws Exception {

        return "/sal/rpt/selectSalesCarTypeInOutRpt";
    }

    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rpt/ptl/selectSalesOrderStatsPtl.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOrderStatsPtl(@RequestBody SalesOrderStatsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(salesReportService.selectSalesOrderStats(searchVO));
        return result;

    }

    /**
     * 2017.03.23 판매리포트 12종 추가
     * 월간소매임무 모니터링 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectRetailMissionMonRpt.do", method = RequestMethod.GET)
    public String selectRetailMissionMonRpt(Model model, SalesReportVO searchVO) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectRetailMissionMonRpt";
    }

    /**
     * 월간소매 명세서 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectRetailStateMonRpt.do", method = RequestMethod.GET)
    public String selectRetailStateMonRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));


        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectRetailStateMonRpt";
    }

    /**
     * 년간소매임무 모니터링 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectRetailMissionAnnualRpt.do", method = RequestMethod.GET)
    public String selectRetailMissionAnnualRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectRetailMissionAnnualRpt";
    }

    /**
     * 월간인도임무 모니터링 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectTransMissionMonRpt.do", method = RequestMethod.GET)
    public String selectTransMissionMonRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectTransMissionMonRpt";
    }

    /**
     * 월간인도임무 명세서 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectTransStateMonRpt.do", method = RequestMethod.GET)
    public String selectTransStateMonRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectTransStateMonRpt";
    }

    /**
     * 년간인도임무 모니터링 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectTransMissionAnnualRpt.do", method = RequestMethod.GET)
    public String selectTransMissionAnnualRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectTransMissionAnnualRpt";
    }

    /**
     * 판매상황종합 통계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesStatisticsRpt.do", method = RequestMethod.GET)
    public String selectSalesStatisticsRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectSalesStatisticsRpt";
    }

    /**
     * 년간소매통계 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectRetailStatisticsAnnualRpt.do", method = RequestMethod.GET)
    public String selectRetailStatisticsAnnualRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        /*String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
         */

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectRetailStatisticsAnnualRpt";
    }

    /**
     * 월/년계약통계표 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectAnnualContractMonRpt.do", method = RequestMethod.GET)
    public String selectAnnualContractMonRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectAnnualContractMonRpt";
    }

    /**
     * 차량출입고판매통계표 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectVehicleInoutStatisticsRpt.do", method = RequestMethod.GET)
    public String selectVehicleInoutStatisticsRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectVehicleInoutStatisticsRpt";
    }

    /**
     * 판매고문 업무 통계표 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectSalesConsultantStatisticsRpt.do", method = RequestMethod.GET)
    public String selectSalesConsultantStatisticsRpt(Model model) throws Exception {

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //판매고문
        //model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        model.addAttribute("saleEmpDSInfo", crmCommonService.selectMngScIdListByCondition());
        String saleAdminYn = "N";
        // VIEW-D-13013 : 화면 : 판매>보고서>판매고문 업무 통계표
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-13013", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);
        model.addAttribute("usrId", LoginUtil.getUserId());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        return "/sal/rpt/selectSalesConsultantStatisticsRpt";
    }

    /**
     * 차량판매 명세서화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/rpt/selectCarSalesStatementRpt.do", method = RequestMethod.GET)
    public String selectCarSalesStatementRpt(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        // VIEW-D-13014 : 화면 : 판매>보고서>차량판매 명세서
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-13014", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));
        // 2급딜러
        model.addAttribute("lvTwoDlrDs", contractMntService.selectlvTwoDlrOrgsByCondition(LoginUtil.getDlrCd()));

        //날짜 조회조건  SAL217
        model.addAttribute("searchDtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL217", null, langCd));
        //주문유형
        model.addAttribute("ordList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        model.addAttribute("sEndDt", sysDate);
        model.addAttribute("sStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        String oneDay       = DateUtil.getDate("yyyyMM") + "01";
        String lastDay      = DateUtil.getDate("yyyyMM") + DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);


        return "/sal/rpt/selectCarSalesStatementRpt";
    }
}
