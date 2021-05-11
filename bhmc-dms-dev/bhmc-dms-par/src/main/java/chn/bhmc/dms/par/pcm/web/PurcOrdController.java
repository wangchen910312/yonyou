package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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
import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.par.pcm.service.PurcInterfaceService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdListVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSaveVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
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
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    /**
     * 구매 인터페이스 서비스
     */
    @Resource(name="purcInterfaceService")
    PurcInterfaceService purcInterfaceService;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 선수금헤더 서비스
     */
    @Resource(name="advanceReceivedInfoHeaderService")
    AdvanceReceivedInfoHeaderService advanceReceivedInfoHeaderService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 구매오더 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdMain.do", method = RequestMethod.GET)
    public String selectPurcOrdMain(HttpServletRequest request,Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo,@RequestParam(value="pBpCd", defaultValue="") String pBpCd
            ,@RequestParam(value="pBpNm", defaultValue="") String pBpNm, @RequestParam(value="pItemDistinCd", defaultValue="") String pItemDistinCd) throws Exception  {
    	//liuxueying 控制订单重复提交 update start
    	String subOrderToken = UUID.randomUUID().toString();
    	WebUtils.setSessionAttribute(request, "subOrderToken", subOrderToken);
    	//liuxueying 控制订单重复提交 update end 
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
        AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = advanceReceivedInfoHeaderService.selectAdvanceReceivedInfoHeaderByKey(LoginUtil.getDlrCd());

        //선수금 정보 없을 때 Default VO 생성 처리.
        if(advanceReceivedInfoHeaderVO == null){
            advanceReceivedInfoHeaderVO = new AdvanceReceivedInfoHeaderVO();
        }

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("pPurcOrdNo",      pPurcOrdNo);
        model.addAttribute("pBpCd",           pBpCd);
        model.addAttribute("pBpNm",           pBpNm);
        model.addAttribute("pItemDistinCd",   pItemDistinCd);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("calcAmt",         advanceReceivedInfoHeaderVO.getCalcAmt());
        model.addAttribute("balAmt",          advanceReceivedInfoHeaderVO.getBalAmt());
        model.addAttribute("dlDistCd",        advanceReceivedInfoHeaderVO.getDlDistCd());
        model.addAttribute("lmtAmt",          advanceReceivedInfoHeaderVO.getLmtAmt());
        model.addAttribute("useAmt",          advanceReceivedInfoHeaderVO.getUseAmt());
        model.addAttribute("dpstAmt",         advanceReceivedInfoHeaderVO.getDpstAmt());
        model.addAttribute("cmcGnlDcRate",    advanceReceivedInfoHeaderVO.getCmcGnlDcRate());
        model.addAttribute("cmcDcRate",       advanceReceivedInfoHeaderVO.getCmcDcRate());
        model.addAttribute("gnlDcRate",       advanceReceivedInfoHeaderVO.getGnlDcRate());
        model.addAttribute("cmcEmgcDcRate",   advanceReceivedInfoHeaderVO.getCmcEmgcDcRate());

        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("pdcList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("bpTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        model.addAttribute("ammendCodeList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd));
        model.addAttribute("sucCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        model.addAttribute("subOrderToken",   subOrderToken);
        return "/par/pcm/purcOrd/selectPurcOrdMain";

    }

    /**
     * 구매오더를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/purcOrd/insertPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public PurcOrdVO createOrd(@Validated @RequestBody PurcOrdListVO purcOrdListVO)  throws Exception {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdVO = purcOrdListVO.getPurcOrdVO();
        List<PurcOrdItemVO> list = purcOrdListVO.getPurcOrdItemList();


        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());
        purcOrdVO.setPltCd(LoginUtil.getPltCd());

        //        如果为“ ”时，则为NULL    Update By Zhang QH
        if(StringUtils.isNotEmpty(purcOrdVO.getCoPack()) && " ".equals(purcOrdVO.getCoPack())){
            purcOrdVO.setCoPack(null);
        }

        purcOrdVO = purcOrdService.createOrd(list, purcOrdVO);

        purcOrdVO.setResultYn(true);

        return purcOrdVO;
    }

    /**
     * 구매오더를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/multiPurcOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPurcOrds(@Validated @RequestBody PurcOrdSaveVO saveVO)  throws Exception {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdVO = saveVO.getPurcOrdVO();

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        purcOrdService.multiPurcOrds(saveVO, purcOrdVO);

        return true;
    }

    /**
     * 구매오더 운송 유형을 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/updatePurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public int updatePurcOrd(@RequestBody PurcOrdVO purcOrdVO)  throws Exception {

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        int result = purcOrdService.updatePurcOrd(purcOrdVO);

        return result;
    }

    /**
     * 구매오더를 전송한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/sendPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    Map<String,String> sendPurcOrd(HttpServletRequest request,@Validated @RequestBody PurcOrdListVO purcOrdListVO)  throws Exception {
    	//liuxueying 订单重复提交验证 update start
    	Map<String,String> resultMap = new HashMap<String,String>();
        	String subOrderToken = (String)WebUtils.getSessionAttribute(request, "subOrderToken");
        	String subOrderTokenFromPage = purcOrdListVO.getSubOrderToken();
        	if(!StringUtils.equals(subOrderToken,subOrderTokenFromPage)){
        		resultMap.put("code", "-1111");
        		return resultMap;
        	}
        	
        	String newSubOrderToken = UUID.randomUUID().toString();
        	WebUtils.setSessionAttribute(request, "subOrderToken", newSubOrderToken);
        	resultMap.put("subOrderToken", newSubOrderToken);
        	//liuxueying 订单重复提交验证 update end

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdVO = purcOrdListVO.getPurcOrdVO();
        List<PurcOrdItemVO> list = purcOrdListVO.getPurcOrdItemList();

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        int result = purcInterfaceService.createOrdInterface(list, purcOrdVO);

        //int result = purcOrdService.sendPurcOrd(purcOrdVO);

        resultMap.put("code", ""+result);
        return resultMap;
    }

    /**
     * 구매오더를 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/cancelPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelPurcOrd(@Validated @RequestBody PurcOrdListVO purcOrdListVO)  throws Exception {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdVO = purcOrdListVO.getPurcOrdVO();
        List<PurcOrdItemVO> list = purcOrdListVO.getPurcOrdItemList();

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        int result = purcOrdService.cancelPurcOrd(list, purcOrdVO);

        return result;
    }

    /**
     * 구매오더를 수정 후 확정한다.(로컬업체 대상)
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/multiConfirmPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiConfirmPurcOrd(@Validated @RequestBody PurcOrdSaveVO saveVO)  throws Exception {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdVO = saveVO.getPurcOrdVO();

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        purcOrdService.multiConfirmPurcOrd(saveVO, purcOrdVO);

        return true;
    }

    /**
     * 구매오더를 확정한다.(로컬업체 대상)
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/confirmPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmPurcOrd(@Validated @RequestBody PurcOrdVO purcOrdVO)  throws Exception {

        purcOrdVO.setRegUsrId(LoginUtil.getUserId());
        purcOrdVO.setDlrCd(LoginUtil.getDlrCd());

        purcOrdService.confirmPurcOrd(purcOrdVO);

        return true;
    }

    /**
     * 로컬 구매오더를 반환한다.(수불발생X)
     * @return
    */
    @RequestMapping(value = "/par/pcm/purcOrd/returnPurcOrdItems.do", method = RequestMethod.POST)
    @ResponseBody
    public int returnPurcOrdItems(@Validated @RequestBody PurcOrdListVO purcOrdListVO)  throws Exception {

        List<PurcOrdItemVO> list = purcOrdListVO.getPurcOrdItemList();

        int result = purcOrdService.returnPurcOrdItems(list);

        return result;
    }

    /**
     * 반환구매오더를 수정한다.(로컬업체 대상)
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/multiReturnPurcOrdItems.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiReturnPurcOrdItems(@Validated @RequestBody PurcOrdSaveVO saveVO)  throws Exception {

        purcOrdService.multiReturnPurcOrdItems(saveVO);

        return true;
    }


    /**
     * 구매오더  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PurcOrdVO selectPurcOrdByKey(@RequestBody PurcOrdSearchVO purcOrdSearchVO) throws Exception
    {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        purcOrdVO = purcOrdService.selectPurcOrdByKey(purcOrdSearchVO);


        return purcOrdVO;
    }

    /**
     * 구매오더 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdItemByKey(@RequestBody PurcOrdSearchVO purcOrdSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        purcOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(purcOrdService.selectPurcOrdItemByKey(purcOrdSearchVO));

        return result;
    }

    /**
     * 구매오더 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(purcOrdService.selectPurcOrdsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매오더품목 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdItems(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(purcOrdService.selectPurcOrdItemConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdItemCondition(searchVO));
        }

        return result;
    }


    /**
     * 구매오더 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdList.do", method = RequestMethod.GET)
    public String selectPurcOrdList(Model model)  throws Exception  {

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
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

        return "/par/pcm/purcOrd/selectPurcOrdList";
    }

    /**
     * 송장등록을 위한 구매오더 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectInvcItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItems(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(purcOrdService.selectInvcItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectInvcItemsByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/par/pcm/cmm/selectPartsInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopup(Model model, HttpServletRequest request) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        //model.addAttribute("baseNames", baseNames);

        return "/par/pcm/cmm/selectPartsInfoExcelUploadPopup";
    }

    @RequestMapping(value = "/par/pcm/purcOrd/insertPurcOrdExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertPurcOrdExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("bpTp") String bpTp,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<PurcOrdItemVO> list = new ArrayList<PurcOrdItemVO>();
        List<PurcOrdItemVO> resultList = new ArrayList<PurcOrdItemVO>();
        PurcOrdItemVO       chkPurcOrdItem = new PurcOrdItemVO();
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
                ExcelReader<PurcOrdItemVO> excelReader = new ExcelReader<PurcOrdItemVO>(PurcOrdItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);


                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    chkPurcOrdItem = new PurcOrdItemVO();
                    errors         = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       resultList.add(list.get(i));
                   }else{

                       if((list.get(i).getItemCd() != null) && !(list.get(i).getItemCd().isEmpty())){
                           list.get(i).setDlrCd(LoginUtil.getDlrCd());
                           list.get(i).setBpCd(venderMasterVO.getBpCd());

                           chkPurcOrdItem =   purcOrdService.selectPurcOrdItemExcelUploadByKey(list.get(i));

                           //부품마스터에 없는 부품인경우
                           if(chkPurcOrdItem  == null){
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

                           if(bpTp.equals("01")){
                               //공급처가  없는 부품인경우
                               if(chkPurcOrdItem.getBpCd() == null){
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

                               if(!chkPurcOrdItem.getSpyrCd().equals("01")){
                                   list.get(i).setErrorCount(1);

                                   msg = messageSource.getMessage(
                                           "sal.info.notEqualSupplyBp"
                                           , new String[]{}
                                           , LocaleContextHolder.getLocale()
                                       );

                                       errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                                   list.get(i).setErrors(errors);

                                   totErrCnt = totErrCnt + 1;
                                   resultList.add(list.get(i));

                                   continue;
                               }
                           }

                           if(!bpTp.equals("01")){

                               if(chkPurcOrdItem.getSpyrCd().equals("01")){
                                   list.get(i).setErrorCount(1);

                                   msg = messageSource.getMessage(
                                           "sal.info.notEqualSupplyBp"
                                           , new String[]{}
                                           , LocaleContextHolder.getLocale()
                                       );

                                       errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                                   list.get(i).setErrors(errors);

                                   totErrCnt = totErrCnt + 1;
                                   resultList.add(list.get(i));

                                   continue;
                               }
                           }

                           list.get(i).setGrStrgeCd(chkPurcOrdItem.getGrStrgeCd());
                           list.get(i).setItemNm(chkPurcOrdItem.getItemNm());
                           list.get(i).setPurcItemTp(chkPurcOrdItem.getPurcItemTp());
                           list.get(i).setPurcItemStatCd(chkPurcOrdItem.getPurcItemStatCd());
                           list.get(i).setPurcUnitCd(chkPurcOrdItem.getPurcUnitCd());
                           list.get(i).setPurcQty(chkPurcOrdItem.getPurcQty());
                           list.get(i).setPurcPrc(chkPurcOrdItem.getPurcPrc());
                           list.get(i).setPurcAmt(chkPurcOrdItem.getPurcAmt());
                           list.get(i).setPurcLeadHm(chkPurcOrdItem.getPurcLeadHm());
                           list.get(i).setMinPurcQty(chkPurcOrdItem.getMinPurcQty());
                           list.get(i).setStockQty(chkPurcOrdItem.getStockQty());
                           list.get(i).setResvStockQty(chkPurcOrdItem.getResvStockQty());
                           list.get(i).setBorrowQty(chkPurcOrdItem.getBorrowQty());
                           list.get(i).setRentQty(chkPurcOrdItem.getRentQty());
                           list.get(i).setAvlbStockQty(chkPurcOrdItem.getAvlbStockQty());
                           list.get(i).setParSpecCd(chkPurcOrdItem.getParSpecCd());
                           list.get(i).setPurcExcelQty(chkPurcOrdItem.getPurcExcelQty());
                           list.get(i).setSucCd(chkPurcOrdItem.getSucCd());

                          // resultList.add(chkPurcOrdItem);
                          resultList.add(list.get(i));
                       }
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                //if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                //}else{
                //    result.setTotal(-999);
                //    result.setData(resultList);
                //}
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
     * 구매현황 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusList.do", method = RequestMethod.GET)
    public String selectPurcOrdStatusList(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo,@RequestParam(value="pBpCd", defaultValue="") String pBpCd,@RequestParam(value="pBpNm", defaultValue="") String pBpNm) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("carlineCdList",   carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("purcPgssCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd));  //구매진행상태상세코드
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("ammendCodeList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd));
        //삭제여부
        model.addAttribute("delYnList",       commonCodeService.selectCommonCodesByCmmGrpCd("SER902", null, langCd));
        model.addAttribute("pPurcOrdNo",      pPurcOrdNo);
        model.addAttribute("pBpCd",           pBpCd);
        model.addAttribute("pBpNm",           pBpNm);

        return "/par/pcm/purcOrd/selectPurcOrdStatusList";
    }

    /**
     * 구매현황 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusListByCondition(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcOrdService.selectPurcOrdStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusByCondition(searchVO));
        }

        return result;
    }

    /**
     * 실시간 구매현황 데이타(AMOS)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusInterfaceRealTimeList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusInterfaceRealTimeList(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return purcOrdService.selectPurcOrdStatusInterfaceRealTime(searchVO);
    }

    /**
     * B/O summary 구한다
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusListSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusListSummary(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(purcOrdService.selectPurcOrdStatusListSummary(searchVO));

        return result;
    }

    /**
     * 구매현황 데이타를 조회한다.(구매집계상세용)
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusByConditionForPurcOrdSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusByConditionForPurcOrdSummary(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcOrdService.selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdStatusByConditionForPurcOrdSummary(searchVO));
        }

        return result;
    }

    /**
     * 구매서머리 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdSummaryByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PurcOrdVO selectPurcOrdSummaryByKey(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        PurcOrdVO result = new PurcOrdVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());


        result = purcOrdService.selectPurcOrdSummaryByKey(searchVO);

        return result;
    }

    /**
     * 구매반품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectReturnPurcOrdItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReturnPurcOrdItemByKey(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(purcOrdService.selectReturnPurcOrdItemByKey(searchVO));

        return result;
    }

    /**
     * 구매오더 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcBackOrdMain.do", method = RequestMethod.GET)
    public String selectPurcBackOrdMain(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

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

        model.addAttribute("pPurcOrdNo",      pPurcOrdNo);
        return "/par/pcm/purcOrd/selectPurcBackOrdMain";
    }

    /**
     * 구매오더 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusSummary.do", method = RequestMethod.GET)
    public String selectPurcOrdStatusSummary(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

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
        model.addAttribute("purcPgssCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd));  //구매진행상태상세코드

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sLangCd", langCd);
        model.addAttribute("sDateFormat", dateFormat);
        model.addAttribute("sDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sPltCd", LoginUtil.getPltCd());

        return "/par/pcm/purcOrd/selectPurcOrdStatusSummary";
    }

    /**
     * 반품구매오더 현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectReturnPurcOrdItemList.do", method = RequestMethod.GET)
    public String selectReturnPurcOrdItemList(Model model) throws Exception  {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/purcOrd/selectReturnPurcOrdItemList";

    }

    /**
     * 반품구매오더 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectReturnPurcOrdItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReturnPurcOrdItems(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(purcOrdService.selectReturnPurcOrdItemConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectReturnPurcOrdItemCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매오더상태 summary 구한다
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdStatusSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdStatusSummary(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(purcOrdService.selectPurcOrdStatusSummary(searchVO));

        return result;
    }

    /**
     * 결품수요조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcReqList.do", method = RequestMethod.GET)
    public String selectPurcReqList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        if(venderMasterVO != null){
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("purcReqTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR201", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //창고 공통 코드
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("strgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/pcm/purcOrd/selectPurcReqList";
    }

    /**
     * 실시간 구매현황 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcOrd/selectPurcOrdRealTimeStatusList.do", method = RequestMethod.GET)
    public String selectPurcOrdStatusList(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String monthDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("monthDtBf", monthDtBf);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("storageList", storageList);

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList = new ArrayList<UnitInfoVO>();
        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);
        model.addAttribute("purcUnit", purcUnitList);

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("purcPgssCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd));  //구매진행상태상세코드
        model.addAttribute("dlPdcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("ammendCodeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd));
        //model.addAttribute("bpCd", "A10AA001");
        model.addAttribute("trsfTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));

        return "/par/pcm/purcOrd/selectPurcOrdRealTimeStatusList";
    }
}
