package chn.bhmc.dms.sal.bto.web;

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
import chn.bhmc.dms.sal.bto.service.BuyPredictedQuantityMngmntService;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSaveVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BuyPredictedQuantityMngmntController
 * @Description : 주문 예측수량 관리 Controller
 * @author Bong
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.       Bong                최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/bto/buyPredictedQuantityMngmnt")
public class BuyPredictedQuantityMngmntController extends HController {
    /**
     * 주문 예측수량 관리 서비스
     */
    @Resource(name="buyPredictedQuantityMngmntService")
    BuyPredictedQuantityMngmntService buyPredictedQuantityMngmntService;


    /**
     * 주문 예측수량 관리 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBuyPredictedQuantityMngmntMain.do", method = RequestMethod.GET)
    public String selectBuyPredictedQuantityMngmntMain(Model model) throws Exception {

        String sysDate = DateUtil.getDate("yyyy-MM");

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/bto/buyPredictedQuantityMngmnt/selectBuyPredictedQuantityMngmntMain";
    }

    /**
     * 주문 예측/완성 수량 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BuyPredictedQuantityMngmntSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBuyPredictedQuantityMngmnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBuyPredictedQuantityMngmntCondition(@RequestBody BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(buyPredictedQuantityMngmntService.selectBuyPredictedQuantityMngmntByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(buyPredictedQuantityMngmntService.selectBuyPredictedQuantityMngmntByCondition(searchVO));  //Result, Search
        }

        return result;
    }

    @RequestMapping(value = "/updateBuyPredictedQuantityMngmnt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockStates(@RequestBody BuyPredictedQuantityMngmntSaveVO saveVO) throws Exception {

        buyPredictedQuantityMngmntService.updateBuyPredictedQuantityMngmnt(saveVO);
        return true;
    }


}
