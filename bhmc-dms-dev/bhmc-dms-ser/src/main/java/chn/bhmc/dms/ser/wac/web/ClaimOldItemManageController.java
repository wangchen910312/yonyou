package chn.bhmc.dms.ser.wac.web;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.wac.service.ClaimOldItemManageService;
import chn.bhmc.dms.ser.wac.vo.*;

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
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

   /**
    *
    * DMS 고품출고 관리 메인
    *
    * @param model
    * @return DMS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMain.do")
   public String selectDlrClaimOldItemManageMain(Model model, HttpServletRequest request)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("sReqToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

       // 공통코드 : 고품상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMain";

   }

   /**
    *
    * DMS 고품요청 조회  메인
    *
    * @param model
    * @return DMS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemMain.do")
   public String selectDlrClaimOldItemMain(Model model, HttpServletRequest request)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("sReqToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

       // 공통코드 : 고품상태
       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER300", null, langCd));

       // 공통코드 : 고품조회조건
       model.addAttribute("searchList", commonCodeService.selectCommonCodesByCmmGrpCd("SER301", null, langCd));

       // 공통코드 : 고품부서
       model.addAttribute("deptCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER302", null, langCd));

       // 공통코드 : 고품부품상태
       model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER303", null, langCd));

       // 공통코드 : 고품지불방식
       model.addAttribute("oldItemPaymCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER304", null, langCd));

       // 사용여부
       model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemMain";

   }

   /**
    *
    * DMS 고품요청 조회  메인
    *
    * @param model
    * @return DMS 고품출고 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemNotSendPopup.do")
   public String selectDlrClaimOldItemNotSendPopup(Model model, HttpServletRequest request)throws Exception{

       return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemNotSendPopup";

   }

   /**
     * DMS 고품요청 조회
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectClaimOldItemsRequest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimOldItemsRequest(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectClaimOldItemRequestByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectClaimOldItemRequestByCondition(searchVO));
        }
        return result;
    }

    /**
     * DMS 고품요청 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectDlrClaimOldItemCnt(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(claimOldItemManageService.selectClaimOldItemRequestByConditionCnt(searchVO));
        return result;
    }


    /**
     * 고품 출고관리 조회
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/selectDlrClaimOldItemManageMains.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrClaimOldItemManageMains(@RequestBody ClaimOldItemManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(claimOldItemManageService.selectDlrClaimOldItemManageByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimOldItemManageService.selectDlrClaimOldItemManageByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고품출고 정보를 등록후 요청 한다.
     * @param saveVO - 고품출고 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/wac/claimOldItemManage/updateClaimOldItemManage.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateClaimOldItemManage(@Validated @RequestBody ClaimOldItemManageSaveVO saveVO ) throws Exception{

        return claimOldItemManageService.updateClaimOldItemManage(saveVO);

    }

    /**
    *
    * DMS 고품 일괄프린트 조회  메인
    *
    * @param model
    * @return DMS 고품 일괄프린트 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/claimOldItemManage/selectDlrClaimOldItemPrintMain.do")
    public String selectDlrClaimOldItemPrintMain(Model model, HttpServletRequest request) throws Exception{

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sClaimToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sClaimFromDt", DateUtil.getDate(DateUtil.getFirstDateOfMonth(new Date()), dateFormat));

        return "/ser/wac/claimOldItemManage/selectDlrClaimOldItemPrintMain";
    }

    /**
    *
    * DMS 고품 일괄프린트 조회  메인
    *
    * @param model
    * @return DMS 고품 일괄프린트 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/claimOldItemManage/insertDlrClaimOldItemPrint.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertDlrClaimOldItemPrint(@RequestBody List<ClaimOldItemPrintVO> claimOldItemPrintList) throws Exception{

        return claimOldItemManageService.insertDlrClaimOldItemPrint(claimOldItemPrintList);
    }
}
