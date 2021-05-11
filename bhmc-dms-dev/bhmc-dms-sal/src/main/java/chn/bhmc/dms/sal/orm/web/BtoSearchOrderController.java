package chn.bhmc.dms.sal.orm.web;


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
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * BTO 주문조회(R)
 *
 * @author Bong
 * @since 2016. 2. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.29         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orm/btoSearchOrder")
public class BtoSearchOrderController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * BTO 주문생성 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;


    /**
     * Bto Search Order Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBtoSearchOrderMain.do", method = RequestMethod.GET)
    public String selectBtoSearchOrderMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        // 주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        //BTO오더상태
        model.addAttribute("ordStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));
        //오더상태
        model.addAttribute("detOrdStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));
        //인터페이스상태
        model.addAttribute("interfaceStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL186", null, langCd));

        return "/sal/orm/btoSearchOrder/btoSearchOrderMain";
    }

    /**
     * 주문주차 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrdWeekRemark.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdWeekRemark(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoSearchOrderService.selectWeekRemark(searchVO));
        return result;
    }

    /**
     * BTO 주문조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBtoSearchOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoSearchOrder(@RequestBody BtoSearchOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(btoSearchOrderService.selectBtoSearchOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoSearchOrderService.selectBtoSearchOrderByCondition(searchVO));
        }

        return result;
    }

    /**
     * BTO 주문조회 목록 데이터를 조회한다.( Detail)
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBtoSearchOrderDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoSearchOrderDetail(@RequestBody BtoSearchOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setData(btoSearchOrderService.selectBtoSearchOrderDetailByCondition(searchVO));

        return result;
    }


}
