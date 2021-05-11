package chn.bhmc.dms.crm.cmm.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

import chn.bhmc.dms.cmm.cmp.service.DealerService;

import chn.bhmc.dms.cmm.cmp.vo.CastleSearchVO;
import chn.bhmc.dms.cmm.cmp.service.CastleService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSearchVO;
import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReportController
 * @Description : 레포트 관리 컨트롤러
 * @author Kim Yunseung
 * @since 2018. 1. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 1. 04.     Kim Yunseung     최초 생성
 * </pre>
 */

@Controller
public class ReportController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;

    /**
     * 성시 관리 서비스
     */
    @Resource(name="castleService")
    CastleService castleService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 사무소 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DivisionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/rpt/selectOfficeList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOfficeListByDivision(@RequestBody DivisionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(divisionService.selectOfficeListByDivision(searchVO));

        return result;
    }

    /**
     * 사무소 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DivisionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/rpt/selectSungList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSungListByOffice(@RequestBody CastleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(castleService.selectSungList(searchVO));

        return result;
    }

    /**
     * 도시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/rpt/selectCityList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCityListBySung(@RequestBody CastleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(castleService.selectCityListBySung(searchVO));

        return result;
    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/rpt/selectDealerList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerList(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(dealerService.selectDealerListByCondition(searchVO));

        return result;
    }


    /**
    * 신차가입률 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesJoinRateReport.do")
   public String selectSalesJoinRateReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectSalesJoinRateReport";
   }

   /**
    * 정비가입률 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectServiceJoinRateReport.do")
   public String selectServiceJoinRateReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectServiceJoinRateReport";
   }

   /**
    * 정비포인트사용률 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectServicePointUseRateReport.do")
   public String selectServicePointUseRateReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectServicePointUseRateReport";
   }

   /**
    * 고객흐름집계 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectCustomerFlowSumReport.do")
   public String selectCustomerFlowSumReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectCustomerFlowSumReport";
   }

   /**
    * 현재추적리드총량 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectTotCurTrackingLeadReport.do")
   public String selectTotCurTrackingLeadReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectTotCurTrackingLeadReport";
   }

   /**
    * 판매리드전환-딜러별 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesLeadByDealerReport.do")
   public String selectSalesLeadByDealerReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectSalesLeadByDealerReport";
   }

   /**
    * 판매리드전환-차종별 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesLeadByCarlineReport.do")
   public String selectSalesLeadByCarlineReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectSalesLeadByCarlineReport";
   }

   /**
    * 판매리드전환-경로별 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesLeadByPathReport.do")
   public String selectSalesLeadByPathReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectSalesLeadByPathReport";
   }

   /**
    * 판매리드전패분석 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesLeadAnalysisReport.do")
   public String selectSalesLeadAnalysisReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       //차종 , 중고차-자사-차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       return "/crm/rpt/selectSalesLeadAnalysisReport";
   }

   /**
    * RO요청리포트 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectRoRequestReport.do")
   public String selectRoRequestReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectRoRequestReport";
   }

   /**
    * 신고RO리포트 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectReportRoReport.do")
   public String selectReportRoReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectReportRoReport";
   }

   /**
    * 신고처리일보 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectReportProcessReport.do")
   public String selectReportProcessReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectReportProcessReport";
   }

   /**
    * 미close신고명세 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectUncloseDetailReport.do")
   public String selectUncloseDetailReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectUncloseDetailReport";
   }

   /**
    * 청구24H미대응 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectClaimUnresponsiveReport.do")
   public String selectClaimUnresponsiveReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectClaimUnresponsiveReport";
   }

   /**
    * 판매고객특성 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectSalesCustAttrReport.do")
   public String selectSalesCustAttrReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectSalesCustAttrReport";
   }

   /**
    * 정비고객특성 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectServiceCustAttrReport.do")
   public String selectServiceCustAttrReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectServiceCustAttrReport";
   }

   /**
    * 캠페인효과명세 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/crm/rpt/selectCampaignEffectReport.do")
   public String selectCampaignEffectReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       DealerSearchVO searchVO = new DealerSearchVO();
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/crm/rpt/selectCampaignEffectReport";
   }


}
