package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.util.fmt.StringUtil;
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

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.CountryService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.CountrySearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.service.VenderTelService;
import chn.bhmc.dms.par.pmm.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelVO;

/**
 * 거래처 관리 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 01. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class VenderMasterController extends HController {

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 거래처 연락처 서비스
     */
    @Resource(name="venderTelService")
    VenderTelService venderTelService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 국가 관리 서비스
     */
    @Resource(name="countryService")
    CountryService countryService;

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
     * 공급상 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterMain.do", method = RequestMethod.GET)
    public String selectVenderMasterMain(Model model) throws Exception {

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
        // 거래처유형 공통코드정보 조회.

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
        // 국가 공통코드정보 조회.
        CountrySearchVO countrySearchVO = new CountrySearchVO();
        countrySearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("cntryCdDs", countryService.selectCountriesByCondition(countrySearchVO));
        // 지불방법 공통코드정보 조회.
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR122", null, langCd));
        // 지불조건 공통코드정보 조회.
        model.addAttribute("payTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR123", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //가격유형
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        //성별코드
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/pmm/venderMaster/selectVenderMasterMain";

    }

    /**
     * 공급상 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVenderMasters(@RequestBody VenderMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(venderMasterService.selectVenderMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(venderMasterService.selectVenderMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공급상 전체 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectAllVenderMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAllVenderMasters(@RequestBody VenderMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(venderMasterService.selectAllVenderMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(venderMasterService.selectAllVenderMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공급상 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public VenderMasterVO selectVenderMasterByKey(@RequestBody VenderMasterSearchVO searchVO) throws Exception
    {
        return venderMasterService.selectVenderMasterByKey(LoginUtil.getDlrCd(), searchVO.getsBpCd());
    }

    /**
     * 공급상 조합 키 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterBpTpByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public VenderMasterVO selectVenderMasterBpTpByKey(@RequestBody VenderMasterSearchVO searchVO) throws Exception
    {
        return venderMasterService.selectVenderMasterBpTpByKey(LoginUtil.getDlrCd(), searchVO.getsBpTp());
    }

    /**
     * 공급상 데이타를 추가한다.
     * @param venderMasterVO - 거래처 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/venderMaster/insertVenderMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertVenderMaster(@Validated @RequestBody VenderMasterSaveVO venderMasterSaveVO) throws Exception
    {
        venderMasterService.insertVenderMaster(venderMasterSaveVO);

        return true;
    }

    /**
     * 공급상 데이타를 수정한다.
     * @param venderMasterVO - 거래처 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/venderMaster/updateVenderMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVenderMaster(@Validated @RequestBody VenderMasterSaveVO venderMasterSaveVO) throws Exception
    {
        venderMasterService.updateVenderMaster(venderMasterSaveVO);

        return true;
    }

    /**
     * 공급상 데이타를 삭제한다.
     * @param venderMasterVO - 거래처 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/venderMaster/deleteVenderMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteVenderMaster(@Validated @RequestBody VenderMasterVO venderMasterVO) throws Exception
    {
        // UPDATE END_YN : Y
        venderMasterService.deleteVenderMaster(venderMasterVO);

        return true;
    }

    /**
     * 공급상 연락처 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderTels.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVenderTels(@RequestBody VenderTelSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(venderTelService.selectVenderTelsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(venderTelService.selectVenderTelsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공급상 연락처 목록 데이타를 최대 2개를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderTelsMaxRow.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVenderTelsMaxRow(@RequestBody VenderTelSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<VenderTelVO> venderTelVOList = venderTelService.selectVenderTelsMaxTwoRowByCondition(searchVO);
        result.setData(venderTelVOList);
        result.setTotal(venderTelVOList.size());

        return result;
    }


    /**
     * 공급상 관리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterPopup.do", method = RequestMethod.GET)
    public String selectVenderMasterPopup(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        //commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/pmm/venderMaster/selectVenderMasterPopup";

    }

    /**
     * 공급상 관리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterForInvcPopup.do", method = RequestMethod.GET)
    public String selectVenderMasterForInvcPopup(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/pmm/venderMaster/selectVenderMasterPopup";

    }

    /**
     * 공급처 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectSupplierMasterPopup.do", method = RequestMethod.GET)
    public String selectSupplierMasterPopup(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/pmm/venderMaster/selectSupplierMasterPopup";

    }

    /**
     * 공급상 조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderMasterDisableMain.do", method = RequestMethod.GET)
    public String selectVenderMasterDisableMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        // 국가 공통코드정보 조회.
        CountrySearchVO countrySearchVO = new CountrySearchVO();
        countrySearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("cntryCdDs", countryService.selectCountriesByCondition(countrySearchVO));
        // 지불방법 공통코드정보 조회.
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR122", null, langCd));
        // 지불조건 공통코드정보 조회.
        model.addAttribute("payTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR123", null, langCd));

        return "/par/pmm/venderMaster/selectVenderMasterDisableMain";
    }

    /**
     * 고객 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectVenderCustomerMasterMain.do", method = RequestMethod.GET)
    public String selectVenderCustomerMasterMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("02");//판매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
        // 국가 공통코드정보 조회.
        CountrySearchVO countrySearchVO = new CountrySearchVO();
        countrySearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("cntryCdDs", countryService.selectCountriesByCondition(countrySearchVO));
        // 지불방법 공통코드정보 조회.
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR122", null, langCd));
        // 지불조건 공통코드정보 조회.
        model.addAttribute("payTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR123", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //판매유형
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //성별코드
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/pmm/venderMaster/selectVenderCustomerMasterMain";
    }

    /**
     * 고객관리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectCustomerMasterPopup.do", method = RequestMethod.GET)
    public String selectCustomerMasterPopup(Model model) throws Exception {

     // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("02");//판매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/pmm/venderMaster/selectCustomerMasterPopup";

    }

    /**
     * 전체고객관리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/venderMaster/selectCustomerMasterAllPopup.do", method = RequestMethod.GET)
    public String selectCustomerMasterAllPopup(Model model) throws Exception {

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        //commonCodeSearchVO.setsRemark2("02");//판매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/pmm/venderMaster/selectCustomerMasterAllPopup";

    }

    /**
     *  액셀파일 부품정보를 수정한다.
     * @param venderMasterExcelVO - 업체관리 액셀 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/multiVenderMasterExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiVenderMasterExcelData(@Validated @RequestBody BaseSaveVO<VenderMasterExcelVO> venderMasterExcelVO) throws Exception {

        venderMasterService.multiVenderMastersExcelDown(venderMasterExcelVO);
        return true;
    }

    /**
     *  액셀파일 부품정보를 수정한다.
     * @param venderMasterExcelVO - 업체관리 액셀 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/par/pmm/venderMaster/multiVenderMasterCustomerExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiVenderMasterCustomerExcelData(@Validated @RequestBody BaseSaveVO<VenderMasterExcelVO> venderMasterExcelVO) throws Exception {

        venderMasterService.multiVenderCustomerMastersExcelDown(venderMasterExcelVO);
        return true;
    }

    /**
     * 업체관리 문건등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectVenderMasterInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectVenderMasterInfoExcelUploadPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 거래처유형 공통코드정보 조회.

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
        // 국가 공통코드정보 조회.
        CountrySearchVO countrySearchVO = new CountrySearchVO();
        countrySearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("cntryCdDs", countryService.selectCountriesByCondition(countrySearchVO));
        // 지불방법 공통코드정보 조회.
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR122", null, langCd));
        // 지불조건 공통코드정보 조회.
        model.addAttribute("payTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR123", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //가격유형
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        //성별코드
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/cmm/selectVenderMasterInfoExcelUploadPopup";
    }

    @RequestMapping(value = "/par/pmm/venderMaster/insertVenderMasterExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertVenderMasterExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<VenderMasterExcelVO> list = new ArrayList<VenderMasterExcelVO>();
        List<VenderMasterExcelVO> resultList = new ArrayList<VenderMasterExcelVO>();
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<VenderMasterExcelVO> excelReader = new ExcelReader<VenderMasterExcelVO>(VenderMasterExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(2);//3row skip

                list = excelReader.readExcelData(status);

                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    venderMasterVO = new VenderMasterVO();
                    errors = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                   }else{
                       //업체코드 기준 액셀 리스트 행 추가.
                       if(!list.get(i).getBpCd().isEmpty()){

                           list.get(i).setDlrCd(LoginUtil.getDlrCd());

                           //업체코드 확인.
                           VenderMasterSearchVO venderMasterSearchVO = new VenderMasterSearchVO();
                           venderMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                           venderMasterSearchVO.setsBpCd(list.get(i).getBpCd());

                           venderMasterVO = venderMasterService.selectVenderMasterByKey(LoginUtil.getDlrCd(), list.get(i).getBpCd());

                           //bpCd
                           if(venderMasterVO == null){
                               list.get(i).setInsertUpdateTp("I");
                           }else{
                               list.get(i).setInsertUpdateTp("U");
                           }

                           list.get(i).setBpTp("03");//거래처유형(Local)
                           list.get(i).setBpCd(list.get(i).getBpCd());
                           list.get(i).setBpNm(list.get(i).getBpNm());
                           list.get(i).setBpFullNm(list.get(i).getBpFullNm());
                           list.get(i).setContractNo(list.get(i).getContractNo());

                           //날짜형식체크
                           boolean bContractStartDt = false;
                           if(!list.get(i).getContractStartDt().isEmpty()){
                               try{
                                   bContractStartDt = able.com.util.fmt.DateUtil.checkDate(list.get(i).getContractStartDt());
                               }catch(Exception ex){}
                           }

                           if(!bContractStartDt){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "par.info.confirmFileUpload"
                                       , new String[]{
                                               messageSource.getMessage("par.lbl.contractStartDt", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getContractStartDt(), msg));

                               list.get(i).setErrors(errors);
                               totErrCnt++;
                           }else{
                               list.get(i).setContractStartDt(list.get(i).getContractStartDt());
                           }

                           list.get(i).setSungNm(list.get(i).getSungNm());
                           list.get(i).setDistNm(list.get(i).getDistNm());
                           list.get(i).setOwnRgstNm(list.get(i).getOwnRgstNm());
                           list.get(i).setPrsnNm(list.get(i).getPrsnNm());
                           list.get(i).setPrsnTelNo(list.get(i).getPrsnTelNo());
                           list.get(i).setPrsnHpNo(list.get(i).getPrsnHpNo());
                           list.get(i).setAddr(list.get(i).getAddr());
                           list.get(i).setZipCd(list.get(i).getZipCd());

                           resultList.add(list.get(i));
                       }
                   }
                }

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
     * 고객관리 문건등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectVenderCustomerMasterInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectVenderCustomerMasterInfoExcelUploadPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 거래처유형 공통코드정보 조회.

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("02");//판매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
        // 국가 공통코드정보 조회.
        CountrySearchVO countrySearchVO = new CountrySearchVO();
        countrySearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("cntryCdDs", countryService.selectCountriesByCondition(countrySearchVO));
        // 지불방법 공통코드정보 조회.
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR122", null, langCd));
        // 지불조건 공통코드정보 조회.
        model.addAttribute("payTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR123", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        //가격유형
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        //성별코드
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/cmm/selectVenderCustomerMasterInfoExcelUploadPopup";
    }

    @RequestMapping(value = "/par/pmm/venderMaster/insertVenderCustomerMasterExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertVenderCustomerMasterExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<VenderCustomerMasterExcelVO> list = new ArrayList<VenderCustomerMasterExcelVO>();
        List<VenderCustomerMasterExcelVO> resultList = new ArrayList<VenderCustomerMasterExcelVO>();
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("02");//판매처
        List<CommonCodeVO> bpTpList = commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO);

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<VenderCustomerMasterExcelVO> excelReader = new ExcelReader<VenderCustomerMasterExcelVO>(VenderCustomerMasterExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(2);//3row skip

                list = excelReader.readExcelData(status);

                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    venderMasterVO = new VenderMasterVO();
                    errors = new ArrayList<ExcelUploadError>();

                    if( list.get(i).getErrorCount() > 0){
                        totErrCnt = totErrCnt + 1;
                    }else{

                        //업체코드 기준 액셀 리스트 행 추가.
                        if(!list.get(i).getBpCd().isEmpty()){
                            list.get(i).setDlrCd(LoginUtil.getDlrCd());
                            //부품마스터 부품 확인.
                            VenderMasterSearchVO venderMasterSearchVO = new VenderMasterSearchVO();
                            venderMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                            venderMasterSearchVO.setsBpCd(list.get(i).getBpCd());

                            venderMasterVO = venderMasterService.selectVenderMasterByKey(LoginUtil.getDlrCd(), list.get(i).getBpCd());

                            //bpCd
                            if(venderMasterVO == null){
                                list.get(i).setInsertUpdateTp("I");
                            }else{
                                list.get(i).setInsertUpdateTp("U");
                            }

                            boolean checkBpTp = false;
                            for(CommonCodeVO bpTpCodeTpVO : bpTpList){
                                if(StringUtil.nullConvert(list.get(i).getBpTp()).equals(bpTpCodeTpVO.getCmmCdNm())){
                                    list.get(i).setBpTp(bpTpCodeTpVO.getCmmCd());
                                    checkBpTp = true;
                                    break;
                                }
                            }

                            if(!checkBpTp){
                                list.get(i).setBpTp("04");//거래처유형 없을 때 기타거래처(04)
                            }

                            list.get(i).setBpCd(list.get(i).getBpCd());
                            list.get(i).setBpNm(list.get(i).getBpNm());
                            list.get(i).setBpFullNm(list.get(i).getBpFullNm());
                            list.get(i).setContractNo(list.get(i).getContractNo());

                            list.get(i).setContractStartDt(list.get(i).getContractStartDt());

                            //날짜형식체크
                            boolean bContractStartDt = false;
                            if(!list.get(i).getContractStartDt().isEmpty()){
                                try{
                                    bContractStartDt = able.com.util.fmt.DateUtil.checkDate(list.get(i).getContractStartDt());
                                }catch(Exception ex){}
                            }

                            if(!bContractStartDt){
                                list.get(i).setErrorCount(1);

                                msg = messageSource.getMessage(
                                        "par.info.confirmFileUpload"
                                        , new String[]{
                                                messageSource.getMessage("par.lbl.contractStartDt", null, LocaleContextHolder.getLocale())
                                        }
                                        , LocaleContextHolder.getLocale()
                                    );

                                    errors.add(new ExcelUploadError(i, 0, list.get(i).getContractStartDt(), msg));

                                list.get(i).setErrors(errors);
                                totErrCnt++;
                            }else{
                                list.get(i).setContractStartDt(list.get(i).getContractStartDt());
                            }

                            list.get(i).setSungNm(list.get(i).getSungNm());
                            list.get(i).setDistNm(list.get(i).getDistNm());
                            list.get(i).setOwnRgstNm(list.get(i).getOwnRgstNm());
                            list.get(i).setPrsnNm(list.get(i).getPrsnNm());
                            list.get(i).setPrsnTelNo(list.get(i).getPrsnTelNo());
                            list.get(i).setPrsnHpNo(list.get(i).getPrsnHpNo());
                            list.get(i).setAddr(list.get(i).getAddr());
                            list.get(i).setZipCd(list.get(i).getZipCd());

                            resultList.add(list.get(i));
                        }
                    }
                }

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
