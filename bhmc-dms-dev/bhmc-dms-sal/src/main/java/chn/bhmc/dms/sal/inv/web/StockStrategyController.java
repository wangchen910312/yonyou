package chn.bhmc.dms.sal.inv.web;

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

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inv.service.StockStrategyService;
import chn.bhmc.dms.sal.inv.vo.StockStrategySearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategyVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
/**
 * 전략출고 신청
 * @author Kim Jin Suk
 * @since 2016. 11. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.11.23         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/stockStrategy")
public class StockStrategyController extends HController {

    /**
     * 전략출고 서비스
     */
    @Resource(name="stockStrategyService")
    StockStrategyService stockStrategyService;

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
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;


    /**
     * 전략출고 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockStrategyMain.do", method = RequestMethod.GET)
    public String selectStockStrategyMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());

        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("threeMonthDay", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));

        // 전략출고 심사상태 SAL190
        model.addAttribute("strStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL190", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/inv/stockStrategy/selectStockStrategyMain";
    }


    /**
     * 전략출고관리 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockStrategySearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockStrategySearch(@RequestBody StockStrategySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(stockStrategyService.selectStockStrategysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockStrategyService.selectStockStrategysByCondition(searchVO));
        }
        return result;
    }

    /**
     * 전략출고 취소
     **/
    @RequestMapping(value = "/cancelStockStrategy.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelStockStrategy(@RequestBody BaseSaveVO<StockStrategyVO> saveVO) throws Exception {
        stockStrategyService.cancelStockStrategy(saveVO);
        return true;
    }

}
