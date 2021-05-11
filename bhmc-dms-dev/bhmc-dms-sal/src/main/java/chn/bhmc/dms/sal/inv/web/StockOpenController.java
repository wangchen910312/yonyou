package chn.bhmc.dms.sal.inv.web;

import java.util.ArrayList;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.inv.service.StockOpenService;
import chn.bhmc.dms.sal.inv.vo.StockOpenSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고관리
 *
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
@RequestMapping(value = "/sal/inv/stockOpen")
public class StockOpenController extends HController {

    /**
     * 공개재고 서비스
     */
    @Resource(name="stockOpenService")
    StockOpenService stockOpenService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 판매 공통 - 사업부, 사무소, 성, 도시 조회 서비스
     */
    @Resource(name="salesCommonService")
    SalesCommonService salesCommonService;

    /**
     * 공개재고관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockOpenMain.do", method = RequestMethod.GET)
    public String selectStockOpenMain(Model model) throws Exception{
        //String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 성
        model.addAttribute("sungList", salesCommonService.selectDealerSung(new DealerSearchVO()));

        return "/sal/inv/stockOpen/selectStockOpenMain";
    }

    /**
     * 공개재고관리 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockOpenSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockOpenSearch(@RequestBody StockOpenSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if("2".equals(searchVO.getsOpenTp())){
            ArrayList<StockOpenVO> list = stockOpenService.selectStockEtcOpensByCondition(searchVO);

            result.setTotal(list.size());
            if(result.getTotal() != 0){
                result.setData(list);
            }
        }else{

            if(StringUtils.isBlank(searchVO.getsDlrCd())){
                searchVO.setsDlrCd(LoginUtil.getDlrCd());
            }

            result.setTotal(stockOpenService.selectStockOpensByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(stockOpenService.selectStockOpensByCondition(searchVO));
            }
        }

        return result;
    }

    /**
     * 공개재고 설정 딜러 조회[팝업]
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockOpenDlrSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockOpenDlrSearch(@RequestBody StockOpenSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsOneselfDlrCd(LoginUtil.getDlrCd());

        result.setTotal(stockOpenService.selectStockOpenDlrsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockOpenService.selectStockOpenDlrsByCondition(searchVO));
        }

        return result;
    }


    // 공개재고 설정
    @RequestMapping(value = "/insertStockOpenDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertStockOpenDlr(@RequestBody StockOpenSaveVO saveVO) throws Exception {
        return stockOpenService.insertStockOpenDlr(saveVO);
    }

    /**
     * 공개재고 딜러별 팝업
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectStockOpenDlrPopup.do", method = RequestMethod.GET)
    public String selectStockOpenDlrPopup(Model model) throws Exception{
        // 성
        model.addAttribute("sungList", salesCommonService.selectDealerSung(new DealerSearchVO()));

        return "/sal/inv/stockOpen/selectStockOpenDlrPopup";
    }

    /**
     * 공개재고 딜러별 팝업 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectStockOpenDlrPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockOpenDlrPopupSearch(@RequestBody StockOpenSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(stockOpenService.selectStockOpenDlrPopupsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockOpenService.selectStockOpenDlrPopupsByCondition(searchVO));
        }

        return result;
    }


    // 공개재고 취소
    @RequestMapping(value = "/cancelStockOpenDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelStockOpenDlr(@RequestBody StockOpenSaveVO saveVO) throws Exception {
        return stockOpenService.cancelStockOpenDlr(saveVO);
    }

}
