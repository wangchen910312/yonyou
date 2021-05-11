package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

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
import chn.bhmc.dms.par.ism.service.IssueEtcService;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcListVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;

/**
 * 기타출고 관리 컨트롤러
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
public class IssueEtcController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 기타출고 서비스
     */
    @Resource(name="issueEtcService")
    IssueEtcService issueEtcService;


    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

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
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;


    /**
     * 기타출고(내부출고) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcInnerMain.do", method = RequestMethod.GET)
    public String selectIssueEtcInnerMain(Model model,@RequestParam(value="pIssueEtcNo", defaultValue="") String pIssueEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);


        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pIssueEtcNo",      pIssueEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/ism/issue/selectIssueEtcInnerMain";

    }
    /**
     * 기타출고(대여) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcRentalMain.do", method = RequestMethod.GET)
    public String selectIssueEtcRentalMain(Model model,@RequestParam(value="pIssueEtcNo", defaultValue="") String pIssueEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);


        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pIssueEtcNo",      pIssueEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issue/selectIssueEtcRentalMain";

    }
    /**
     * 기타출고(차입반환) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcReturnMain.do", method = RequestMethod.GET)
    public String selectIssueEtcReturnMain(Model model,@RequestParam(value="pIssueEtcNo", defaultValue="") String pIssueEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        String monthBf     = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }


        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pIssueEtcNo",      pIssueEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("frDt",             monthBf);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        return "/par/ism/issue/selectIssueEtcReturnMain";

    }

    /**
     * 기타출고(재고조정) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcStockAdjustMain.do", method = RequestMethod.GET)
    public String selectIssueEtcInvestigationMain(Model model,@RequestParam(value="pIssueEtcNo", defaultValue="") String pIssueEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("regUsrNm", LoginUtil.getUserNm());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pIssueEtcNo",      pIssueEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("sysDate",          DateUtil.getDate(dateFormat));
        model.addAttribute("docStatList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));

        return "/par/ism/issue/selectIssueEtcStockAdjustMain";

    }

    /**
     * 기타출고를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/ism/issue/createIssueEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueEtcVO createIssueEtc(@Validated @RequestBody IssueEtcListVO issueEtcListVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = issueEtcListVO.getIssueEtcVO();
        List<IssueEtcItemVO> list = issueEtcListVO.getIssueEtcItemList();


        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());
        issueEtcVO.setPltCd(LoginUtil.getPltCd());
        issueEtcVO.setRegDt(new Date());

        if(issueEtcVO.getMvtTp().equals("43")){//재고조정출고인 경우
            issueEtcVO.setBpCd(LoginUtil.getDlrCd());
        }

        issueEtcVO = issueEtcService.createIssueEtc(list, issueEtcVO);

        issueEtcVO.setResultYn(true);

        return issueEtcVO;
    }

    /**
     * 기타출고를 등록한다.(수불발생X)
     * @return
    */
    @RequestMapping(value = "/par/ism/issue/createIssueEtcReg.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueEtcVO createIssueEtcReg(@Validated @RequestBody IssueEtcListVO issueEtcListVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = issueEtcListVO.getIssueEtcVO();
        List<IssueEtcItemVO> list = issueEtcListVO.getIssueEtcItemList();


        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());
        issueEtcVO.setPltCd(LoginUtil.getPltCd());
        issueEtcVO.setRegDt(new Date());

        if(issueEtcVO.getMvtTp().equals("43")){//재고조정출고인 경우
            issueEtcVO.setBpCd(LoginUtil.getDlrCd());
        }

        issueEtcVO = issueEtcService.createIssueEtcReg(list, issueEtcVO);

        issueEtcVO.setResultYn(true);

        return issueEtcVO;
    }

    /**
     * 기타출고를 확정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/createIssueEtcCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueEtcVO createIssueEtcCnfm(@Validated @RequestBody IssueEtcListVO issueEtcListVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = issueEtcListVO.getIssueEtcVO();
        List<IssueEtcItemVO> list = issueEtcListVO.getIssueEtcItemList();


        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());
        issueEtcVO.setPltCd(LoginUtil.getPltCd());
        issueEtcVO.setRegDt(new Date());

        issueEtcVO = issueEtcService.createIssueEtcCnfm(list, issueEtcVO);

        issueEtcVO.setResultYn(true);

        return issueEtcVO;
    }

    /**
     * 기타출고를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/multiIssueEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueEtcs(@Validated @RequestBody IssueEtcSaveVO saveVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = saveVO.getIssueEtcVO();

        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());

        issueEtcService.multiIssueEtcs(saveVO, issueEtcVO);

        return true;
    }

    /**
     * 기타출고(차출등기출고)를 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/regCancIssueEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean regCancIssueEtcs(@Validated @RequestBody IssueEtcVO regIssueEtcVO)  throws Exception {

        regIssueEtcVO.setRegUsrId(LoginUtil.getUserId());
        regIssueEtcVO.setDlrCd(LoginUtil.getDlrCd());

        issueEtcService.regCancIssueEtcs(regIssueEtcVO);

        return true;
    }

    /**
     * 기타출고를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/ism/issue/cancelIssueEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelIssueEtc(@Validated @RequestBody IssueEtcListVO issueEtcListVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = issueEtcListVO.getIssueEtcVO();
        List<IssueEtcItemVO> list = issueEtcListVO.getIssueEtcItemList();

        issueEtcService.cancelIssueEtc(list, issueEtcVO);


        return true;
    }

    /**
     * 기타출고 헤더정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/updateIssueEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateIssueEtc(@RequestBody IssueEtcVO issueEtcVO)  throws Exception {

        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());

        int result = issueEtcService.updateIssueEtc(issueEtcVO);

        return result;
    }

    /**
     * 기타출고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueEtcVO selectIssueEtcByKey(@RequestBody IssueEtcSearchVO issueEtcSearchVO) throws Exception
    {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueEtcVO = issueEtcService.selectIssueEtcByKey(issueEtcSearchVO);


        return issueEtcVO;
    }

    /**
     * 기타출고 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcItemByKey(@RequestBody IssueEtcSearchVO issueEtcSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        issueEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(issueEtcService.selectIssueEtcItemByKey(issueEtcSearchVO));

        return result;
    }

    /**
     * 기타출고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcs(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issueEtcService.selectIssueEtcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차출출고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectRentalItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRentalItemByKey(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(issueEtcService.selectRentalItemByKey(searchVO));

        return result;
    }

    /**
     * 기타(조달)출고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcFunds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcFunds(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issueEtcService.selectIssueEtcFundsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcFundsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 기타출고 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcList.do", method = RequestMethod.GET)
    public String selectIssueEtcList(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",          LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",       LoginUtil.getUserId());
        model.addAttribute("pltCd",          LoginUtil.getPltCd());
        model.addAttribute("toDt",           sysDate);
        model.addAttribute("sevenDtBf",      sevenDtBf);
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("issueEtcTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("issueEtcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/ism/issue/selectIssueEtcList";

    }

    /**
     * 기타출고 조달 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcFundsMain.do", method = RequestMethod.GET)
    public String selectIssueEtcFundsMain(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        /*String sysDate     = DateUtil.getDate(dateFormat);*/
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);


        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }


       // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",          LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",       LoginUtil.getUserId());
        model.addAttribute("pltCd",          LoginUtil.getPltCd());
        model.addAttribute("toDt",           sysDate);
        model.addAttribute("sevenDtBf",      sevenDtBf);
        model.addAttribute("issueEtcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());


        return "/par/ism/issue/selectIssueEtcFundsMain";

    }

    @RequestMapping(value = "/par/ism/cmm/selectPartsInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopup(Model model, HttpServletRequest request) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //model.addAttribute("baseNames", baseNames);

        return "/par/ism/cmm/selectPartsInfoExcelUploadPopup";
    }

    /**
     * 조달출고 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcFundsStatusSummary.do", method = RequestMethod.GET)
    public String selectIssueEtcFundsStatusSummary(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        /*String sysDate     = DateUtil.getDate(dateFormat);*/
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));

        return "/par/ism/issue/selectIssueEtcFundsStatusSummary";

    }

    /**
     * 기타출고 집계 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcListByCondition(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issueEtcService.selectIssueEtcListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기타출고 명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcDetailListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcDetailListByCondition(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issueEtcService.selectIssueEtcDetailListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcDetailListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차출출고 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcRentalStatusSummary.do", method = RequestMethod.GET)
    public String selectIssueEtcRentalStatusSummary(Model model)  throws Exception  {

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

       // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("storageList", storageList);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));

        return "/par/ism/issue/selectIssueEtcRentalStatusSummary";

    }

    /**
     * 기타출고(차출출고) 명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueEtcRentalDetailListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcRentalDetailListByCondition(@RequestBody IssueEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issueEtcService.selectIssueEtcRentalDetailListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcRentalDetailListByCondition(searchVO));
        }

        return result;
    }


    /*
    @RequestMapping(value = "/par/ism/issue/insertIssueEtcExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertIssueEtcExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<IssueEtcItemVO> list = new ArrayList<IssueEtcItemVO>();
        List<IssueEtcItemVO> resultList = new ArrayList<IssueEtcItemVO>();
        IssueEtcItemVO       chkIssueEtcItem = new IssueEtcItemVO();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<IssueEtcItemVO> excelReader = new ExcelReader<IssueEtcItemVO>(IssueEtcItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);


                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    chkIssueEtcItem = new IssueEtcItemVO();
                    errors         = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       resultList.add(list.get(i));
                   }else{

                       list.get(i).setDlrCd(LoginUtil.getDlrCd());
                       list.get(i).setBpCd(venderMasterVO.getBpCd());

                       chkIssueEtcItem =   issueEtcService.selectIssueEtcItemExcelUploadByKey(list.get(i));

                       //부품마스터에 없는 부품인경우
                       if(chkIssueEtcItem  == null){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "global.info.emptyParamInfo"
                                   , new String[]{
                                           messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }

                       //공급처가  없는 부품인경우
                       if(chkIssueEtcItem.getBpCd() == null){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "global.err.chkBpCdIsBMP"
                                   , new String[]{}
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }

                       list.get(i).setGrStrgeCd(chkIssueEtcItem.getGrStrgeCd());
                       list.get(i).setItemNm(chkIssueEtcItem.getItemNm());
                       list.get(i).setPurcItemTp(chkIssueEtcItem.getPurcItemTp());
                       list.get(i).setPurcItemStatCd(chkIssueEtcItem.getPurcItemStatCd());
                       list.get(i).setPurcUnitCd(chkIssueEtcItem.getPurcUnitCd());
                       list.get(i).setPurcQty(chkIssueEtcItem.getPurcQty());
                       list.get(i).setPurcPrc(chkIssueEtcItem.getPurcPrc());
                       list.get(i).setPurcAmt(chkIssueEtcItem.getPurcAmt());
                       list.get(i).setPurcLeadHm(chkIssueEtcItem.getPurcLeadHm());

                      // resultList.add(chkIssueEtcItem);
                      resultList.add(list.get(i));
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                }else{
                    result.setTotal(-999);
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

    }*/

}
