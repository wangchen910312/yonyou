package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.PartsSaleEstimateService;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateListVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSaveVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 부품판매견적관리 컨트롤러
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
public class PartsSaleEstimateController extends HController {

    /**
     * 부품판매견적 서비스
     */
    @Resource(name="partsSaleEstimateService")
    PartsSaleEstimateService partsSaleEstimateService;

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
     * 부품판매견적 등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleEstimateMain.do", method = RequestMethod.GET)
    public String selectPartsSaleEstimateMain(Model model,@RequestParam(value="pParSalesEstimateNo", defaultValue="") String pParSalesEstimateNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate = DateUtil.getDate(dateFormat);
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
        model.addAttribute("unitCdList",               unitCdList);
        model.addAttribute("pParSalesEstimateNo",      pParSalesEstimateNo);
        model.addAttribute("toDt",                     sysDate);

        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("statCdList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
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

        return "/par/ism/issue/selectPartsSaleEstimateMain";

    }

    /**
     * 부품판매견적을 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/ism/issue/createPartsSaleEstimate.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleEstimateVO createPartsSaleEstimate(@Validated @RequestBody PartsSaleEstimateListVO partsSaleEstimateListVO)  throws Exception {

        PartsSaleEstimateVO partsSaleEstimateVO = new PartsSaleEstimateVO();
        partsSaleEstimateVO = partsSaleEstimateListVO.getPartsSaleEstimateVO();
        List<PartsSaleEstimateItemVO> list = partsSaleEstimateListVO.getPartsSaleEstimateItemList();


        partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleEstimateVO = partsSaleEstimateService.createPartsSaleEstimate(list, partsSaleEstimateVO);

        partsSaleEstimateVO.setResultYn(true);

        return partsSaleEstimateVO;
    }

    /**
     * 부품판매견적을 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/multiPartsSaleEstimates.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsSaleEstimates(@Validated @RequestBody PartsSaleEstimateSaveVO saveVO)  throws Exception {

        PartsSaleEstimateVO partsSaleEstimateVO = new PartsSaleEstimateVO();
        partsSaleEstimateVO = saveVO.getPartsSaleEstimateVO();

        partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleEstimateService.multiPartsSaleEstimates(saveVO, partsSaleEstimateVO);

        return true;
    }

    /**
     * 부품판매견적을 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/cancelPartsSaleEstimate.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelPartsSaleEstimate(@Validated @RequestBody PartsSaleEstimateVO partsSaleEstimateVO)  throws Exception {

        partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());
        partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());

        partsSaleEstimateService.cancelPartsSaleEstimate(partsSaleEstimateVO);

        return true;
    }

    /**
     * 부품판매  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleEstimateByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsSaleEstimateVO selectPartsSaleEstimateByKey(@RequestBody PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception
    {

        PartsSaleEstimateVO partsSaleEstimateVO = new PartsSaleEstimateVO();
        partsSaleEstimateSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        partsSaleEstimateVO = partsSaleEstimateService.selectPartsSaleEstimateByKey(partsSaleEstimateSearchVO);


        return partsSaleEstimateVO;
    }

    /**
     * 부품판매 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleEstimateItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleEstimateItemByKey(@RequestBody PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        partsSaleEstimateSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(partsSaleEstimateService.selectPartsSaleEstimateItemByKey(partsSaleEstimateSearchVO));

        return result;
    }

    /**
     * 부품판매 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectEstimatesByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEstimatesByCondition(@RequestBody PartsSaleEstimateSearchVO searchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partsSaleEstimateService.selectEstimatesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleEstimateService.selectEstimatesByCondition(searchVO));
        }


        return result;
    }

}
