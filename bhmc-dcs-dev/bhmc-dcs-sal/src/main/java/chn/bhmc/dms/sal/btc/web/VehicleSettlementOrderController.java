package chn.bhmc.dms.sal.btc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.btc.service.VehicleSettlementOrderService;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSaveVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSearchVO;

/**
 * 완성차 정산순서 관리(C.R.U.D)
 *
 * @author Bong
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/btc/vehicleSettlementOrder")
public class VehicleSettlementOrderController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 완성차 정산순위 서비스
     */
    @Resource(name="vehicleSettlementOrderService")
    VehicleSettlementOrderService vehicleSettlementOrderService;

    /**
     * Vehicle Settlement Order Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSettlementOrderMain.do", method = RequestMethod.GET)
    public String selectVehicleSettlementOrderMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("taxAtcDstinCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL080", null, langCd));
        model.addAttribute("calcAtcDstinCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL085", null, langCd));

        return "/sal/btc/vehicleSettlementOrder/vehicleSettlementOrderMain";
    }


    /**
     * VehicleSettlementOrder 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSettlementOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSettlementOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSettlementOrder(@RequestBody VehicleSettlementOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(vehicleSettlementOrderService.selectVehicleSettlementOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSettlementOrderService.selectVehicleSettlementOrderByCondition(searchVO));
        }

        return result;
    }


    /**
     * 완성차 정산순위를 등록,수정,삭제 한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 VehicleSettlementOrderSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/multiVehicleSettlementOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiVehicleSettlementOrder(@Validated @RequestBody VehicleSettlementOrderSaveVO saveVO) throws Exception {
        vehicleSettlementOrderService.multiVehicleSettlementOrder(saveVO);
        return true;

    }


}
