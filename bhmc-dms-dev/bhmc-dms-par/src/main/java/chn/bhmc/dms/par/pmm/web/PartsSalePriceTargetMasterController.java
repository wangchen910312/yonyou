package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsPriceExcelUploadSaveDTO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetExcelVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistorySearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetSaveVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 판매가 대상선정 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 04. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class PartsSalePriceTargetMasterController extends HController {

    /**
     * 부품구매가격마스터 가격정보 서비스
     */
    @Resource(name="partsVenderPriceMasterService")
    PartsVenderPriceMasterService partsVenderPriceMasterService;


    /**
     * 판매가 생성 대상선정 마스터 서비스
     */
    @Resource(name="partsVenderSalPriceTargetMasterService")
    PartsVenderSalPriceTargetMasterService partsVenderSalPriceTargetMasterService;

    /**
     * 판매가 히스토리 서비스
     */
    @Resource(name="partsVenderSalPriceTargetHistoryService")
    PartsVenderSalPriceTargetHistoryService partsVenderSalPriceTargetHistoryService;

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
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 로케이션 레벨 정의 서비스
     */
    @Resource(name="binLocationDefineService")
    BinLocationDefineService binLocationDefineService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 판매가 생성 대상선정 마스터 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceSalMasterMain.do", method = RequestMethod.GET)
    public String electPartsPriceSalMasterMain(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 파라미터 정보: 부품코드
        model.addAttribute("itemCd", itemCd);
        // 파라미터 정보: 부품코드
        model.addAttribute("itemNm", itemNm);
        // 단위 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/pmm/partsPriceMaster/selectPartsPriceSalMasterMain";
    }

    /**
     * 판매가 생성 대상선정 마스터 변경 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceSalMasterOperMain.do", method = RequestMethod.GET)
    public String selectPartsPriceSalMasterOperMain(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 파라미터 정보: 부품코드
        model.addAttribute("itemCd", itemCd);
        // 파라미터 정보: 부품코드
        model.addAttribute("itemNm", itemNm);
        // 단위 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsLvlId(2);
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));
        // 판매단가유형 공통코드정보 조회.
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));
        //소수점계산식
        model.addAttribute("pricePointNumCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR134", null, langCd));
        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("vatCd",            vatInfoVO.getVatApplyRate());

        return "/par/pmm/partsPriceMaster/selectPartsPriceSalMasterOperMain";
    }

    /**
     * 판매가 생성 대상선정  목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsVenderSalPriceTargetMasters(@RequestBody PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(partsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderSalPriceTargetMasterService.selectPartsVenderSalPriceTargetMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매가 생성 대상선정  추가/수정/삭제 한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/multiPartsVenderSalPriceTargetMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsVenderMasters(@RequestBody PartsVenderSalPriceTargetSaveVO saveVO, BindingResult bindingResult) throws Exception
    {
        partsVenderSalPriceTargetMasterService.multiPartsVenderSalPriceTargetMaster(saveVO);
        return true;
    }


    /**
     * 판매가 생성 대상선정  히스토리 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceSalHistoryMain.do", method = RequestMethod.GET)
    public String selectPartsSalHistoryMain(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 파라미터 정보: 부품코드
        model.addAttribute("itemCd", itemCd);
        // 파라미터 정보: 부품코드
        model.addAttribute("itemNm", itemNm);
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        // 단위 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        // 판매단가유형 공통코드정보 조회.
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        return "/par/pmm/partsPriceMaster/selectPartsPriceSalHistoryMain";
    }

    /**
     * 판매가 생성 대상선정  히스토리 메인 변경 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceSalHistoryOperMain.do", method = RequestMethod.GET)
    public String selectPartsSalHistoryOperMain(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 파라미터 정보: 부품코드
        model.addAttribute("itemCd", itemCd);
        // 파라미터 정보: 부품코드
        model.addAttribute("itemNm", itemNm);
        // 단위 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        // 판매단가유형 공통코드정보 조회.
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/pmm/partsPriceMaster/selectPartsPriceSalHistoryOperMain";
    }

    /**
     * 판매가 히스토리  목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceTargetHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsVenderSalPriceTargetHistorys(@RequestBody PartsVenderSalPriceTargetHistorySearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(partsVenderSalPriceTargetHistoryService.selectPartsVenderSalPriceTargetHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderSalPriceTargetHistoryService.selectPartsVenderSalPriceTargetHistorysByCondition(searchVO));
        }

        return result;
    }



    @RequestMapping(value = "/par/pmm/partsPriceMaster/insertPartsPriceExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertPartsPriceExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<PartsVenderSalPriceTargetExcelVO> list = new ArrayList<PartsVenderSalPriceTargetExcelVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        List<PartsVenderSalPriceTargetExcelVO> resultList = new ArrayList<PartsVenderSalPriceTargetExcelVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<PartsVenderSalPriceTargetExcelVO> excelReader = new ExcelReader<PartsVenderSalPriceTargetExcelVO>(PartsVenderSalPriceTargetExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(2);

                list = excelReader.readExcelData(status);
                status.setStep(ExcelUploadStatus.COMPLETED);

                resultList = partsVenderSalPriceTargetMasterService.selectPartsPriceExcelValidate(list);

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
     * 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/savePartsPriceExcelUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean savePartsPriceExcelUpload(@RequestBody PartsPriceExcelUploadSaveDTO partsPriceList) throws Exception {

        List<PartsVenderSalPriceTargetExcelVO> list = partsPriceList.getPartsPriceList();

        partsVenderSalPriceTargetMasterService.updatePartsPriceUpload(list);

        return true;

    }

}
