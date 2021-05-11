package chn.bhmc.dms.sal.inv.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.inv.service.StockStateService;
import chn.bhmc.dms.sal.inv.vo.StockStateSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고상태관리
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.21         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/stockState")
public class StockStateController extends HController {

    /**
     * 재고상태관리 서비스
     */
    @Resource(name="stockStateService")
    private StockStateService stockStateService;

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
     * 재고상태관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockStateMain.do", method = RequestMethod.GET)
    public String selectStockStateMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 재고유형 SAL074
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));
        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 회사차구분 SAL053
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));
        // 차량상태 SAL001
        model.addAttribute("carStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        // 보유상태 SAL149
        model.addAttribute("ownStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        // 오더상세유형(오더유형) SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        //BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        //locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/inv/stockState/selectStockStateMain";
    }

    /**
     * 재고상태관리 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockState.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockState(@RequestBody StockStateSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(stockStateService.selectStockStatesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockStateService.selectStockStatesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고상태관리 상세 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockStateSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockStateSub(@RequestBody StockStateSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(stockStateService.selectStockStateSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockStateService.selectStockStateSubsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고상태관리 유형정보를 등록한다.
     *  : 상태변동유형 SAL009 에 따라 저장
     */
    @RequestMapping(value = "/multiStockState.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockStates(@RequestBody StockStateSaveVO saveVO) throws Exception {

        stockStateService.multiStockStates(saveVO);
        return true;
    }




    /**
     * 위치 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectLocation.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocation(@RequestBody String storage) throws Exception {

        SearchResult result = new SearchResult();

        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());    // 딜러코드
        locSearchVO.setsStrgeCd( storage );

        result.setData(binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));
        return result;
    }


    /**
     * 일괄변경 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectStockStateAllChangePopup.do", method = RequestMethod.GET)
    public String selectStockStateAllChangePopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 재고유형 SAL074
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));
        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 회사차구분 SAL053
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/inv/stockState/selectStockStateAllChangePopup";
    }

}
