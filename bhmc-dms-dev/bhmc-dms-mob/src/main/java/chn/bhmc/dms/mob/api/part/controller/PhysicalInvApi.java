package chn.bhmc.dms.mob.api.part.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationDefineService;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationMasterService;
import chn.bhmc.dms.mob.api.part.service.PartCarInfoService;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.service.PartUnitInfoService;
import chn.bhmc.dms.mob.api.part.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationDefineVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterVO;
import chn.bhmc.dms.mob.api.part.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.par.stm.service.InvestigationService;
//import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.InvestigationListVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSaveVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobInvestigationController.java
 * @Description : 재고실사등록 Controller
 * @author JongHee Lim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
@RequestMapping("/api/part/PhysicalInv")
@Api("配件盘点")
public class PhysicalInvApi extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;
//
//    /**
//     * 현재고 서비스
//     */
//    @Resource(name="stockInOutService")
//    StockInOutService stockInOutService;

    /**
     * 재고실사 서비스
     * 有写功能 （不动）
     */
    @Resource(name="investigationService")
    InvestigationService investigationService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService PartStorageService;

    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService PartSystemConfigInfoService;

//    /**
//     * 품목그룹 관리 서비스
//     * no
//     */
//    @Resource(name="itemGroupService")
//    ItemGroupService itemGroupService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="PartCarInfoService")
    PartCarInfoService PartCarInfoService;

    /**
     * Location 정의 정보 서비스
     */
    @Resource(name="PartBinLocationDefineService")
    PartBinLocationDefineService PartBinLocationDefineService;

    /**
     * Location 마스터 정보 서비스
     */
    @Resource(name="PartBinLocationMasterService")
    PartBinLocationMasterService PartBinLocationMasterService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="PartUnitInfoService")
    PartUnitInfoService PartUnitInfoService;


    /**
     * 재고실사등록 메인
     */
    @ApiOperation("盘点清单确认(页面加载)")
    @ResponseBody
    @RequestMapping(value = "/selectPhysicalInvMain.do", method = RequestMethod.GET)
    public BaseJSON __selectInvestigationMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        BinLocationDefineSearchVO binLocationDefineSearchVO   = new BinLocationDefineSearchVO();
        List<BinLocationDefineVO> binLocLevelList        = new ArrayList<BinLocationDefineVO>();
        BinLocationMasterSearchVO binLocationMasterSearchVO   = new BinLocationMasterSearchVO();
        List<BinLocationMasterVO> binLocList             = new ArrayList<BinLocationMasterVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = PartUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        int binLocLvlCnt = 0;

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        binLocationMasterSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLevelList = PartBinLocationDefineService.selectBinLocationLevelCombo(binLocationDefineSearchVO);

        binLocationDefineSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLvlCnt = PartBinLocationDefineService.selectBinLocationLevelCount(binLocationDefineSearchVO);
        binLocList = PartBinLocationMasterService.selectBinLocationMasterComboByLevel(binLocationMasterSearchVO);


        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", PartCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList",        PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("abcIndList",           PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("binLocLevelList",      binLocLevelList);
        model.addAttribute("binLocLvlCnt",         binLocLvlCnt);
        model.addAttribute("binLocList",           binLocList);
        model.addAttribute("stockLockYnList",      PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);


        model.addAttribute("docStatList",          PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList",         PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);
//        model.addAttribute("pStockDdDocNo",        pStockDdDocNo);

        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //return "/mob/par/stm/physicalInv/selectPhysicalInvMain";
		BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(model);
		return baseJSON;
    }

    @ApiOperation("盘点清单确认(页面加载)")
    @RequestMapping(value = "/selectInvestigationMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectInvestigationMain(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        BinLocationDefineSearchVO binLocationDefineSearchVO   = new BinLocationDefineSearchVO();
        List<BinLocationDefineVO> binLocLevelList        = new ArrayList<BinLocationDefineVO>();
        BinLocationMasterSearchVO binLocationMasterSearchVO   = new BinLocationMasterSearchVO();
        List<BinLocationMasterVO> binLocList             = new ArrayList<BinLocationMasterVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = PartUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        int binLocLvlCnt = 0;

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        binLocationMasterSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLevelList = PartBinLocationDefineService.selectBinLocationLevelCombo(binLocationDefineSearchVO);

        binLocationDefineSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLvlCnt = PartBinLocationDefineService.selectBinLocationLevelCount(binLocationDefineSearchVO);
        binLocList = PartBinLocationMasterService.selectBinLocationMasterComboByLevel(binLocationMasterSearchVO);


        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", PartCarInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList",        PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("abcIndList",           PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("binLocLevelList",      binLocLevelList);
        model.addAttribute("binLocLvlCnt",         binLocLvlCnt);
        model.addAttribute("binLocList",           binLocList);
        model.addAttribute("stockLockYnList",      PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);


        model.addAttribute("docStatList",          PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList",         PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);
//        model.addAttribute("pStockDdDocNo",        pStockDdDocNo);

        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(model);
		return baseJSON;
    }

    /**
     * 재고실사등록 목록
     */
    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvList.do", method = RequestMethod.GET)
    public String selectInvestigationList(Model model) throws Exception{
        //return "/mob/par/stm/investigation/selectInvestigationList";
        return "/mob/par/stm/physicalInv/selectPhysicalInvList";
    }

    /**
     * 재고실사등록 목록 [조회]
     */
    //@RequestMapping(value = "/mob/par/stm/investigation/selectInvestigationsPop", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationsPop(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(investigationService.selectInvestigationListByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationListByCondition(searchVO));
        }
        return result;
    }

    /**
     * 재고실사등록 부품 목록
     */
    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvLocList.do", method = RequestMethod.GET)
    public String selectPhysicalInvLocList(Model model,
            @RequestParam(value="stockDdDocNo", defaultValue="") String stockDdDocNo) throws Exception{
        model.addAttribute("stockDdDocNo", stockDdDocNo);
        return "/mob/par/stm/physicalInv/selectPhysicalInvLocList";
    }

    /**
     * 재고실사등록 부품 목록
     */
    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvItemList.do", method = RequestMethod.GET)
    public String selectInvestigationItemList(Model model,
            @RequestParam(value="stockDdDocNo", defaultValue="") String stockDdDocNo,
            @RequestParam(value="strgeCd", defaultValue="") String strgeCd) throws Exception{
        model.addAttribute("stockDdDocNo", stockDdDocNo);
        model.addAttribute("strgeCd", strgeCd);
        return "/mob/par/stm/physicalInv/selectPhysicalInvItemList";
    }


    /**
     * 재고실사등록 부품 목록 [조회]
     */
    //@RequestMapping(value = "/mob/par/stm/investigation/selectApproveReqInvestigations", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvItemLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectApproveReqInvestigations(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(investigationService.selectInvestigationByKeyCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationByKey(searchVO));
        }
        return result;
    }

    /**
     * 재고실사 수정한다.
     * @return
     */
    @RequestMapping(value = "/multiInvestigations.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("盘点清单确认-保存1")
    public BaseJSON multiInvestigations(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {
        InvestigationVO investigationVO = saveVO.getInvestigationVO();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        investigationService.multiInvestigations(saveVO, investigationVO);

        return new BaseJSON();
    }

//    /**
//     * 재고실사등록 확정
//     */
//    //@RequestMapping(value = "/mob/par/stm/investigation/multiInvestigations", method = RequestMethod.POST)
//    @RequestMapping(value = "/mob/par/stm/physicalInv/actionPhysicalInv", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean multiInvestigations(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {
//        InvestigationVO investigationVO = new InvestigationVO();
//        investigationVO = saveVO.getInvestigationVO();
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        investigationVO.setRegUsrId(mobLoginVO.getUserId());
//        investigationVO.setDlrCd(mobLoginVO.getDlrCd());
//        investigationService.multiInvestigations(saveVO, investigationVO);
//        return true;
//    }

    /**
     * 재고실사 헤더 정보를 수정한다.
     * @return
     */
    //@RequestMapping(value = "/par/stm/investigation/updateInvestigationHeaderByKey", method = RequestMethod.POST)
/*
    @RequestMapping(value = "/mob/par/stm/physicalInv/updateInvestigationHeaderByKey", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationHeaderByKey(@RequestBody InvestigationVO investigationVO)  throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //모바일에서는 실사대상 상세정보 저장시에 부품 리스트 항목에 대한 저장을 하기 때문에 재고실사 헤더정보만 수정
        investigationVO.setDocStatCd("REQ");
        investigationVO.setRegUsrId(mobLoginVO.getUserId());
        investigationVO.setDlrCd(mobLoginVO.getDlrCd());

        int result = investigationService.updateInvestigationHeaderByKey(investigationVO);


        return result;
    }
    */
    /**
     * 재고실사 승인요청한다.
     * @return
     */
    @RequestMapping(value = "/updateInvestigationApplyReq.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("库存盘点单目录-申请1")
    public BaseJSON updateInvestigationApplyReq(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {
    	investigationListVO.getInvestigationVO().setRegUsrId(LoginUtil.getUserId());
    	investigationListVO.getInvestigationVO().setDlrCd(LoginUtil.getDlrCd());
    	BaseJSON json = new BaseJSON();
    	json.setResult(investigationService.updateInvestigationApplyReq(investigationListVO.getInvestigationItemList(), investigationListVO.getInvestigationVO()));
        return json;
    }
//    /**
//     * 재고실사 승인요청한다.
//     * @return
//     */
//    //@RequestMapping(value = "/par/stm/investigation/updateInvestigationApplyReq", method = RequestMethod.POST)
//    @RequestMapping(value = "/mob/par/stm/physicalInv/updateInvestigationApplyReq", method = RequestMethod.POST)
//    @ResponseBody
//    public int updateInvestigationApplyReq(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {
//
//      //모바일에서는 실사대상 상세정보 저장시에 부품 리스트 항목에 대한 저장을 하기 때문에 재고실사 헤더정보만 수정
//        InvestigationVO investigationVO = new InvestigationVO();
//        investigationVO = investigationListVO.getInvestigationVO();
//        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList(); //공백리스트임
//
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        investigationVO.setRegUsrId(mobLoginVO.getUserId());
//        investigationVO.setDlrCd(mobLoginVO.getDlrCd());
//
//        int result = investigationService.updateInvestigationApplyReq(list, investigationVO);
//
//
//        return result;
//    }

//    /**
//     * 모바일용 메인 화면  데이타를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
//     * @return
//     */
//    @RequestMapping(value = "/mob/par/stm/stockInOut/selectMobileStockInoByDlrCd.do", method = RequestMethod.POST)
//    @ResponseBody
//    public StockInOutVO selectMobileStockInoByDlrCd(@RequestBody StockInOutVO stockInOutVO) throws Exception
//    {
//
//        // StockInOutVO 중 PURC_TOT_CNT(발주 총 수량), SALE_TOT_AMT(판매 누계), STOCK_TOT_AMT(재고 금액)
//        stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
//        stockInOutVO = stockInOutService.selectMobileStockInoByDlrCd(stockInOutVO);
//
//
//        return stockInOutVO;
//    }

    /**
     * 실사문서를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     */
    @RequestMapping(value = "/selectInvestigationListGrid.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("盘点单信息查询")
    public BaseJSON selectInvestigationListGrid(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationListGridByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationListGridByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;

    }

    /**
     * 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     */
    @RequestMapping(value = "/selectInvestigationListDetailGrid.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("库存盘点单目录")
    public BaseJSON selectInvestigationStrge(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(investigationService.selectInvestigationStrgeByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationStrgeByKey(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;
    }

    /**
     * 재고실사 부품 정보를 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/selectInvestigationItem.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("库存盘点单配件列表")
    public BaseJSON selectInvestigationItem(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(investigationService.selectInvestigationItemByStrgeCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationItemByStrge(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;
    }

    /**
     * 로케이션 특정 품목 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBinLocationMasterByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("盘点清单确认")
    public BaseJSON selectBinLocationMasterByItemCd(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(PartBinLocationMasterService.selectBinLocationMasterByItemCdCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartBinLocationMasterService.selectBinLocationMasterByItemCd(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;

    }

    /**
     * 재고실사  헤더를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/selectInvestigationListByKey.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("盘点清单确认-保存3")
    public BaseJSON selectInvestigationListByKey(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        InvestigationVO investigationVO = new InvestigationVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        investigationVO = investigationService.selectInvestigationListByKey(searchVO);

        if(investigationVO == null){
            investigationVO = new InvestigationVO();
        }
        BaseJSON json = new BaseJSON();
        json.setResult(investigationVO);

        return json;

    }

//    @RequestMapping(value = "/actionPhysicalInv", method = RequestMethod.POST)
//    @ResponseBody
//    @ApiOperation("盘点清单确认-删除")
//    public BaseJSON multiInvestigations(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {
//        InvestigationVO investigationVO = new InvestigationVO();
//        investigationVO = saveVO.getInvestigationVO();
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        investigationVO.setRegUsrId(mobLoginVO.getUserId());
//        investigationVO.setDlrCd(mobLoginVO.getDlrCd());
//        investigationService.multiInvestigations(saveVO, investigationVO);
//        return new BaseJSON();
//    }

    @RequestMapping(value = "/selectStoragesByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("仓库列表")
    public BaseJSON  selectStoragesByCondition(@RequestBody StorageSearchVO storageSearchVO){
    	BaseJSON json = new BaseJSON();
    	storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<StorageVO> storageList   = new ArrayList<StorageVO>();
        try {
			storageList = PartStorageService.selectStoragesByCondition(storageSearchVO);
		} catch (Exception e) {
			json.setResultMsg("失败");
			json.setResultCode(1);
			e.printStackTrace();
		}
        json.setResult(storageList);
		return json;

    }







}
