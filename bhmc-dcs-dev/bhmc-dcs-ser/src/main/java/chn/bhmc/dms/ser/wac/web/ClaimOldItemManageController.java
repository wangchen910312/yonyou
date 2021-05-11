package chn.bhmc.dms.ser.wac.web;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.wac.service.ClaimOldItemManageService;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageController.java
 * @Description : 고품관리 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 5. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 3.     YIN XUEYUAN     최초 생성
 * </pre>
 */
@Controller
public class ClaimOldItemManageController extends HController{

    /**
     * 고품관리 서비스
     */
    @Resource(name="claimOldItemManageService")
    ClaimOldItemManageService claimOldItemManageService;

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;


    /**
    *
    * DCS 고품요청 조회 화면 메인
    *
    * @param model
    * @return DCS 고품관리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemMain.do")
   public String selectClaimOldItemMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sReqToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       return "/ser/wac/claimOldItemManage/selectClaimOldItemMain";

   }

    /**
    *
    * DCS 고품요청 관리 메인(DSC) - 사용
    *
    * @param model
    * @return DCS 고품요청 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemApproveMain.do")
   public String selectClaimOldItemApproveMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       model.addAttribute("sReqToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd") );
       model.addAttribute("loginUsrId", LoginUtil.getUserId());
       model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/ser/wac/claimOldItemManage/selectClaimOldItemApproveMain";

   }

   /**
    *
    * DCS 고품회수 관리 메인
    *
    * @param model
    * @return DCS 고품회수 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemRecoveryMain.do")
   public String selectClaimOldItemRecoveryMain(Model model)throws Exception{
       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sReqToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 접수여부
       model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       return "/ser/wac/claimOldItemManage/selectClaimOldItemRecoveryMain";

   }

   /**
    *
    * DCS 고품공제 관리 메인
    *
    * @param model
    * @return DCS 고품공제 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemDeduteMain.do")
   public String selectClaimOldItemDeduteMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 접수여부
       model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd ));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       return "/ser/wac/claimOldItemManage/selectClaimOldItemDeduteMain";

   }

   /**
    *
    * DCS 고품출고 관리 메인
    *
    * @param model
    * @return DCS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemOutMain.do")
   public String selectClaimOldItemOutMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 접수여부
       model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       return "/ser/wac/claimOldItemManage/selectClaimOldItemOutMain";
   }

   /**
    *
    * DMS 고품출고 관리 메인
    *
    * @param model
    * @return DMS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMain.do")
   public String selectDlrClaimOldItemManageMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       //법인[DCS] 부서목록
       DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
       departmentSearchVO.setsUseYn("Y");
       departmentSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
       List<DepartmentVO> deptList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
       model.addAttribute("deptCdList", deptList);

       return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMain";
   }

   /**
    *
    * DMS 고품 조회  메인
    *
    * @param model
    * @return DMS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemMain.do")
   public String selectDlrClaimOldItemMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       //법인[DCS] 부서목록
       DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
       departmentSearchVO.setsUseYn("Y");
       departmentSearchVO.setsCmpTp(Constants.CMP_TP_CORP);
       List<DepartmentVO> deptList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
       model.addAttribute("deptCdList", deptList);

       return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemMain";
   }

   /**
    *
    * DCS 고품 배치 등록 파업
    *
    * @param model
    * @return DCS 고품 배치 등록
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectClaimOldItemApproveBatchUploadPopup.do")
   public String selectClaimOldItemApproveBatchUploadPopup(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       // 공통코드 : 고품요청상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));


       return "/ser/wac/claimOldItemManage/selectClaimOldItemApproveBatchUploadPopup";

   }

   @RequestMapping(value = "/ser/wac/claimOldItemManage/insertClaimOldItemApproveBatchUploadFile.do", method = RequestMethod.POST)
   @ResponseBody
   public Boolean insertClaimOldItemApproveBatchUploadFile(
                                                            @RequestParam("uploadFile") MultipartFile uploadFile,
                                                            @RequestParam("progressId") String progressId,
                                                            HttpServletRequest request,
                                                            HttpServletResponse response) throws Exception {

        //SearchResult result = new SearchResult();
        List<ClaimOldItemManageVO> list = new ArrayList<ClaimOldItemManageVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<ClaimOldItemManageVO> excelReader = new ExcelReader<ClaimOldItemManageVO>(ClaimOldItemManageVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                claimOldItemManageService.multiClaimOldItemExcelTemp(list);

                /*ClaimOldItemManageSearchVO searchVO = new ClaimOldItemManageSearchVO();
                result.setTotal(claimOldItemManageService.selectClaimOldItemExcelTempByConditionCnt(searchVO));
                if(result.getTotal() != 0){
                    result.setData(claimOldItemManageService.selectClaimOldItemExcelTempByCondition(searchVO));
                }*/

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return true;

    }

   /**
     * DCS 고품 엑셀업로드 TEMP 조회
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimOldItemExcelTemp.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItemExcelTemp(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemExcelTempByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemExcelTempByCondition(searchVO));
        }
        return result;

    }

    /**
     * DCS 고품 공제관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimOldItemExcelTempErr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItemExcelTempErr(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemExcelTempErrByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemExcelTempErrByCondition(searchVO));
        }
        return result;

    }

   /**
     * DCS EXCEL UPLOAD  TEMP DATA를 본테이블에  저장한다.
     * @param saveVO - 고품 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/insertExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertExcelData() throws Exception{


        claimOldItemManageService.insertExcelData();

        return true;

    }

    /**
     * DCS 고품 정보를 등록후 요청 한다.
     * @param saveVO - 고품 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/insertClaimOldItemManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertClaimOldItemManage(@Validated @RequestBody ClaimOldItemManageSaveVO saveVO ) throws Exception{

        claimOldItemManageService.insertClaimOldItemManage(saveVO);

        return true;

    }

    /**
     * DCS 고품회수관리 를 등록후 요청 한다.
     * @param saveVO - 고품 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/updateReceiveOldItemManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateReceiveOldItemManage(@Validated @RequestBody ClaimOldItemManageSaveVO saveVO ) throws Exception{

        return claimOldItemManageService.updateReceiveOldItemManage(saveVO);
    }

    /**
     * DCS 고품공제관리 등록
     * @param saveVO - 고품공제 수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/updateDeductOldItemManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDeductOldItemManage(@Validated @RequestBody ClaimOldItemManageSaveVO saveVO ) throws Exception{

        return claimOldItemManageService.updateDeductOldItemManage(saveVO);
    }

    /**
     * DCS 고품출고 정보를 등록후 요청 한다.
     * @param saveVO - 고품 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/updateClaimOldItemOutManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateClaimOldItemOutManage(@Validated @RequestBody ClaimOldItemManageSaveVO saveVO ) throws Exception{

        claimOldItemManageService.updateClaimOldItemOutManage(saveVO);

        return true;

    }

    /**
     * DCS 고품 공제관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectDeductOldItemManage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItems(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectDeductOldItemManageByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectDeductOldItemManageByCondition(searchVO));
        }
        return result;

    }

    /**
     * DCS 고품 요청 관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimOldItemInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItemInfo(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemInfoByCondition(searchVO));
        }
        return result;

    }

    /**
     * DCS 고품 회수 관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimOldItemRecovery.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItemRecovery(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemRecoveryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemRecoveryByCondition(searchVO));
        }
        return result;

    }

    /**
     * DCS 고품출고 관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectOldItemOutManage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOldItemOutManage(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectOldItemOutManageByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectOldItemOutManageByCondition(searchVO));
        }
        return result;

    }



    /**
     * 고품요청조회 현황 헤더
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimHeadInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimHeadInfo(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(claimOldItemManageService.selectClaimOldItemMaterInfoByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemMaterInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고품요청조회 현황 상세
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectOldItemsDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOldItemsDetail(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemDetailInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemDetailInfoByCondition(searchVO));
        }


        return result;

    }

}
