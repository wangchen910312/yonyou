package chn.bhmc.dms.par.stm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.core.datatype.SearchVO.SortDescriptor;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.StockInOutExcelUploadSaveDTO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceDlrInfoVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceVO;
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
     * 현재고 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

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
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 수불유형 서비스
     */
    @Resource(name="movementTypeService")
    MovementTypeService movementTypeService;

    /**
     * 현재고리스트 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInOut.do", method = RequestMethod.GET)
    public String selectStockInOut(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        List<StorageVO> storageAllList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        //부품창고
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        storageSearchVO.setsStrgeSaleAccYn("");
        //전체창고
        storageAllList = storageService.selectStoragesByCondition(storageSearchVO);

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);


        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        model.addAttribute("storageList", storageList);
        model.addAttribute("storageAllList", storageAllList);
        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("toDt", sysDate);

        return "/par/stm/stockInOut/selectStockInOut";
    }

    /**
     * 현재고리스트 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInOutList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockInOutList(@RequestBody StockInOutSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(stockInOutService.selectStockInOutItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockInOutService.selectStockInOutItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 현재고리스트에서 품목마스터 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/updateItemMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateItemMasterByKey(@RequestBody StockInOutVO stockInOutVO)  throws Exception {

        stockInOutVO.setRegUsrId(LoginUtil.getUserId());
        stockInOutVO.setDlrCd(LoginUtil.getDlrCd());

        int result = stockInOutService.updateItemMasterByKey(stockInOutVO);

        return result;
    }

    /**
     * 재고실사대상 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectInvestigationTargetList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationTargetList(@RequestBody StockInOutSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        result.setTotal(stockInOutService.selectInvestigationTargetItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockInOutService.selectInvestigationTargetItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 현재고리스트 단일 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInOutByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public StockInOutVO selectStockInOutByKey(@RequestBody StockInOutSearchVO searchVO) throws Exception
    {
        StockInOutVO stockInOutVO = stockInOutService.selectStockInOutByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), searchVO.getsStrgeCd(), searchVO.getsItemCd());

        if(stockInOutVO == null){
            stockInOutVO = new StockInOutVO();
        }

        return stockInOutVO;
    }

    /**
     * 북경 모비스 및 딜러의 INVENTORY 조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectBmpInventory.do", method = RequestMethod.GET)
    public String selectBmpInventory(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageAllList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("");
        //전체창고
        storageAllList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("storageAllList", storageAllList);

        return "/par/stm/stockInOut/selectBmpInventory";
    }


    /**
     * BMP&딜러재고 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectBmpInventoryList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBmpInventoryList(@RequestBody ItemMasterSearchVO searchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(itemMasterService.selectInventoryInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectInventoryInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     *재고인터페이스 단일 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInterfaceInfoByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockInterfaceInfoByItemCd(@RequestBody StockInterfaceVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        List<StockInterfaceVO> stockInterfaceVO    = new ArrayList<StockInterfaceVO>();
        stockInterfaceVO.add(stockInOutService.selectStockInterfaceInfoByItemCd(searchVO));
        result.setData(stockInterfaceVO);
        return result;
    }

    /**
     *딜러재고인터페이스 단일 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInterfaceDlrInfoByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockInterfaceDlrInfoByItemCd(@RequestBody StockInterfaceDlrInfoVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        List<StockInterfaceDlrInfoVO> stockInterfaceDlrInfoVO    = new ArrayList<StockInterfaceDlrInfoVO>();
        stockInterfaceDlrInfoVO.add(stockInOutService.selectStockInterfaceDlrInfoByItemCd(searchVO));
        result.setData(stockInterfaceDlrInfoVO);
        return result;
    }

    /**
     *재고인터페이스 실시간으로 BMP정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInterfaceRealTimeInfoByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockInterfaceRealTimeInfoByItemCd(@RequestBody StockInterfaceVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        List<StockInterfaceVO> stockInterfaceVO    = new ArrayList<StockInterfaceVO>();
        stockInterfaceVO.add(stockInOutService.selectStockInterfaceRealTimeInfoByItemCd(searchVO));
        result.setData(stockInterfaceVO);
        return result;
    }

    /**
     *재고인터페이스 실시간으로 DLR정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectDlrStockInterfaceRealTimeInfoByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrStockInterfaceRealTimeInfoByItemCd(@RequestBody StockInterfaceDlrInfoVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        List<String> dlrLst = new ArrayList<String>();
        DealerSearchVO searchDealerVO = new DealerSearchVO();


        searchDealerVO.setsSdptCd(searchVO.getSdptCd());
        searchDealerVO.setsDistOfficeCd(searchVO.getDistOfficeCd());
        searchDealerVO.setsSaleDlrSungCd(searchVO.getSaleDlrSungCd());
        searchDealerVO.setsDlrCd(searchVO.getDlrCd());
        List<StockInterfaceDlrInfoVO> stockInterfaceDlrInfoVO = stockInOutService.selectDlrStockInterfaceRealTimeInfoByItemCd(searchVO);

        for(int i = 0; i < stockInterfaceDlrInfoVO.size(); i = i + 1){
            dlrLst.add(stockInterfaceDlrInfoVO.get(i).getDpsDlrCd());
        }
        searchDealerVO.setsDlrCdList(dlrLst);


        result.setData(dealerService.selectDealersByCondition(searchDealerVO));
        return result;
    }

    /**
     * 입출고 조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectGrGiList.do", method = RequestMethod.GET)
    public String selectGrGiList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/stm/stockInOut/selectGrGiList";
    }

    /**
     * 입출고 현황 조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectGrGiStatusList.do", method = RequestMethod.GET)
    public String selectGrGiStatusList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("grGiList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR001", null, langCd));
        model.addAttribute("storageList", storageList);

        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        //CommonCode SearchVO
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsUseYn("Y");
        commonCodeSearchVO.setsCmmGrpCd("PAR100");
        commonCodeSearchVO.setsLangCd(langCd);

        //sort
        List<SortDescriptor> sort = new ArrayList<SortDescriptor>();

        SortDescriptor sortField01 = new SortDescriptor();
        sortField01.setField("sortOrder");
        sortField01.setDir("asc");
        sort.add(sortField01);

        SortDescriptor sortField02 = new SortDescriptor();
        sortField02.setField("cmmCd");
        sortField02.setDir("asc");
        sort.add(sortField02);

        commonCodeSearchVO.setSort(sort);

        //수불유형:공통코드
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd(commonCodeSearchVO));

        return "/par/stm/stockInOut/selectGrGiStatusList";
    }

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
     * 재고분석 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockAnalysisByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockAnalysisByCondition(@RequestBody StockInOutSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(stockInOutService.selectStockAnalysisByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockInOutService.selectStockAnalysisByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고리스트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stock/selectStockList.do", method = RequestMethod.GET)
    public String selectStockList(Model model) throws Exception {

        return "/par/stm/stock/selectStockList";
    }

    /**
     * 부품별 창고/로케이션 리스트 정보 조회.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/selectStockInStrgeNmListAndLocNmListOutByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public StockInOutVO selectStockInStrgeNmListAndLocNmListOutByItemCd(@RequestBody StockInOutSearchVO searchVO) throws Exception
    {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        StockInOutVO stockInOutVO = stockInOutService.selectStockInStrgeNmListAndLocNmListOutByItemCd(searchVO);

        return stockInOutVO;
    }



    @RequestMapping(value = "/par/stm/stockInOut/insertStockInOutExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertPartsPriceExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<StockInOutVO> list = new ArrayList<StockInOutVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        List<StockInOutVO> resultList = new ArrayList<StockInOutVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<StockInOutVO> excelReader = new ExcelReader<StockInOutVO>(StockInOutVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                //1000건 이상이 데이터 수정 못함.
                if(excelReader.getTotalRows() - 2 > 1000){
                    status.addError("global.info.dataMaxCnt");
                    result.setTotal(10000);
                }else {
                    list = excelReader.readExcelData(status);

                    result.setTotal(list.size());
                    result.setData(list);

                    status.setStep(ExcelUploadStatus.COMPLETED);

                    resultList = stockInOutService.selectStockInOutExcelValidate(list);

                    result.setTotal(resultList.size());
                    result.setData(resultList);
                }

            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }

    /**
     * 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockInOut/saveStockInOutExcelUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveStockInOutExcelUpload(@RequestBody StockInOutExcelUploadSaveDTO stockInOutList) throws Exception {

        List<StockInOutVO> list = stockInOutList.getStockInOutList();

        stockInOutService.updateStockInOutUpload(list);

        return true;
    }
}
