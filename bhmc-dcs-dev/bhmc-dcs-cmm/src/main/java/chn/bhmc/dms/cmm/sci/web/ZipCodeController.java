package chn.bhmc.dms.cmm.sci.web;

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
import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;

/**
 * 우편번호 관리 컨트롤러
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
public class ZipCodeController extends HController {

    /**
     * 우편번호 관리 서비스
     */
    @Resource(name="zipCodeService")
    ZipCodeService zipCodeService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 우편번호 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/zipCode/selectZipCodeMain.do", method = RequestMethod.GET)
    public String selectZipCodeMain(Model model) throws Exception {
        model.addAttribute("gubunList", commonCodeService.selectCommonCodesByCmmGrpCd("COM018", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/cmm/sci/zipCode/selectZipCodeMain";
    }

    /**
     * 우편번호 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/zipCode/selectZipCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectZipCodes(@RequestBody ZipCodeSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(zipCodeService.selectZipCodesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(zipCodeService.selectZipCodesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 우편번호 정보를 등록한다.
     * @param saveVO - 우편번호정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/zipCode/multiZipCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiZipCodes(@Validated @RequestBody ZipCodeSaveVO saveVO) throws Exception {
        zipCodeService.multiZipCodes(saveVO);
        return true;
    }

    @RequestMapping(value = "/cmm/sci/zipCode/insertZipCodeBatchUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertZipCodeBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<ZipCodeVO> list = new ArrayList<ZipCodeVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<ZipCodeVO> excelReader = new ExcelReader<ZipCodeVO>(ZipCodeVO.class, uploadFile.getInputStream(), 0);
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
     * 우편번호를 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/zipCode/insertZipCodeBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadSave(@Validated @RequestBody ZipCodeSaveVO batchUploadList) throws Exception {
        zipCodeService.insertZipCodeBatchUpload(batchUploadList.getBatchUploadList());
        return true;
    }

    /**
     * 우편번호를 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/zipCode/selectZipCodeBatchUploadPopup.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopup() throws Exception {
        return "/cmm/sci/zipCode/selectZipCodeBatchUploadPopup";
    }
}
