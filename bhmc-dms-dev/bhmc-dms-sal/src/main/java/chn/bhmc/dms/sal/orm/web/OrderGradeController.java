package chn.bhmc.dms.sal.orm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.orm.service.OrderGradeService;
import chn.bhmc.dms.sal.orm.vo.OrderGradeSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderGradeController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/orm/orderGradeCondition")
public class OrderGradeController extends HController {
    /**
     * 오더등급현황 서비스
     */
    @Resource(name="orderGradeService")
    OrderGradeService orderGradeService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 오더등급현황 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOrderGradeConditionMain.do", method = RequestMethod.GET)
    public String selectOrderGradeConditionMain(Model model) throws Exception {

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orm/orderGradeCondition/selectOrderGradeConditionMain";
    }

    /**
     * 오더등급현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OrderGradeSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrderGradeCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrderGradeCondition(@RequestBody OrderGradeSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(orderGradeService.selectOrderGradeConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(orderGradeService.selectOrderGradeCondition(searchVO));  //Result, Search
        }

        return result;
    }

}
