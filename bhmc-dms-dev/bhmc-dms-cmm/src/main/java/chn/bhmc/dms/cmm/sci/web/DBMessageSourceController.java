package chn.bhmc.dms.cmm.sci.web;

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

import chn.bhmc.dms.cmm.sci.service.DBMessageSourceService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSaveVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;

/**
 * 메세지소스 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DBMessageSourceController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 메세지소스 관리 서비스
     */
    @Resource(name="dbMessageSourceService")
    DBMessageSourceService dbMessageSourceService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 메세지소스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/dbMessageSource/selectDBMessageSourceMain.do", method = RequestMethod.GET)
    public String selectDBMessageSourceMain(Model model) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/cmm/sci/dbMessageSource/selectDBMessageSourceMain";
    }

    /**
     * 메세지소스 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/dbMessageSource/selectDBMessageSources.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDBMessageSources(@RequestBody DBMessageSourceSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(dbMessageSourceService.selectDBMessageSourcesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dbMessageSourceService.selectDBMessageSourcesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 메세지소스 정보를 등록한다.
     * @param saveVO - 메세지소스정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/dbMessageSource/multiDBMessageSources.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDBMessageSources(@Validated @RequestBody DBMessageSourceSaveVO saveVO) throws Exception {

        dbMessageSourceService.multiDBMessageSources(saveVO);
        return true;
    }

    @RequestMapping(value = "/cmm/sci/dbMessageSource/selectDBMessageSourceBatchUploadPopup.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopup(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/cmm/sci/dbMessageSource/selectDBMessageSourceBatchUploadPopup";
    }

    @RequestMapping(value = "/cmm/sci/dbMessageSource/insertDBMessageSourceBatchUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<DBMessageSourceVO> list = new ArrayList<DBMessageSourceVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<DBMessageSourceVO> excelReader = new ExcelReader<DBMessageSourceVO>(DBMessageSourceVO.class, uploadFile.getInputStream(), 0);
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
     * 메세지소스 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/dbMessageSource/insertDBMessageSourceBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadSave(@Validated @RequestBody DBMessageSourceSaveVO batchUploadList) throws Exception {

        dbMessageSourceService.insertDBMessageSourceBatchUpload(batchUploadList.getBatchUploadList());

        return true;

    }
}
