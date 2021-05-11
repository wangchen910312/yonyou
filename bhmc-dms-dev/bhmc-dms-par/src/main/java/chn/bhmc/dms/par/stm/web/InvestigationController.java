package chn.bhmc.dms.par.stm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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

import able.com.web.HController;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
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
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.stm.service.InvestigationService;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationListVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSaveVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
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
public class InvestigationController extends HController {

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

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
     * 재고실사 대상 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationMain.do", method = RequestMethod.GET)
    public String selectInvestigationMain(Model model
            ,@Param("stockDdDocNo") String stockDdDocNo
            ,@Param("docStatCd") String docStatCd) throws Exception{

        /** 실사현황에서 그리드 상태별 재고실사문서 번호 링크처리 시 필요한 파라미터.**/
        model.addAttribute("stockDdDocNo",  stockDdDocNo);
        model.addAttribute("docStatCd",     docStatCd);
        /** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ***/

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //창고정보
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        //로케이션정보
        BinLocationDefineSearchVO binLocationDefineSearchVO   = new BinLocationDefineSearchVO();
        List<BinLocationDefineVO> binLocLevelList        = new ArrayList<BinLocationDefineVO>();
        BinLocationMasterSearchVO binLocationMasterSearchVO   = new BinLocationMasterSearchVO();
        List<BinLocationMasterVO> binLocList             = new ArrayList<BinLocationMasterVO>();

        //단위정보
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();
        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        int binLocLvlCnt = 0;

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        binLocationMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        binLocLevelList = binLocationDefineService.selectBinLocationLevelCombo(binLocationDefineSearchVO);

        binLocationDefineSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        binLocLvlCnt = binLocationDefineService.selectBinLocationLevelCount(binLocationDefineSearchVO);
        binLocList = binLocationMasterService.selectBinLocationMasterComboByLevel(binLocationMasterSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("dlrCd",                LoginUtil.getDlrCd());
        model.addAttribute("langCd",                langCd);

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
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("binLocLevelList",      binLocLevelList);
        model.addAttribute("binLocLvlCnt",         binLocLvlCnt);
        model.addAttribute("binLocList",           binLocList);
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //공급업체 리스트.
        VenderMasterSearchVO venderMasterSearchVO = new VenderMasterSearchVO();
        venderMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        venderMasterSearchVO.setsEndYn("N");
        venderMasterSearchVO.setsBpDstinCd("Y");
        model.addAttribute("bpCdList", venderMasterService.selectVenderMastersByCondition(venderMasterSearchVO));

        model.addAttribute("unitCdList",           unitCdList);
        model.addAttribute("sysDate",              DateUtil.getDate(dateFormat +" HH:00:00"));
        model.addAttribute("usrId",                LoginUtil.getUserId());
        model.addAttribute("usrNm",                LoginUtil.getUserNm());

        return "/par/stm/investigation/selectInvestigationMain";

    }

    /**
     * 재고실사정보를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/stm/investigation/createInvestigation.do", method = RequestMethod.POST)
    @ResponseBody
    public int createInvestigation(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        int resultCnt = 0;
        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        resultCnt = investigationService.createInvestigation(list, investigationVO);

        if(resultCnt > 0){
            resultCnt = 1;
        }

        return resultCnt;
    }

    /**
     * 재고실사정보를 등록한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/createInvestigationReg.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO createInvestigationReg(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO = investigationService.createInvestigationReg(list, investigationVO);

        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 수정한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationReg.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO updateInvestigationReg(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO = investigationService.updateInvestigationReg(list, investigationVO);

        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 수정한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationRegNew.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO updateInvestigationRegNew(@Validated @RequestBody InvestigationSaveVO investigationSaveVO)  throws Exception {

        InvestigationVO investigationVO = investigationService.updateInvestigationRegNew(investigationSaveVO);

        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 저장한다.(추가버튼클릭시)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationRegAdd.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO updateInvestigationRegAdd(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO = investigationService.updateInvestigationRegAdd(list, investigationVO);

        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 삭제한다.(삭제버튼클릭시)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/deleteInvestigationReg.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO deleteInvestigationReg(@Validated @RequestBody InvestigationSaveVO investigationItemList)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationService.deleteInvestigationReg(investigationItemList.getInvestigationItemList());
        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 등록확정한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/createInvestigationCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO createInvestigationCnfm(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();


        investigationVO = investigationService.createInvestigationCnfm(list, investigationVO);
        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 등록확정한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationSaveCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO updateInvestigationSaveCnfm(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO = investigationService.updateInvestigationSaveCnfm(list, investigationVO);
        investigationVO.setResultYn(true);

        return investigationVO;
    }

    /**
     * 재고실사정보를 등록수정한다.(상태적용X)
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/multiInvestigationRegs.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiInvestigationRegs(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {

        int resultCnt = 0;
        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = saveVO.getInvestigationVO();




        resultCnt = investigationService.multiInvestigationRegs(saveVO, investigationVO);

        if(resultCnt > 0){
            resultCnt = 1;
        }

        return resultCnt;
    }

    /**
     * 재고실사문서  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationInfoByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO selectInvestigationInfoByKey(@RequestBody InvestigationSearchVO searchVO) throws Exception
    {

        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationService.selectInvestigationInfoByKey(searchVO);


        return investigationVO;
    }

    /**
     * 재고실사 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationManageMain.do", method = RequestMethod.GET)
    public String selectInvestigationManageMain(Model model,@RequestParam(value="pStockDdDocNo", defaultValue="") String pStockDdDocNo
            ,@RequestParam(value="pDocStatCd", defaultValue="") String pDocStatCd) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("langCd", langCd);
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("storageList", storageList);
        model.addAttribute("stockStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("docStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList", unitCdList);

        model.addAttribute("pStockDdDocNo", pStockDdDocNo);
        model.addAttribute("pDocStatCd", pDocStatCd);


        model.addAttribute("sysDate", dateFormat);
        model.addAttribute("usrId", LoginUtil.getUserId());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/stm/investigation/selectInvestigationManageMain";

    }

    /**
     * 재고실사승인요청 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectApproveReqInvestigations.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectApproveReqInvestigations(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationByKey(searchVO));
        }

        return result;

    }

    /**
     * 재고실사 리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationsPop.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationsPop(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationListByCondition(searchVO));
        }

        return result;

    }

    /**
     * 재고실사  헤더를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationListByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InvestigationVO selectInvestigationListByKey(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        InvestigationVO investigationVO = new InvestigationVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        investigationVO = investigationService.selectInvestigationListByKey(searchVO);

        if(investigationVO == null){
            investigationVO = new InvestigationVO();
        }

        return investigationVO;

    }


    /**
     * 재고실사 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/multiInvestigations.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiInvestigations(@Validated @RequestBody InvestigationSaveVO saveVO)  throws Exception {
        InvestigationVO investigationVO = saveVO.getInvestigationVO();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        investigationService.multiInvestigations(saveVO, investigationVO);

        return true;
    }

    /**
     * 재고실사 승인요청한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationApplyReq.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationApplyReq(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {
    	investigationListVO.getInvestigationVO().setRegUsrId(LoginUtil.getUserId());
    	investigationListVO.getInvestigationVO().setDlrCd(LoginUtil.getDlrCd());

        return investigationService.updateInvestigationApplyReq(investigationListVO.getInvestigationItemList(), investigationListVO.getInvestigationVO());
    }

    /**
     * 재고실사 헤더 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationHeaderByKey(@RequestBody InvestigationVO investigationVO)  throws Exception {
        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        return investigationService.updateInvestigationHeaderByKey(investigationVO);
    }

    /**
     * 재고실사 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/cancelInvestigationByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelInvestigationByKey(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {


        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        int result = investigationService.deleteInvestigation(list, investigationVO);

        return result;
    }

    /**
     * 재고실사 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationApproveMain.do", method = RequestMethod.GET)
    public String selectInvestigationApproveMain(Model model,@RequestParam(value="pStockDdDocNo", defaultValue="") String pStockDdDocNo) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("storageList", storageList);
        model.addAttribute("stockStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd));
        model.addAttribute("docStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("itemStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("pStockDdDocNo", pStockDdDocNo);
        model.addAttribute("sysDate", dateFormat);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/stm/investigation/selectInvestigationApproveMain";
    }

    /**
     * 재고조정 승인한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationApplyCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationApplyCnfm(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {


        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        int result = investigationService.updateInvestigationApplyCnfm(list, investigationVO);


        return result;
    }

    /**
     * 재고조정(Shortage출고)한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/createInvestigationOverageReserve.do", method = RequestMethod.POST)
    @ResponseBody
    public int createInvestigationOverageReserve(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {


        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        int result = investigationService.createInvestigationOverageReserve(list, investigationVO);


        return result;
    }
    /**
     * 재고조정(Overage입고)한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/createInvestigationShortageIssue.do", method = RequestMethod.POST)
    @ResponseBody
    public int createInvestigationShortageIssue(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {


        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        int result = investigationService.createInvestigationShortageIssue(list, investigationVO);


        return result;
    }

    /**
     * 재고실사 반려한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/updateInvestigationByReject.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvestigationByReject(@Validated @RequestBody InvestigationListVO investigationListVO)  throws Exception {


        InvestigationVO investigationVO = new InvestigationVO();
        investigationVO = investigationListVO.getInvestigationVO();
        List<InvestigationItemVO> list = investigationListVO.getInvestigationItemList();

        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setDlrCd(LoginUtil.getDlrCd());

        int result = investigationService.updateInvestigationByReject(list, investigationVO);


        return result;
    }

    /**
     * 재고실사 현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationList.do", method = RequestMethod.GET)
    public String selectInvestigationList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList", storageList);
        model.addAttribute("stockStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd)); //상태
        model.addAttribute("docStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("stockLockYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("sysDate", sysDate);
        return "/par/stm/investigation/selectInvestigationList";

    }

    /**
     * PDA 재고실사 현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectPdaInvestigationList.do", method = RequestMethod.GET)
    public String selectPdaInvestigationList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd)); //상태
        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("toDt",                 sysDate);
        model.addAttribute("sevenDtBf",            sevenDtBf);
        model.addAttribute("sysDate",              sysDate);

        return "/par/stm/investigation/selectPdaInvestigationList";
    }

    /**
     *  재고실사 차이 현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationDiffeList.do", method = RequestMethod.GET)
    public String selectInvestigationDiffeList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd)); //상태
        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("toDt",                 sysDate);
        model.addAttribute("sevenDtBf",            sevenDtBf);
        model.addAttribute("sysDate",              sysDate);

        return "/par/stm/investigation/selectInvestigationDiffeList";
    }

    /**
     *  재고실사  현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationStatusList.do", method = RequestMethod.GET)
    public String selectInvestigationStatusList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd)); //상태
        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("itemDstinList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        model.addAttribute("toDt",                 sysDate);
        model.addAttribute("sevenDtBf",            sevenDtBf);
        model.addAttribute("sysDate",              sysDate);

        return "/par/stm/investigation/selectInvestigationStatusList";
    }

    /**
     * 실사문서를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationListGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationListGrid(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationListGridByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationListGridByCondition(searchVO));
        }

        return result;

    }

    /**
     * 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationListDetailGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationListDetailGrid(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(investigationService.selectInvestigationListDetailGridByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationListDetailGridByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고조정 현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectStockAdjustStatusList.do", method = RequestMethod.GET)
    public String selectStockAdjustStatusList(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",          storageList);
        model.addAttribute("stockStatList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR004", null, langCd)); //상태
        model.addAttribute("docStatList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("stockLockYnList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR411", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemStatList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR413", null, langCd));
        model.addAttribute("toDt",                 sysDate);
        model.addAttribute("sevenDtBf",            sevenDtBf);
        model.addAttribute("sysDate",              sysDate);

        return "/par/stm/investigation/selectStockAdjustStatusList";
    }

    /**
     * 재고실사(Shortage출고) 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationForIssueByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationForIssueByKey(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationForIssueByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationForIssueByKey(searchVO));
        }

        return result;

    }

    /**
     * 재고실사(Overage입고) 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationForReserveByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationForReserveByKey(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(investigationService.selectInvestigationForReserveByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationForReserveByKey(searchVO));
        }

        return result;

    }


    /**
     * 재고실사대상 부품 창고 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationStrge.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationStrge(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(investigationService.selectInvestigationStrgeByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationStrgeByKey(searchVO));
        }

        return result;
    }

    /**
     * 재고실사 부품 정보를 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/investigation/selectInvestigationItem.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvestigationItem(@RequestBody InvestigationSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(investigationService.selectInvestigationItemByStrgeCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(investigationService.selectInvestigationItemByStrge(searchVO));
        }

        return result;
    }


    /**
     * 全库盘点
     * @author liuxueying
     * @param investigationListVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/stm/investigation/createInvestigationForStrage.do", method = RequestMethod.POST)
    @ResponseBody
    public String createInvestigationForStrage(@RequestBody InvestigationListVO investigationListVO)  throws Exception {

        String nos = investigationService.createInvestigationForStrage(investigationListVO.getInvestigationVO());

        return nos;
    }
    
    /**
     * 导入盘点结果
     * @author liuxueying
     * @param uploadFile
     * @param progressId
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/stm/investigation/insertInvestigationExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertInvcReceiveEtcExcelUploadFile(
    		
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("sStockDdDocNo") String sStockDdDocNo,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<InvestigationItemVO> list = new ArrayList<InvestigationItemVO>();
        List<InvestigationItemVO> resultList = new ArrayList<InvestigationItemVO>();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<InvestigationItemVO> excelReader = new ExcelReader<InvestigationItemVO>(InvestigationItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(2);
                list = excelReader.readExcelData(status);
                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){
                	  errors = new ArrayList<ExcelUploadError>();
                	  if( list.get(i).getErrorCount() > 0){
                		  totErrCnt = totErrCnt + 1;
                		  resultList.add(list.get(i));
                	  }else{
                		//验证配件编号 仓库  货位  货位2是否存在一条记录 
                		  InvestigationSearchVO searchVO = new InvestigationSearchVO();
                		  searchVO.setsItemCd(list.get(i).getExcelItemCd());
                		  searchVO.setsStrgeNm(list.get(i).getExcelStrgeNm());
                		  searchVO.setsLocCd(list.get(i).getExcelLocCd());
                		  searchVO.setsLocCdMig(list.get(i).getExcelLocCdMig());
                		  searchVO.setsStockDdDocNo(sStockDdDocNo);
                		  searchVO.setsDlrCd(LoginUtil.getDlrCd());
                		  InvestigationItemVO checkVo = investigationService.checkImportData(searchVO);
                	      if(checkVo == null){
                	    	  list.get(i).setErrorCount(1);
                              msg = messageSource.getMessage(
                                      "global.info.emptyParamInfo"
                                      , new String[]{
                                              messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())
                                      }
                                      , LocaleContextHolder.getLocale()
                                  );

                              errors.add(new ExcelUploadError(i, 0, list.get(i).getExcelItemCd(), msg));

                              list.get(i).setErrors(errors);

                              totErrCnt = totErrCnt + 1;
                              resultList.add(list.get(i));
                	      }else{
                	    	  list.get(i).setItemCd(list.get(i).getExcelItemCd());
                	    	  list.get(i).setStrgeCd(checkVo.getStrgeCd());
                	    	  list.get(i).setDlrCd(LoginUtil.getDlrCd());
                	    	  list.get(i).setStockDdDocNo(sStockDdDocNo);
                	    	  investigationService.updateBathByExcel(list.get(i));
                	      }
                	  }
                }
                status.setStep(ExcelUploadStatus.COMPLETED);
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
}
