package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.OrdAppealService;
import chn.bhmc.dms.par.pcm.service.OrdReplyService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.vo.DBPartsAccSupSaveVO;
import chn.bhmc.dms.par.pcm.vo.DBPartsAccSupVO;
import chn.bhmc.dms.par.pcm.vo.InvcStatisticsVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealSearchVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealVO;
import chn.bhmc.dms.par.pcm.vo.OrdReplyVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 구매오더 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 02. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class PurcOrdController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

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
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    @Resource(name="ordAppealService")
    OrdAppealService ordAppealService;
    
    @Resource(name="divisionService")
    DivisionService divisionService;
    
    
    @Resource(name="ordReplyService")
    OrdReplyService ordReplyService;
    
    @Resource(name="officeService")
    OfficeService officeService;
    
    @Resource(name="userService")
    UserService UserService;
    /**
     * 구매오더 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdList.do", method = RequestMethod.GET)
    public String selectPurcOrdList(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",          LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",       LoginUtil.getUserId());
        model.addAttribute("pltCd",          LoginUtil.getPltCd());
        model.addAttribute("toDt",           sysDate);
        model.addAttribute("sevenDtBf",      sevenDtBf);
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("ammendCodeList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd));
        model.addAttribute("purcPgssCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd));  //구매진행상태상세코드
        model.addAttribute("divisionList", divisionService.selectDivisionList());
        return "/par/pcm/purcOrd/selectPurcOrdList";
    }

    /**
     * B/O 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/selectPurcBackOrdMain.do", method = RequestMethod.GET)
    public String selectPurcBackOrdMain(Model model,@RequestParam(value="sDlrCd", defaultValue="") String sDlrCd) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sDlrCd", sDlrCd);
        return "/par/pcm/purcBackOrd/selectPurcBackOrdMain";
    }

    /**
     * 딜러별 구매오더 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(purcOrdService.selectPurcOrdsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매헤더 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusListByCondition(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(purcOrdService.selectPurcOrdStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusByCondition(searchVO));
        }

        return result;
    }


    /**
     * 구매명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusDetailByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusDetailByCondition(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(purcOrdService.selectPurcOrdStatusDetailByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusDetailByCondition(searchVO));
        }

        return result;
    }
    
    /**
     * 配件缺货升级提报
     * @author liuxueying
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/selectPurcBoSubMain.do", method = RequestMethod.GET)
    public String selectPurcBoSubMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("appealTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR513", null, langCd));
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        model.addAttribute("bmpUsers",UserService.selectBMPUsers());//bmp账号
        
        return "/par/pcm/purcBackOrd/selectPurcBoSubMain";
    }
    
    /**
     * 提交申诉
     * @author liuxueying
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/subAppeal.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult subAppeal(@RequestBody OrdAppealVO ordAppealVO) throws Exception{
        SearchResult result = new SearchResult();
        ordAppealService.insertOrdAppeal(ordAppealVO);
        return result;
    }
    
    /**
     * 提交申诉
     * @author liuxueying
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/subRemind.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult subRemind(@RequestBody OrdAppealVO ordAppealVO) throws Exception{
        SearchResult result = new SearchResult();
        ordAppealService.insertOrdRemind(ordAppealVO);
        return result;
    }
    
    /**
     * 查询自己负责的经销商的可提报的待货记录
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusListForMe.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusListForMe(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(purcOrdService.selectPurcOrdStatusForMeCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusForMe(searchVO));
        }

        return result;
    }
    
    
  
    
    /**
     * 查询客户服务科登录人可回复的待货缺货记录
     * @param searchVO
     * @return
     * @throws Exception
     */
    /*@RequestMapping(value = "/par/pcm/purcOrd/selectOrdStatusListForCustServiceReply.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdStatusListForCustServiceReply(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsReplyStatus("0");
        result.setTotal(purcOrdService.selectPurcOrdStatusForMeCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusForMe(searchVO));
        }

        return result;
    }*/
    
    /**
     * 根据待货记录查询处理情况
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectDealList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealList(@RequestBody OrdAppealSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(ordAppealService.selectDealListCnt(searchVO));
        if(result.getTotal() != 0){
        	 result.setData(ordAppealService.selectDealList(searchVO));
        }
        return result;
    }
    /**
     * 回复---库存管理科
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/partStockBoReplyForStockManage.do", method = RequestMethod.GET)
    public String partStockBoReplyForStockManage(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("appealTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR513", null, langCd));
        
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("bmpUsers",UserService.selectBMPUsers());//bmp账号
        
        return "/par/pcm/purcBackOrd/partStockBoReplyForStockManage";
    }
    
    
    /**
     * 查询库存科可以回复的
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectOrdStatusListForStockManage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdStatusListForStockManage(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsReplyStatus("0");
        result.setTotal(purcOrdService.selectPurcOrdReplyByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdReplyByCondition(searchVO));
        }

        return result;
    }
    
    
    /**
     * 缺货升级支援科回复
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/partStockBoReplyForPurcSupport.do", method = RequestMethod.GET)
    public String partStockBoReplyForPurcSupport(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("appealTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR513", null, langCd));
        
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        return "/par/pcm/purcBackOrd/partStockBoReplyForPurcSupport";
    }
    
    
    /**
     * 采购支援科查询所属自己的回复
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectOrdStatusListForPurcSupport.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdStatusListForPurcSupport(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsReplyStatus("1");
        result.setTotal(purcOrdService.selectPurcOrdReplyByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdReplyByCondition(searchVO));
        }

        return result;
    }
    
    /**
     * 事业部汇总
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatisticsByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatisticsByCondition(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        List<InvcStatisticsVO> list = purcOrdService.selectPurcOrdStatisticsByCondition(searchVO);
        result.setData(list);
        result.setTotal(list.size());
        return result;
    }
    
    /**
     * 经销商汇总
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatisticsByDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatisticsByDlr(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        List<InvcStatisticsVO> list = purcOrdService.selectPurcOrdStatisticsByDlr(searchVO);
        result.setData(list);
        result.setTotal(list.size());
        return result;
    }
    
    /**
     * 供应商导入	配件对就供应商数据导入展示	采购科的审核画面，要增加配件供应商的展示，每个配件一个供应商，需要完成定期的导入处理
     * JiaMing 2020-11-17 
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/selectPartsAccSupInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectPartsAccSupInfoExcelUploadPopup(Model model) throws Exception {
        //return "/par/cmm/selectPartsAccSupInfoExcelUploadPopup";
        return "/par/pcm/purcBackOrd/selectPartsAccSupInfoExcelUploadPopup";
    }
    
    /**
     * 文件检索
     * JiaMing 2020-11-18 
     * @param uploadFile
     * @param progressId
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/insertPartsAccSupInfoBatchUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<DBPartsAccSupVO> list = new ArrayList<DBPartsAccSupVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<DBPartsAccSupVO> excelReader = new ExcelReader<DBPartsAccSupVO>(DBPartsAccSupVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);
                list = excelReader.readExcelData(status);
                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);
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
     * 配件对应 供应商导入 保存
     * JiaMing 2020-11-18 
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/insertPartsAccSupInfoBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadSave(@Validated @RequestBody DBPartsAccSupSaveVO batchUploadList) throws Exception {
    	 purcOrdService.insertPartsAccSupInfoBatchUpload(batchUploadList.getBatchUploadList());
    	 return true;
    }

 
    
    /**
     * 保存回复
     * @author liuxueying
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/replyAppeal.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult subAppeal(@RequestBody OrdReplyVO ordReplyVO) throws Exception{
        SearchResult result = new SearchResult();
        
        ordReplyService.insertOrdReply(ordReplyVO);
        return result;
    }
    
    
    /**
     * 升级查询页面
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcBackOrd/selectPurcBoSubInfoMain.do", method = RequestMethod.GET)
    public String selectPurcBoSubInfoMain(Model model,@RequestParam(value="sQuestionNo", defaultValue="")String sQuestionNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        model.addAttribute("bpCd",            "A10AA001");
        model.addAttribute("bpNm",            "BMP");
        model.addAttribute("bpTp",            "01");

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("appealTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR513", null, langCd));
        
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        model.addAttribute("sQuestionNo",sQuestionNo);
        model.addAttribute("divisionList", divisionService.selectDivisionList());
        model.addAttribute("officeList",officeService.selectOfficesList());
        return "/par/pcm/purcBackOrd/selectPurcBoSubInfoMain";
    }

    
    /**
     * 缺货升级查询
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcBoSubInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcBoSubInfo(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(purcOrdService.selectOrdBoInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectOrdBoInfoByCondition(searchVO));
        }

        return result;
    }
    
}
