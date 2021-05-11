package chn.bhmc.dms.crm.cif.web;

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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageCustInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageVinInfoVO;
import chn.bhmc.dms.crm.cif.vo.VinCouponInfoVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomerDcInfoController
 * @Description : 고객할인관리 컨트롤러
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Controller
public class CustomerDcInfoController extends HController {
    @Resource(name="baseNames")
    List<String> baseNames;


    /**
     * SystemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * CustomerCouponMgmtService
     */
    @Resource(name="customerCouponMgmtService")
    CustomerCouponMgmtService customerCouponMgmtService;

    /**
     * CommonCodeService
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;




    /**
     * selectCustCouponMainUploadPopupCouponCust 페이지
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupCouponCust.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopupCouponCust(Model model, HttpServletRequest request) throws Exception {
        return "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupCouponCust";
    }

    /**
     * selectCustCouponMainUploadPopupCouponVin 페이지
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupCouponVin.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopupCouponVin(Model model, HttpServletRequest request) throws Exception {
        return "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupCouponVin";
    }

    /**
     * selectCustCouponMainUploadPopupCouponCust 페이지
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupPkgCust.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopupPkgCust(Model model, HttpServletRequest request) throws Exception {
        return "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupPkgCust";
    }

    /**
     * selectCustCouponMainUploadPopupCouponVin 페이지
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupPkgVin.do", method = RequestMethod.GET)
    public String selectDBMessageSourceBatchUploadPopupPkgVin(Model model, HttpServletRequest request) throws Exception {
        return "/crm/cif/customerCoupon/selectCustCouponMainUploadPopupPkgVin";

    }


    /**
     * Excel file upload to grid for CouponCust
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/insertUploadFileCouponCust.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertUploadFileCouponCust(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<CustCouponInfoVO> list = new ArrayList<CustCouponInfoVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<CustCouponInfoVO> excelReader = new ExcelReader<CustCouponInfoVO>(CustCouponInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);
                list = excelReader.readExcelData(status);
                list = customerCouponMgmtService.selectCouponCustomerInfoChkByExcelImp(list);

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
     * Excel file upload to grid for CouponVin
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/insertUploadFileCouponVin.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertUploadFileCouponVin(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<VinCouponInfoVO> list = new ArrayList<VinCouponInfoVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<VinCouponInfoVO> excelReader = new ExcelReader<VinCouponInfoVO>(VinCouponInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                //List<VinCouponInfoVO> listFilt = new ArrayList<VinCouponInfoVO>();

//                for(VinCouponInfoVO vinCouponInfoVO : list) {
//                    if (StringUtils.isNotEmpty(vinCouponInfoVO.getVinNo())) {
//                        listFilt.add(vinCouponInfoVO);
//                    }
//                }
                list = customerCouponMgmtService.selectCouponVinInfoChkByExcelImp(list);

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
     * Excel file upload to grid for CouponVin
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/insertUploadFilePkgCust.do  ", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertUploadFilePkgCust(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<PackageCustInfoVO> list = new ArrayList<PackageCustInfoVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<PackageCustInfoVO> excelReader = new ExcelReader<PackageCustInfoVO>(PackageCustInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                //List<VinCouponInfoVO> listFilt = new ArrayList<VinCouponInfoVO>();

//                for(VinCouponInfoVO vinCouponInfoVO : list) {
//                    if (StringUtils.isNotEmpty(vinCouponInfoVO.getVinNo())) {
//                        listFilt.add(vinCouponInfoVO);
//                    }
//                }
                list = customerCouponMgmtService.selectPackageCustomerInfoChkByExcelImp(list);

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
     * Excel file upload to grid for PkgVin
     */
    @RequestMapping(value = "/crm/cif/customerCoupon/insertUploadFilePkgVin.do  ", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertUploadFilePkgVin(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<PackageVinInfoVO> list = new ArrayList<PackageVinInfoVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);


        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<PackageVinInfoVO> excelReader = new ExcelReader<PackageVinInfoVO>(PackageVinInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                list = customerCouponMgmtService.selectPackageVinInfoChkByExcelImp(list);

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
     * 고객할인관리 쿠폰 목록
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerCouponInfo/selectCustCouponMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoRegMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 할인 방식
        model.addAttribute("dcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM051", null, langCd));
        // 할인사용구분
        model.addAttribute("dcUseTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM052", null, langCd));

