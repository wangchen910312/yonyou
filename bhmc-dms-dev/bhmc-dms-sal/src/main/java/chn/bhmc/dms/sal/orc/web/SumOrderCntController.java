package chn.bhmc.dms.sal.orc.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orc.service.SumOrderCntService;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * 종합오더현황
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orc/sumOrderCnt")
public class SumOrderCntController extends HController {

    /**
     * 종합오더현황-딜러
     */
    @Resource(name="sumOrderCntService")
    SumOrderCntService sumOrderCntService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;


    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;

    /**
     * 종합오더현황-딜러 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrMain.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);


        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // BTO주문상태 : SAL135
        model.addAttribute("btoOrdStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL196", null, langCd));

        // 하치장 : SAL211
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL211", null, langCd));

        // 주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain";
    }

    /**
     * 종합오더현황-딜러 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOrderCntDlrs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
       //订单综合查询_统计逻辑修改_update by sunzq 20180911 start
       //获取符合条件的总数sql对比无逻辑差异，合并；
       //不判断订单类型，统计逻辑变更为，以符合条件的订单，按照已审批、未审批分组统计，合并统计结果；
       /* if(searchVO.getStrOrdTp().equals("N1")||searchVO.getStrOrdTp().equals("AD")||searchVO.getStrOrdTp().equals("NS")||searchVO.getStrOrdTp().equals("N7")||searchVO.getStrOrdTp().equals("N5")){
            result.setTotal(sumOrderCntService.selectSumOrderCntDlrsByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(sumOrderCntService.selectSumOrderCntDlrsByCondition(searchVO));
            }
        }else{
            result.setTotal(sumOrderCntService.selectSumOrderCntDlrsAsByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(sumOrderCntService.selectSumOrderCntDlrsAsByCondition(searchVO));
            }
        }*/
        result.setTotal(sumOrderCntService.selectSumOrderCntDlrsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(sumOrderCntService.selectSumOrderCntDlrsByConditionForNew(searchVO));
        }
      //订单综合查询_统计逻辑修改_update by sunzq 20180911 end
        return result;
    }

    /**
     * 종합오더현황-딜러 세부조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOrderCntDlrSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(sumOrderCntService.selectSumOrderCntDlrSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sumOrderCntService.selectSumOrderCntDlrSubsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 종합오더현황-법인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntCorpMain.do", method = RequestMethod.GET)
    public String selectSumOrderCntCorpMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // BTO주문상태 : SAL135
        model.addAttribute("btoOrdStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        // 주차
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoCreateOrderService.selectWeekRemark(searchVO));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orc/sumOrderCnt/selectSumOrderCntCorpMain";
    }

}
