package chn.bhmc.dms.sal.inv.web;

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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.inv.service.StockDueService;
import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고실사
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.04         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/stockDue")
public class StockDueController extends HController {

    /**
     * 재고실사 서비스
     */
    @Resource(name="stockDueService")
    StockDueService stockDueService;

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
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 재고현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockDueMain.do", method = RequestMethod.GET)
    public String selectStockDueMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("toMonth", DateUtil.getDate("yyyy-MM"));
        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //재고월령
        model.addAttribute("agingCntDSList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL169", null, langCd));

        return "/sal/inv/stockDue/selectStockDueMain";
    }

    /**
     * 재고실사 정보 생성
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/CreateStockDueInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int CreateStockDueInfo(@Validated @RequestBody StockDueVO saveVO) throws Exception {
        saveVO.setDlrCd(LoginUtil.getDlrCd());
        return stockDueService.CreateStockDueInfo(saveVO);
    }

    /**
     * 재고실사 헤더 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockDueSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDueSearch(@RequestBody StockDueSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(stockDueService.selectStockDueListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDueService.selectStockDueListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고실사 상세 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockDueDetailSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDueDetailSearch(@RequestBody StockDueSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(stockDueService.selectStockDueDetailListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDueService.selectStockDueDetailListsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 재고실사 상세 조회 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     * @param ConfirmWearingVehicleSearchVO : barcodeList - 바코드 값
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectStockDueDetailMobSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDueDetailMobSearch(@RequestBody StockDueSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(stockDueService.selectStockDueDetailMobsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDueService.selectStockDueDetailMobsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 재고실사 저장
     */
    @RequestMapping(value = "/multiStockDue.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiStockDue(@Validated @RequestBody BaseSaveVO<StockDueVO> saveVO) throws Exception {
        return stockDueService.multiStockDue(saveVO);
    }


    /**
     * 재고실사 저장
     */
    @RequestMapping(value = "/multiMobStockDue.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiMobStockDue(@RequestBody BaseSaveVO<StockDueVO> saveVO) throws Exception {
        return stockDueService.multiMobStockDue(saveVO);
    }

    /**
     * 재고실사 일괄변경 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectStockAllChangePopup.do", method = RequestMethod.GET)
    public String selectStockAllChangePopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        return "/sal/inv/stockDue/selectStockAllChangePopup";
    }

    /**
     * 재고실사 일괄변경
     */
    @RequestMapping(value = "/saveAllStockDue.do", method = RequestMethod.POST)
    @ResponseBody
    public int saveAllStockDue(@RequestBody StockDueVO saveVO) throws Exception {
        return stockDueService.saveAllStockDue(saveVO);
    }


    /**
     * 재고실사 선택변경
     */
    @RequestMapping(value = "/saveSelectStockDue.do", method = RequestMethod.POST)
    @ResponseBody
    public int saveSelectStockDue(@RequestBody BaseSaveVO<StockDueVO> saveVO) throws Exception {
        return stockDueService.saveSelectStockDue(saveVO.getInsertList());
    }

}
