package chn.bhmc.dms.sal.stm.web;


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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.stm.service.CorpStockConditionService;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSaveVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 법인재고현황(전략오더)
 *
 * @author Kim Jin Suk
 * @since 2016. 7. 25
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.25          Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/stm/corpStockCondition")
public class CorpStockConditionController extends HController {

    /**
     * 법인재고현황(전략오더)
     */
    @Resource(name="corpStockConditionService")
    private CorpStockConditionService corpStockConditionService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * 법인재고현황(전략오더) Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCorpStockConditionMain.do", method = RequestMethod.GET)
    public String selectCorpStockConditionMain(Model model) throws Exception {

        //배기등급 : SAL159
        model.addAttribute("dispGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL159", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/stm/corpStockCondition/selectCorpStockConditionMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 법인재고현황(전략오더) 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectCorpStockConditionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorpStockConditionSearch(@RequestBody CorpStockConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(corpStockConditionService.selectCorpStockConditionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(corpStockConditionService.selectCorpStockConditionsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 법인재고현황(전략오더) 엑셀업로드
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCorpStockConditionUploadPopup.do", method = RequestMethod.GET)
    public String selectCorpStockConditionUploadPopup(Model model, HttpServletRequest request) throws Exception {

        //배기등급 : SAL159
        model.addAttribute("dispGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL159", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/stm/corpStockCondition/selectCorpStockConditionUploadPopup";
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
    @RequestMapping(value = "/insertCorpStockConditionUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertCorpStockConditionUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        ExcelUploadStatus status = new ExcelUploadStatus();

        List<CorpStockConditionVO> list = new ArrayList<CorpStockConditionVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<CorpStockConditionVO> excelReader = new ExcelReader<CorpStockConditionVO>(CorpStockConditionVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);

                /**
                 * 모델, 지도가격, 배기등급을 불러온다.
                 */
                if(list.size() > 0){
                    list = corpStockConditionService.selectCorpStockConditionModelPrice(list);
                }

                result.setTotal(list.size());
                result.setData(list);


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
    @RequestMapping(value = "/insertCorpStockConditionUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCorpStockConditionUpload(@Validated @RequestBody CorpStockConditionSaveVO uploadList) throws Exception {
        corpStockConditionService.insertCorpStockConditionUpload(uploadList.getUploadList());

        return true;

    }

    /**
     * 법인재고현황(전략오더) 등록 마감시간 체크
     */
    @RequestMapping(value = "/selectCorpStockDeadLineCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCorpStockDeadLineCheck() throws Exception {

        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("A");                      // 오더
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
        deadLineVO.setsCtrlTargCd("B00");                   // 전략수량등록

        return deadlineCtrlMngService.selectDeadLineCheck(deadLineVO);
    }

}
