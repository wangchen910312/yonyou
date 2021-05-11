package chn.bhmc.dms.par.stm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.stm.service.StockDdlnService;
import chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 월마감 컨트롤러
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
public class StockDdlnController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 월마감 관리 서비스
     */
    @Resource(name="stockDdlnService")
    StockDdlnService stockDdlnService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;


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
     * 입출고 판매 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockDdlnList.do", method = RequestMethod.GET)
    public String selectStockDdlnList(Model model) throws Exception{

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       // String sysDate     = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
       // String searchDtBf  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        String searchDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("storageList",          storageList);
        model.addAttribute("accStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);
        model.addAttribute("bpTpList",             commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        model.addAttribute("toDt",                 searchDtBf);
        model.addAttribute("searchDtBf",           searchDtBf);

        return "/par/stm/stock/selectStockDdlnList";

    }



    /**
     * 월마감 입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockDdlnByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDdlnByCondition(@RequestBody StockDdlnSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(stockDdlnService.selectStockDdlnByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDdlnService.selectStockDdlnByCondition(searchVO));
        }

        return result;
    }

    /**
     * 월마감 출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockDdlnByConditionByItemDistCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDdlnByConditionByItemDistCd(@RequestBody StockDdlnSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(stockDdlnService.selectStockDdlnByConditionByItemDistCdCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDdlnService.selectStockDdlnByConditionByItemDistCd(searchVO));
        }

        return result;
    }

    /**
     * 입고재고현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockDdlnGrGiByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockDdlnGrGiByCondition(@RequestBody StockDdlnSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(stockDdlnService.selectStockDdlnGrGiByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockDdlnService.selectStockDdlnGrGiByCondition(searchVO));
        }

        return result;
    }

    /**
     * 월마감 수동 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockDdlnManualMain.do", method = RequestMethod.GET)
    public String selectStockDdlnManualMain(Model model) throws Exception{

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
       // String sysDate     = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
       // String searchDtBf  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        String searchDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);

        model.addAttribute("toDt",                 sysDate);
        model.addAttribute("searchDtBf",           searchDtBf);

        return "/par/stm/stock/selectStockDdlnManualMain";

    }

    /**
     * 월마감 실행 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/par/stm/stock/executeParMmDdlnLoopDlrCdProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public int executeManualParMmDdlnLoopDlrCdProcedure(@RequestBody StockDdlnSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsRegUsrId(LoginUtil.getUserId());

        stockDdlnService.executeManualParMmDdlnLoopDlrCdProcedure(searchVO);

        return 1;
    }

}
