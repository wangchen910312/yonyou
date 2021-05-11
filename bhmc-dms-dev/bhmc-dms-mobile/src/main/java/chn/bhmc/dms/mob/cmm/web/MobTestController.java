package chn.bhmc.dms.mob.cmm.web;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import chn.bhmc.dms.cmm.ath.service.MobileMainMappingService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.DeviceInfoService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.mob.cmm.service.MobMainService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.cmm.ath.vo.MobileMainMappingVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobTestController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 18.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/mob/cmm/main")
public class MobTestController extends HController {
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
        double calcTotAmtExcludeItemPriceForMonth = 0;
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

    /*@RequestMapping(value = "/selectMain.do", method = RequestMethod.GET)
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
        }

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
        model.addAttribute("_urlListJsp", "#");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }*/
}
