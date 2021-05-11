package chn.bhmc.dms.mis.tdm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
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

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.mis.tdm.service.TargetDcptMgmtService;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtCustConfigSaveVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSalemanSaveVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSalemanVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSaveVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSearchVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtVO;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtController.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetDcptMgmtController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 목표분해도 서비스
     */
    @Resource(name="targetDcptMgmtService")
    TargetDcptMgmtService targetDcptMgmtService;

    /**
     * 목표분해도 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtMain.do", method = RequestMethod.GET)
    public String selectTargetDcptMgmtMain(Model model) throws Exception {

        return "/mis/tdm/selectTargetDcptMgmtMain";
    }

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtMarketStatusSearch.do")
    public String selectTargetDcptMgmtMarketStatusSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        // 성(우편번호) 목록을 조회한다.
        List<TargetDcptMgmtVO> arrProvinceInfo = targetDcptMgmtService.selectProvinceInfoList("");
        model.addAttribute("arrProvinceInfo", arrProvinceInfo);

        // 시(우편번호) 목록을 조회한다.
        List<TargetDcptMgmtVO> arrCityInfo = targetDcptMgmtService.selectCityInfoList("");
        model.addAttribute("arrCityInfo", arrCityInfo);


        return "/mis/tdm/selectTargetDcptMgmtMarketStatusSearch";
    }

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtMarketStatusGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtMarketStatusGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtByCondition(searchVO));

        return result;

    }

    /**
     * 시(우편번호) 목록을 조회한다.
     */
    @RequestMapping(value = "/mis/tdm/selectMarketStatusCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMarketStatusCity(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setProvinceCd(searchVO.getProvinceCd());

        result.setTotal(targetDcptMgmtService.selectMarketStatusCityCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectMarketStatusCityList(searchVO));
        }

        return result;
    }

    /**
     * 목표분해도 - 시장현황자료 엑셀 일괄 데이터 업로드 팝업 화면을 출력한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectMarketStatusDataRegPopup.do", method = RequestMethod.GET)
    public String selectMarketStatusDataRegPopup(Model model, HttpServletRequest request) throws Exception {

        return "/mis/tdm/selectMarketStatusDataRegPopup";
    }

    /**
     * 목표분해도 - 시장현황자료 엑셀 일괄 데이터 업로드 한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearAllRegVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/insertTargetDcptMgmtRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetDcptMgmtVO> list = new ArrayList<TargetDcptMgmtVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetDcptMgmtVO> excelReader = new ExcelReader<TargetDcptMgmtVO>(TargetDcptMgmtVO.class, uploadFile.getInputStream(), 0);
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
     * 목표분해도 - 시장현황자료 엑셀 일괄 데이터 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tdm/insertTargetDcptMgmtRegUploadSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetDcptMgmtRegUploadSave(@Validated @RequestBody TargetDcptMgmtSaveVO targetDcptMgmtRegUploadList) throws Exception {

        targetDcptMgmtService.insertTargetDcptMgmtRegUploadSave(targetDcptMgmtRegUploadList.getTargetDcptMgmtRegUploadList());

        return true;

    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerStatusSearch.do")
    public String selectTargetDcptMgmtDealerStatusSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        return "/mis/tdm/selectTargetDcptMgmtDealerStatusSearch";
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerStatusBasicGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerStatusBasicGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerStatusBasicGrid(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerStatusDetailGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerStatusDetailGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerStatusDetailGrid(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 제조사목표(당월 총 목표) 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtManuTargetSearch.do")
    public String selectTargetDcptMgmtManuTargetSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        return "/mis/tdm/selectTargetDcptMgmtManuTargetSearch";

    }

    /**
     * 목표분해도 - 제조사목표(당월 총 목표) 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtManuTargetAllGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtManuTargetAllGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(targetDcptMgmtService.selectTargetDcptMgmtManuTargetAllGrid(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 제조사목표(그리드) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtManuTargetGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtManuTargetGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptMgmtService.selectTargetDcptMgmtManuTargetGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectTargetDcptMgmtManuTargetGridByCondition(searchVO));
        }

        return result;

    }

    /**
     * 목표분해도 - 딜러분해 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch.do", method = {RequestMethod.GET, RequestMethod.POST})

    public String selectTargetDcptMgmtDealerDcptSaleSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH )+1;
        String newStatusMonth = "";

        if(targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }
        List<TargetDcptMgmtSearchVO> totalResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptTotalResult(targetDcptMgmtSearchVO);

        if(totalResultList.size() > 0 && totalResultList.get(0).getAllDealerGoalPrefVal() != "0"){
            targetDcptMgmtSearchVO = totalResultList.get(0);
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerSaleDcptTotalResult(targetDcptMgmtSearchVO);
            targetDcptMgmtSearchVO.setAllDealerGoalPrefVal("0");
            targetDcptMgmtSearchVO.setIdccDealerGoalPrefVal("0");
            targetDcptMgmtSearchVO.setShopDealerGoalPrefVal("0");
            targetDcptMgmtSearchVO.setDealerPrefTp("T");
        }

        model.addAttribute("targetDcptMgmtSearchVO", targetDcptMgmtSearchVO);

        TargetDcptMgmtSearchVO carResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> carResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptCarResult(targetDcptMgmtSearchVO);

        if(carResultList.size() > 0){
            carResultListVO = carResultList.get(0);
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerSaleDcptCarResult(targetDcptMgmtSearchVO);
        }

        model.addAttribute("carResultListVO", carResultListVO);

        TargetDcptMgmtSearchVO shopResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> shopResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptShopResult(targetDcptMgmtSearchVO);

        if(shopResultList.size() > 0){
            shopResultListVO = shopResultList.get(0);
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerSaleDcptCarResult(shopResultListVO);
        }

        model.addAttribute("shopResultListVO", shopResultListVO);

        TargetDcptMgmtSearchVO custResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> custResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerDcptCustResult(targetDcptMgmtSearchVO);

        if(custResultList.size() > 0){
            custResultListVO = custResultList.get(0);
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerDcptCustResult(carResultListVO);
        }

        model.addAttribute("custResultListVO", custResultListVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch";

    }

    /**
     * 목표분해도 - 딜러분해 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleManSearch.do", method = {RequestMethod.GET, RequestMethod.POST})

    public String selectTargetDcptMgmtDealerDcptSaleManSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH )+1;
        String newStatusMonth = "";

        TargetDcptMgmtSearchVO saleAllResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleManDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> saleAllResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerDcptSaleManAllData(targetDcptMgmtSearchVO);

        if(saleAllResultList.size() > 0){
            saleAllResultListVO = saleAllResultList.get(0);
        } else {
            saleAllResultListVO.setAllMonthTargetVal("0");
            saleAllResultListVO.setIdccMonthTargetVal("0");
            saleAllResultListVO.setShopMonthTargetVal("0");
            saleAllResultListVO.setAllSalemanCnt("0");
        }

        model.addAttribute("saleAllResultListVO", saleAllResultListVO);


        TargetDcptMgmtSearchVO saleStatusResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleManDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> saleStatusResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerDcptSaleManAllStatus(targetDcptMgmtSearchVO);

        if(saleStatusResultList.size() > 0){
            saleStatusResultListVO = saleStatusResultList.get(0);
        }

        model.addAttribute("saleStatusResultListVO", saleStatusResultListVO);


        TargetDcptMgmtSearchVO saleProResultListVO = new TargetDcptMgmtSearchVO();

        if(targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == null || targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            targetDcptMgmtSearchVO.setsDealerSaleManDcptYyMm(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptMgmtSearchVO> saleProResultList = targetDcptMgmtService.selectTargetDcptMgmtDealerDcptSaleManProStatus(targetDcptMgmtSearchVO);

        if(saleProResultList.size() > 0){
            saleProResultListVO = saleProResultList.get(0);
        }

        model.addAttribute("saleProResultListVO", saleProResultListVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleManSearch";
    }

    /**
     * 목표분해도 - 딜러분해 자료를 조회한다.(당월 총목표 그리드)
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerSaleDcptTotal.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerSaleDcptTotal(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptTotalCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptTotalResult(searchVO));
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerSaleDcptTotalResult(searchVO);
        }
        result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptTotalBasic(searchVO));
        return result;

    }

    /**
     * 목표분해도 - 딜러분해 자료를 조회한다.(차종별 목표 그리드)
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerDcptCar.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerDcptCar(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptCarCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptCarResult(searchVO));
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerSaleDcptCarResult(searchVO);
        }

        result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerSaleDcptCarResult(searchVO));
        return result;

    }

    /**
     * 목표분해도 - 딜러분해 자료를 조회한다.(집객 목표 그리드)
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerDcptCust.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerDcptCust(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptMgmtService.selectTargetDcptMgmtDealerDcptCustCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerDcptCustResult(searchVO));
        } else {
            targetDcptMgmtService.insertTargetDcptMgmtDealerDcptCustResult(searchVO);
        }

        result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerDcptCustResult(searchVO));
        return result;

    }

    /**
     * 목표분해도 - 딜러분해 자료를 등록한다.
     * @param saveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/updateTargetDcptMgmtDealerDcptCar.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateTargetDcptMgmtDealerDcptCar(@Validated @RequestBody BaseSaveVO<TargetDcptMgmtSearchVO> saveVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtDealerDcptCar(saveVO);
        return true;
    }

    /**
     * 목표분해도 - 딜러분해 자료를 등록한다.
     * @param saveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/updateTargetDcptMgmtDealerDcptCust.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateTargetDcptMgmtDealerDcptCust(@Validated @RequestBody BaseSaveVO<TargetDcptMgmtSearchVO> saveVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtDealerDcptCust(saveVO);
        return true;
    }

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 팝업 화면을 호출한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectSalesmanDcptRegPopup.do", method = RequestMethod.GET)
    public String selectSalesmanDcptRegPopup(Model model, HttpServletRequest request) throws Exception {

        return "/mis/tmp/selectSalesmanDcptRegPopup";
    }


    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 한다.
     * @param TargetDcptMgmtSalemanVO
     * @param TargetDcptMgmtSalemanVO
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSalemanVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/insertSalesmanDcptRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile1(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetDcptMgmtSalemanVO> list = new ArrayList<TargetDcptMgmtSalemanVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetDcptMgmtSalemanVO> excelReader = new ExcelReader<TargetDcptMgmtSalemanVO>(TargetDcptMgmtSalemanVO.class, uploadFile.getInputStream(), 0);
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
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectSalesmanDcptRegExcel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectSalesmanDcptRegExcel(@Validated @RequestBody TargetDcptMgmtSalemanSaveVO targetSalesmanRegUploadList, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO, TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception {

        targetDcptMgmtSearchVO.setsDealerSaleManDcptYyMm(targetDcptMgmtSearchVO.getsDealerSaleManDcptYyMm());

        targetDcptMgmtService.insertSalesmanDcptRegUploadSave(targetSalesmanRegUploadList.getTargetSalesmanRegUploadList(), targetDcptMgmtSearchVO);

        return true;

    }

    /**
     * [목표분해도 - 딜러분해(판매고문)  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerSalemanDcpt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerSalemanDcpt(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH )+1;
        String newStatusMonth = "";

        if(searchVO.getsDealerSaleManDcptYyMm() == null || searchVO.getsDealerSaleManDcptYyMm() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            }
            searchVO.setsDealerSaleManDcptYyMm(String.valueOf(statusYear)+newStatusMonth);

        }
        SearchResult result = new SearchResult();
        result.setTotal(targetDcptMgmtService.selectTargetDcptMgmtDealerSalemanDcptCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerSalemanDcpt(searchVO));
        }

        return result;

    }

    /**
     * 목표분해도 - 딜러분해 집객 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerDcptCustSearch.do")
    public String selectTargetDcptMgmtDealerDcptCustSearch(Model model, TargetDcptMgmtSearchVO searchVO) throws Exception {


        return "/mis/tdm/selectTargetDcptMgmtDealerDcptCustSearch";
    }

    /**
     * 목표분해도 - 딜러분해 집객 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectCustStatus.do")
    public String selectCustStatus(Model model, TargetDcptMgmtSearchVO searchVO) throws Exception {


        return "/mis/tdm/selectCustStatus";
    }

    /**
     * 목표분해도 - 딜러분해 집객 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectCustModel.do")
    public String selectCustModel(Model model, TargetDcptMgmtSearchVO searchVO) throws Exception {


        return "/mis/tdm/selectCustModel";
    }



    /**
     * 목표분해도 - 과정관리 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessMgmtSearch.do")
    public String selectTargetDcptMgmtProcessMgmtSearch(Model model, TargetDcptMgmtSearchVO searchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        if(searchVO.getsProcessMgmtYyMmDd() == null || searchVO.getsProcessMgmtYyMmDd() == ""){

            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }

            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }

            searchVO.setsProcessMgmtYyMmDd(String.valueOf(statusYear)+newStatusMonth+newStatusDate);
        }

        //List<TargetDcptMgmtSearchVO> dcptInfoList = targetDcptMgmtService.selectTargetDcptMgmtProcessMgmtSale(searchVO);

        //if(dcptInfoList.size() > 0){

        //    searchVO = dcptInfoList.get(0);

       // } else {

         //   searchVO.setTotalDayTargetVal("0");
         //   searchVO.setTotalDayGoalVal("0%");
         //   searchVO.setTotalDayGapVal("0");
         //   searchVO.setTotalDayDealRate("0");
         //   searchVO.setTotalMonthTargetVal("0");
         //   searchVO.setTotalMonthGoalVal("0");
         //   searchVO.setTotalMonthGapVal("0");
         //   searchVO.setTotalMonthDealRate("0%");
         //   searchVO.setTotalYearTargetVal("0");
         //   searchVO.setTotalYearGoalVal("0");
         //   searchVO.setTotalYearGapVal("0");
         //   searchVO.setTotalYearDealRate("0");

        //}

        //model.addAttribute("dcptInfoList", dcptInfoList);

        return "/mis/tdm/selectTargetDcptMgmtProcessMgmtSearch";

    }

    /**
     * 목표분해도 - 과정관리 진도자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetProPopup.do")
    public String selectTargetProPopup(Model model, TargetDcptMgmtSearchVO searchVO) throws Exception {

        return "/mis/tmp/selectTargetProPopup";

    }

    /**
     * 목표분해도 - KPI 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtCustKpiSearch.do")
    public String selectTargetDcptMgmtCustKpiSearch(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        if(targetDcptMgmtSearchVO.getsCustKpiYyMmDd() == null || targetDcptMgmtSearchVO.getsCustKpiYyMmDd() == ""){

            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }

            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }

            targetDcptMgmtSearchVO.setsCustKpiYyMmDd(String.valueOf(statusYear)+newStatusMonth+newStatusDate);
        }

        if(targetDcptMgmtSearchVO.geteCustKpiYyMmDd() == null || targetDcptMgmtSearchVO.geteCustKpiYyMmDd() == ""){

            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }

            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }

            targetDcptMgmtSearchVO.seteCustKpiYyMmDd(String.valueOf(statusYear)+newStatusMonth+newStatusDate);
        }



        List<TargetDcptMgmtSearchVO> kpiList = targetDcptMgmtService.selectTargetDcptMgmtKpi(targetDcptMgmtSearchVO);

        if(kpiList != null){
            targetDcptMgmtSearchVO = kpiList.get(0);
        }

        model.addAttribute("targetDcptMgmtSearchVO", targetDcptMgmtSearchVO);

        return "/mis/tdm/selectTargetDcptMgmtCustKpiSearch";

    }

    /**
     * [제조사] 년간 목표 정보를 저장 확정한다.
     * @param response
     * @param saveVO - 년간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/insertTargetDcptMgmtDealerDcptSaleSave.do", method = RequestMethod.POST)
    public String insertTargetDcptMgmtDealerDcptSaleSave(Model model, HttpServletRequest request, ServletResponse response, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtDealerDcptSaleAll(targetDcptMgmtSearchVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch";

    }

    /**
     * [제조사] 년간 목표 정보를 저장 확정한다.
     * @param response
     * @param saveVO - 년간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/updateTargetDcptMgmtDealerDcptSaleComplete.do", method = RequestMethod.POST)
    public String updateTargetDcptMgmtDealerDcptSaleComplete(Model model, HttpServletRequest request, ServletResponse response, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtDealerDcptSaleComplete(targetDcptMgmtSearchVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch";

    }

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerTargetStatus.do")
    public String selectTargetDcptMgmtDealerTargetStatus(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";


        if(targetDcptMgmtSearchVO.getsTargetStatusYyMmDd() == null || targetDcptMgmtSearchVO.getsTargetStatusYyMmDd() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }
            targetDcptMgmtSearchVO.setsTargetStatusYyMmDd(String.valueOf(statusYear)+newStatusMonth+newStatusDate);
        }

        List<TargetDcptMgmtSearchVO> potenCustCntList = targetDcptMgmtService.selectTargetDcptMgmtPotenCustCnt(targetDcptMgmtSearchVO);

        if(potenCustCntList.size() > 0){
            targetDcptMgmtSearchVO = potenCustCntList.get(0);
        }

        model.addAttribute("potenCustCntList", potenCustCntList);

        return "/mis/tdm/selectTargetDcptMgmtDealerTargetStatus";
    }

    /**
     * 목표분해도 - 시장현황 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerTargetAchieve.do")
    public String selectTargetDcptMgmtDealerTargetAchieve(Model model, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {


        return "/mis/tdm/selectTargetDcptMgmtDealerTargetAchieve";
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtDealerTargetAchieveGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerTargetAchieveGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerTargetAchieveGrid(searchVO));
        //result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerTargetAchieveIdccGrid(searchVO));
        //result.setData(targetDcptMgmtService.selectTargetDcptMgmtDealerTargetAchieveShopGrid(searchVO));

        return result;
    }

    /**
     * [제조사] 년간 목표 정보를 저장 확정한다.
     * @param response
     * @param saveVO - 년간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/insertTargetDcptMgmtTargetStatusSave.do", method = RequestMethod.POST)
    public String insertTargetDcptMgmtTargetStatusSave(Model model, HttpServletRequest request, ServletResponse response, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtTargetStatusSave(targetDcptMgmtSearchVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerTargetStatus";

    }

    /**
     * [제조사] 년간 목표 정보를 저장 확정한다.
     * @param response
     * @param saveVO - 년간 목표 정보를 저장 확정한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/updateTargetDcptMgmtDealerDcptCustComplete.do", method = RequestMethod.POST)
    public String updateTargetDcptMgmtDealerDcptCustComplete(Model model, HttpServletRequest request, ServletResponse response, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception {

        targetDcptMgmtService.updateTargetDcptMgmtDealerDcptCustComplete(targetDcptMgmtSearchVO);

        return "/mis/tdm/selectTargetDcptMgmtDealerTargetStatus";

    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessMgmtGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtProcessMgmtGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtProcessMgmtGrid(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessCustConfig.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtProcessCustConfig(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtProcessCustConfig(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessCustConfigVal.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtProcessCustConfigVal(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtProcessCustConfigVal(searchVO));

        return result;
    }

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param saveVO - [제조사] 년간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tdm/multiTargetCustConfigRegTempSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTargetCustConfigRegTempSave(@Validated @RequestBody TargetDcptMgmtCustConfigSaveVO saveVO) throws Exception {

        targetDcptMgmtService.multiTargetCustConfigRegTempSave(saveVO);
        return true;
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessMgmtSaleGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtProcessMgmtSaleGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtProcessMgmtSaleGrid(searchVO));

        return result;
    }

    /**
     * 목표분해도 - 딜러현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tdm/selectTargetDcptMgmtProcessMgmtCustGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtProcessMgmtCustGrid(@RequestBody TargetDcptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptMgmtService.selectTargetDcptMgmtProcessMgmtCustGrid(searchVO));

        return result;
    }

}
