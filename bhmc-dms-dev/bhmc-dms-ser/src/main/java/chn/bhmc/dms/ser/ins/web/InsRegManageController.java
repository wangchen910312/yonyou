package chn.bhmc.dms.ser.ins.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
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
import chn.bhmc.dms.ser.ins.service.InsRegManageService;
import chn.bhmc.dms.ser.ins.vo.InsRegSaveVO;
import chn.bhmc.dms.ser.ins.vo.InsRegSearchVO;
import chn.bhmc.dms.ser.ins.vo.InsRegVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsReqManageController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class InsRegManageController extends HController {

    @Resource(name="insRegManageService")
    InsRegManageService insRegManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
    *
    * 보험 통합 관리 화면 메인
    *
    * @param model
    * @return 보험 통합 관리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/selectInsRegManageMain.do",method=RequestMethod.GET)
   public String selectInsRegManageMain(Model model
                                 ,@RequestParam(value="vinNo", defaultValue="") String vinNo
                                 ,@RequestParam(value="incDocNo", defaultValue="") String incDocNo
                                   )throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       //공통코드 : 상업보험유형명
       model.addAttribute("cmcIncTpNmDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER121", null, langCd));
       //공통코드 : 상업보험유형
       model.addAttribute("cmcIncTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER122", null, langCd));

       model.addAttribute("vinNo", vinNo);
       model.addAttribute("incDocNo", incDocNo);

       return "/ser/ins/insurance/selectInsRegManageMain";

   }

   /**
    *
    * 보험 통합 관리 화면 엑셀 업로드팝업
    *
    * @param model
    * @return 보험 통합 관리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/selectInsRegExcelUploadPopup.do",method=RequestMethod.GET)
   public String selectInsRegExcelUploadPopup(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       //공통코드 : 상업보험유형명
       model.addAttribute("cmcIncTpNmDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER121", null, langCd));
       //공통코드 : 상업보험유형
       model.addAttribute("cmcIncTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER122", null, langCd));

       return "/ser/ins/insurance/selectInsRegExcelUploadPopup";

   }

   @RequestMapping(value = "/ser/ins/insurance/insertInsRegExcelUploadFile.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult insertInsRegExcelUploadFile(
           @RequestParam("uploadFile") MultipartFile uploadFile,
           @RequestParam("progressId") String progressId,
           HttpServletRequest request,
           HttpServletResponse response) throws Exception {

       SearchResult result = new SearchResult();
       List<InsRegVO> list = new ArrayList<InsRegVO>();
       ExcelUploadStatus status = new ExcelUploadStatus();

       //업로드상태 정보를 세션에 저장한다.
       WebUtils.setSessionAttribute(request, progressId, status);

       if(uploadFile.getSize() > 0){

           try{
               ExcelReader<InsRegVO> excelReader = new ExcelReader<InsRegVO>(InsRegVO.class, uploadFile.getInputStream(), 0);
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

   @RequestMapping(value="/ser/ins/insurance/insertExcelUpload.do",method=RequestMethod.POST)
   @ResponseBody
   public boolean insertExcelUpload(@Validated @RequestBody InsRegSaveVO saveVO)throws Exception{

       insRegManageService.insertExcelUpload(saveVO.getInsRegList());

       return true;
   }

   /**
    *
    * 보험 처리 관리 화면 메인
    *
    * @param model
    * @return 보험 통합 관리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/selectInsRegManageListMain.do",method=RequestMethod.GET)
   public String selectInsRegManageListMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       //공통코드 : 상업보험유형명
       model.addAttribute("cmcIncTpNmDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER121", null, langCd));
       //공통코드 : 상업보험유형
       model.addAttribute("cmcIncTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER122", null, langCd));

       return "/ser/ins/insurance/selectInsRegManageListMain";

   }

   /**
    *
    * 보험관리 등록 목록을 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/selectInRegManages.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectInRegManages(@RequestBody InsRegSearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       searchVO.setsDlrCd(dlrCd);

       SearchResult result = new SearchResult();

       result.setTotal(insRegManageService.selectInsRegManagesByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(insRegManageService.selectInsRegManagesByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * 보험관리 등록 상세 목록을 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/selectInRegDetailManages.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectInRegDetailManages(@RequestBody InsRegSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(insRegManageService.selectInsRegDetailManagesByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(insRegManageService.selectInsRegDetailManagesByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * 보험등록 관리 등록/수정/삭제
    *
    * @param saveVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/multiInsRegManage.do",method=RequestMethod.POST)
   @ResponseBody
   public boolean multiInsRegManage(@RequestBody @Validated InsRegSaveVO saveVO)throws Exception{

       insRegManageService.multiInsRegManage(saveVO);

       return true;
   }

   /**
    *
    * 보험등록 관리상세  등록/수정/삭제
    *
    * @param saveVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ins/insurance/multiInsRegDetailManage.do",method=RequestMethod.POST)
   @ResponseBody
   public boolean multiInsRegDetailManage(@RequestBody @Validated InsRegSaveVO saveVO)throws Exception{

       insRegManageService.multiInsRegDetailManage(saveVO);

       return true;
   }

   /**
   *
   * 보험관리 등록 목록을 조회한다.
   *
   * @param searchVO
   * @return
   * @throws Exception
   */
  @RequestMapping(value="/ser/ins/insurance/selectInRegManageList.do",method=RequestMethod.POST)
  @ResponseBody
  public SearchResult selectInRegManageList(@RequestBody InsRegSearchVO searchVO)throws Exception{

      String dlrCd = LoginUtil.getDlrCd();
      searchVO.setsDlrCd(dlrCd);

      SearchResult result = new SearchResult();

      result.setTotal(insRegManageService.selectInsRegListByConditionCnt(searchVO));
      if(result.getTotal() != 0){
          result.setData(insRegManageService.selectInsRegListByCondition(searchVO));
      }

      return result;
  }


    /**
     *
     * 보험관리 등록 목록을 조회한다.
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/ins/insurance/selectInsuPopup.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInsuPopup(@RequestBody InsuranceManageSearchVO searchVO)throws Exception{
      
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
      
        SearchResult result = new SearchResult();
      
        result.setTotal(insRegManageService.selectInsuManagesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(insRegManageService.selectInsuManagesByCondition(searchVO));
        }
      
        return result;
    }
  
  


}
