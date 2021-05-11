package chn.bhmc.dms.sal.uva.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.uva.service.UsedCarPriceManagementService;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSaveVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarPriceManagementController
 * @Description : 직책별 할인금액 관리 Controller
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/uva/usedCarPriceManagement")
public class UsedCarPriceManagementController extends HController {
    /**
     * 직책별 할인금액 관리 서비스
     */
    @Resource(name="usedCarPriceManagementService")
    UsedCarPriceManagementService usedCarPriceManagementService;


    /**
     * 중고차 가격 관리 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectUsedCarPriceManagementMain.do", method = RequestMethod.GET)
    public String selectUsedCarPriceManagementMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 물류 서비스 평가 SAL030
        //model.addAttribute("dstbSerEvalInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL030", null, langCd));

        return "/sal/uva/usedCarPriceManagement/selectUsedCarPriceManagementMain";
    }

    /**
     * 중고차 가격 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarPriceManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarPriceManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarPriceManagementCondition(@RequestBody UsedCarPriceManagementSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(usedCarPriceManagementService.selectUsedCarPriceManagementConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(usedCarPriceManagementService.selectUsedCarPriceManagementCondition(searchVO));  //Result, Search
        }

        return result;
    }



    /**
     * 중고차 가격 등록 및 수정 처리를 한다.
     * @param saveVO - 수정 목록을 포함하는 UsedCarPriceManagementSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/multiUsedCarPriceManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUsedCarPriceManagement(@Validated @RequestBody UsedCarPriceManagementSaveVO saveVO) throws Exception {

        usedCarPriceManagementService.multiUsedCarPriceManagement(saveVO);
        return true;
    }

}
