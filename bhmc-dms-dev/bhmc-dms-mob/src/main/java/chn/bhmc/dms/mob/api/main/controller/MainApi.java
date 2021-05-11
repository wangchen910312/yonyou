package chn.bhmc.dms.mob.api.main.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.main.service.MainAdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.mob.api.main.service.MainMobMainService;
import chn.bhmc.dms.mob.api.main.service.MainMobileMainMappingService;
import chn.bhmc.dms.mob.api.main.service.MainNotificationMessageService;
import chn.bhmc.dms.mob.api.main.service.MainTodoInfoService;
import chn.bhmc.dms.mob.api.main.service.MainViewInfoService;
import chn.bhmc.dms.mob.api.main.service.MainViewMappingService;
import chn.bhmc.dms.mob.api.main.vo.MenuVO;
import chn.bhmc.dms.mob.api.main.vo.MobileMainMappingVO;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoSearchVO;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingSearchVO;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
/**
 *
 * @ClassName: MainApi
 * @Description: 登录首页
 *<pre>
 * 首页：包括待办、提示、销售和售后统计
 *</pre>
 * @author blueair
 *
 * -----------------------------------------------------
 * @date 2017年9月29日
 * -----------------------------------------------------
 */
@Controller
@RequestMapping("/api/main")
@Api("首页")
public class MainApi extends HController {

	/**
     * 모바일 메인 화면 - 사용자 매핑 서비스
     */
    @Resource(name="MainMobileMainMappingService")
    MainMobileMainMappingService MainMobileMainMappingService;

	@Resource(name="todoInfoService")
    TodoInfoService todoInfoService;
	
	@Resource(name="MainTodoInfoService")
    MainTodoInfoService MainTodoInfoService;

	/**
     * 알림메세지 관리 서비스(不迁移，因为有修改方法)
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;
    /**
     * 消息提醒service迁移，查询条件需要修改。
     */
    @Resource(name="mainNotificationMessageService")
    MainNotificationMessageService mainNotificationMessageService;

    @Resource(name="MainMobMainService")
    MainMobMainService MainMobMainService;

    /**
     * 权限查询
     */
    @Resource(name="MainViewInfoService")
    MainViewInfoService MainViewInfoService;

    /**
     * 按钮权限
     */
    @Resource(name="MainViewMappingService")
    MainViewMappingService MainViewMappingService;

