package chn.bhmc.dms.mob.api.sales.controller;

import java.util.Calendar;
import java.util.Date;

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
import chn.bhmc.dms.mob.api.sales.service.SalesBtoSearchOrderService;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesCommonCodeService;
import chn.bhmc.dms.mob.api.sales.service.SalesSumOrderCntService;
import chn.bhmc.dms.mob.api.sales.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 종합오더현황
 *
 * @author Kim In
 * @since 2016. 1. 11.
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
@RequestMapping(value = "/api/sales/sumOrderCnt")
@Api("销售-订单现况-订单综合现况")
public class SumOrderCntApi extends HController {

    /**
     * 종합오더현황-딜러
     */
    @Resource(name="SalesSumOrderCntService")
     SalesSumOrderCntService SalesSumOrderCntService;

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
     * BTO 주문조회 서비스
     */
    @Resource(name="SalesBtoSearchOrderService")
    SalesBtoSearchOrderService SalesBtoSearchOrderService;

    /**
     * 종합오더현황-딜러 화면을 출력한다.
     * @return
     *	订单综合现况_页面跳转，筛选信息
     */
    @ApiOperation("订单综合现况--页面跳转筛选信息")
    @RequestMapping(value = "/selectSumOrderCntDlrMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);
        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));
        // BTO주문상태 : SAL135
        model.addAttribute("btoOrdStatCdDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL196", null, langCd));
        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", SalesCommonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));
     // 주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", SalesBtoSearchOrderService.selectWeekRemark(searchVO));
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", SalesCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/sumOrderCnt/baseJsp/selectSumOrderCntDlrMain.jsp");

        //return "/ZnewMob/templatesNewMob/mobTemplateA";
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     * 종합오더현황-딜러 조회
     * @param searchVO
     * @return
     */
    @ApiOperation("订单综合现况--合计查询")
    @RequestMapping(value = "/selectSumOrderCntFstScndFinal.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSumOrderCntFstScndFinal(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
       try {
    	   if(searchVO.getStrOrdTp().equals("N1")||searchVO.getStrOrdTp().equals("AD")||searchVO.getStrOrdTp().equals("NS")||searchVO.getStrOrdTp().equals("N7")||searchVO.getStrOrdTp().equals("N5")){
               result.setTotal(SalesSumOrderCntService.selectSumOrderCntDlrsByConditionCnt(searchVO));

               if(result.getTotal() != 0){
                   result.setData(SalesSumOrderCntService.selectSumOrderCntFstScndFinal(searchVO));
               }
           }else{
               result.setTotal(SalesSumOrderCntService.selectSumOrderCntDlrsAsByConditionCnt(searchVO));

               if(result.getTotal() != 0){
                   result.setData(SalesSumOrderCntService.selectSumOrderCntAsFstScndFinal(searchVO));
               }
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
     * 종합오더현황-딜러 조회
     * @param searchVO
     * @return
     */
    @ApiOperation("订单综合现况--查询")
    @RequestMapping(value = "/selectSumOrderCntDlrs.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
       try {
    	   if(searchVO.getStrOrdTp().equals("N1")||searchVO.getStrOrdTp().equals("AD")||searchVO.getStrOrdTp().equals("NS")||searchVO.getStrOrdTp().equals("N7")||searchVO.getStrOrdTp().equals("N5")){
               result.setTotal(SalesSumOrderCntService.selectSumOrderCntDlrsByConditionCnt(searchVO));

               if(result.getTotal() != 0){
                   result.setData(SalesSumOrderCntService.selectSumOrderCntDlrsByCondition(searchVO));
               }
           }else{
               result.setTotal(SalesSumOrderCntService.selectSumOrderCntDlrsAsByConditionCnt(searchVO));

               if(result.getTotal() != 0){
                   result.setData(SalesSumOrderCntService.selectSumOrderCntDlrsAsByCondition(searchVO));
               }
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
     * 종합오더현황-딜러 세부조회
     * @param searchVO
     * @return
     */
    @ApiOperation("订单综合现况查询结果详情页")
    @RequestMapping(value = "/selectSumOrderCntDlrSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSumOrderCntDlrSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
    	BaseJSON baseJ = new BaseJSON();
    	SearchResult result = new SearchResult();
        result.setTotal(SalesSumOrderCntService.selectSumOrderCntDlrSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(SalesSumOrderCntService.selectSumOrderCntDlrSubsByCondition(searchVO));
        }

        if(result.getTotal() > 0){
        	baseJ.setResultCode(0);
        	//baseJ.setResultMsg("成功");
        }else {
        	baseJ.setResultCode(0);
        	baseJ.setResultMsg("失败");
        }
        baseJ.setResult(result);
        return baseJ;
    }

}
