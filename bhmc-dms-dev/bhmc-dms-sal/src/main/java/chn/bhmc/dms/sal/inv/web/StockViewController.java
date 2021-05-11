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
import chn.bhmc.dms.sal.inv.service.StockViewService;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고조회
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
@RequestMapping(value = "/sal/inv/stockView")
public class StockViewController extends HController {

    /**
     * 재고조회 서비스
     */
    @Resource(name="stockViewService")
    StockViewService stockViewService;

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
     * 재고조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockViewMain.do", method = RequestMethod.GET)
    public String selectStockViewMain(Model model) throws Exception{

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
        // 보유상태 SAL149 (배정여부)
        model.addAttribute("ownStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        // 오더상세유형(오더유형) SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 합격증 저당코드 : SAL052
        model.addAttribute("certSecuDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL052", null, langCd));
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

        return "/sal/inv/stockView/selectStockViewMain";
    }

    /**
     * 재고조회 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockView.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockView(@RequestBody StockStateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd( LoginUtil.getDlrCd() );

        result.setTotal(stockViewService.selectStockViewsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockViewService.selectStockViewsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고조회 상세 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockViewSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockViewSub(@RequestBody StockStateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd( LoginUtil.getDlrCd() );

        result.setTotal(stockViewService.selectStockViewSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockViewService.selectStockViewSubsByCondition(searchVO));
        }

        return result;
    }



}
