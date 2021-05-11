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
import chn.bhmc.dms.mis.tmp.service.TargetYearRegService;
import chn.bhmc.dms.mis.tmp.vo.TargetYearAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegSaveVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegVO;

/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetYearRegController.java
 * @Description : [제조사] 년간 목표 등록
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
public class TargetYearRegController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [제조사] 년간 목표 등록 서비스
     */
    @Resource(name="targetYearRegService")
    TargetYearRegService targetYearRegService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * [제조사] 년간 목표 등록  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetYearRegMain.do", method = RequestMethod.GET)
    public String selectTargetYearRegMain(Model model, TargetYearRegSearchVO searchVO) throws Exception {

        List<TargetYearRegVO> sdptList = targetYearRegService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<TargetYearRegVO> officeList = targetYearRegService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        return "/mis/tmp/selectTargetYearRegMain";
    }

    /**
     * [제조사] 년간 목표 등록 사업부에 따른 사무소 조회
     */
    @RequestMapping(value = "/mis/tmp/selectTargetYearRegOfficeCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetYearRegOfficeCd(@RequestBody TargetYearRegSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsSdptCd(searchVO.getsSdptCd());

        result.setTotal(targetYearRegService.selectOfficeListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetYearRegService.selectYearOfficeList(searchVO));
        }

        return result;
    }

    /**
     * [제조사] 년간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetYearRegMainSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetYearRegMainSearch(@RequestBody TargetYearRegSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetYearRegService.selectTargetYearAllRegByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetYearRegService.selectTargetYearAllRegByCondition(searchVO));
        }

        return result;

    }

    /**
     * [제조사] 년간 목표 등록 엑셀 일괄 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetAllYearRegPopup.do", method = RequestMethod.GET)
    public String selectTargetAllYearRegPopup(Model model, HttpServletRequest request, TargetYearRegSearchVO targetYearRegSearchVO) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        targetYearRegSearchVO.setsGoalYy(request.getParameter("goalYy"));

        return "/mis/tmp/selectTargetAllYearRegPopup";
    }

    /**
     * [제조사] 년간 목표 등록 엑셀  데이터 업로드 한다.
     * @param targetYearAllRegVO
     * @param targetYearAllRegVO
     * @param searchVO - 조회 조건을 포함하는 TargetYearAllRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetYearRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetYearAllRegVO> list = new ArrayList<TargetYearAllRegVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetYearAllRegVO> excelReader = new ExcelReader<TargetYearAllRegVO>(TargetYearAllRegVO.class, uploadFile.getInputStream(), 0);
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
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetAllYearRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetAllYearRegUploadSave(@Validated @RequestBody TargetYearRegSaveVO targetAllYearRegUploadList, TargetYearRegSearchVO targetYearRegSearchVO) throws Exception {

        targetYearRegSearchVO.setGoalYy(targetYearRegSearchVO.getGoalYy());

        targetYearRegService.insertTargetAllYearRegUploadSave(targetAllYearRegUploadList.getTargetAllYearRegUploadList(), targetYearRegSearchVO);

        return true;

    }

    /**
     * [제조사] 년간 목표 등록 엑셀 부분 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetPartYearRegPopup.do", method = RequestMethod.GET)
    public String selectTargetPartYearRegPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/mis/tmp/selectTargetPartYearRegPopup";
    }

    /**
     * [제조사] 년간 목표 등록 엑셀  데이터 업로드 한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearAllRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetYearRegUploadFile2.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile2(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetYearPartRegVO> list = new ArrayList<TargetYearPartRegVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetYearPartRegVO> excelReader = new ExcelReader<TargetYearPartRegVO>(TargetYearPartRegVO.class, uploadFile.getInputStream(), 0);
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
     * [제조사] 년간 목표 등록 엑셀 전체 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertTargetPartYearRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetPartYearRegUploadSave(@Validated @RequestBody TargetYearRegSaveVO targetPartYearRegUploadList) throws Exception {

        targetYearRegService.insertTargetPartYearRegUploadSave(targetPartYearRegUploadList.getTargetPartYearRegUploadList());

        return true;

    }

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param saveVO - [제조사] 년간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tmp/multiTargetYearRegTempSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTargetYearRegTempSave(@Validated @RequestBody TargetYearRegSaveVO saveVO) throws Exception {

        targetYearRegService.multiTargetYearRegTempSave(saveVO);
        return true;
    }

    @RequestMapping(value = "/mis/tmp/multiTargetYearRegCompleteSaveCnt.do")
    public String multiTargetYearRegCompleteSaveCnt(Model model, HttpServletRequest request, TargetYearAllRegVO targetYearAllRegVO) throws Exception {
        targetYearAllRegVO.setsGoalYy(targetYearAllRegVO.getsGoalYy());
        targetYearAllRegVO.setsSdptCd(targetYearAllRegVO.getsSdptCd());
        targetYearAllRegVO.setsOfficeCd(targetYearAllRegVO.getsOfficeCd());

        targetYearRegService.multiTargetYearRegCompleteSaveCnt(targetYearAllRegVO);

        model.addAttribute("targetYearAllRegVO", targetYearAllRegVO);
        return "/mis/tmp/selectTargetYearRegMain";
    }

    /**
     * [제조사] 년간 목표 정보를 저장 확정한다.
     * @param saveVO - 년간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tmp/multiTargetYearRegCompleteSave.do", method = RequestMethod.POST)
    public String multiTargetYearRegCompleteSave(Model model, HttpServletRequest request, TargetYearAllRegVO targetYearAllRegVO) throws Exception {

        targetYearAllRegVO.setsGoalYy(targetYearAllRegVO.getsGoalYy());
        targetYearAllRegVO.setsSdptCd(targetYearAllRegVO.getsSdptCd());
        targetYearAllRegVO.setsOfficeCd(targetYearAllRegVO.getsOfficeCd());

        targetYearRegService.multiTargetYearRegCompleteSave(targetYearAllRegVO);

        return "/mis/tmp/selectTargetYearRegMain";
    }

    /**
     * [제조사] 년간 목표 등록  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetYearRegReport.do", method = RequestMethod.GET)
    public String selectTargetYearRegReport(Model model) throws Exception {


        return "/mis/tmp/selectTargetYearRegReport";
    }
}
