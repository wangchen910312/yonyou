package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.util.fmt.DateUtil;
import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.ComItemMasterService;
import chn.bhmc.dms.par.pmm.service.ComItemMasterStatusService;
import chn.bhmc.dms.par.pmm.service.ItemGroupLevelService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterPackageSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * 품목마스터 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Controller
public class ItemMasterController extends HController {

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공용부품마스터 관리 서비스
     */
    @Resource(name="comItemMasterService")
    ComItemMasterService comItemMasterService;

    /**
     * 공용부품현황 관리 서비스
     */
    @Resource(name="comItemMasterStatusService")
    ComItemMasterStatusService comItemMasterStatusService;

    /**
     * 품목그룹레벨 서비스
     */
    @Resource(name="itemGroupLevelService")
    ItemGroupLevelService itemGroupLevelService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;


    /**
     * 이동평균가 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;

    /**
     * 품목마스터 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterMain.do", method = RequestMethod.GET)
    public String selectItemMasterMain(Model model,@RequestParam(value="pCallMenu", defaultValue="") String pCallMenu) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("stockUnitList", stockUnitList);
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

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

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("itemDstinAmosCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR136", null, langCd));
        model.addAttribute("weightUnitCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));
        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        model.addAttribute("pCallMenu", pCallMenu);

        //1차분류코드
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin1stCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //2차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin2ndCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(4);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin3rdCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));

        return "/par/pmm/itemMaster/selectItemMasterMain";
    }

    /**
     * 품목마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemMasters(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemMastersByCondition(searchVO));
        }

        return result;

    }

    /**
     * 품목마스터 목록 데이터를 조회한다.(팝업용)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectPopItemMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPopItemMasters(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectPopItemMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectPopItemMastersByCondition(searchVO));
        }

        return result;

    }

    /**
     * 품목마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ItemMasterVO selectItemMasterByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        ItemMasterVO itemMasterVO = new ItemMasterVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        itemMasterVO = itemMasterService.selectItemMasterByKey(searchVO);

        return itemMasterVO;

    }

    /**
     * 품목마스터 정보(모바일용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectMobileItemMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ItemMasterVO selectMobileItemMasterByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {
        ItemMasterVO itemMasterVO = new ItemMasterVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        itemMasterVO = itemMasterService.selectMobileItemMasterByKey(searchVO);

        return itemMasterVO;

    }

    /**
     * 품목마스터 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/insertItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertItemMaster(@Validated @RequestBody ItemMasterVO saveVO)  throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.insertItemMaster(saveVO);

        return result;

    }

    /**
     * 품목마스터 정보 추가 및 부품유형정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/insertItemMasterItemGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertItemMasterItemGroup(@Validated @RequestBody ItemMasterSaveVO itemMasterSaveVO)  throws Exception {

        itemMasterSaveVO.getSaveVO().setDlrCd(LoginUtil.getDlrCd());
        itemMasterSaveVO.getSaveVO().setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.insertItemMaster(itemMasterSaveVO);

        return result;

    }

    /**
     * 품목마스터 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/updateItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateItemMaster(@Validated @RequestBody ItemMasterVO saveVO)  throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.updateItemMaster(saveVO);

        return result;

    }

    /**
     * 품목마스터 정보를 수정 및 부품유형정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/updateItemMasterItemGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateItemMasterItemGroup(@Validated @RequestBody ItemMasterSaveVO itemMasterSaveVO)  throws Exception {

        itemMasterSaveVO.getSaveVO().setDlrCd(LoginUtil.getDlrCd());
        itemMasterSaveVO.getSaveVO().setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.updateItemMaster(itemMasterSaveVO);

        return result;

    }

    /**
     * 품목마스터 정보를 삭제(로컬부품)한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/deleteLocalItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteLocalItemMaster(@RequestBody ItemMasterVO saveVO)  throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.deleteLocalItemMaster(saveVO);

        return result;

    }

    /**
     * 품목마스터 정보를 삭제(패키지)한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/deleteItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteItemMaster(@RequestBody ItemMasterVO saveVO)  throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setRegUsrId(LoginUtil.getUserId());

        int result = itemMasterService.deleteLocalItemMaster(saveVO);

        return result;

    }

    /**
     * 구매단가용 품목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectPurcPrcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcPrcItemByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<ItemMasterVO> itemLst = new ArrayList<ItemMasterVO>();

        result.setTotal(itemMasterService.selectPurcPrcItemByKeyCnt(searchVO));

        if(result.getTotal() == 1){
            itemLst.add(itemMasterService.selectPurcPrcItemByKey(searchVO));

            result.setData(itemLst);
        }
        return result;
    }

    /**
     * 판매단가용 품목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectSalePrcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalePrcItemByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<ItemMasterVO> itemLst = new ArrayList<ItemMasterVO>();

        result.setTotal(itemMasterService.selectSalePrcItemByKeyCnt(searchVO));

        if(result.getTotal() == 1){
            itemLst.add(itemMasterService.selectSalePrcItemByKey(searchVO));

            result.setData(itemLst);
        }

        return result;

    }

    /**
     * 공용품목그룹 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selecComtItemMasterMain.do", method = RequestMethod.GET)
    public String selecComtItemMasterMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

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

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));
        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/par/pmm/itemMaster/selecComtItemMasterMain";
    }

    /**
     * 통용부번설정 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectComItemMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectComItemMasters(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectComItemMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectComItemMastersByCondition(searchVO));
        }

        return result;

    }



    /**
     * 조회조건에 해당하는 공용부품 마스터 정보 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/comItemMastersList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult comItemMastersList(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemMastersByCondition(searchVO));
        }

        return result;

    }

    /**
     * Key에 해당하는 공용부품 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/comItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult comItemMaster(@RequestBody ComItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(comItemMasterService.comItemMasterByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(comItemMasterService.comItemMasterByKey(searchVO));
        }

        return result;

    }

    /**
     * 조회조건에 해당하는 공용부품 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/comItemMasterByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult comItemMasterByCondition(@RequestBody ComItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(comItemMasterService.comItemMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(comItemMasterService.comItemMasterByCondition(searchVO));
        }

        return result;

    }

    /**
     * 조회조건에 해당하는 공용부품 마스터 재고정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/comItemMasterStockByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult comItemMasterStockByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(comItemMasterService.comItemMasterStockByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(comItemMasterService.comItemMasterStockByCondition(searchVO));
        }

        return result;
    }

    /**
     *  공용부품 마스터 정보를 등록한다.
     * @param ComItemMasterSaveVO -  공용부품 마스터 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/par/pmm/multiUpdateComItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUpdateComItemCd(@Validated @RequestBody ComItemMasterSaveVO saveVO) throws Exception {

        comItemMasterService.multiUpdateComItemCd(saveVO);
        return true;
    }

    /**
     * 부품 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectPurcPrcItemsForSuggest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcPrcItemsForSuggest(@RequestBody ItemMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        //result.setData(itemMasterService.selectPurcPrcItemsForSuggest(searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setData(itemMasterService.selectPurcPrcItemsForSuggest(searchVO));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 부품 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectSalePrcItemsForSuggest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalePrcItemsForSuggest(@RequestBody ItemMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        //result.setData(itemMasterService.selectPurcPrcItemsForSuggest(searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setData(itemMasterService.selectSalePrcItemsForSuggest(searchVO));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 부품 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectIssueReqItemSalePrcByKeyIn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqItemSalePrcByKeyIn(@RequestBody ItemMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        //result.setData(itemMasterService.selectPurcPrcItemsForSuggest(searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setData(itemMasterService.selectIssueReqItemSalePrcByKeyIn(searchVO));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 부품마스터 패키지 정보 추가 및 패키지 헤더정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/insertItemMasterPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertItemMasterPackage(@Validated @RequestBody ItemMasterPackageSaveVO itemMasterPackageSaveVO)  throws Exception {

        int result = itemMasterService.insertItemMaster(itemMasterPackageSaveVO);

        return result;
    }

    /**
     * 부품마스터 패키지 정보 추가 및 패키지 헤더정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/updateItemMasterPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateItemMasterPackage(@Validated @RequestBody ItemMasterPackageSaveVO itemMasterPackageSaveVO)  throws Exception {

        int result = itemMasterService.updateItemMaster(itemMasterPackageSaveVO);

        return result;
    }

    /**
     * 창고, 품목 코드에 해당하는 이동평균가격을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMovingAvgPrcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ItemMovingAvgPrcVO selectItemMovingAvgPrcByKey(@RequestBody ItemMovingAvgPrcVO searchVO) throws Exception
    {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        ItemMovingAvgPrcVO itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchVO);

        if(itemMovingAvgPrcVO == null){
            itemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        }

        return itemMovingAvgPrcVO;
    }



    /**
     * 부품정보관리 문건등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemMasterInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectItemMasterInfoExcelUploadPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //brandCd
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        //carlineCd
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //carlineCd2
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        return "/par/cmm/selectItemMasterInfoExcelUploadPopup";
    }

    /**
     *  액셀파일 부품정보를 수정한다.
     * @param ComItemMasterSaveVO -  부품정보관리 액셀 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/multiItemMasterExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItemMasterExcelData(@RequestBody List<ItemMasterExcelVO> itemMasterExcelList) throws Exception {

        itemMasterService.multiItemMasterExcelData(itemMasterExcelList);
        return true;
    }

    @RequestMapping(value = "/par/pmm/itemMaster/insertItemMasterExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertItemMasterExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<ItemMasterExcelVO> list = new ArrayList<ItemMasterExcelVO>();
        List<ItemMasterExcelVO> resultList = new ArrayList<ItemMasterExcelVO>();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //brandCdList
        List<CommonCodeVO> brandCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd);
        //carlineCd

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        List<CarInfoVO> carlineCdList = carInfoService.selectCarListsByCondition(carInfoSearchVO);

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        List<UnitInfoVO> stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<ItemMasterExcelVO> excelReader = new ExcelReader<ItemMasterExcelVO>(ItemMasterExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(2);//3row skip

                list = excelReader.readExcelData(status);

                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    errors = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt++;
                       //resultList.add(list.get(i));
                   }else{

                       //부품코드 기준 액셀 리스트 행 추가.
                       if(!list.get(i).getItemCd().isEmpty()){

                           //부품마스터 부품 확인.
                           ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
                           itemMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                           itemMasterSearchVO.setsItemCd(list.get(i).getItemCd());

                           if(itemMasterService.selectItemMastersByConditionCnt(itemMasterSearchVO) == 0){
                               list.get(i).setInsertUpdateTp("I");
                           }else{
                               list.get(i).setInsertUpdateTp("U");
                           }

                           //itemCd
                           if(list.get(i).getItemCd().isEmpty()){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "global.info.emptyParamInfo"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                               list.get(i).setErrors(errors);
                               totErrCnt++;
                           }

                           //itemNm
                           if(list.get(i).getItemNm().isEmpty()){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "global.info.emptyParamInfo"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.itemNm", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getItemNm(), msg));

                               list.get(i).setErrors(errors);
                               totErrCnt++;
                           }

                           //날짜형식체크
                           //startDt
                           boolean bStartDt = false;
                           if(!list.get(i).getStartDt().isEmpty()){

                               try{
                                   bStartDt = DateUtil.checkDate(list.get(i).getStartDt());
                               }catch(Exception ex){}

                           }

                           if(!bStartDt){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "par.info.confirmFileUpload"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getStartDt(), msg));

                               list.get(i).setErrors(errors);
                               totErrCnt++;
                           }

                           //brandCd Check and set brand code
                           int iBrandCdCheckCnt = 0;

                           for(CommonCodeVO brandCommonCdVO : brandCdList){
                               if(brandCommonCdVO.getUseYn().trim().equals("Y")){
                                   if(list.get(i).getBrandCd().equals(brandCommonCdVO.getCmmCd())){
                                       iBrandCdCheckCnt++;
                                       list.get(i).setBrandCd(brandCommonCdVO.getCmmCd());
                                   }
                               }
                           }

                           //brandCd code empty
                           if(iBrandCdCheckCnt == 0){
                               list.get(i).setBrandCd("OT");//브랜드코드 없을 때 : 기타(OT)
                           }

                           //carlineCd
                           for(CarInfoVO carInfoVO : carlineCdList){
                               if(list.get(i).getCarlineCd().equals(carInfoVO.getCarlineCd())){
                                   list.get(i).setCarlineCd(carInfoVO.getCarlineCd());
                               }
                           }

                           //stockUnitCd Check and set stockUnitCd code
                           int iStockUnitCdCheckCnt = 0;

                           for(UnitInfoVO unitInfoVO : stockUnitList){
                               if(list.get(i).getStockUnitCd().equals(unitInfoVO.getUnitCd())){
                                   iStockUnitCdCheckCnt++;
                                   list.get(i).setStockUnitCd(unitInfoVO.getUnitCd());
                               }
                           }

                           //stockUnitCd code empty
                           if(iStockUnitCdCheckCnt == 0){
                               list.get(i).setStockUnitCd("EA");
                           }

                           list.get(i).setItemCd(list.get(i).getItemCd());
                           list.get(i).setItemNm(list.get(i).getItemNm());
                           list.get(i).setStartDt(list.get(i).getStartDt());


                           if(list.get(i).getDgrItemYn().equals("Y")){
                               list.get(i).setDgrItemYn("Y");
                           }else{
                               list.get(i).setDgrItemYn("N");
                           }

                           //안전재고 체크.
                           //sftyStockQty
                           double dSftyStockQty = 0.0;
                           boolean bSftyStockQty = false;
                           if(!list.get(i).getStrSftyStockQty().isEmpty()){

                               try{
                                   dSftyStockQty = Double.parseDouble(list.get(i).getStrSftyStockQty());
                                   bSftyStockQty = true;
                               }catch(Exception ex){}

                           }

                           if(!bSftyStockQty){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "par.info.confirmFileUpload"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.sftyStockQty", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getStrSftyStockQty(), msg));

                               list.get(i).setErrors(errors);
                               totErrCnt++;
                           }else{
                               list.get(i).setSftyStockQty(dSftyStockQty);
                           }

                           list.get(i).setOldRplcItemCd(list.get(i).getOldRplcItemCd());
                           list.get(i).setNewRplcItemCd(list.get(i).getNewRplcItemCd());

                           //oldRplcParCmptYn check
                           if(list.get(i).getOldRplcParCmptYn().equals("Y")){
                               list.get(i).setOldRplcParCmptYn("Y");
                           }else{
                               list.get(i).setOldRplcParCmptYn("N");
                           }
                           //newRplcParCmptYn check
                           if(list.get(i).getNewRplcParCmptYn().equals("Y")){
                               list.get(i).setNewRplcParCmptYn("Y");
                           }else{
                               list.get(i).setNewRplcParCmptYn("N");
                           }
                           //stockUnitCd
                           if(list.get(i).getStockUnitCd().isEmpty()){
                               list.get(i).setStockUnitCd("EA");
                           }

                           resultList.add(list.get(i));
                       }
                   }
                }

                result.setTotal(resultList.size());
                result.setData(resultList);

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
     * 공용부품현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selecComtItemMasterStatusMain.do", method = RequestMethod.GET)
    public String selecComtItemMasterStatusMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("stockUnitList", stockUnitList);
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

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

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("weightUnitCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));
        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        //1차분류코드
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin1stCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //2차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin2ndCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(4);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin3rdCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));

        //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));

        return "/par/pmm/itemMaster/selecComtItemMasterStatusMain";
    }


    /**
     * 조회조건에 해당하는 공용부품현황정보 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectComItemMasterStatues.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectComItemMasterStatues(@RequestBody ComItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(comItemMasterStatusService.selectComItemMasterStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(comItemMasterStatusService.selectComItemMasterStatusByCondition(searchVO));
        }

        return result;

    }

}
