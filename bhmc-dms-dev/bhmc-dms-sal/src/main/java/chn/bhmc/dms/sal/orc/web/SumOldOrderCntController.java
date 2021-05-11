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
import chn.bhmc.dms.sal.orc.service.SumOldOrderCntService;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * 종합오더현황
 *
 * @author Lee Seungmin
 * @since 2017. 7. 5.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 7. 5.         Lee Seungmin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orc/sumOrderCnt")
public class SumOldOrderCntController extends HController {

    /**
     * 종합오더현황-딜러
     */
    @Resource(name="sumOldOrderCntService")
    SumOldOrderCntService sumOldOrderCntService;

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
     * 구종합오더현황-딜러 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOldOrderCntDlrMain.do", method = RequestMethod.GET)
    public String selectSumOldOrderCntDlrMain(Model model) throws Exception{

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

        return "/sal/orc/sumOrderCnt/selectSumOldOrderCntDlrMain";
    }

    /**
     * 구종합오더현황-딜러 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOldOrderCntDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOldOrderCntDlr(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(sumOldOrderCntService.selectSumOldOrderCntDlrByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sumOldOrderCntService.selectSumOldOrderCntDlrByCondition(searchVO));
        }
        return result;
    }

    /**
     * 구종합오더현황-딜러 세부조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOldOrderCntDlrSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOldOrderCntDlrSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(sumOldOrderCntService.selectSumOldOrderCntDlrSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sumOldOrderCntService.selectSumOldOrderCntDlrSubsByCondition(searchVO));
        }
        return result;
    }
}