    /**
     * 首页_配件统计  实际金额
     */
    @Resource(name="MainAdvanceReceivedInfoHeaderService")
    MainAdvanceReceivedInfoHeaderService MainAdvanceReceivedInfoHeaderService;
    /**
     * 该类拷贝MobMainController._selectMain改造
     * @Title: _selectMain
     * @Description: 登录首页调整
     * @param model
     * @return
     * @throws Exception
     * @return String    返回类型
     * @throws
     */
    @RequestMapping(value = "/selectMain.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("登录-首页数据加载")
    public BaseJSON _selectMain(Model model) throws Exception {
    	BaseJSON resutlJson = new BaseJSON();
        MobileMainMappingVO mobileMainMappingVO = MainMobileMainMappingService.selectMobileMainMapping(LoginUtil.getUserId());
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
        //2017-11-12 update by sunzhiqiang 未设置“移动端首页”报错修正  start
        //TODO[강훈식] 모바일 메인화면 - 사용자 매핑이 설정 되지 않은 경우에 대한 처리 필요
        //메인화면매핑이 없는 사용자
//        if(mobileMainMappingVO == null){
//            initSalesAndCrmMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
//            initServiceAndPartsMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
//            model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/mob/cmm/main/selectMainAccountancy.jsp");
//        }
        if(mobileMainMappingVO == null){
        	//initSalesAndCrmMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
        	//initServiceAndPartsMain(model, null, mobLoginVO.getDlrCd(), today, firstDayOfMonth, firstDayOfYear);
        	//model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/mob/cmm/main/selectMainAccountancy.jsp");
            //2017.09.29 新增标识，标识访问人员身份 01-总经理，02-销售CRM，03-配件，售后
            model.addAttribute("mobMainTp","0");
        }else{
       	//2017-11-12 update by sunzhiqiang 未设置“移动端首页”报错修正  end

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

        //2017.09.29 新增标识，标识访问人员身份 01-总经理，02-销售CRM，03-配件，售后
        model.addAttribute("mobMainTp",mobileMainMappingVO.getMobMainTp());
	    //2017-11-12 update by sunzhiqiang 未设置“移动端首页”报错修正  start
        }
        //2017-11-12 update by sunzhiqiang 未设置“移动端首页”报错修正  end
        //2017.09.29 增加初始 待办和提示数量查询
        model.addAttribute("todo",this.selectUnconfirmedTodoCnt().getResult());
        NotificationMessageSearchVO sVo = new NotificationMessageSearchVO();
        model.addAttribute("alarm",this.selectAlarmCnt(sVo).getResult());
        resutlJson.setResult(model.asMap());
        return resutlJson;
    }

    /**
     * 모바일 메인화면(판매|CRM) 데이터 설정
     * 注：该类拷贝MobMainController.initSalesAndCrmMain改造
     * @param model
     * @throws Exception
     */
    private void initSalesAndCrmMain(Model model, String mobMainTp, String dlrCd, Date today, Date firstDayOfMonth, Date firstDayOfYear) throws Exception{

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //판매정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //당일 소매판매량
        int custSalesCountForDate = MainMobMainService.selectCustSalesCount(dlrCd, today, today);
        //당월 소매판매량(당월 1일부터 현재까지)
        int custSalesCountForMonth = MainMobMainService.selectCustSalesCount(dlrCd, firstDayOfMonth, today);
        //당년 소매판매량(당년 1일부터 현재까지)
        int custSalesCountForYear = MainMobMainService.selectCustSalesCount(dlrCd, firstDayOfYear, today);

        //전월 소매판매량(전월 1일부터 전월 현재일자까지)
        int custSalesCountForPrevMonth = MainMobMainService.selectCustSalesCount(dlrCd, DateUtil.add(firstDayOfMonth, Calendar.MONTH, -1), DateUtil.add(today, Calendar.MONTH, -1));
        //전년 소매판매량(전년 1일부터 전년 현재일자까지)
        int custSalesCountForPrevYear = MainMobMainService.selectCustSalesCount(dlrCd, DateUtil.add(firstDayOfYear, Calendar.YEAR, -1), DateUtil.add(today, Calendar.YEAR, -1));

        //전월대비 소매판매 증감율
        double custSalesRateOfIncreaseForMonth = 0;
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00");  
        if(custSalesCountForPrevMonth != 0){
        	String fmted = df.format((((double)custSalesCountForMonth/(double)custSalesCountForPrevMonth)-1));
            custSalesRateOfIncreaseForMonth = Double.valueOf(fmted);
        }

        //전년대비 소매판매 증감율
        double custSalesRateOfIncreaseForYear = 0;
        if(custSalesCountForPrevYear != 0){
        	String fmted = df.format(((double)custSalesCountForYear/(double)custSalesCountForPrevYear)-1);
            custSalesRateOfIncreaseForYear = Double.valueOf(fmted);
        }

        //당월 전략출고량(전략출고[J3])
        /*List<String> kmoptList = new ArrayList<String>();
        kmoptList.add("J3");
        int strategySalesCountForMonth = MainMobMainService.selectSalesCount(dlrCd, DateUtil.getDate(today, "yyyyMM"), kmoptList);*/

        //당월 총판매량(일반판매[J1]+전략출고[J3]+전략출고일반판매전환[J5])
        /*List<String> kmoptList = new ArrayList<String>();
        kmoptList.add("J1");
        kmoptList.add("J5");
        int totalSalesCountForMonth = MainMobMainService.selectSalesCount(dlrCd, DateUtil.getDate(today, "yyyyMM"), kmoptList);*/

        //당월 전략출고비율(전략출고판매량/총판매량)
        /*double strategySalesRateForMonth = 0;
        if(totalSalesCountForMonth != 0){
            strategySalesRateForMonth = strategySalesCountForMonth/totalSalesCountForMonth;
        }*/

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //CRM정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //당일방문자수
        int visitCountForDate = MainMobMainService.selectVisitCount(dlrCd, today, today);
        //당월방문자수
        int visitCountForMonth = MainMobMainService.selectVisitCount(dlrCd, firstDayOfMonth, today);
        //리드미처리수
        List<String> leadStatCdList = new ArrayList<String>();
        leadStatCdList.add("01");   //업로드|집객
        int outstandingLeadCount = MainMobMainService.selectLeadCount(dlrCd, leadStatCdList, null);
        //리드F/U수
        leadStatCdList.clear();
        leadStatCdList.add("02");   //추출|예약
        leadStatCdList.add("03");   //방문|면담
        leadStatCdList.add("04");   //추적|추진
        int followUpLeadCount = MainMobMainService.selectLeadCount(dlrCd, leadStatCdList, null);

        int reservedLeadCount = 0;
        int visitReserviceLeadCount = 0;

        //판매|CRM
        if("02".equals(mobMainTp)){
            //리드 당일예약수
            reservedLeadCount = MainMobMainService.selectReservedLeadCount(dlrCd, today, today);
            //리드 예약후 당일방문수
            visitReserviceLeadCount = MainMobMainService.selectVisitReservedLeadCount(dlrCd, today, today);
        }

        //제조사클레임수
        int outstandingVocClaimCount = MainMobMainService.selectOutstandingVocClaimCount(dlrCd);
        //진행중 캠페인수
        int outstandingCampaignCount = 0;

        //총경리
        if("01".equals(mobMainTp)){
            outstandingCampaignCount = MainMobMainService.selectOutstandingCampaignCount(dlrCd);
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
     * 注：该类拷贝MobMainController.initServiceAndPartsMain改造
     * @param model
     * @throws Exception
     */
    private void initServiceAndPartsMain(Model model, String mobMainTp, String dlrCd, Date today, Date firstDayOfMonth, Date firstDayOfYear) throws Exception{
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //정비정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Map<String, BigDecimal> repairOrderAmtSummary = MainMobMainService.selectRepairOrderAmtSummary(dlrCd, firstDayOfMonth, today);
        //정비위탁대차
        int repairOrderCountForMonth = MainMobMainService.selectRepairOrderCount(dlrCd, firstDayOfMonth, today);
        //정비생산액
        double calcTotAmtForMonth = MainMobMainService.selectCalcTotAmt(dlrCd, firstDayOfMonth, today);
        //서비스정산대차
        int calcDocCntForMonth = repairOrderAmtSummary.get("CALC_DOC_CNT").intValue();
        //정비매출
        double calcTotAmtExcludeItemPriceForMonth = MainMobMainService.selectCalcSales(dlrCd, firstDayOfMonth, today);
        //한대차생산액
        double calcDocAvgAmgForMonth = repairOrderAmtSummary.get("CALC_DOC_AVG_AMT").doubleValue();
        //한대당생산액
        double calcVinAvgAmgForMonth = repairOrderAmtSummary.get("CALC_VIN_AVG_AMT").doubleValue();

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //부품정보 집계
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Map<String, BigDecimal> selectStockInOutAmtSummary = MainMobMainService.selectStockInOutAmtSummary(dlrCd);
        //장면금액
        double stockAmt = selectStockInOutAmtSummary.get("STOCK_AMT").doubleValue();
        //공사중금액
        double usedAmtReceivedInAdvanced = MainMobMainService.selectUsedAmtReceivedInAdvanced(dlrCd);
        //재고금액
        double stockAvlbAmt = selectStockInOutAmtSummary.get("STOCK_AVLB_AMT").doubleValue();
        //당일판매금액
        double itemSalesAmtForDate = MainMobMainService.selectItemSalesAmt(dlrCd, today, today);
        //维修销售额
        double itemReparAmtForDate = MainMobMainService.selectItemReparAmt(dlrCd, today, today);
        //발송주문수
        int processingPurcharsOrderCount = MainMobMainService.selectPurcharsOrderCount(dlrCd, "02");
        //처리주문수
        int completedPurcharsOrderCount = MainMobMainService.selectPurcharsOrderCount(dlrCd, "03");
        //당일출고금액
        double itemGiAmtForDate = MainMobMainService.selectItemGiAmt(dlrCd, today, today);
        //당일입고금액
        double itemGrAmtForDate = MainMobMainService.selectItemGrAmt(dlrCd, today, today);

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
        //新增维修销售额
        model.addAttribute("itemReparAmtForDate", itemReparAmtForDate);
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
     * 查询待办事项
     * 注：该类修改自 MobTodoController.selectUnconfirmedTodoCnt方法
     * @return
     */
    @RequestMapping(value = "/selectUnconfirmedTodoCnt.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("首页-查询待办事项")
    public BaseJSON selectUnconfirmedTodoCnt(/*@RequestBody NotificationMessageSearchVO searchVO*/)  throws Exception  {
    	BaseJSON resultJson = new BaseJSON();
        SearchResult result = new SearchResult();
        TodoInfoSearchVO searchVO = new TodoInfoSearchVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsOpenYn("N");
        searchVO.setsActionTargetTp("03");

        result.setTotal(MainTodoInfoService.selectTodoInfosByConditionCnt(searchVO));
        resultJson.setResult(result);
        return resultJson;
    }

    /**
     * 查询待办事项明细
     * 注：该类修改自 MobTodoController.selectTodo方法
     * @return
     */
    @RequestMapping(value = "/selectTodo.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("首页-查询待办事项明细")
    public BaseJSON selectTodo(@RequestBody TodoInfoSearchVO searchVO) throws Exception {
    	BaseJSON resultJson = new BaseJSON();
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsActionTargetTp("03");

        searchVO.setsOpenYn("N");
        result.setTotal(MainTodoInfoService.selectTodoInfosByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(MainTodoInfoService.selectTodoInfosByCondition(searchVO));
        }
        resultJson.setResult(result);
        return resultJson;

    }

    /**
     * 点击结束按钮 Todo
     * @param list
     * @return
     */
    @RequestMapping(value = "/updateTodoInfoHndl.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("查询待办事项明细-结束按钮")
    public BaseJSON updateTodoInfoHndl(@RequestBody List<Integer> list) throws Exception {
    	BaseJSON resultJson = new BaseJSON();
    	int result = todoInfoService.updateTodoInfoHndl(list, LoginUtil.getUserId());
    	if(result == 0) {
    		resultJson.setResultCode(1);
    		resultJson.setResultMsg("已正常处理");
    	}
        return resultJson;
    }

    /**
     * 查询提示信息
     * 注：该类修改自 MobAlarmController.selectAlarmCnt方法
     * @return
     */
    @RequestMapping(value = "/selectAlarmCnt.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("首页-查询提示信息")
    public BaseJSON selectAlarmCnt(@RequestBody NotificationMessageSearchVO searchVO)  throws Exception  {
    	BaseJSON resultJson = new BaseJSON();
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();


        //sReceiveUsrId : 사용자 ID
        //sMesgTp : 메세지유형 -> PUSH
        //sSendYn : 전송여부 -> Y
        //sReceiveYn : 수신여부 -> N

        searchVO.setsReceiveUsrId(mobLoginVO.getUserId());
        searchVO.setsMesgTp("P");
        searchVO.setsSendYn("Y");
        searchVO.setsReceiveYn("N");

        result.setTotal(mainNotificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));
        resultJson.setResult(result);
        return resultJson;
    }

    /**
     * 查询提示信息明细
     * 注：该类修改自 MobAlarmController.selectAlarm方法
     * @return
     */
    @RequestMapping(value = "/selectAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("首页-查询提示信息明细")
    public BaseJSON selectAlarm(@RequestBody NotificationMessageSearchVO searchVO) throws Exception{
    	BaseJSON resultJson = new BaseJSON();
        SearchResult result = new SearchResult();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();


        //sReceiveUsrId : 사용자 ID
        //sMesgTp : 메세지유형 -> PUSH
        //sSendYn : 전송여부 -> Y

        searchVO.setsReceiveUsrId(mobLoginVO.getUserId());
      //searchVO.setsMesgTp("PUSH");
        searchVO.setsMesgTp("P");
        searchVO.setsSendYn("Y");
        searchVO.setsReceiveYn("N");

        result.setTotal(mainNotificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(mainNotificationMessageService.selectNotificationMessagesByCondition(searchVO));
        }
        resultJson.setResult(result);
        return resultJson;
    }

    /**
     * 修改消息 update
     */
    @RequestMapping(value = "/updateAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("查询提示信息明细 - 修改")
    public BaseJSON updateAlarm(@RequestBody NotificationMessageVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	int result = notificationMessageService.updateReceive(searchVO.getMesgId());
    	if(result == 0) {
    		baseJSON.setResultCode(1);
    		baseJSON.setResultMsg("已正常处理");
    	}
        return baseJSON;
    }
    
    /**
     * 修改消息 批量update
     */
    @RequestMapping(value = "/updateBatchAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("查询提示信息明细 - 批量修改")
    public BaseJSON updateBatchAlarm(@RequestBody NotificationMessageVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	String mesgIds = searchVO.getMesgId();
    	String[] mesgId = mesgIds.split(",");
    	int result=0;
    	for(int i=0;i<mesgId.length;i++){
    		searchVO.setMesgId(mesgId[i]);
    		result = notificationMessageService.updateReceive(searchVO.getMesgId());
    	}
    	
    	if(result == 0) {
    		baseJSON.setResultCode(1);
    		baseJSON.setResultMsg("已正常处理");
    	}
        return baseJSON;
    }

    /**
     * 删除消息delete
     */
    @RequestMapping(value = "/deleteAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("查询提示信息明细 - 删除")
    public BaseJSON deleteAlarm(@RequestBody NotificationMessageVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        int result = notificationMessageService.deleteNotificationMessage(searchVO.getMesgId());
        if(result == 0) {
        	baseJSON.setResultCode(1);
        	baseJSON.setResultMsg("删除失败");
        }
        return baseJSON;
    }

    /**
     * 每日总零售
     * 注：该类修改自 MobMainController.selectDailyCustSalesList方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectDailyCustSalesList.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("首页-每日总零售-图表")
    public BaseJSON selectDailyCustSalesList() throws Exception {
    	BaseJSON resultJson = new BaseJSON();
    	List<Map<String, Object>> result = MainMobMainService.selectDailyCustSalesList(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate("yyyyMM"));
    	resultJson.setResult(result);
    	return resultJson;
    }

    /**
     * 各车型零售统计
     * 注：该类修改自 MobMainController.selectCustSalesListByCarline方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCustSalesListByCarline.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("首页-各车型零售统计-图表")
    public BaseJSON selectCustSalesListByCarline() throws Exception {
    	BaseJSON resultJson = new BaseJSON();
    	List<Map<String, Object>> result =MainMobMainService.selectCustSalesListByCarline(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate("yyyyMM"));
        resultJson.setResult(result);
    	return resultJson;
    }

    /**
     *  维修产值（合计)
     *  注：该类修改自 MobMainController.selectMonthlyCalcTotAmtList方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectMonthlyCalcTotAmtList.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("首页-维修产值（合计)-图表")
    public BaseJSON selectMonthlyCalcTotAmtList() throws Exception {
    	BaseJSON resultJson = new BaseJSON();
        Date today = Calendar.getInstance().getTime();
        List<Map<String, Object>> result = MainMobMainService.selectMonthlyCalcTotAmtList(MobUtil.getLoginVO().getDlrCd(), DateUtil.getDate(today, "yyyy", Calendar.YEAR, -1), DateUtil.getDate(today, "yyyy"));
        resultJson.setResult(result);
    	return resultJson;
    }

    /**
     * 各车型维修台次统计
     * 注：该类修改自 MobMainController.selectCalcDocListByCarline方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCalcDocListByCarline.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("首页-各车型维修台次统计-图表")
    public BaseJSON selectCalcDocListByCarline() throws Exception {
    	BaseJSON resultJson = new BaseJSON();
        //오늘날짜
        Date today = Calendar.getInstance().getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당월종료일자
        Date lastDayOfMonth = DateUtil.getLastDateOfMonth(today);

        List<Map<String, Object>> result =  MainMobMainService.selectCalcDocListByCarline(MobUtil.getLoginVO().getDlrCd(), firstDayOfMonth, lastDayOfMonth);
        resultJson.setResult(result);
    	return resultJson;
    }

    /**
     * 各维修类型维修台次统计
     * 注：该类修改自 MobMainController.selectCalcDocListByRepairOrderType方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCalcDocListByRepairOrderType.do", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("首页-各维修类型维修台次统计-图表")
    public BaseJSON selectCalcDocListByRepairOrderType() throws Exception {
    	BaseJSON resultJson = new BaseJSON();
        //오늘날짜
        Date today = Calendar.getInstance().getTime();
        //당월시작일자
        Date firstDayOfMonth = DateUtil.getFirstDateOfMonth(today);
        //당월종료일자
        Date lastDayOfMonth = DateUtil.getLastDateOfMonth(today);

        List<Map<String, Object>> result =   MainMobMainService.selectCalcDocListByRepairOrderType(MobUtil.getLoginVO().getDlrCd(), firstDayOfMonth, lastDayOfMonth, LocaleContextHolder.getLocale().getLanguage());
        resultJson.setResult(result);
    	return resultJson;
    }

    /**
     * 获取权限菜单
     * 注：该类修改自chn.bhmc.dms.cmm.ath.taglibs.MenuBuildTag.doStartTag()方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectMenuAndRole.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("首页-权限菜单")
    public BaseJSON selectMenuAndRole() throws Exception {
	    String usrId = LoginUtil.getUserId();
	    List<MenuVO> list = null;
	    List<MenuVO> jList = new ArrayList<MenuVO>();

	    //사용자별 메뉴 목록을 조회한다.
	    list = MainViewInfoService.selectMenuListByUser("D", "M", usrId);


	    //메뉴명 다국어 처리
	    for(MenuVO menu : list){
	        String viewNm = "";

	        if(!StringUtils.isBlank(menu.getMesgKey())){
	            viewNm = messageSource.getMessage(menu.getMesgKey(), null, menu.getViewNm(), LocaleContextHolder.getLocale());
	        }

	        //메뉴명에 T코드 출력적용
	        //if(!StringUtils.isBlank(menu.gettCd())){
	        //    viewNm += "[" + menu.gettCd() + "]";
	        //}
	        menu.setViewNm(viewNm);
	        if(menu.getPermYn().equalsIgnoreCase("Y")) jList.add(menu);
	    }
        BaseJSON json = new BaseJSON();
        json.setResult(jList);
        return json;
    }

    /**
     * 按钮-权限.
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectButtonPermissions.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("按钮-权限菜单")
    public BaseJSON selectButtonPermissions(@RequestBody ViewMappingSearchVO viewMappingSearchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	SearchResult result = new SearchResult();
        viewMappingSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ViewMappingVO> list = MainViewMappingService.selectViewMappingsWithPermission(viewMappingSearchVO);

//        for(ViewMappingVO viewMappingVO : list){
//            if(StringUtils.isNotBlank(viewMappingVO.getMesgKey())){
//                viewMappingVO.setViewNm(messageSource.getMessage(viewMappingVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
//            }
//        }

        result.setTotal(list.size());
        result.setData(list);
        baseJSON.setResult(result);
        return baseJSON;
    }

}
