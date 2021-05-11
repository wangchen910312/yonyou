package chn.bhmc.dms.mob.par.stm.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;
import chn.bhmc.dms.par.stm.service.InvestigationService;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationListVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSaveVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;


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
public class MobPhysicalInvController extends HController {

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
     * 재고실사 서비스
     */
    @Resource(name="investigationService")
    InvestigationService investigationService;

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
     * Location 정의 정보 서비스
     */
    @Resource(name="binLocationDefineService")
    BinLocationDefineService binLocationDefineService;

    /**
     * Location 마스터 정보 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;


    /**
     * 재고실사등록 메인
     */
    @RequestMapping(value = "/mob/par/stm/physicalInv/__selectPhysicalInvMain.do", method = RequestMethod.GET)
    public String __selectInvestigationMain(Model model) throws Exception{

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
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        int binLocLvlCnt = 0;

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        binLocationMasterSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLevelList = binLocationDefineService.selectBinLocationLevelCombo(binLocationDefineSearchVO);

        binLocationDefineSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLvlCnt = binLocationDefineService.selectBinLocationLevelCount(binLocationDefineSearchVO);
        binLocList = binLocationMasterService.selectBinLocationMasterComboByLevel(binLocationMasterSearchVO);


        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("abcIndList",           commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("binLocLevelList",      binLocLevelList);
        model.addAttribute("binLocLvlCnt",         binLocLvlCnt);
        model.addAttribute("binLocList",           binLocList);
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);


        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);
//        model.addAttribute("pStockDdDocNo",        pStockDdDocNo);

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/mob/par/stm/physicalInv/selectPhysicalInvMain";
    }

    @RequestMapping(value = "/mob/par/stm/physicalInv/selectPhysicalInvMain.do", method = RequestMethod.GET)
    public String selectInvestigationMain(Model model) throws Exception{

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
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        int binLocLvlCnt = 0;

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        binLocationMasterSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLevelList = binLocationDefineService.selectBinLocationLevelCombo(binLocationDefineSearchVO);

        binLocationDefineSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        binLocLvlCnt = binLocationDefineService.selectBinLocationLevelCount(binLocationDefineSearchVO);
        binLocList = binLocationMasterService.selectBinLocationMasterComboByLevel(binLocationMasterSearchVO);


        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("abcIndList",           commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("binLocLevelList",      binLocLevelList);
        model.addAttribute("binLocLvlCnt",         binLocLvlCnt);
        model.addAttribute("binLocList",           binLocList);
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);


        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList",           unitCdList);
//        model.addAttribute("pStockDdDocNo",        pStockDdDocNo);

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/stm/physicalInv/baseJsp/selectPhysicalInvMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateB";
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
    //@RequestMapping(value = "/mob/par/stm/investigation/selectInvestigationsPop.do", method = RequestMethod.POST)
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
    //@RequestMapping(value = "/mob/par/stm/investigation/selectApproveReqInvestigations.do", method = RequestMethod.POST)
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
     * 재고실사등록 확정
     */
    //@RequestMapping(value = "/mob/par/stm/investigation/multiInvestigations.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/stm/physicalInv/actionPhysicalInv.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiInvestigations(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {
        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = saveVO.getInvestigationVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        investigationVO.setRegUsrId(mobLoginVO.getUserId());
        investigationVO.setDlrCd(mobLoginVO.getDlrCd());
        investigationService.multiInvestigations(saveVO, investigationVO);
        return true;
    }

    /**
     * 재고실사 헤더 정보를 수정한다.
     * @return
     */
    //@RequestMapping(value = "/par/stm/investigation/updateInvestigationHeaderByKey.do", method = RequestMethod.POST)
/*
    @RequestMapping(value = "/mob/par/stm/physicalInv/updateInvestigationHeaderByKey.do", method = RequestMethod.POST)
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
    //@RequestMapping(value = "/par/stm/investigation/updateInvestigationApplyReq.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/stm/physicalInv/updateInvestigationApplyReq.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationApplyReq(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

      //모바일에서는 실사대상 상세정보 저장시에 부품 리스트 항목에 대한 저장을 하기 때문에 재고실사 헤더정보만 수정
        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList(); //공백리스트임

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        investigationVO.setRegUsrId(mobLoginVO.getUserId());
        investigationVO.setDlrCd(mobLoginVO.getDlrCd());

        int result = investigationService.updateInvestigationApplyReq(list, investigationVO);


        return result;
    }

    /**
     * 모바일용 메인 화면  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/par/stm/stockInOut/selectMobileStockInoByDlrCd.do", method = RequestMethod.POST)
    @ResponseBody
    public StockInOutVO selectMobileStockInoByDlrCd(@RequestBody StockInOutVO stockInOutVO) throws Exception
    {

        // StockInOutVO 중 PURC_TOT_CNT(발주 총 수량), SALE_TOT_AMT(판매 누계), STOCK_TOT_AMT(재고 금액)
        stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
        stockInOutVO = stockInOutService.selectMobileStockInoByDlrCd(stockInOutVO);


        return stockInOutVO;
    }
}
