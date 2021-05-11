package chn.bhmc.dms.sal.orc.web;


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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orc.service.NotAssignedOrderService;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 미배정 주문조회
 *
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.10         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orc")
public class NotAssignedOrderController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 모델 패키지 서비스
     */
    @Resource(name="notAssignedOrderService")
    NotAssignedOrderService notAssignedOrderService;

    /**
     * 차량 모델 패키지  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/orderPlacement/selectNotAssignedOrderMain.do", method = RequestMethod.GET)
    public String selectNotAssignedOrderMain(Model model) throws Exception{

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/orc/orderPlacement/selectNotAssignedOrderMain";
    }


    /**
     * 미배정 주문조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderVO
     * @return
     */
    @RequestMapping(value = "/orderPlacement/selectNotAssignedOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotAssignedOrder(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(notAssignedOrderService.selectNotAssignedOrderCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(notAssignedOrderService.selectNotAssignedOrder(searchVO));  //Result, Search
        }

        return result;
    }
}
