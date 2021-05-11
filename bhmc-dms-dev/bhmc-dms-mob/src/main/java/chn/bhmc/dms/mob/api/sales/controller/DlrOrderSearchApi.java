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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesDlrOrderSearchService;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
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
@RequestMapping(value = "/api/sales/dlrOrderSearch")
@Api("销售-订单现况-已分配订单查询")
public class DlrOrderSearchApi extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="SalesCommonCodeService")
    SalesCommonCodeService SalesCommonCodeService;

     /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="SalesCarInfoService")
    SalesCarInfoService SalesCarInfoService;

    /**
     * 딜러주문조회 서비스
     */
    @Resource(name="SalesDlrOrderSearchService")
    SalesDlrOrderSearchService SalesDlrOrderSearchService;

    @ApiOperation("已分配订单现况--页面跳转筛选信息")
    @RequestMapping(value = "/selectDlrOrderSearchMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectDlrOrderSearchMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

//        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
//        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
//        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
//        model.addAttribute("toDay", sysDate);
//        model.addAttribute("oneDay", oneDay);
//        model.addAttribute("lastDay", lastDay);
//        model.addAttribute("nextMonthDay", nextMonthDay);

        // 주문유형 : SAL137 딜러용
        model.addAttribute("ordTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 오더상태 : SAL150
        model.addAttribute("ordStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // 주문조회용상태 : SAL198
        model.addAttribute("ordSrchStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL198", null, langCd));

        // detail 주문상태
        model.addAttribute("ordStatCdInfoDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/dlrOrderSearch/baseJsp/selectDlrOrderSearchMain.jsp");

        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON json = new BaseJSON();
        json.setResult(model.asMap());
        return json;
    }

    /**
     * 딜러주문조회 메인 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSearchs.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("已分配订单查询")
    public BaseJSON selectDlrOrderSearchs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        try {
        	result.setTotal(SalesDlrOrderSearchService.selectDlrOrderSearchsByConditionCnt(searchVO));
        	if(result.getTotal() != 0){
                result.setData(SalesDlrOrderSearchService.selectDlrOrderSearchsByCondition(searchVO));
            }
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

        baseJ.setResult(result);
        return baseJ;
    }
    //详细页方法未知
    
    @ApiOperation("已分配订单现况--页面跳转筛选信息")
    @RequestMapping(value = "/selectDlrOrderSumMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectDlrOrderSumMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

//        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
//        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
//        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
//        model.addAttribute("toDay", sysDate);
//        model.addAttribute("oneDay", oneDay);
//        model.addAttribute("lastDay", lastDay);
//        model.addAttribute("nextMonthDay", nextMonthDay);

        // 주문유형 : SAL137 딜러용
        model.addAttribute("ordTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 오더상태 : SAL150
        model.addAttribute("ordStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // 주문조회용상태 : SAL198
        model.addAttribute("ordSrchStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL198", null, langCd));

        // detail 주문상태
        model.addAttribute("ordStatCdInfoDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/dlrOrderSearch/baseJsp/selectDlrOrderSearchMain.jsp");

        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON json = new BaseJSON();
        json.setResult(model.asMap());
        return json;
    }

    /**
     * 딜러주문조회 메인 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSum.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("已分配订单查询")
    public BaseJSON selectDlrOrderSum(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        try {
        	result.setTotal(SalesDlrOrderSearchService.selectDlrOrderSumByConditionCnt(searchVO));
        	if(result.getTotal() != 0){
                result.setData(SalesDlrOrderSearchService.selectDlrOrderSumByCondition(searchVO));
            }
		} catch (Exception e) {
			baseJ.setResultCode(1);
			baseJ.setResultMsg("失败");
			e.printStackTrace();
		}

        baseJ.setResult(result);
        return baseJ;
    }
    //详细页方法未知
}
