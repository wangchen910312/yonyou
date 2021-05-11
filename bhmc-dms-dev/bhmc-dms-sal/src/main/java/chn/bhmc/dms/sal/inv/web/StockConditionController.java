package chn.bhmc.dms.sal.inv.web;

import java.util.ArrayList;
import java.util.List;

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
import chn.bhmc.dms.sal.inv.service.StockConditionService;
import chn.bhmc.dms.sal.inv.service.StockViewService;
import chn.bhmc.dms.sal.inv.vo.StockConditionVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고현황
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.28         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/stockCondition")
public class StockConditionController extends HController {

    /**
     * 재고현황 서비스
     */
    @Resource(name="stockConditionService")
    StockConditionService stockConditionService;

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
     * 재고현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockConditionMain.do", method = RequestMethod.GET)
    public String selectStockConditionMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 재고유형 SAL074
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));
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
        storageSearchVO.setsStrgeTp("02");  //완성차창고
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        //BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        //locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/inv/stockCondition/selectStockConditionMain";
    }

    /**
     * 재고현황 트리 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<StockConditionVO> selectStockCondition(@RequestBody StockStateSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd( LoginUtil.getDlrCd() );

        //SearchResult result = new SearchResult();
        //result.setTotal(stockConditionService.selectStockConditionsByConditionCnt(searchVO));
        //if(result.getTotal() != 0){
            //result.setData(stockConditionService.selectStockConditionsByCondition(searchVO));
        //}

        if("X".equals(searchVO.getsStrgeCd())){
            return new ArrayList<StockConditionVO>();
        }else{
            return stockConditionService.selectStockConditionsByCondition(searchVO);
        }
    }

    /**
     * 재고현황 상세 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockConditionSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockConditionSub(@RequestBody StockStateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd( LoginUtil.getDlrCd() );

        result.setTotal(stockViewService.selectStockViewSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockViewService.selectStockViewSubsByCondition(searchVO));
        }

        return result;
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

}
