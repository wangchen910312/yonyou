package chn.bhmc.dms.mob.cmm.web;


import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.MobileMainMappingService;
import chn.bhmc.dms.cmm.ath.vo.MobileMainMappingVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.DeviceInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.tree.KendoTreeModel;
import chn.bhmc.dms.core.support.tree.KendoTreeModelBuilder;
import chn.bhmc.dms.core.support.tree.Tree;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.mob.cmm.service.MobMainService;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * 모바일 메인
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/cmm/main")
public class MobMainController extends HController {

    /**
     * 디바이스정보 서비스
     */
    @Resource(name="deviceInfoService")
    DeviceInfoService deviceInfoService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 모바일 메인 화면 - 사용자 매핑 서비스
     */
    @Resource(name="mobileMainMappingService")
    MobileMainMappingService mobileMainMappingService;

    /**
     * 판매기회유입유형 관리 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 차종, 모델, 옵션 정보 관리 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 모바일메인화면 데이터 조회 서비스
     */
    @Resource(name="mobMainService")
    MobMainService mobMainService;

//    @Resource(name="viewInfoService")
//    ViewInfoService viewInfoService;
//
//
//    @Resource(name="roleService")
//    RoleService roleService;



    /**
     * 내방고객수 (내방건수)
     * 판매기회건수(리드입력건수)
     */
//    @Resource(name="salesOpptProcessMgmtOutBoundService")
//    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * VOC 건수 (VOC 입력건수)
     */
//    @Resource(name="vocMgmtService")
//    VocMgmtService  vocMgmtService;


    /**
     * RO 건수,  총매출액,  클레임 금액
     */
//    @Resource(name="serviceAccountService")
//    ServiceAccountService serviceAccountService;


//    @Resource(name="salesCommonService")
//    SalesCommonService salesCommonService;

    /**
     * 현재고 서비스
     */
//    @Resource(name="stockInOutService")
//    StockInOutService stockInOutService;

