package chn.bhmc.dms.par.stm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 현재고 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee      최초 생성
 * </pre>
 */

@Controller
public class StockInOutController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 재고 관리 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /**
     * 재고분석 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockAnalysisMain.do", method = RequestMethod.GET)
    public String selectStockAnalysisMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        //거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));

        return "/par/stm/stock/selectStockAnalysisMain";
    }

    /**
     * 재고분석화면 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockAnalysisByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockAnalysisByCondition(@RequestBody StockInOutSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(stockInOutService.selectStockAnalysisByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockInOutService.selectStockAnalysisByCondition(searchVO));
        }

        return result;
    }
}
