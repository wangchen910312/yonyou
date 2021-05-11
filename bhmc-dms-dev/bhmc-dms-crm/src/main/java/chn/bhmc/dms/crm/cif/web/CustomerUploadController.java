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
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomerUploadController.java
 * @Description : 대용량고객정보업로드 컨트롤러
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
public class CustomerUploadController extends HController{

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
     * 대용량고객업로드 화면
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerUpload/selectCustomerUploadMain.do", method = RequestMethod.GET)
    public String selectCustomerUploadMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));

        return "/crm/cif/customerUpload/selectCustomerUploadMain";
    }

    @RequestMapping(value = "/crm/cif/customerUpload/insertCustomerUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertCustomerUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

        List<CustomerInfoVO> list = new ArrayList<CustomerInfoVO>();
        List<CustomerInfoVO> resultList = new ArrayList<CustomerInfoVO>();


            try{
                ExcelReader<CustomerInfoVO> excelReader = new ExcelReader<CustomerInfoVO>(CustomerInfoVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);

                resultList = customerInfoService.selectCustDupCheck(list);

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
     * 고객정보  일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerUpload/multiCustomerUploadFileSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerUploadFileSave(@Validated @RequestBody BaseSaveVO<CustomerInfoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        customerInfoService.multiCustomerUploadFileSave(saveVO);
        return true;
    }



}
