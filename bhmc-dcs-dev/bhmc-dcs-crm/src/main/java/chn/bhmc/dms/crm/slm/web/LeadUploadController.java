package chn.bhmc.dms.crm.slm.web;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : LeadUploadController.java
 * @Description : 대용량리드정보업로드 컨트롤러
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
public class LeadUploadController extends HController{

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * MarketingCampaign Management Service
     */
    @Resource(name = "marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * Customer Information Management Service
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * Customer Information Management Service
     */
    @Resource(name = "leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * 대용량리드업로드 화면
     * @return
     */
    @RequestMapping(value = "/crm/slm/leadUpload/selectLeadUploadMain.do", method = RequestMethod.GET)
    public String selectLeadUploadMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처

        // 개인 법인
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        return "/crm/slm/leadUpload/selectLeadUploadMain";
    }

    @RequestMapping(value = "/crm/slm/leadUpload/insertLeadUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertLeadUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

        LeadInfoVO leadInfoVO = new LeadInfoVO();

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        List<LeadInfoVO> list = new ArrayList<LeadInfoVO>();
        List<LeadInfoVO> resultList = new ArrayList<LeadInfoVO>();


            try{
                ExcelReader<LeadInfoVO> excelReader = new ExcelReader<LeadInfoVO>(LeadInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);

                resultList = leadInfoService.selectLeadDupCheck(list);

                result.setTotal(resultList.size());
                result.setData(resultList);

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
     * 리드정보  일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/crm/slm/leadUpload/multiLeadUploadFileSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLeadUploadFileSave(@Validated @RequestBody BaseSaveVO<LeadInfoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        leadInfoService.multiLeadUploadFileSave(saveVO);
        return true;
    }



}

