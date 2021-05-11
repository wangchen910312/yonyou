package chn.bhmc.dms.mis.tmp.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

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

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.mis.tmp.service.TargetMonthRegService;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSaveVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegVO;

/**
 * <pre>
 * [제조사] 월간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetMonthRegController.java
 * @Description : [제조사] 월간 목표 등록
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetMonthRegController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [제조사] 월간 목표 등록 서비스
     */
    @Resource(name="targetMonthRegService")
    TargetMonthRegService targetMonthRegService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * [제조사] 월간 목표 등록  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetMonthRegMain.do", method = RequestMethod.GET)
    public String selectTargetMonthRegMain(Model model, TargetMonthRegSearchVO searchVO) throws Exception {

        model.addAttribute("baseNames", baseNames);

        List<TargetMonthRegVO> sdptList = targetMonthRegService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<TargetMonthRegVO> officeList = targetMonthRegService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<TargetMonthRegVO> dealerList = targetMonthRegService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/tmp/selectTargetMonthRegMain";
    }

    /**
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     */
    @RequestMapping(value = "/mis/tmp/selectTargetMonthRegOfficeCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetMonthRegOfficeCd(@RequestBody TargetMonthRegSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsSdptCd(searchVO.getsSdptCd());

        result.setTotal(targetMonthRegService.selectOfficeListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetMonthRegService.selectMonthOfficeList(searchVO));
        }

        return result;
    }

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     */
    @RequestMapping(value = "/mis/tmp/selectTargetMonthRegDealerCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetMonthRegDealerCd(@RequestBody TargetMonthRegSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsOfficeCd(searchVO.getsOfficeCd());

        result.setTotal(targetMonthRegService.selectDealerListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetMonthRegService.selectMonthDealerList(searchVO));
        }

        return result;
    }

    /**
     * [제조사] 월간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetMonthRegMainSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetMonthRegMainSearch(@RequestBody TargetMonthRegSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetMonthRegService.selectTargetMonthAllRegByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetMonthRegService.selectTargetMonthAllRegByCondition(searchVO));
        }

        return result;

    }

    /**
     * [제조사] 월간 목표 등록 엑셀 일괄 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetAllMonthRegPopup.do", method = RequestMethod.GET)
    public String selectTargetAllMonthRegPopup(Model model, HttpServletRequest request, TargetMonthRegSearchVO targetMonthRegSearchVO) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        targetMonthRegSearchVO.setsGoalYy(request.getParameter("goalYyMm"));

        return "/mis/tmp/selectTargetAllMonthRegPopup";
    }

    /**
     * [제조사] 월간 목표 등록 엑셀  데이터 업로드 한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthAllRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetMonthRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetMonthAllRegVO> list = new ArrayList<TargetMonthAllRegVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetMonthAllRegVO> excelReader = new ExcelReader<TargetMonthAllRegVO>(TargetMonthAllRegVO.class, uploadFile.getInputStream(), 0);
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
     * [제조사] 월간 목표 등록 엑셀 전체 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetAllMonthRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetAllYearRegUploadSave(@Validated @RequestBody TargetMonthRegSaveVO targetAllMonthRegUploadList, TargetMonthRegSearchVO targetMonthRegSearchVO) throws Exception {
        targetMonthRegSearchVO.setGoalYyMm(targetMonthRegSearchVO.getGoalYyMm());
        targetMonthRegService.insertTargetAllMonthRegUploadSave(targetAllMonthRegUploadList.getTargetAllMonthRegUploadList(), targetMonthRegSearchVO);

        return true;
    }

    /**
     * [제조사] 월간 목표 등록 엑셀 부분 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetPartMonthRegPopup.do", method = RequestMethod.GET)
    public String selectTargetPartMonthRegPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/mis/tmp/selectTargetPartMonthRegPopup";
    }

    /**
     * [제조사] 월간 목표 정보를 등록한다.
     * @param saveVO - [제조사] 월간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tmp/multiTargetMonthRegTempSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTargetMonthRegTempSave(@Validated @RequestBody TargetMonthRegSaveVO saveVO) throws Exception {

        targetMonthRegService.multiTargetMonthRegTempSave(saveVO);
        return true;
    }

    /**
     * [제조사] 월간 목표 정보를 저장 확정한다.
     * @param saveVO - 월간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */

    @RequestMapping(value = "/mis/tmp/multiTargetMonthRegCompleteSave.do", method = RequestMethod.POST)
    public String multiTargetMonthRegCompleteSave(Model model, HttpServletRequest request, TargetMonthAllRegVO targetMonthAllRegVO) throws Exception {

        targetMonthAllRegVO.setsGoalYyMm(targetMonthAllRegVO.getsGoalYyMm());
        targetMonthRegService.multiTargetMonthRegCompleteSave(targetMonthAllRegVO);

        return "/mis/tmp/selectTargetMonthRegMain";
    }

    /**
     * [제조사] 월간목표 등록 엑셀  데이터 업로드 한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthPartRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetMonthRegUploadFile2.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile2(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetMonthPartRegVO> list = new ArrayList<TargetMonthPartRegVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetMonthPartRegVO> excelReader = new ExcelReader<TargetMonthPartRegVO>(TargetMonthPartRegVO.class, uploadFile.getInputStream(), 0);
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
     * [제조사] 월간 목표 등록 엑셀 전체 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetPartMonthRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetPartMonthRegUploadSave(@Validated @RequestBody TargetMonthRegSaveVO targetPartMonthRegUploadList) throws Exception {

        targetMonthRegService.insertTargetPartMonthRegUploadSave(targetPartMonthRegUploadList.getTargetPartMonthRegUploadList());

        return true;

    }

}
