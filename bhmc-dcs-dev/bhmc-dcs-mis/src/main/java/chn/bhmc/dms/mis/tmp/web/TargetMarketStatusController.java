package chn.bhmc.dms.mis.tmp.web;

import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.util.*;

import able.com.web.*;
import chn.bhmc.dms.core.datatype.*;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.mis.tmp.service.*;
import chn.bhmc.dms.mis.tmp.vo.*;

/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusController.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetMarketStatusController extends HController {

    /**
     * 시장현황등록 서비스
     */
    @Resource(name="targetMarketStatusService")
    TargetMarketStatusService targetMarketStatusService;

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetMarketStatus.do")
    public String selectTargetMarketStatus(Model model) throws Exception {

        // 성(우편번호) 목록을 조회한다.
        List<TargetMarketStatusVO> arrProvinceInfo = targetMarketStatusService.selectProvinceInfoList("");
        model.addAttribute("arrProvinceInfo", arrProvinceInfo);

        // 시(우편번호) 목록을 조회한다.
        List<TargetMarketStatusVO> arrCityInfo = targetMarketStatusService.selectCityInfoList("");
        model.addAttribute("arrCityInfo", arrCityInfo);

        return "/mis/tmp/selectTargetMarketStatus";
    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @RequestMapping(value = "/mis/tmp/selectManuMarketStatusCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectManuMarketStatusCity(@RequestBody TargetMarketStatusSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setProvinceCd(searchVO.getProvinceCd());

        result.setTotal(targetMarketStatusService.selectManuMarketStatusCityCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetMarketStatusService.selectManuMarketStatusCityList(searchVO));
        }

        return result;
    }

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectManuMarketStatusGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectManuMarketStatusGrid(@RequestBody TargetMarketStatusSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(targetMarketStatusService.selectManuMarketStatusByCondition(searchVO));
        return result;
    }

    /**
     * 시장현황자료 엑셀 일괄 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMarketStatusSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectManuMarketStatusDataRegPopup.do", method = RequestMethod.GET)
    public String selectManuMarketStatusDataRegPopup(Model model, HttpServletRequest request) throws Exception {

        return "/mis/tmp/selectManuMarketStatusDataRegPopup";
    }

    /**
     * 시장현황자료 엑셀 일괄 데이터 업로드 한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearAllRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertManuMarketStatusDataRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetMarketStatusVO> list = new ArrayList<TargetMarketStatusVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetMarketStatusVO> excelReader = new ExcelReader<TargetMarketStatusVO>(TargetMarketStatusVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                list = targetMarketStatusService.selectManuMarketStatusDataRegChkByExcelImp(list);

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
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertManuMarketStatusDataRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertManuMarketStatusDataRegUploadSave(@Validated @RequestBody TargetMarketStatusSaveVO targetMarketStatusRegUploadList) throws Exception {

        targetMarketStatusService.insertManuMarketStatusDataRegUploadSave(targetMarketStatusRegUploadList.getTargetMarketStatusRegUploadList());

        return true;

    }

    /**
     * 목표분해도 - 시장현황 상세 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectManuMarketDetailGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectManuMarketDetailGrid(@RequestBody TargetMarketStatusSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(targetMarketStatusService.selectManuMarketDetailByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetMarketStatusService.selectManuMarketDetailByCondition(searchVO));
        }

        return result;

    }

}