    /**
     * 메인 화면.
     * @return
     */
    /*@RequestMapping(value = "/selectMain.do", method = RequestMethod.GET)
    public String selectMain(Model model, HttpServletResponse response) throws Exception {

        Cookie cookie=new Cookie("TESTCOOKIE","TESTVAL");
        response.addCookie(cookie);


        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("tskCd", LoginUtil.getTskCd());

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId",mobLoginVO.getUserId());
        model.addAttribute("userNm",mobLoginVO.getUserNm());
        model.addAttribute("dlrCd",mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm",mobLoginVO.getDlrNm());


        model.addAttribute("dt", DateUtil.getDate("yyyy年 MM月 dd日"));

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        // 해당월의 1일
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        Calendar cCaltoD = Calendar.getInstance();
        Date toDate=cCaltoD.getTime();//오늘

        Calendar cCalD = Calendar.getInstance();
        cCalD.add(Calendar.DATE, -1);
        Date before1day=cCalD.getTime();//전일

        Calendar cCalM = Calendar.getInstance();
        cCalM.add(Calendar.MONTH, -1);
        Date before1month=cCalM.getTime();//전월

        //CRM
        ShowRoomMgmtSearchVO showRoomMgmtSearchVO=new ShowRoomMgmtSearchVO();
        showRoomMgmtSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        showRoomMgmtSearchVO.setsDateTp("M");
        int showRoomVisitCnt=salesOpptProcessMgmtOutBoundService.selectShowRoomVisitCnt(showRoomMgmtSearchVO);

        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO=new SalesOpptProcessMgmtSearchVO();
        salesOpptProcessMgmtSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        salesOpptProcessMgmtSearchVO.setsDateTp("M");
        int salesOpptProcessMgmtsByConditionStatsCnt=salesOpptProcessMgmtOutBoundService.selectSalesOpptProcessMgmtsByConditionStatsCnt(salesOpptProcessMgmtSearchVO);

        VocMgmtSearchVO vocMgmtSearchVO=new VocMgmtSearchVO();
        vocMgmtSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        vocMgmtSearchVO.setsDateTp("M");
        int vocDateTpRegCntToMonth=vocMgmtService.selectVocDateTpRegCnt(vocMgmtSearchVO);

        vocMgmtSearchVO.setsRegDt(before1month);
        int vocDateTpRegCntBefore=vocMgmtService.selectVocDateTpRegCnt(vocMgmtSearchVO);
        String vocDateTpRegGubun="";
        if(vocDateTpRegCntToMonth > vocDateTpRegCntBefore){
            vocDateTpRegGubun="UP";
        }else if(vocDateTpRegCntToMonth < vocDateTpRegCntBefore){
            vocDateTpRegGubun="DN";
        }else{
            vocDateTpRegGubun="EQ";
        }
        model.addAttribute("showRoomVisitCnt", showRoomVisitCnt);
        model.addAttribute("salesOpptProcessMgmtsByConditionStatsCnt", salesOpptProcessMgmtsByConditionStatsCnt);
        model.addAttribute("vocDateTpRegCnt", vocDateTpRegCntToMonth);
        model.addAttribute("vocDateTpRegGubn", vocDateTpRegGubun);
        //CRM


        //정비
        ServiceAccountSearchVO searchVOSer = new ServiceAccountSearchVO ();
        searchVOSer.setsDlrCd(LoginUtil.getDlrCd());
        searchVOSer.setsDateTp("M");
        searchVOSer.setsRegDt(toDate);
        HMap map =   serviceAccountService.selectServiceRoByConditionCnt(searchVOSer);
        Integer serviceTotCntToday =  serviceAccountService.selectServiceRcvByConditionCnt(searchVOSer);

        HMap hmap =  serviceAccountService.selectServiceClaimByConditionCnt(searchVOSer) ;
        model.addAttribute("roCnt", map.get("cnt"));
        model.addAttribute("roCntGubun", map.get("gubun"));
        model.addAttribute("serviceTotCnt", serviceTotCntToday);
        model.addAttribute("claimTotAmt", hmap.get("claimAmt"));
        model.addAttribute("claimTotAmtGubun", hmap.get("gubun"));
        //정비


        //판매
        MobileSumSrchVO searchVOSal=new MobileSumSrchVO();
        searchVOSal.setsDlrCd(LoginUtil.getDlrCd());
        List<MobileSumVO> list=salesCommonService.selectMobileMainSum(searchVOSal);
        MobileSumVO resultSal=list.get(0);
        resultSal.getTyearSoldCnt();
        model.addAttribute("tmonthSoldCnt", resultSal.getTmonthSoldCnt());
        model.addAttribute("tmonthSoldGubn", resultSal.getMonthStat());
        model.addAttribute("tyearSoldCnt", resultSal.getTyearSoldCnt());
        model.addAttribute("tyearSoldGubn", resultSal.getYearStat());
        model.addAttribute("stockRate", resultSal.getStockRate());
        model.addAttribute("stockCnt", resultSal.getStockCnt());
        //판매

        //부품
     // StockInOutVO 중 PURC_TOT_AMT(발주총액 ), SALE_TOT_AMT(판매 누계), STOCK_TOT_AMT(재고 금액)
        StockInOutVO stockInOutVO=new StockInOutVO();
        stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
        stockInOutVO = stockInOutService.selectMobileStockInoByDlrCd(stockInOutVO);

        model.addAttribute("PURC_TOT_AMT", (int)stockInOutVO.getPurcTotAmt());
        model.addAttribute("PURC_TOT_AMT_GUBUN", stockInOutVO.getGubun());
        model.addAttribute("SALE_TOT_AMT", (int)stockInOutVO.getSaleTotAmt());
        model.addAttribute("STOCK_TOT_AMT", (int)stockInOutVO.getStockTotAmt());
        //부품

        //List<CarInfoVO> tempList=carInfoService.selectBarCodeCarListsByCondition(new CarInfoSearchVO());

        model.addAttribute("carInfoList", carInfoService.selectBarCodeCarListsByCondition(new CarInfoSearchVO()));

        return "/mob/cmm/main/selectMainAccountancy";
    }*/

