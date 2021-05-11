package chn.bhmc.dms.sal.rcp.web;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

import chn.bhmc.dms.sal.cmm.service.SalesCommonService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.rcp.service.SalesVhclCbinRcitService;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;

/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVhclCbinRcitController.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class SalesVhclCbinRcitController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 기동차통일영수증관리 > 영수증 관리 서비스
     */
    @Resource(name="salesVhclCbinRcitService")
    SalesVhclCbinRcitService salesVhclCbinRcitService;

    /**
     * 고객조회팝업 서비스
     */
    @Resource(name="vehOfCustInfoService")
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 판매 공통 - 사업부, 사무소, 성, 도시 조회 서비스
     */
    @Resource(name="salesCommonService")
    SalesCommonService salesCommonService;

    /**
     * 기동차통일영수증관리 > 영수증 관리 메인화면을 호출한다.
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectSalesVehicleCombineReceipt.do", method = RequestMethod.GET)
    public String selectSalesVehicleCombineReceipt(Model model, SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        SimpleDateFormat sdf = new SimpleDateFormat("dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        int intToday = Integer.parseInt(strToday) - 1;

        model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -intToday), dateFormat) );
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("distOfficeCd", LoginUtil.getDistOfficeCd());
        model.addAttribute("getSdptCd", LoginUtil.getSdptCd());

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("dealerSungStr", salesVhclCbinRcitService.selectDealerSungStr(searchVO));

        model.addAttribute("dstbChnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL200", null, langCd));
        model.addAttribute("vinGubunList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL201", null, langCd));
        model.addAttribute("uploadStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL202", null, langCd));
        model.addAttribute("secDlrGbList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL203", null, langCd));
        model.addAttribute("searchTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER310", null, langCd));
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        model.addAttribute("existYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL218", null, langCd));
        //R19080700284 初审  次月复核 选择项 贾明 2019-8-8 start
        model.addAttribute("certYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL227", null, langCd));
      //R19080700284 初审  次月复核 选择项 贾明 2019-8-8 start
        // 사업부
        model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));
        // 성
        model.addAttribute("sungList", salesCommonService.selectDealerSung(new DealerSearchVO()));

        // 성(우편번호) 목록을 조회한다.
        List<SalesVhclCbinRcitVO> arrProvinceInfo = salesVhclCbinRcitService.selectProvinceInfoList("");
        model.addAttribute("arrProvinceInfo", arrProvinceInfo);
        // 发票验证状态  宫荣枢 2021-04-27
        model.addAttribute("sCertFst", commonCodeService.selectCommonCodesByCmmGrpCd("SAF001", null, langCd));
        // 发票状态  宫荣枢 2021-04-27
        model.addAttribute("sReceiptStatus", commonCodeService.selectCommonCodesByCmmGrpCd("SAF004", null, langCd));

        return "/sal/rcp/selectSalesVehicleCombineReceipt";
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectSalesVehicleCombineReceiptSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesVehicleCombineReceiptSearch(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesVhclCbinRcitService.selectSalesVehicleCombineReceiptSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesVhclCbinRcitService.selectSalesVehicleCombineReceiptSearchData(searchVO));
        }

        return result;

    }
    
    /**
     * 发票查询总数 贾明 2020-5-21 
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sal/rcp/selectSalesVehicleCombineReceiptSearchCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectSalesVehicleCombineReceiptSearchCnt(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(salesVhclCbinRcitService.selectSalesVehicleCombineReceiptSearchCnt(searchVO));
        return result;

    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 데이터를 등록한다.
     * @param saveVO - [제조사] 년간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/sal/rcp/insertSalesVehicleCombineReceiptGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesVehicleCombineReceiptGridSave(@Validated @RequestBody SalesVhclCbinRcitSaveVO saveVO) throws Exception {

        salesVhclCbinRcitService.multiSalesVehicleCombineReceiptGridSave(saveVO);
        return true;
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/insertSalesVehicleCombineReceiptSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesVehicleCombineReceiptSave(@Validated @RequestBody SalesVhclCbinRcitVO saveVO) throws Exception {
        salesVhclCbinRcitService.insertSalesVehicleCombineReceiptSave(saveVO);
        return true;
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 조회 화면을 호출한다.
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectVinNoSearchPopup.do", method = RequestMethod.GET)
    public String selectVinNoSearchPopup(Model model, SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("sVinNo",              searchVO.getsVinNo());

        return "/sal/rcp/selectVinNoSearchPopup";
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectVinNoSearchPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVinNoSearchPopupSearch(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesVhclCbinRcitService.selectVinNoSearchPopupSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesVhclCbinRcitService.selectVinNoSearchPopupSearchData(searchVO));
        }

        return result;
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 2급딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectSecondDealerSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSecondDealerSearch(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesVhclCbinRcitService.selectSecondDealerSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesVhclCbinRcitService.selectSecondDealerSearchData(searchVO));
        }

        return result;
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리> 영수증 명세 화면을 호출한다.
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectReceiptDetailPopup.do", method = RequestMethod.GET)
    public String selectReceiptDetailPopup(Model model, SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        model.addAttribute("dlrCd",  LoginUtil.getDlrCd());
        model.addAttribute("sCarId", searchVO.getsCarId());
        model.addAttribute("sVinNo", searchVO.getsVinNo());

        return "/sal/rcp/selectReceiptDetailPopup";
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectReceiptDetailPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesVhclCbinRcitVO selectReceiptDetailPopupSearch(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setsCarId(searchVO.getsCarId());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return salesVhclCbinRcitService.selectReceiptDetailPopupSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리> 영수증 이미지 화면을 호출한다.
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectReceiptImagePopup.do", method = RequestMethod.GET)
    public String selectReceiptImagePopup(Model model, SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        model.addAttribute("dlrCd",  LoginUtil.getDlrCd());
        model.addAttribute("sCarId", searchVO.getsCarId());
        model.addAttribute("sVinNo", searchVO.getsVinNo());

        return "/sal/rcp/selectReceiptImagePopup";
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectReceiptImageSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesVhclCbinRcitVO selectReceiptImageSearch(@RequestBody SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        searchVO.setsCarId(searchVO.getsCarId());
        searchVO.setsVinNo(searchVO.getsVinNo());

        return salesVhclCbinRcitService.selectReceiptImageSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    /*@RequestMapping(value = "/sal/rcp/selectSalesVehicleCombineReceiptImg.do", method = RequestMethod.GET)
    public ModelAndView selectReceiptImg(
    		@RequestParam("carId") String carId,
    		@RequestParam(value="inline", required=false, defaultValue="false") boolean inline) throws Exception {

//    	BlobVO inputBlobVO = new BlobVO();
//    	inputBlobVO.setData(FileUtils.readFileToByteArray(new File("D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH/2016/04/26/20170320235534.jpg")));
//    	salesVhclCbinRcitDAO.updateReceiptImg(inputBlobVO);

        BlobVO blobVO = salesVhclCbinRcitService.selectSalesVehicleCombineReceiptImg(carId);

    	DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName("receipt.jpg");
        downloadVO.setFileSize(blobVO.getData().length);
        downloadVO.setContentType("image/jpeg");
        downloadVO.setFileData(blobVO.getData());

        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("FILE_INFO", downloadVO);
        mav.addObject("INLINE", inline);

        return mav;
    }*/

}
