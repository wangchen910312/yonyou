package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.par.ism.vo.PartsCalculateSaveVO;

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
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssuePartsResvService;
import chn.bhmc.dms.par.ism.service.PartsSaleOrdService;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdListVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSaveVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 부품판매관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class PartsSaleOrdController extends HController {

    /**
     * 부품예약 서비스
     */
    @Resource(name="issuePartsResvService")
    IssuePartsResvService issuePartsResvService;

    /**
     * 부품판매 서비스
     */
    @Resource(name="partsSaleOrdService")
    PartsSaleOrdService partsSaleOrdService;

    /**
     * 출고등록 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 출고등록상세 서비스
     */
    @Resource(name="issuePartsOutDetailService")
    IssuePartsOutDetailService issuePartsOutDetailService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 부품판매 등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdMain.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdMain(Model model,@RequestParam(value="pParSalesOrdNo", defaultValue="") String pParSalesOrdNo,@RequestParam(value="pEstimateDocNo", defaultValue="") String pEstimateDocNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("unitCdList",         unitCdList);
        model.addAttribute("pParSalesOrdNo",     pParSalesOrdNo);
        model.addAttribute("pEstimateDocNo",     pEstimateDocNo);
        model.addAttribute("toDt",               sysDate);

        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("storageList",     storageList);
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("usrId",           LoginUtil.getUserId());
        model.addAttribute("usrNm",           LoginUtil.getUserNm());
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issue/selectPartsSaleOrdMain";

    }

    /**
     * 부품판매를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/ism/issue/createPartsSaleOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleOrdVO createPartsSaleOrd(@Validated @RequestBody PartsSaleOrdListVO partsSaleOrdListVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = partsSaleOrdListVO.getPartsSaleOrdVO();
        List<PartsSaleOrdItemVO> list = partsSaleOrdListVO.getPartsSaleOrdItemList();


        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdVO = partsSaleOrdService.createPartsSaleOrd(list, partsSaleOrdVO);

        partsSaleOrdVO.setResultYn(true);

        return partsSaleOrdVO;
    }

    /**
     * 부품판매를 반품한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/returnPartsSaleOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleOrdVO returnPartsSaleOrd(@Validated @RequestBody PartsSaleOrdListVO partsSaleOrdListVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = partsSaleOrdListVO.getPartsSaleOrdVO();
        List<PartsSaleOrdItemVO> list = partsSaleOrdListVO.getPartsSaleOrdItemList();


        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdVO = partsSaleOrdService.returnPartsSaleOrd(list, partsSaleOrdVO);

        partsSaleOrdVO.setResultYn(true);

        return partsSaleOrdVO;
    }

    /**
     * 부품판매를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/multiPartsSaleOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsSaleOrds(@Validated @RequestBody PartsSaleOrdSaveVO saveVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = saveVO.getPartsSaleOrdVO();

        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdService.multiPartsSaleOrds(saveVO, partsSaleOrdVO);

        return true;
    }

    /**
     * 부품판매를 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/cancelPartsSaleOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelPartsSaleOrd(@Validated @RequestBody PartsSaleOrdListVO partsSaleOrdListVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = partsSaleOrdListVO.getPartsSaleOrdVO();
        List<PartsSaleOrdItemVO> list = partsSaleOrdListVO.getPartsSaleOrdItemList();


        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdService.cancelPartsSaleOrd(list, partsSaleOrdVO);

        return true;
    }

    /**
     * 부품판매를 확정처리한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/cnfmPartsSaleOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cnfmPartsSaleOrd(@Validated @RequestBody PartsSaleOrdListVO partsSaleOrdListVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = partsSaleOrdListVO.getPartsSaleOrdVO();
        List<PartsSaleOrdItemVO> list = partsSaleOrdListVO.getPartsSaleOrdItemList();


        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdVO = partsSaleOrdService.cnfmPartsSaleOrd(list, partsSaleOrdVO);

        return true;
    }

    /**
     * 부품판매를 확정처리한다.(개별확정)
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/cnfmPartsItemSaleOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cnfmPartsItemSaleOrd(@Validated @RequestBody PartsSaleOrdListVO partsSaleOrdListVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = partsSaleOrdListVO.getPartsSaleOrdVO();
        List<PartsSaleOrdItemVO> list = partsSaleOrdListVO.getPartsSaleOrdItemList();


        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleOrdVO = partsSaleOrdService.cnfmPartsItemSaleOrd(list, partsSaleOrdVO);

        return true;
    }

    /**
     * 정비정보를 판매정보에 반영한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/updateCalculateInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleOrdVO updateCalculateInfo(@RequestBody PartsCalculateSaveVO saveVO)  throws Exception {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdVO = saveVO.getPartsSaleOrdVO();
        PartsSaleOrdSearchVO partsSaleOrdSearchVO = new PartsSaleOrdSearchVO();

        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        partsSaleOrdSearchVO.setsParSaleOrdNo(partsSaleOrdVO.getParSaleOrdNo());


        //partsSaleOrdService.updateCalculateInfo(partsSaleOrdVO);

        partsSaleOrdService.modifyPartsSaleOrdDcRates(saveVO, partsSaleOrdVO);

        partsSaleOrdVO = partsSaleOrdService.selectPartsSaleOrdByKey(partsSaleOrdSearchVO);

        return partsSaleOrdVO;
    }


    /**
     * 부품판매  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleOrdVO selectPartsSaleOrdByKey(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {

        PartsSaleOrdVO partsSaleOrdVO = new PartsSaleOrdVO();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        partsSaleOrdVO = partsSaleOrdService.selectPartsSaleOrdByKey(partsSaleOrdSearchVO);


        return partsSaleOrdVO;
    }

    /**
     * 부품판매 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdItemByKey(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(partsSaleOrdService.selectPartsSaleOrdItemByKey(partsSaleOrdSearchVO));

        return result;
    }

    /**
     * 부품판매 부품 데이타를 조회한다.(정산용)
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdCalcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdCalcItemByKey(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(partsSaleOrdService.selectPartsSaleOrdCalcItemByKey(partsSaleOrdSearchVO));

        return result;
    }

    /**
     * 부품판매 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdList.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdList(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        // 로그인 정보: 딜러코드
        model.addAttribute("toDt",           sysDate);
        model.addAttribute("sevenDtBf",      sevenDtBf);
        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));

        return "/par/ism/issue/selectPartsSaleOrdList";

    }

    /**
     * 부품판매 리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrds(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdListCnt(partsSaleOrdSearchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdList(partsSaleOrdSearchVO));
        }

        return result;
    }

    /**
     * 부품판매 리스트 정보(팝업)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdPops.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdPops(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdPopListCnt(partsSaleOrdSearchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdPopList(partsSaleOrdSearchVO));
        }

        return result;
    }

    /**
     * 부품판매 리스트 정보(정산)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdForCalcs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdForCalcs(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdForCalcListCnt(partsSaleOrdSearchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdForCalcList(partsSaleOrdSearchVO));
        }

        return result;
    }

    /**
     * 부품판매 현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdItemList.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdItemList(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("unitCdList",      unitCdList);
        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));

        return "/par/ism/issue/selectPartsSaleOrdItemList";

    }

    /**
     * 부품판매 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdStatusSummary.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdStatusSummary(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("unitCdList",      unitCdList);
        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));
        model.addAttribute("storageList",     storageList);
        // 공통코드 : RO상태
        model.addAttribute("roStatCdList",    commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));


        return "/par/ism/issue/selectPartsSaleOrdStatusSummary";

    }

    /**
     * 부품판매 품목리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdItems(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdItemListCnt(partsSaleOrdSearchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdItemList(partsSaleOrdSearchVO));
        }

        return result;
    }

    /**
     * 부품판매 명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdItemByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdItemByCondition(@RequestBody PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        partsSaleOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdItemByConditionCnt(partsSaleOrdSearchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdItemByCondition(partsSaleOrdSearchVO));
        }

        return result;
    }

    /**
     * 견적key에 의한 부품판매 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdByEstimateKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleOrdVO selectPartsSaleOrdByEstimateKey(@RequestBody PartsSaleEstimateVO searchVO) throws Exception
    {
        return partsSaleOrdService.selectPartsSaleOrdByEstimateKey(LoginUtil.getDlrCd(), searchVO.getEstimateDocNo());
    }

    /**
     * 견적key에 의한 부품판매 품목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdItemByEstimateKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrdItemByEstimateKey(@RequestBody PartsSaleEstimateVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setData(partsSaleOrdService.selectPartsSaleOrdItemByEstimateKey(LoginUtil.getDlrCd(), searchVO.getEstimateDocNo()));

        return result;
    }

    /**
     * 부품판매 누군가에 의한 수정여부를 체크한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/fnChkPartsSaleOrdNoUpdateSomebody.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean fnChkPartsSaleOrdNoUpdateSomebody(@RequestBody PartsSaleOrdVO partsSaleOrdVO)  throws Exception {

        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());

        return partsSaleOrdService.fnChkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);
    }


    @RequestMapping(value = "/par/ism/issue/insertPartsSaleOrdItemExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertPartsSaleOrdItemExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam(value="prcTp", defaultValue="") String prcTp,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult             result              = new SearchResult();
        List<PartsSaleOrdItemVO> list                = new ArrayList<PartsSaleOrdItemVO>();
        List<PartsSaleOrdItemVO> resultList          = new ArrayList<PartsSaleOrdItemVO>();
        PartsSaleOrdItemVO       chkPartsSaleOrdItem = new PartsSaleOrdItemVO();
        List<ExcelUploadError>   errors              = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus        status              = new ExcelUploadStatus();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        HashMap<String, String> storageMap = new HashMap<String, String>();
        for( StorageVO storageVO : storageList ){
            storageMap.put(storageVO.getStrgeCd(), storageVO.getStrgeNm());
        }

        int totErrCnt = 0;
        String msg;
        String lPrcTp;

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<PartsSaleOrdItemVO> excelReader = new ExcelReader<PartsSaleOrdItemVO>(PartsSaleOrdItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);


                status.setStep(ExcelUploadStatus.COMPLETED);

                lPrcTp = progressId.substring(progressId.indexOf("0"));

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    chkPartsSaleOrdItem = new PartsSaleOrdItemVO();
                    errors         = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       resultList.add(list.get(i));
                   }else{

                       if(!((list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty()))){
                           list.get(i).setDlrCd(LoginUtil.getDlrCd());
                           list.get(i).setPrcTp(lPrcTp);

                           for(int j = 0; j < storageList.size() ; j = j + 1){
                               if(storageList.get(j).getStrgeNm().equals(list.get(i).getExcelStrgeNm())){
                                   list.get(i).setExcelStrgeCd(storageList.get(j).getStrgeCd());
                                   break;
                               }
                           }

                           chkPartsSaleOrdItem =   partsSaleOrdService.selectPartsSaleOrdItemExcelUploadByKey(list.get(i));

                           //부품마스터에 없는 부품인경우
                           if(chkPartsSaleOrdItem  == null){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "global.info.emptyParamInfo"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.itemInfo", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                               list.get(i).setErrors(errors);

                               totErrCnt = totErrCnt + 1;
                               resultList.add(list.get(i));

                               continue;
                           }

                           //창고코드 검색 -> 창고이름 검색으로 수정. 20170914
                           if(!storageMap.containsValue(list.get(i).getExcelStrgeNm())){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "par.info.notStorgeMsg"
                                       , new String[]{}
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getExcelStrgeNm(), msg));

                               list.get(i).setErrors(errors);

                               totErrCnt = totErrCnt + 1;
                               resultList.add(list.get(i));

                               continue;
                           }

                           list.get(i).setItemNm(chkPartsSaleOrdItem.getItemNm());
                           list.get(i).setItemDstinCd(chkPartsSaleOrdItem.getItemDstinCd());
                           list.get(i).setGiStrgeCd(chkPartsSaleOrdItem.getGiStrgeCd());
                           list.get(i).setGiLocCd(chkPartsSaleOrdItem.getGiLocCd());
                           list.get(i).setSaleTp(chkPartsSaleOrdItem.getSaleTp());
                           list.get(i).setPrcTp(chkPartsSaleOrdItem.getPrcTp());
                           list.get(i).setUnitCd(chkPartsSaleOrdItem.getUnitCd());
                           list.get(i).setOrdQty(chkPartsSaleOrdItem.getOrdQty());
                           list.get(i).setEndQty(chkPartsSaleOrdItem.getEndQty());
                           list.get(i).setDcRate(chkPartsSaleOrdItem.getDcRate());
                           list.get(i).setPrc(chkPartsSaleOrdItem.getPrc());
                           list.get(i).setAmt(chkPartsSaleOrdItem.getAmt());
                           list.get(i).setDcAmt(chkPartsSaleOrdItem.getDcAmt());
                           list.get(i).setTaxAmt(chkPartsSaleOrdItem.getTaxAmt());
                           list.get(i).setTaxDdctAmt(chkPartsSaleOrdItem.getTaxDdctAmt());
                           list.get(i).setStockQty(chkPartsSaleOrdItem.getStockQty());
                           list.get(i).setAvlbStockQty(chkPartsSaleOrdItem.getAvlbStockQty());
                           list.get(i).setResvStockQty(chkPartsSaleOrdItem.getResvStockQty());
                           list.get(i).setBorrowQty(chkPartsSaleOrdItem.getBorrowQty());
                           list.get(i).setRentQty(chkPartsSaleOrdItem.getRentQty());
                           list.get(i).setExcelQty(chkPartsSaleOrdItem.getExcelQty());
                           list.get(i).setExcelPrc(chkPartsSaleOrdItem.getExcelPrc());
                           list.get(i).setExcelDcRate(chkPartsSaleOrdItem.getExcelDcRate());
                           list.get(i).setMovingAvgPrc(chkPartsSaleOrdItem.getMovingAvgPrc());
                           list.get(i).setMovingAvgTaxDdctPrc(chkPartsSaleOrdItem.getMovingAvgTaxDdctPrc());

                          // resultList.add(chkReceiveEtcItem);
                          resultList.add(list.get(i));
                       }
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                //if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                /*}else{
                    result.setTotal(-999);
                    result.setData(resultList);
                }*/
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
