package chn.bhmc.dms.par.pcm.web;

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

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

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
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcListVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSaveVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;

/**
 * 기타입고 관리 컨트롤러
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
public class ReceiveEtcController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 기타입고 서비스
     */
    @Resource(name="receiveEtcService")
    ReceiveEtcService receiveEtcService;


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
     * 기타입고 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcMain(Model model,@RequestParam(value="pReceiveEtcNo", defaultValue="") String pReceiveEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pReceiveEtcNo",      pReceiveEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("grReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/pcm/receive/selectReceiveEtcMain";
    }

    /**
     * 기타입고(차입) 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcBorrowMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcBorrowMain(Model model,@RequestParam(value="pReceiveEtcNo", defaultValue="") String pReceiveEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        String sysDate     = DateUtil.getDate(dateFormat);
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
        model.addAttribute("pReceiveEtcNo",      pReceiveEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("grReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        return "/par/pcm/receive/selectReceiveEtcBorrowMain";
    }

    /**
     * 기타입고(대여반환) 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcReturnMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcReturnMain(Model model,@RequestParam(value="pReceiveEtcNo", defaultValue="") String pReceiveEtcNo) throws Exception  {

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
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pReceiveEtcNo",      pReceiveEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("frDt",             monthBf);
        model.addAttribute("grReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/pcm/receive/selectReceiveEtcReturnMain";
    }

    /**
     * 기타입고(재고조정) 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcStockAdjustMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcStockAdjustMain(Model model,@RequestParam(value="pReceiveEtcNo", defaultValue="") String pReceiveEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("regUsrNm", LoginUtil.getUserNm());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("pReceiveEtcNo", pReceiveEtcNo);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("grReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("docStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));

        return "/par/pcm/receive/selectReceiveEtcStockAdjustMain";
    }

    /**
     * 기타입고(내부수령) 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcInnerMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcInnerMain(Model model,@RequestParam(value="pReceiveEtcNo", defaultValue="") String pReceiveEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pReceiveEtcNo",    pReceiveEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("grReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/pcm/receive/selectReceiveEtcInnerMain";
    }

    /**
     * 기타입고를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/receive/createReceiveEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveEtc(@Validated @RequestBody ReceiveEtcListVO receiveEtcListVO)  throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = receiveEtcListVO.getReceiveEtcVO();
        List<ReceiveEtcItemVO> list = receiveEtcListVO.getReceiveEtcItemList();


        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        if(receiveEtcVO.getMvtTp().equals("49")){//재고조정입고인 경우
            receiveEtcVO.setBpCd(LoginUtil.getDlrCd());
        }

        receiveEtcVO = receiveEtcService.createReceiveEtc(list, receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기타입고를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/receive/createReceiveEtcReg.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveEtcReg(@Validated @RequestBody ReceiveEtcListVO receiveEtcListVO)  throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = receiveEtcListVO.getReceiveEtcVO();
        List<ReceiveEtcItemVO> list = receiveEtcListVO.getReceiveEtcItemList();


        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        if(receiveEtcVO.getMvtTp().equals("49")){//재고조정입고인 경우
            receiveEtcVO.setBpCd(LoginUtil.getDlrCd());
        }

        receiveEtcVO = receiveEtcService.createReceiveEtcReg(list, receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기타입고를 확정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/createReceiveEtcCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveEtcCnfm(@Validated @RequestBody ReceiveEtcListVO receiveEtcListVO)  throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = receiveEtcListVO.getReceiveEtcVO();
        List<ReceiveEtcItemVO> list = receiveEtcListVO.getReceiveEtcItemList();


        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        receiveEtcVO = receiveEtcService.createReceiveEtcCnfm(list, receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기타입고를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/multiReceiveEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiReceiveEtcs(@Validated @RequestBody ReceiveEtcSaveVO saveVO) throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = saveVO.getReceiveEtcVO();

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());

        receiveEtcService.multiReceiveEtcs(saveVO, receiveEtcVO);

        return true;
    }

    /**
     * 기타입고(차입등기입고)를 취소한다. (등록 - 취소)
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/regCancReceiveEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean regCancReceiveEtcs(@Validated @RequestBody ReceiveEtcVO regReceiveEtcVO) throws Exception {

        regReceiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        regReceiveEtcVO.setDlrCd(LoginUtil.getDlrCd());

        receiveEtcService.regCancReceiveEtcs(regReceiveEtcVO);

        return true;
    }

    /**
     * 기타입고를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/receive/cancelReceiveEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveEtcs(@Validated @RequestBody ReceiveEtcListVO receiveEtcListVO)  throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = receiveEtcListVO.getReceiveEtcVO();
        List<ReceiveEtcItemVO> list = receiveEtcListVO.getReceiveEtcItemList();


        receiveEtcService.cancelReceiveEtc(list, receiveEtcVO);


        return true;
    }

    /**
     * 기타입고를 반품한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/returnInvcReceiveEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO returnInvcReceiveEtc(@Validated @RequestBody ReceiveEtcListVO receiveEtcListVO)  throws Exception {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcVO = receiveEtcListVO.getReceiveEtcVO();
        List<ReceiveEtcItemVO> list = receiveEtcListVO.getReceiveEtcItemList();


        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());

        receiveEtcVO = receiveEtcService.returnInvcReceiveEtc(list, receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기타입고 헤더정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/updateReceiveEtc.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateReceiveEtc(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());

        int result = receiveEtcService.updateReceiveEtc(receiveEtcVO);

        return result;
    }

    /**
     * 기타입고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO selectReceiveEtcByKey(@RequestBody ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception
    {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO = receiveEtcService.selectReceiveEtcByKey(receiveEtcSearchVO);


        return receiveEtcVO;
    }

    /**
     * 구매입고기타입고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveReturnEtcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO selectReceiveReturnEtcByKey(@RequestBody ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception
    {

        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO = receiveEtcService.selectReceiveReturnEtcByKey(receiveEtcSearchVO);


        return receiveEtcVO;
    }

    /**
     * 기타입고 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcItemByKey(@RequestBody ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(receiveEtcService.selectReceiveEtcItemByKey(receiveEtcSearchVO));

        return result;
    }

    /**
     * 기타입고 부품 데이타(반품용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcReturnItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcReturnItemByKey(@RequestBody ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(receiveEtcService.selectReceiveEtcReturnItemByKey(receiveEtcSearchVO));

        return result;
    }

    /**
     * 기타입고 부품 데이타(반품용)를 조회한다.(이동평균가를 수불정보에서 가져온다.)
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcReturnDocItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcReturnDocItemByKey(@RequestBody ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(receiveEtcService.selectReceiveEtcReturnDocItemByKey(receiveEtcSearchVO));

        return result;
    }

    /**
     * 기타입고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcs(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기타입고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcForReturns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcForReturns(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcForReturnsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcForReturnsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차입입고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectBorrowItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBorrowItemByKey(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(receiveEtcService.selectBorrowItemByKey(searchVO));

        return result;
    }


    /**
     * 기타입고 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcList.do", method = RequestMethod.GET)
    public String selectReceiveEtcList(Model model)  throws Exception  {

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
        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",           LoginUtil.getUserId());
        model.addAttribute("pltCd",              LoginUtil.getPltCd());
        model.addAttribute("toDt",               sysDate);
        model.addAttribute("sevenDtBf",          sevenDtBf);
        model.addAttribute("trsfTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("receiveEtcTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("receiveEtcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("mvtTpList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/pcm/receive/selectReceiveEtcList";
    }

    /**
     * 입고반품 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveReturnMain.do", method = RequestMethod.GET)
    public String selectReceiveReturnMain(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo,@RequestParam(value="pBpCd", defaultValue="") String pBpCd,@RequestParam(value="pBpNm", defaultValue="") String pBpNm)  throws Exception  {

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
        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",           LoginUtil.getUserId());
        model.addAttribute("pltCd",              LoginUtil.getPltCd());
        model.addAttribute("toDt",               sysDate);
        model.addAttribute("sevenDtBf",          sevenDtBf);
        model.addAttribute("pPurcOrdNo",         pPurcOrdNo);
        model.addAttribute("pBpCd",              pBpCd);
        model.addAttribute("pBpNm",              pBpNm);
        model.addAttribute("trsfTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("receiveEtcTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("receiveEtcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("mvtTpList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/pcm/receive/selectReceiveReturnMain";
    }

    /**
     * 입고반품 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectInvcReceiveEtcReturnMain.do", method = RequestMethod.GET)
    public String selectInvcReceiveEtcReturnMain(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);


        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",           LoginUtil.getUserId());
        model.addAttribute("pltCd",              LoginUtil.getPltCd());
        model.addAttribute("toDt",               sysDate);
        model.addAttribute("sevenDtBf",          sevenDtBf);
        model.addAttribute("bpCd",               venderMasterVO.getBpCd());
        model.addAttribute("bpNm",               venderMasterVO.getBpNm());
        model.addAttribute("bpTp",               venderMasterVO.getBpTp());
        model.addAttribute("trsfTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("receiveEtcTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("receiveEtcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("storageList",        storageList);
        model.addAttribute("mvtTpList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/pcm/receive/selectInvcReceiveEtcReturnMain";
    }

    /**
     * 조달입고 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcFundsMain.do", method = RequestMethod.GET)
    public String selectReceiveEtcFundsMain(Model model, @RequestParam(value="sEtcGrDocNo", defaultValue="") String sEtcGrDocNo)  throws Exception  {

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
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        //링크이동시 조달입고 데이터셋팅
        if(!sEtcGrDocNo.equals("")){
            model.addAttribute("etcGrDocNoParam", sEtcGrDocNo);
        }
        return "/par/pcm/receive/selectReceiveEtcFundsMain";
    }

    /**
     * 조달입고 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcFundsStatusSummary.do", method = RequestMethod.GET)
    public String selectReceiveEtcFundsStatusSummary(Model model)  throws Exception  {

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

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd));

        return "/par/pcm/receive/selectReceiveEtcFundsStatusSummary";
    }

    /**
     * 조달입고대기리스트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issueProcure/selectReceiveProcureList.do", method = RequestMethod.GET)
    public String selectReceiveProcureList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd));

        return "/par/ism/issueProcure/selectReceiveProcureList";
    }

    /**
     * 기타입고 집계 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcListByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기타입고 명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcDetailListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcDetailListByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcDetailListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcDetailListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매입고 반품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcReturnsByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcReturnsByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcReturnsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcReturnsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매입고 반품 집계 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcReturnSummaryListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcReturnSummaryListByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcReturnSummaryListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcReturnSummaryListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매입고 반품 데이타를 조회한다.(반품문서기준)
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectPurcReceiveReturnsByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcReceiveReturnsByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectPurcReceiveReturnsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectPurcReceiveReturnsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매입고 반품 집계 데이타를 조회한다.(반품문서기준)
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectPurcReceiveReturnSummaryListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcReceiveReturnSummaryListByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectPurcReceiveReturnSummaryListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectPurcReceiveReturnSummaryListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차입입고 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcBorrowStatusSummary.do", method = RequestMethod.GET)
    public String selectReceiveEtcBorrowStatusSummary(Model model)  throws Exception  {

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

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd));

        return "/par/pcm/receive/selectReceiveEtcBorrowStatusSummary";
    }

    /**
     * 기타입고(차입입고) 명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcBorrowDetailListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcBorrowDetailListByCondition(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveEtcBorrowDetailListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcBorrowDetailListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기초재고입고 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitStockMain.do", method = RequestMethod.GET)
    public String selectReceiveInitStockMain(Model model)  throws Exception  {

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
        model.addAttribute("dlrNm",            LoginUtil.getDlrNm());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        return "/par/pcm/receive/selectReceiveInitStockMain";
    }

    /**
     * 기초재고입고(엑셀없이 DB데이터로) 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitByDataMain.do", method = RequestMethod.GET)
    public String selectReceiveInitByDataMain(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

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
        model.addAttribute("dlrNm",            LoginUtil.getDlrNm());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/pcm/receive/selectReceiveInitByDataMain";
    }

    /**
     * 기초재고입고를 등록한다.(테이블에서 즉시)
     * @return
    */
    @RequestMapping(value = "/par/pcm/receive/createReceiveInitByDataReg.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveInitByDataReg(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        receiveEtcVO = receiveEtcService.createReceiveInitByDataReg(receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기초재고입고를 확정한다.(테이블에서 즉시)
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/createReceiveInitByDataCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveInitByDataCnfm(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        receiveEtcVO = receiveEtcService.createReceiveInitByDataCnfm(receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     * 기초재고입고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitDataByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveInitDataByKey(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveInitItemByKeyCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveInitItemByKey(searchVO));
        }

        return result;
    }

    /**
     * 기초재고입고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitTargetData.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveInitTargetData(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectReceiveInitListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveInitListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기초재고입고를 취소(기타입고문서번호 라인별)한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/cancelReceiveInitByData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveInitByData(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcService.cancelReceiveInitByData(receiveEtcVO);

        return true;
    }

    /**
     * 기초재고입고를 취소(기타입고문서번호 )한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/cancelReceiveInitByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveInitByKey(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcService.cancelReceiveInitByKey(receiveEtcVO);

        return true;
    }

    /**
     * 기초재고입고 정비수령용(엑셀없이 DB데이터로) 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitByRepairOrderDataMain.do", method = RequestMethod.GET)
    public String selectReceiveInitByRepairOrderDataMain(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

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
        model.addAttribute("dlrNm",            LoginUtil.getDlrNm());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        return "/par/pcm/receive/selectReceiveInitByRepairOrderDataMain";
    }

    /**
     *  정비수령용 기초재고입고를 등록한다.(테이블에서 즉시)
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/createReceiveInitByRepairOrderDataReg.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveInitByRepairOrderDataReg(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        receiveEtcVO = receiveEtcService.createReceiveInitByRepairOrderDataReg(receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }

    /**
     *  정비수령용 기초재고입고를 확정한다.(테이블에서 즉시)
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/createReceiveInitByRepairOrderDataCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO createReceiveInitByRepairOrderDataCnfm(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());

        receiveEtcVO = receiveEtcService.createReceiveInitByRepairOrderDataCnfm(receiveEtcVO);

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }


    /**
     * 정비수령용 기초재고입고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectRepairOrderInitTargetData.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepairOrderInitTargetData(@RequestBody ReceiveEtcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcService.selectRepairOrderInitListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectRepairOrderInitListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 정비수령용 기초재고입고를 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/cancelReceiveInitByRepairOrderData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveInitByRepairOrderData(@RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        receiveEtcService.cancelReceiveInitByRepairOrderData(receiveEtcVO);

        return true;
    }

    /**
     * 기초재고 입고 실행 프로시저
     * @return
     */
    @RequestMapping(value = "/par/pcm/executeReceiveEtcInitProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean executeParInvoiceInfcProcedure(@RequestBody ReceiveEtcVO receiveEtcVO) throws Exception {

        boolean retFalg = false;

        ReceiveEtcSearchVO searchVO01 = new ReceiveEtcSearchVO();
        searchVO01.setsDlrCd(LoginUtil.getDlrCd());
        searchVO01.setsInitDataYn("Y");
        int iApplyYnYCnt = receiveEtcService.selectReceiveInitListByConditionCnt(searchVO01);
        //searchVO01.setsInitDataYn("C");
        //int iApplyYnCCnt = receiveEtcService.selectReceiveInitListByConditionCnt(searchVO01);

        if(iApplyYnYCnt > 0){  // iApplyYnCCnt == 0 && iApplyYnYCnt > 0 에서 변경. 2017-11-09. 이유 : 기초재고입고V2는 한번만 쓰는게 아니다.
            receiveEtcService.executeReceiveEtcInitProcedure(receiveEtcVO);
            retFalg = true;
        }/*else if(iApplyYnCCnt > 0 && iApplyYnYCnt == 0){
            retFalg = true;
        }*/

        return retFalg;
    }

}
