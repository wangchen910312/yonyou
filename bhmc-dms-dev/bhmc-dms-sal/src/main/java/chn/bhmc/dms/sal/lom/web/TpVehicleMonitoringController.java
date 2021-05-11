package chn.bhmc.dms.sal.lom.web;

import java.util.ArrayList;
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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.lom.service.TpVehicleMonitoringService;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionVO;

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

    /**
     * TP차량모니터링 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTpVehicleMonitoringMain.do", method = RequestMethod.GET)
    public String selectTpVehicleMonitoringConditionMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 운송회사 SAL057
        model.addAttribute("tpCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL057", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringMain";
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

        return result;
    }

    /**
     * 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/insertTpVehicleMonitoringUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTpVehicleMonitoringUpload(@Validated @RequestBody BaseSaveVO<TpVehicleConditionVO> uploadList) throws Exception {
        tpVehicleMonitoringService.insertTpVehicleMonitoringUpload(uploadList.getInsertList());
        return true;
    }

}
