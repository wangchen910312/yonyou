package chn.bhmc.dms.mob.api.sales.controller;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesBtoSearchOrderService;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesFundStatusService;
import chn.bhmc.dms.mob.api.sales.service.SalesNotAssignedOrderService;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 종합오더현황
 *
 * @author HG
 * @since 2017. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2017.02.17       HG              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/api/sales/notAssignedOrder")
@Api("销售-订单现况-未分配订单查询")
public class NotAssignedOrderApi extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="SalesCommonCodeService")
    SalesCommonCodeService SalesCommonCodeService;

     /**
     * BTO 주문조회 서비스
     */
    @Resource(name="SalesBtoSearchOrderService")
    SalesBtoSearchOrderService SalesBtoSearchOrderService;

     /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="SalesCarInfoService")
    SalesCarInfoService SalesCarInfoService;

    /**
     * 모델 패키지 서비스
     */
    @Resource(name="SalesNotAssignedOrderService")
    SalesNotAssignedOrderService SalesNotAssignedOrderService;

    /**
     * 자금현황 서비스
     */
    @Resource(name="SalesFundStatusService")
    SalesFundStatusService SalesFundStatusService;

    /**
     * 미배정 오더조회 출력
     * @return
     */
    @ApiOperation("未分配订单现况--页面跳转筛选信息")
    @RequestMapping(value = "/selectSumOrderCntDlrMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
//        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
//        model.addAttribute("toDay", sysDate);
//        model.addAttribute("oneDay", oneDay);

//        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
//        model.addAttribute("sysDate", sysDate);
//        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //담보유형
        model.addAttribute("mortgageTp", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL204", null, LocaleContextHolder.getLocale().getLanguage()));


        //주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", SalesBtoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));

        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/orderPlacement/baseJsp/selectNotAssignedOrderMain.jsp");
        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON json = new BaseJSON();
        json.setResult(model.asMap());
		return json;

    }

    /**
     * 미배정 주문조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderVO
     * @return
     */
    @ApiOperation("未分配订单查询")
    @RequestMapping(value = "/selectNotAssignedOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectNotAssignedOrder(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        try {
        	result.setTotal(SalesNotAssignedOrderService.selectNotAssignedOrderCnt(searchVO));  //Result, Row Count
        	if(result.getTotal() != 0) {
                result.setData(SalesNotAssignedOrderService.selectNotAssignedOrder(searchVO));  //Result, Search
            }
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

        baseJ.setResult(result);
        return baseJ;
    }

    /**
     *
     * @return
     */
    @ApiOperation("资金情况")
    @RequestMapping(value = "/selectBtoCreateOrderPreAmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectBtoCreateOrderPreAmtSearch() {
        // 자금현황의 EAI 호출. : 현재일기준 데이터
    	BaseJSON baseJ = new BaseJSON();
        FundStatusSearchVO searchVO = new FundStatusSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsYy( DateUtil.getDate("yyyy") );
        searchVO.setsMm( DateUtil.getDate("MM") );

        SearchResult result = new SearchResult();
        try {
        	 result.setData(SalesFundStatusService.selectNowDayFundStatusEaiSearch(searchVO));
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
        baseJ.setResult(result);
        return baseJ;
    }


    /**
     * 미배정 주문조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderVO
     * @return
     */
    @ApiOperation("未分配订单明细查询")
    @RequestMapping(value = "/selectNotAssignedOrderDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectNotAssignedOrderDetail(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        try {
        	result.setTotal(SalesNotAssignedOrderService.selectNotAssignedOrderDetailCnt(searchVO));  //Result, Row Count
        	if(result.getTotal() != 0) {
                result.setData(SalesNotAssignedOrderService.selectNotAssignedOrderDetail(searchVO));  //Result, Search
            }
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

        baseJ.setResult(result);
        return baseJ;
    }
}