    /**
     * 모바일 메인화면
     */
    @RequestMapping(value = "/__selectMain.do", method = RequestMethod.GET)
    public String selectMain(Model model) throws Exception {
        MobileMainMappingVO mobileMainMappingVO = mobileMainMappingService.selectMobileMainMapping(LoginUtil.getUserId());
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        Calendar nowCal = Calendar.getInstance();
        nowCal.set(Calendar.HOUR, 0);
        nowCal.set(Calendar.MINUTE, 0);
        nowCal.set(Calendar.SECOND, 0);
        nowCal.set(Calendar.HOUR_OF_DAY, 0);
        //오늘날짜
        Date today = nowCal.getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당년시작일자
        Date firstDayOfYear = DateUtil.getFirstDateOfYear(today);

        model.addAttribute("userId",mobLoginVO.getUserId());
        model.addAttribute("userNm",mobLoginVO.getUserNm());
        model.addAttribute("dlrCd",mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm",mobLoginVO.getDlrNm());
        model.addAttribute("today", DateUtil.getDate("yyyy年 MM月 dd日"));

        //TODO[강훈식] 모바일 메인화면 - 사용자 매핑이 설정 되지 않은 경우에 대한 처리 필요
        //메인화면매핑이 없는 사용자
        if(mobileMainMappingVO == null){
            initSalesAndCrmMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            initServiceAndPartsMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            return "/mob/cmm/main/selectMainAccountancy";
        }

        //mobileMainMappingVO.setMobMainTp("02");

        //총경리
        if("01".equals(mobileMainMappingVO.getMobMainTp())){
            initSalesAndCrmMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            initServiceAndPartsMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            return "/mob/cmm/main/selectMainAccountancy";
        //판매|CRM
        }else if("02".equals(mobileMainMappingVO.getMobMainTp())){
            initSalesAndCrmMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            return "/mob/cmm/main/selectMainSalCrm";
        //정비|부품
        }else{
            initServiceAndPartsMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            return "/mob/cmm/main/selectMainSerPar";
        }
    }

    @RequestMapping(value = "/selectMain.do", method = RequestMethod.GET)
    public String _selectMain(Model model) throws Exception {

        MobileMainMappingVO mobileMainMappingVO = mobileMainMappingService.selectMobileMainMapping(LoginUtil.getUserId());
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        Calendar nowCal = Calendar.getInstance();
        nowCal.set(Calendar.HOUR, 0);
        nowCal.set(Calendar.MINUTE, 0);
        nowCal.set(Calendar.SECOND, 0);
        nowCal.set(Calendar.HOUR_OF_DAY, 0);
        //오늘날짜
        Date today = nowCal.getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당년시작일자
        Date firstDayOfYear = DateUtil.getFirstDateOfYear(today);

        model.addAttribute("userId",mobLoginVO.getUserId());
        model.addAttribute("userNm",mobLoginVO.getUserNm());
        model.addAttribute("dlrCd",mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm",mobLoginVO.getDlrNm());
        model.addAttribute("today", DateUtil.getDate("yyyy年 MM月 dd日"));
        model.addAttribute("userId",mobLoginVO.getUserId());
        model.addAttribute("userNm",mobLoginVO.getUserNm());
        model.addAttribute("dlrCd",mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm",mobLoginVO.getDlrNm());
        model.addAttribute("today", DateUtil.getDate("yyyy年 MM月 dd日"));
        //TODO[강훈식] 모바일 메인화면 - 사용자 매핑이 설정 되지 않은 경우에 대한 처리 필요
        //메인화면매핑이 없는 사용자
        if(mobileMainMappingVO == null){
            initSalesAndCrmMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            initServiceAndPartsMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
            model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/mob/cmm/main/selectMainAccountancy.jsp");
        }else{
            //총경리
            if("01".equals(mobileMainMappingVO.getMobMainTp())){
                initSalesAndCrmMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
                initServiceAndPartsMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
                model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/mob/cmm/main/selectMainAccountancy.jsp");
            //판매|CRM
            }else if("02".equals(mobileMainMappingVO.getMobMainTp())){
                initSalesAndCrmMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
                model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp//mob/cmm/main/selectMainSalCrm.jsp");
            //정비|부품
            }else{
                initServiceAndPartsMain(model, mobileMainMappingVO.getMobMainTp(), mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
                model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/mob/cmm/main/selectMainSerPar.jsp");
            }
        }
        return "/ZnewMob/templatesNewMob/mobTemplateD";
    }

    /**
     * 모바일 메인화면(판매|CRM) 데이터 설정
     * @param model
     * @throws Exception
     */
    private void initSalesAndCrmMain(Model model, String mobMainTp, String dlrCd, Date today, Date firstDayOfMonth, Date firstDayOfYear) throws Exception{

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //판매정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //당일 소매판매량
        int custSalesCountForDate = mobMainService.selectCustSalesCount(dlrCd, today, today);
        //당월 소매판매량(당월 1일부터 현재까지)
        int custSalesCountForMonth = mobMainService.selectCustSalesCount(dlrCd, firstDayOfMonth, today);
        //당년 소매판매량(당년 1일부터 현재까지)
        int custSalesCountForYear = mobMainService.selectCustSalesCount(dlrCd, firstDayOfYear, today);

        //전월 소매판매량(전월 1일부터 전월 현재일자까지)
        int custSalesCountForPrevMonth = mobMainService.selectCustSalesCount(dlrCd, DateUtil.add(firstDayOfMonth, Calendar.MONTH, -1), DateUtil.add(today, Calendar.MONTH, -1));
        //전년 소매판매량(전년 1일부터 전년 현재일자까지)
        int custSalesCountForPrevYear = mobMainService.selectCustSalesCount(dlrCd, DateUtil.add(firstDayOfYear, Calendar.YEAR, -1), DateUtil.add(today, Calendar.YEAR, -1));

        //전월대비 소매판매 증감율
        double custSalesRateOfIncreaseForMonth = 0;
        if(custSalesCountForPrevMonth != 0){
            custSalesRateOfIncreaseForMonth = ((custSalesCountForMonth/custSalesCountForPrevMonth)-1);
        }

        //전년대비 소매판매 증감율
        double custSalesRateOfIncreaseForYear = 0;
        if(custSalesCountForPrevYear != 0){
            custSalesRateOfIncreaseForYear = ((custSalesCountForYear/custSalesCountForPrevYear)-1);
        }

        //당월 전략출고량(전략출고[J3])
        /*List<String> kmoptList = new ArrayList<String>();
        kmoptList.add("J3");
        int strategySalesCountForMonth = mobMainService.selectSalesCount(dlrCd, DateUtil.getDate(today, "yyyyMM"), kmoptList);*/

        //당월 총판매량(일반판매[J1]+전략출고[J3]+전략출고일반판매전환[J5])
        /*List<String> kmoptList = new ArrayList<String>();
        kmoptList.add("J1");
        kmoptList.add("J5");
        int totalSalesCountForMonth = mobMainService.selectSalesCount(dlrCd, DateUtil.getDate(today, "yyyyMM"), kmoptList);*/

        //당월 전략출고비율(전략출고판매량/총판매량)
        /*double strategySalesRateForMonth = 0;
        if(totalSalesCountForMonth != 0){
            strategySalesRateForMonth = strategySalesCountForMonth/totalSalesCountForMonth;
        }*/

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //CRM정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //당일방문자수
        int visitCountForDate = mobMainService.selectVisitCount(dlrCd, today, today);
        //당월방문자수
        int visitCountForMonth = mobMainService.selectVisitCount(dlrCd, firstDayOfMonth, today);
        //리드미처리수
        List<String> leadStatCdList = new ArrayList<String>();
        leadStatCdList.add("01");   //업로드|집객
        int outstandingLeadCount = mobMainService.selectLeadCount(dlrCd, leadStatCdList, null);
        //리드F/U수
        leadStatCdList.clear();
        leadStatCdList.add("02");   //추출|예약
        leadStatCdList.add("03");   //방문|면담
        leadStatCdList.add("04");   //추적|추진
        int followUpLeadCount = mobMainService.selectLeadCount(dlrCd, leadStatCdList, null);

        int reservedLeadCount = 0;
        int visitReserviceLeadCount = 0;

        //판매|CRM
        if("02".equals(mobMainTp)){
            //리드 당일예약수
            reservedLeadCount = mobMainService.selectReservedLeadCount(dlrCd, today, today);
            //리드 예약후 당일방문수
            visitReserviceLeadCount = mobMainService.selectVisitReservedLeadCount(dlrCd, today, today);
        }

        //제조사클레임수
        int outstandingVocClaimCount = mobMainService.selectOutstandingVocClaimCount(dlrCd);
        //진행중 캠페인수
        int outstandingCampaignCount = 0;

        //총경리
        if("01".equals(mobMainTp)){
            outstandingCampaignCount = mobMainService.selectOutstandingCampaignCount(dlrCd);
        }

        //TODO[강훈식] 현재 미개발되어 개발완료시 반영 필요
        //2급딜러판매량
        //int minorDealerSalesCount = 0;

        //TODO[강훈식] 현재 미개발되어 개발완료시 반영 필요
        //2급딜러판매비율
        //double minorDealerSalesRate = 0;

        //판매집계정보설정
        //당일판매량
        model.addAttribute("custSalesCountForDate", custSalesCountForDate);
        //당월판매량
        model.addAttribute("custSalesCountForMonth", custSalesCountForMonth);
        //전월대비 판매 증감율
        model.addAttribute("custSalesRateOfIncreaseForMonth", custSalesRateOfIncreaseForMonth);
        //당년판매량
        model.addAttribute("custSalesCountForYear", custSalesCountForYear);
        //전년대비 판매 증감율
        model.addAttribute("custSalesRateOfIncreaseForYear", custSalesRateOfIncreaseForYear);
        //당월전략출고량
        //model.addAttribute("strategySalesCountForMonth", strategySalesCountForMonth);
        //당월전략출고비율
        //model.addAttribute("strategySalesRateForMonth", strategySalesRateForMonth);

        //CRM집계정보설정
        //당일방문자수
        model.addAttribute("visitCountForDate", visitCountForDate);
        //당월방문자수
        model.addAttribute("visitCountForMonth", visitCountForMonth);
        //리드미처리수
        model.addAttribute("outstandingLeadCount", outstandingLeadCount);
        //리드F/U수
        model.addAttribute("followUpLeadCount", followUpLeadCount);
        //2급딜러판매량
        //model.addAttribute("minorDealerSalesCount", minorDealerSalesCount);
        //2급딜러판매비율
        //model.addAttribute("minorDealerSalesRate", minorDealerSalesRate);
        //제조사클레임수
        model.addAttribute("outstandingVocClaimCount", outstandingVocClaimCount);
        //진행중 캠페인수
        model.addAttribute("outstandingCampaignCount", outstandingCampaignCount);
        //리드 당일예약수
        model.addAttribute("reservedLeadCount", reservedLeadCount);
        //리드 예약후 당일방문수
        model.addAttribute("visitReserviceLeadCount", visitReserviceLeadCount);

    }

    /**
     * 모바일 메인화면(정비|부품) 데이터 설정
     * @param model
     * @throws Exception
     */
    private void initServiceAndPartsMain(Model model, String mobMainTp, String dlrCd, Date today, Date firstDayOfMonth, Date firstDayOfYear) throws Exception{
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //정비정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Map<String, BigDecimal> repairOrderAmtSummary = mobMainService.selectRepairOrderAmtSummary(dlrCd, firstDayOfMonth, today);
        //정비위탁대차
        int repairOrderCountForMonth = mobMainService.selectRepairOrderCount(dlrCd, firstDayOfMonth, today);
        //정비생산액
        double calcTotAmtForMonth = mobMainService.selectCalcTotAmt(dlrCd, firstDayOfMonth, today);
        //서비스정산대차
        int calcDocCntForMonth = repairOrderAmtSummary.get("CALC_DOC_CNT").intValue();
        //정비매출
        double calcTotAmtExcludeItemPriceForMonth = mobMainService.selectCalcSales(dlrCd, firstDayOfMonth, today);
        //한대차생산액
        double calcDocAvgAmgForMonth = repairOrderAmtSummary.get("CALC_DOC_AVG_AMT").doubleValue();
        //한대당생산액
        double calcVinAvgAmgForMonth = repairOrderAmtSummary.get("CALC_VIN_AVG_AMT").doubleValue();

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //부품정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Map<String, BigDecimal> selectStockInOutAmtSummary = mobMainService.selectStockInOutAmtSummary(dlrCd);
        //장면금액
        double stockAmt = selectStockInOutAmtSummary.get("STOCK_AMT").doubleValue();
        //공사중금액
        double usedAmtReceivedInAdvanced = mobMainService.selectUsedAmtReceivedInAdvanced(dlrCd);
        //재고금액
        double stockAvlbAmt = selectStockInOutAmtSummary.get("STOCK_AVLB_AMT").doubleValue();
        //당일판매금액
        double itemSalesAmtForDate = mobMainService.selectItemSalesAmt(dlrCd, today, today);
        //발송주문수
        int processingPurcharsOrderCount = mobMainService.selectPurcharsOrderCount(dlrCd, "02");
        //처리주문수
        int completedPurcharsOrderCount = mobMainService.selectPurcharsOrderCount(dlrCd, "03");
        //당일출고금액
        double itemGiAmtForDate = mobMainService.selectItemGiAmt(dlrCd, today, today);
        //당일입고금액
        double itemGrAmtForDate = mobMainService.selectItemGrAmt(dlrCd, today, today);

        //정비집계정보설정
        //정비위탁대차
        model.addAttribute("repairOrderCountForMonth", repairOrderCountForMonth);
        //정비생산액
        model.addAttribute("calcTotAmtForMonth", calcTotAmtForMonth);
        //서비스정산대차
        model.addAttribute("calcDocCntForMonth", calcDocCntForMonth);
        //정비매출
        model.addAttribute("calcTotAmtExcludeItemPriceForMonth", calcTotAmtExcludeItemPriceForMonth);
        //한대차생산액
        model.addAttribute("calcDocAvgAmgForMonth", calcDocAvgAmgForMonth);
        //한대당생산액
        model.addAttribute("calcVinAvgAmgForMonth", calcVinAvgAmgForMonth);

        //부품집계정보설정
        //장면금액
        model.addAttribute("stockAmt", stockAmt);
        //공사중금액
        model.addAttribute("usedAmtReceivedInAdvanced", usedAmtReceivedInAdvanced);
        //재고금액
        model.addAttribute("stockAvlbAmt", stockAvlbAmt);
        //당일판매금액
        model.addAttribute("itemSalesAmtForDate", itemSalesAmtForDate);
        //발송주문수
        model.addAttribute("processingPurcharsOrderCount", processingPurcharsOrderCount);
        //처리주문수
        model.addAttribute("completedPurcharsOrderCount", completedPurcharsOrderCount);
        //당일출고금액
        model.addAttribute("itemGiAmtForDate", itemGiAmtForDate);
        //당일입고금액
        model.addAttribute("itemGrAmtForDate", itemGrAmtForDate);
    }

    /**
     * 당월 일별 소매판매 데이터 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectDailyCustSalesList.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> selectDailyCustSalesList() throws Exception {
        return mobMainService.selectDailyCustSalesList(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate("yyyyMM"));
    }

    /**
     * 당월 차종별 소매판매 데이터 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCustSalesListByCarline.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> selectCustSalesListByCarline() throws Exception {
        return mobMainService.selectCustSalesListByCarline(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate("yyyyMM"));
    }

    /**
     * 월별 서비스생산액 데이터 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectMonthlyCalcTotAmtList.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> selectMonthlyCalcTotAmtList() throws Exception {
        Date today = Calendar.getInstance().getTime();
        return mobMainService.selectMonthlyCalcTotAmtList(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate(today, "yyyy", Calendar.YEAR, -1), DateUtil.getDate(today, "yyyy"));
    }

    /**
     * 당월 차종별 서비스 정산 대차 데이터 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCalcDocListByCarline.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> selectCalcDocListByCarline() throws Exception {
        //오늘날짜
        Date today = Calendar.getInstance().getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당월종료일자
        Date lastDayOfMonth = DateUtil.getLastDateOfMonth(today);

        return mobMainService.selectCalcDocListByCarline(MobUtil.getLoginVO().getDlrCd(), firstDayOfMonth, lastDayOfMonth);
    }

    /**
     * 당월 수리유형별 서비스 정산 대차 데이터 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCalcDocListByRepairOrderType.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> selectCalcDocListByRepairOrderType() throws Exception {
        //오늘날짜
        Date today = Calendar.getInstance().getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당월종료일자
        Date lastDayOfMonth = DateUtil.getLastDateOfMonth(today);

        return mobMainService.selectCalcDocListByRepairOrderType(MobUtil.getLoginVO().getDlrCd(), firstDayOfMonth, lastDayOfMonth, LocaleContextHolder.getLocale().getLanguage());
    }


    @RequestMapping(value = "/Car_Info.do", method = RequestMethod.GET)
    @ResponseBody
    public SearchResult carInfoSource(Model model) throws Exception {

        SearchResult result = new SearchResult();

        List<HashMap<String, String>> mapList = new ArrayList<HashMap<String, String>>();

        List<CarInfoVO> carInfoList = carInfoService.selectBarCodeCarListsByCondition(new CarInfoSearchVO());
        for(int i=0; i<carInfoList.size(); i++){
            HashMap<String,String> hm=new HashMap<String,String>();
            hm.put("VEHICLE_CD",carInfoList.get(i).getBarCode());
            hm.put("CARLINE_CD",carInfoList.get(i).getCarlineCd());
            hm.put("CARLINE_NM",carInfoList.get(i).getCarlineNm());
            mapList.add(hm);
        }
        result.setData(mapList);

        return result;
    }

    @RequestMapping(value = "/Lead_Source.do", method = RequestMethod.GET)
    @ResponseBody
    public SearchResult getLeadSource(Model model) throws Exception {

        SearchResult result = new SearchResult();

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        List<HashMap<String, String>> mapList = new ArrayList<HashMap<String, String>>();

        List<CommonCodeVO> infoTpList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd);
        for(int i=0; i<infoTpList.size(); i++){
            HashMap<String,String> hm=new HashMap<String,String>();
            hm.put("LEAD_SEQ","-1");
            hm.put("LEAD_CD",infoTpList.get(i).getCmmCd());
            hm.put("LEAD_NM",infoTpList.get(i).getCmmCdNm());
            hm.put("START_DT","00000001");
            hm.put("END_DT","00000001");
            mapList.add(hm);
        }

        List<CommonCodeVO> holdTpList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd);
        for(int i=0; i<holdTpList.size(); i++){
            HashMap<String,String> hm=new HashMap<String,String>();
            hm.put("LEAD_SEQ","00");
            hm.put("LEAD_CD",holdTpList.get(i).getCmmCd());
            hm.put("LEAD_NM",holdTpList.get(i).getCmmCdNm());
            hm.put("START_DT","00000001");
            hm.put("END_DT","00000001");
            mapList.add(hm);
        }

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO=new SalesOpptHoldTypeMgmtSearchVO();
        salesOpptHoldTypeMgmtSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        if (holdDtlCnt > 0){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            for(int i=0; i<holdDetlTpSeqList.size(); i++){
                HashMap<String,String> hm=new HashMap<String,String>();
                hm.put("LEAD_SEQ",holdDetlTpSeqList.get(i).getHoldSeq()+"");
                hm.put("LEAD_CD",holdDetlTpSeqList.get(i).getHoldTp());
                hm.put("LEAD_NM",holdDetlTpSeqList.get(i).getHoldDetlTpNm());
                if(holdDetlTpSeqList.get(i).getHoldTp().equals("03")&&holdDetlTpSeqList.get(i).getStartDt()!=null&&holdDetlTpSeqList.get(i).getEndDt()!=null){
                    String strStartDt = dateFormat.format(holdDetlTpSeqList.get(i).getStartDt());
                    String strEndDt = dateFormat.format(holdDetlTpSeqList.get(i).getEndDt());
                    hm.put("START_DT",strStartDt.replace("-", ""));
                    hm.put("END_DT",strEndDt.replace("-", ""));
                }else{
                    hm.put("START_DT","00000001");
                    hm.put("END_DT","00000001");
                }
                mapList.add(hm);
            }
        }
        result.setData(mapList);

        return result;
    }


    // 메인 - 외부설문
    @RequestMapping(value = "/selectExtraSurvey.do", method = RequestMethod.GET)
    public String selectExtraSurvey(Model model) throws Exception {

        return "/mob/cmm/main/selectExtraSurvey";
    }



    /**
     * 사이드 메뉴 화면.
     * @return
     */
    @RequestMapping(value = "/selectMenuMain.do", method = RequestMethod.GET)
    public String selectMenuMain(Model model) throws Exception {

        //khskhs 강훈식
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
       //khskhs 강훈식

        return "/mob/cmm/main/selectMenuMain";
    }

    /**
     * 메인화면 알람 건수 표시.
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMainAlarms.do", method = RequestMethod.POST)
    public SearchResult selectMainAlarms(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 주업무 바로가기.
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMainLinks.do", method = RequestMethod.POST)
    public SearchResult selectMainLinks(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 업무 현황.
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMainTodo.do", method = RequestMethod.POST)
    public SearchResult selectMainTodo(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 자주 쓰는 메뉴
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMainFavorites.do", method = RequestMethod.POST)
    public SearchResult selectMainFavorites(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 전체 알림
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMainNotices.do", method = RequestMethod.POST)
    public SearchResult selectMainNotices(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 메뉴
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMenuResults.do", method = RequestMethod.POST)
    public SearchResult selectMenuResults(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 메뉴 자주 쓰는 메뉴
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectMenuFavorites.do", method = RequestMethod.POST)
    public SearchResult selectMenuFavorites(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }

    /**
     * 메인화면 메뉴 자주 쓰는 메뉴 등록
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/insertMenuFavorites.do", method = RequestMethod.POST)
    public @ResponseBody boolean insertMenuFavorites(@RequestBody SearchVO searchVO) throws Exception {
        return true;
    }

    /**
     * 메인화면 메뉴 자주 쓰는 메뉴 변경
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/deleteMenuFavorites.do", method = RequestMethod.POST)
    public @ResponseBody boolean deleteMenuFavorites(@RequestBody SearchVO searchVO) throws Exception {
        return true;
    }

    public List<KendoTreeModel<ViewHierarchyVO>> getTreeNode(Tree<ViewHierarchyVO> tree, List<ViewHierarchyVO> lstMenu ,String rootId) {

        for(ViewHierarchyVO vo : lstMenu){
            tree.addNode(vo.getChildViewId(), vo.getParentViewId(), vo);
        }

        if(tree.getNodes().size() > 1) {

            @SuppressWarnings("unchecked")
            KendoTreeModel<ViewHierarchyVO> kendoTreeModel = (KendoTreeModel<ViewHierarchyVO>)tree.buildTreeModel(rootId,null,new KendoTreeModelBuilder<ViewHierarchyVO>(0) );

            List<KendoTreeModel<ViewHierarchyVO>> kendoTreeModelList = new ArrayList<KendoTreeModel<ViewHierarchyVO>>();
            kendoTreeModelList.add(kendoTreeModel);

            return kendoTreeModelList;

        } else {

            return null;
        }


    }

    @RequestMapping(value = "/insertDeviceInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertDeviceInfo(@RequestBody DeviceInfoVO deviceInfoVO) throws Exception {


        int n=deviceInfoService.selectDeviceInfoCnt(deviceInfoVO);

        if(n>0){
            if(deviceInfoVO.getUpdateDate().length()>9){
                deviceInfoService.updateDeviceInfo(deviceInfoVO);
            }else{

            }
        }else{
            deviceInfoService.insertDeviceInfo(deviceInfoVO);
        }

        return true;
    }

}
