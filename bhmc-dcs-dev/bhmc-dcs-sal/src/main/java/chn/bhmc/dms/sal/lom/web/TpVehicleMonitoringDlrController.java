package chn.bhmc.dms.sal.lom.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.lom.service.TpVehicleMonitoringService;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringDlrController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Lee Seungmin     최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/lom/tpVehicleMonitoringDlr")
public class TpVehicleMonitoringDlrController extends HController {
    /**
     * TP차량모니터링 서비스 법인
     */
    @Resource(name="tpVehicleMonitoringService")
    TpVehicleMonitoringService tpVehicleMonitoringService;

    /**
     * TP차량모니터링 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringDlrMain.do", method = RequestMethod.GET)
    public String selectTpVehicleMonitoringConditionMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/lom/tpVehicleMonitoringDlr/selectTpVehicleMonitoringDlrMain";
    }

    /**
     * TP차량모니터링 현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TpVehicleMonitoringSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringDlrCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTpVehicleMonitoringCondition(@RequestBody TpVehicleConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(tpVehicleMonitoringService.selectTpVehicleMonitoringConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectTpVehicleMonitoringCondition(searchVO));  //Result, Search
        }

        return result;
    }

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringDlrDetailPopup.do", method = RequestMethod.GET)
    public String selectTpVehicleMonitoringDlrDetailPopup(Model model) throws Exception{
        return "/sal/lom/tpVehicleMonitoringDlr/selectTpVehicleMonitoringDlrDetailPopup";
    }

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectTpMonitoringDlrDetailSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTpMonitoringDlrDetailSearch(@RequestBody TpVehicleConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(tpVehicleMonitoringService.selectTpMonitoringDlrDetailSearchsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectTpMonitoringDlrDetailSearchsByCondition(searchVO));
        }
        return result;
    }

}