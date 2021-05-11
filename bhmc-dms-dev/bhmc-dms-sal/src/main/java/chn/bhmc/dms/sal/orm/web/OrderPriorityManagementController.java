package chn.bhmc.dms.sal.orm.web;


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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.OrderPriorityManagementService;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSaveVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * 오더 우선순위 관리(C.U)
 *
 * @author Bong
 * @since 2016. 3. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.17         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orm/orderPriorityManagement")
public class OrderPriorityManagementController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 완성차 입고확정 서비스
     */
    @Resource(name="orderPriorityManagementService")
    OrderPriorityManagementService orderPriorityManagementService;

    /**
     * 완성차 입고확정 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOrderPriorityManagementMain.do", method = RequestMethod.GET)
    public String selectOrderPriorityManagementMain(Model model) throws Exception {

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
//        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/orm/orderPriorityManagement/OrderPriorityManagementMain";
    }


    /**
     * OrderPriorityManagement 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OrderPriorityManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrderPriorityManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrderPriorityManagement(@RequestBody OrderPriorityManagementSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(orderPriorityManagementService.selectOrderPriorityManagementByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(orderPriorityManagementService.selectOrderPriorityManagementByCondition(searchVO));
        }

        return result;
    }


    /**
     * 오더 삭제 처리를 한다.
     * @param saveVO - 수정 목록을 포함하는 OrderPriorityManagementSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/updateOrderPriorityManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateOrderPriorityManagement(@Validated @RequestBody OrderPriorityManagementSaveVO saveVO) throws Exception {
        orderPriorityManagementService.updateOrderPriorityManagement(saveVO);
        return true;

    }


}
