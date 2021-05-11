package chn.bhmc.dms.par.stm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageDetailVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageListVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSaveVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO;

/**
 * StockMovement Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 10.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class StockMovementController extends HController {

    /**
     * 수불유형 서비스
     */
    @Resource(name="movementTypeService")
    MovementTypeService movementTypeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 현재고 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /**
     * 재고이동 서비스
     */
    @Resource(name="stockMovStorageHeaderService")
    StockMovStorageHeaderService stockMovStorageHeaderService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService uerService;


    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 창고간 재고이동 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStorageMain.do", method = RequestMethod.GET)
    public String selectStorageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //MovementTypeSearchVO
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        //StorageSearchVO
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        // 로케이션 타입 정보 조회.
        model.addAttribute("storgeMoveReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR404", null, langCd));
        //등록자 ID
        model.addAttribute("userId", LoginUtil.getUserId());
        //사용자 리스트.
        UserSearchVO userSearchVO = new UserSearchVO();
        userSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<UserVO> userCdList = uerService.selectUsersByCondition(userSearchVO);

        model.addAttribute("userCdList", userCdList);
        model.addAttribute("langCd", langCd);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/stm/stockMovement/selectStorageMain";
    }

    /**
     * 창고간 재고이동 헤더 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovStorageHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public StockMovStorageHeaderVO selectStockInOutList(@RequestBody StockMovStorageSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        searchVO.setsEtcGiDocLineNo(searchVO.getsEtcGiDocLineNo());

        StockMovStorageHeaderVO stockMovStorageHeaderVO = stockMovStorageHeaderService.selectStockMovStorageHeaderByKey(searchVO);

        if(stockMovStorageHeaderVO == null){
            stockMovStorageHeaderVO = new StockMovStorageHeaderVO();
        }

        return stockMovStorageHeaderVO;
    }

    /**
     * 창고간 재고이동 상세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovStorageItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockMovStorageItemByKey(@RequestBody StockMovStorageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        searchVO.setsEtcGiDocLineNo(searchVO.getsEtcGiDocLineNo());
        result.setData(stockMovStorageHeaderService.selectStockMovStorageItemByKey(searchVO));

        return result;
    }

    /**
     * 창고간 재고이동 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovStorageByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockMovStorageByCondition(@RequestBody StockMovStorageSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(stockMovStorageHeaderService.selectStockMovStorageHeadersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockMovStorageHeaderService.selectStockMovStorageHeadersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고이동 헤더,상세정보를 등록한다.
     * @param issueReqSaveVO - 저장정보를 포함하는 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/insertStockMovStorageSave.do", method = RequestMethod.POST)
    @ResponseBody
    public StockMovStorageSaveVO insertStockMovStorageSave(@RequestBody StockMovStorageSaveVO stockMovStorageSaveVO) throws Exception{
        return stockMovStorageHeaderService.insertStockMovStorageSave(stockMovStorageSaveVO);
    }

    /**
     * 재고이동 헤더,상세정보를 등록한다.(수불발생(X)
     * @param issueReqSaveVO - 저장정보를 포함하는 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/createStockMovStorageReg.do", method = RequestMethod.POST)
    @ResponseBody
    public StockMovStorageHeaderVO createStockMovStorageReg(@RequestBody StockMovStorageListVO stockMovStorageListVO) throws Exception{
        StockMovStorageHeaderVO stockMovStorageHeaderVO = new StockMovStorageHeaderVO();
        stockMovStorageHeaderVO = stockMovStorageListVO.getStockMovStorageHeaderVO();
        List<StockMovStorageDetailVO> list = stockMovStorageListVO.getStockMovStorageDetailList();

        stockMovStorageHeaderVO = stockMovStorageHeaderService.createStockMovStorageReg(list, stockMovStorageHeaderVO);

        stockMovStorageHeaderVO.setResultYn(true);
        return stockMovStorageHeaderVO;
    }

    /**
     * 재고이동 헤더,상세정보를  확정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/createStockMovStorageCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public StockMovStorageHeaderVO createStockMovStorageCnfm(@Validated @RequestBody StockMovStorageListVO stockMovStorageListVO)  throws Exception {

        StockMovStorageHeaderVO stockMovStorageHeaderVO = new StockMovStorageHeaderVO();
        stockMovStorageHeaderVO = stockMovStorageListVO.getStockMovStorageHeaderVO();
        List<StockMovStorageDetailVO> list = stockMovStorageListVO.getStockMovStorageDetailList();

        stockMovStorageHeaderVO = stockMovStorageHeaderService.createStockMovStorageCnfm(list, stockMovStorageHeaderVO);

        stockMovStorageHeaderVO.setResultYn(true);

        return stockMovStorageHeaderVO;
    }

    /**
     * 재고이동 헤더,상세정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/multiStockMovStorages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockMovStorages(@Validated @RequestBody StockMovStorageSaveVO saveVO)  throws Exception {

        StockMovStorageHeaderVO stockMovStorageHeaderVO = new StockMovStorageHeaderVO();
        stockMovStorageHeaderVO = saveVO.getStockMovStorageHeaderVO();


        stockMovStorageHeaderService.multiStockMovStorages(saveVO, stockMovStorageHeaderVO);

        return true;
    }

    /**
     * 재고이동 헤더,상세정보를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/stm/stockMovement/cancelStockMovStorage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelStockMovStorage(@Validated @RequestBody StockMovStorageListVO stockMovStorageListVO)  throws Exception {

        StockMovStorageHeaderVO stockMovStorageHeaderVO = new StockMovStorageHeaderVO();
        stockMovStorageHeaderVO = stockMovStorageListVO.getStockMovStorageHeaderVO();
        List<StockMovStorageDetailVO> list = stockMovStorageListVO.getStockMovStorageDetailList();

        stockMovStorageHeaderService.cancelStockMovStorage(list, stockMovStorageHeaderVO);


        return true;
    }

    @RequestMapping(value = "/par/cmm/selectStorageItemExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectStorageItemExcelUploadPopup(Model model) throws Exception {


        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //StorageSearchVO
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        model.addAttribute("langCd", langCd);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/cmm/selectStorageItemExcelUploadPopup";
    }

    @RequestMapping(value = "/par/stm/stockMovement/insertStorageItemExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertStorageItemExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("strgeCd") String strgeCd,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<StockMovStorageDetailVO> list = new ArrayList<StockMovStorageDetailVO>();
        List<StockMovStorageDetailVO> resultList = new ArrayList<StockMovStorageDetailVO>();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<StorageVO> storageVOList = storageService.selectStoragesByCondition(storageSearchVO);

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        StockInOutVO stockInOutGiVO = new StockInOutVO();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<StockMovStorageDetailVO> excelReader = new ExcelReader<StockMovStorageDetailVO>(StockMovStorageDetailVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    boolean bGiStorageCheck = false;//원창고유무
                    boolean bGrStorageCheck = false;//이동창고유무

                    errors = new ArrayList<ExcelUploadError>();

                    if( list.get(i).getErrorCount() > 0){
                        totErrCnt = totErrCnt + 1;
                        resultList.add(list.get(i));
                    }else{
                        list.get(i).setDlrCd(LoginUtil.getDlrCd());

                        //창고리스트 창고명 확인 및 창고코드 일치화.
                        for(StorageVO storageVO : storageVOList){
                            if(storageVO.getStrgeNm().equals(list.get(i).getGrStrgeNm())){
                                bGrStorageCheck = true;
                                list.get(i).setGrStrgeCd(storageVO.getStrgeCd());
                            }
                            if(storageVO.getStrgeNm().equals(list.get(i).getGiStrgeNm())){
                                bGiStorageCheck = true;
                                list.get(i).setGiStrgeCd(storageVO.getStrgeCd());
                            }

                            if(bGrStorageCheck && bGiStorageCheck){
                                break;
                            }
                        }

                        stockInOutGiVO = new StockInOutVO();
                        stockInOutGiVO = stockInOutService.selectStockInOutByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), list.get(i).getGiStrgeCd(), list.get(i).getItemCd());

                        if(stockInOutGiVO == null){//재고 부품 없을 때
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage("global.info.emptyParamInfo",
                                   new String[]{messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));
                       }else if(!bGiStorageCheck){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage("global.info.emptyParamInfo",
                                   new String[]{messageSource.getMessage("par.lbl.orgStrgeCd", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getGiStrgeNm(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                       }else if(!bGrStorageCheck){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage("global.info.emptyParamInfo",
                                   new String[]{messageSource.getMessage("par.lbl.newStrgeCd", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getGrStrgeNm(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));
                       }else{//재고 부품이 있을 때

                           list.get(i).setItemCd(stockInOutGiVO.getItemCd());
                           list.get(i).setItemNm(stockInOutGiVO.getItemNm());
                           list.get(i).setUnitCd(stockInOutGiVO.getUnitCd());
                           list.get(i).setGiStockQty(stockInOutGiVO.getStockQty());
                           list.get(i).setGiAvlbStockQty(stockInOutGiVO.getAvlbStockQty());
                           list.get(i).setGiResvStockQty(stockInOutGiVO.getResvStockQty());
                           list.get(i).setStrgeStockQty(stockInOutGiVO.getAvlbStockQty());
                           list.get(i).setMovingAvgPrc(stockInOutGiVO.getMovingAvgPrc());
                           list.get(i).setGiLocCd(stockInOutGiVO.getLocCd());
                           list.get(i).setGiLocNm(stockInOutGiVO.getLocNm());

                           double dExcelQty = Double.parseDouble(list.get(i).getExcelQty());
                           list.get(i).setStrgeMoveStockQty(dExcelQty);
                           resultList.add(list.get(i));
                       }
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
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
     * 창고 로케이션 간 부품 검색 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectStorageItemPopup.do", method = RequestMethod.GET)
    public String selectStorageItemPopup(Model model) throws Exception {

        //StorageSearchVO
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/cmm/selectStorageItemPopup";
    }

    /**
     * 창고간 부품 검색 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectStorageItemAvlbPopup.do", method = RequestMethod.GET)
    public String selectStorageItemAvlbPopup(Model model) throws Exception {

        //StorageSearchVO
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/cmm/selectStorageItemPopup";
    }

    /**
     * 창고간이동 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovementStatusSummary.do", method = RequestMethod.GET)
    public String selectStockMovementStatusSummary(Model model)  throws Exception  {

        String langCd      = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat  = systemConfigInfoService.selectStrValueByKey("dateFormat");
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
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR403", null, langCd));

        return "/par/stm/stockMovement/selectStockMovementStatusSummary";
    }

    /**
     * 창고이동 집계 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovStorageListSummaryByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockMovStorageListSummaryByCondition(@RequestBody StockMovStorageSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(stockMovStorageHeaderService.selectStockMovStorageListSummaryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockMovStorageHeaderService.selectStockMovStorageListSummaryByCondition(searchVO));
        }

        return result;
    }

    /**
     * 창고이동 명세 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/stockMovement/selectStockMovStorageDetailSummaryListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockMovStorageDetailSummaryListByCondition(@RequestBody StockMovStorageSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(stockMovStorageHeaderService.selectStockMovStorageDetailSummaryListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockMovStorageHeaderService.selectStockMovStorageDetailSummaryListByCondition(searchVO));
        }

        return result;
    }
}