        return "/crm/cif/customerCouponInfo/selectCustCouponMain";
    }

    /**
     * 쿠폰 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/selectCustCouponInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustCouponInfo(@RequestBody CustCouponInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(customerCouponMgmtService.selectCustCouponInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerCouponMgmtService.selectCustCouponInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 쿠폰을 저장한다.
     *
     * @param CustCouponInfoVO
     * @return CustCouponInfoVO
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/insertCustCouponInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertCustCouponInfo(@RequestBody CustCouponInfoVO custCouponInfoVO) throws Exception {
        return customerCouponMgmtService.insertCustCoupon(custCouponInfoVO);
    }

    /**
     * 쿠폰을 업데이트 한다.
     *
     * @param CustCouponInfoVO
     * @return int
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/updaetCustCouponInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int updaetCustCouponInfo(@RequestBody CustCouponInfoVO custCouponInfoVO) throws Exception {
        return customerCouponMgmtService.updateCustCoupon(custCouponInfoVO);
    }

    /**
     * 쿠폰을 삭제 한다.
     *
     * @param CustCouponInfoVO
     * @return int
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/deleteCustCouponInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteCustCouponInfo(@RequestBody CustCouponInfoVO custCouponInfoVO) throws Exception {
        return customerCouponMgmtService.updateCustCoupon(custCouponInfoVO);
    }

    /**
     * 패키지 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/selectCustCouponPackagenInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustCouponPackagenInfo(@RequestBody CustPackageInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(customerCouponMgmtService.selectCustCouponPackageInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerCouponMgmtService.selectCustCouponPackageInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 패키지 정보 목록 저장
     * @param saveVO - 패키지 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/multiCustPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustPackage(@Validated @RequestBody CustPackageInfoSaveVO saveVO) throws Exception {

        customerCouponMgmtService.multiCustPackage(saveVO);
        return true;
    }


    /**
     * 패키지 - 쿠폰 발행 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/selectCouponInPackageInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCouponInPackageInfo(@RequestBody CustCouponInPackageInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(customerCouponMgmtService.selectCouponInPackageInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerCouponMgmtService.selectCouponInPackageInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 패키지 정보 목록 저장
     * @param saveVO - 패키지 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/multiCouponInPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCouponInPackage(@Validated @RequestBody CustCouponInPackageInfoSaveVO saveVO) throws Exception {

        customerCouponMgmtService.multiCouponInPackage(saveVO);
        return true;
    }

    /**
     * 쿠폰 발행 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/selectCustCouponPublishInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustCouponPublishInfo(@RequestBody CustPublishInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(customerCouponMgmtService.selectCustCouponPublishInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerCouponMgmtService.selectCustCouponPublishInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 쿠폰 발행 저장한다.
     *
     * @param CustCouponInfoVO
     * @return CustCouponInfoVO
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/insertCustCouponPublish.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertCustCouponPublish(@RequestBody CustPublishInfoVO custPublishInfoVO) throws Exception {
        return customerCouponMgmtService.insertCustCouponPublish(custPublishInfoVO);
    }

    /**
     * 쿠폰 발행 업데이트 한다.
     *
     * @param CustCouponInfoVO
     * @return int
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/updateCustCouponPublish.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateCustCouponPublish(@RequestBody CustPublishInfoVO custPublishInfoVO) throws Exception {
        return customerCouponMgmtService.updateCustCouponPublish(custPublishInfoVO);
    }

    /**
     * 쿠폰 발행 정보를 등록한다.
     * @param saveVO - 쿠폰 발행 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerDcInfo/multiCustCouponPublish.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustCouponPublish(@Validated @RequestBody CustPublishInfoSaveVO saveVO) throws Exception {

        customerCouponMgmtService.multiCustCouponPublish(saveVO);
        return true;
    }

    /**
     * 쿠폰 팝업
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerCouponInfo/selectCustCouponSearchPopup.do", method = RequestMethod.GET)
    public String selectCustCouponSearchPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 할인 방식
        model.addAttribute("dcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM051", null, langCd));
        // 할인사용구분
        model.addAttribute("dcUseTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM052", null, langCd));

        return "/crm/cif/customerCouponInfo/selectCustCouponSearchPopup";
    }

}
