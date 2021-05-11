package chn.bhmc.dms.sal.lom.web;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.lom.service.TpVehicleMonitoringService;
import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventorySearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringController
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/lom/tpVehicleMonitoring")
public class TpVehicleMonitoringController extends HController {
    /**
     * TP차량모니터링 서비스
     */
    @Resource(name="tpVehicleMonitoringService")
    TpVehicleMonitoringService tpVehicleMonitoringService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    // 차량마스터 서비스
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;


    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;
    /**
     * TP차량모니터링 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringMain.do", method = RequestMethod.GET)
    public String selectTpVehicleMonitoringConditionMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        //String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";

        String oneDay = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 운송회사 SAL057
        model.addAttribute("tpCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL057", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringMain";
    }
    
    @RequestMapping(value = "/selectdistributorAbnormalInventoryMain.do", method = RequestMethod.GET)
    public String selectdistributorAbnormalInventoryMain(Model model) throws Exception {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();
        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        //String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";

        String oneDay = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");

        model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));
        model.addAttribute("distCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd));
        
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 운송회사 SAL057
        model.addAttribute("tpCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL057", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/lom/tpVehicleMonitoring/selectdistributorAbnormalInventoryMain";
    }

    
    @RequestMapping(value = "/selectDistributorAbnormalInventory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDistributorAbnormalInventoryCnt(@RequestBody DistributorAbnormalInventorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        result.setTotal(tpVehicleMonitoringService.selectDistributorAbnormalInventoryCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectDistributorAbnormalInventory(searchVO));  //Result, Search
        }

        return result;
    }
    /**
     * TP차량모니터링 현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TpVehicleMonitoringSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTpVehicleMonitoringCondition(@RequestBody TpVehicleConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        result.setTotal(tpVehicleMonitoringService.selectTpVehicleMonitoringConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectTpVehicleMonitoringCondition(searchVO));  //Result, Search
        }

        return result;
    }

    /**
     * TP차량모니터링 엑셀업로드
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringUploadPopup.do", method = RequestMethod.GET)
    public String selectTpVehicleMonitoringUploadPopup(Model model, HttpServletRequest request) throws Exception {
        return "/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringUploadPopup";
    }


    /**
     * 파일 업로드
     * @param uploadFile
     * @param progressId
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTpVehicleMonitoringUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertTpVehicleMonitoringUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        ExcelUploadStatus status = new ExcelUploadStatus();

        List<TpVehicleConditionVO> list = new ArrayList<TpVehicleConditionVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TpVehicleConditionVO> excelReader = new ExcelReader<TpVehicleConditionVO>(TpVehicleConditionVO.class, uploadFile.getInputStream(), 0);
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

        // vin상태 점검.
        for(int i = 0; i < list.size(); i++){
            TpVehicleConditionVO vo = list.get(i);

            List<ExcelUploadError> errors = vo.getErrors();
            String msg = "";

            TpVehicleConditionVO vehicleVO = null;
            vehicleVO = tpVehicleMonitoringService.selectVehicleStatCdSearch(vo.getVinNo());

            if(vehicleVO == null){
                msg = messageSource.getMessage(
                        "sal.info.confirmMsg"
                        , new String[]{
                                messageSource.getMessage("sal.lbl.vinNo", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );
                errors.add(new ExcelUploadError(i, 0, vo.getVinNo(), msg));
                vo.setErrorCount(errors.size());
                continue;
            }

            String statCd = vehicleVO.getCarStatCd();
            String dlrCd = vehicleVO.getOrdDlrCd();

            // 1.차량상태 확인
            if(statCd != null && statCd.length() > 0){
                if(!"50".equals(statCd)){
                    msg = messageSource.getMessage(
                            "sal.info.confirmMsg"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.trsfStatCd", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                        );
                    errors.add(new ExcelUploadError(i, 0, vo.getVinNo(), msg));
                    vo.setErrorCount(errors.size());
                }
            }else{
                msg = messageSource.getMessage(
                        "sal.info.confirmMsg"
                        , new String[]{
                                messageSource.getMessage("sal.lbl.vinNo", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );
                errors.add(new ExcelUploadError(i, 0, vo.getVinNo(), msg));
                vo.setErrorCount(errors.size());
            }


            // 2.딜러정보 입력.
            if(dlrCd != null && dlrCd.length() > 0){
                vo.setDlrCd(dlrCd);
            }else{
                msg = messageSource.getMessage(
                        "sal.info.confirmMsg"
                        , new String[]{
                                messageSource.getMessage("sal.lbl.vinNo", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );
                errors.add(new ExcelUploadError(i, 0, vo.getDlrCd(), msg));
                vo.setErrorCount(errors.size());
            }

        }

        return result;
    }

    /**
     * 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/insertTpVehicleMonitoringUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTpVehicleMonitoringUpload(@RequestBody BaseSaveVO<TpVehicleConditionVO> uploadList) throws Exception {
        /*
        List<TpVehicleConditionVO> list = uploadList.getInsertList();
        int listSize = list.size();
        int sSize = 200;
        for(int i=0; i<listSize; i+= sSize){
            tpVehicleMonitoringService.insertTpVehicleMonitoringUpload( list.subList(i, Math.min(listSize, i + sSize)) );
        }
        */

        tpVehicleMonitoringService.insertTpVehicleMonitoringUpload(uploadList.getInsertList());
        return true;
    }

    /**
     * TP차량모니터링 팝업을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TpVehicleMonitoringSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringConditionPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTpVehicleMonitoringConditionPopup(@RequestBody TpVehicleConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        result.setTotal(tpVehicleMonitoringService.selectTpVehicleMonitoringConditionPopupCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectTpVehicleMonitoringConditionPopup(searchVO));  //Result, Search
        }

        return result;
    }

}
