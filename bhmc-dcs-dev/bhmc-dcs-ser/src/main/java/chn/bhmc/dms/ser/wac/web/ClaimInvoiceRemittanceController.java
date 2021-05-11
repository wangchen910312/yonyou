package chn.bhmc.dms.ser.wac.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceRemittanceService;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceUploadVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceVO;
import chn.bhmc.dms.ser.wac.vo.FindClaimInvoiceRemittanceSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceController.java
 * @Description : 索赔发票汇款controller层
 * @author chen shengan
 * @since 2021. 04. 07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 07   chen shengan       索赔发票汇款controller层
 * </pre>
 */
@Controller
public class ClaimInvoiceRemittanceController extends HController {
	
	@Resource(name="claimInvoiceRemittanceService")
	ClaimInvoiceRemittanceService claimInvoiceRemittanceService;
	
	/**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
     * 跳转到索赔发票汇款主页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceMain.do", method = RequestMethod.GET)
	public String selectClaimInvoiceRemittanceMain(Model model) throws Exception {
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		
		model.addAttribute("paymTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER130", null, langCd)); // 获取所有汇款状态
		return "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceMain";
	}
	
	/**
     * 跳转到索赔发票汇款批量导入页面
     * @param
     * @return 
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceBatchUpload.do", method = RequestMethod.GET)
	public String selectClaimInvoiceRemittanceBatchUpload(Model model) throws Exception {
		return "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceBatchUpload";
	}
	
	/**
     * 查询汇款单信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/findClaimInvoiceRemittance.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult findClaimInvoiceRemittance (@RequestBody FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO ) throws Exception {
		SearchResult result = new SearchResult();
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		
		result.setTotal(claimInvoiceRemittanceService.findClaimInvoiceRemittanceCnt(findClaimInvoiceRemittanceSearchVO)); // 查询汇款单数量
		
		if (result.getTotal() != 0){ // 判断是否存在汇款单信息
			findClaimInvoiceRemittanceSearchVO.setsLangCd(langCd);
			result.setData(claimInvoiceRemittanceService.findClaimInvoiceRemittance(findClaimInvoiceRemittanceSearchVO)); // 查询汇款单信息
		}
		return result;
	}
	
	/**
     * 查询汇款单信息数量
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/findClaimInvoiceRemittanceCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public int findClaimInvoiceRemittanceCnt (@RequestBody FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO ) throws Exception {
		int count = claimInvoiceRemittanceService.findClaimInvoiceRemittanceCnt(findClaimInvoiceRemittanceSearchVO); // 查询汇款单数量
		return count;
	}
	
	/**
     * 修改汇款单信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/updateClaimInvoiceRemittance.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateClaimInvoiceRemittance (@Validated @RequestBody FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO ) throws Exception {
		int count = claimInvoiceRemittanceService.updateClaimInvoiceRemittance(findClaimInvoiceRemittanceSearchVO);
		return count;
	}
	
	/**
     * 查询发票信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/selectReceiptByInvcNo.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectReceiptByInvcNo (@RequestBody FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO ) throws Exception {
		SearchResult result = new SearchResult();
		
		result.setTotal(claimInvoiceRemittanceService.selectReceiptByInvcNoCnt(findClaimInvoiceRemittanceSearchVO)); // 查询发票数量
		
		if (result.getTotal() != 0){ // 判断是否存在汇款单信息
			result.setData(claimInvoiceRemittanceService.selectReceiptByInvcNo(findClaimInvoiceRemittanceSearchVO)); // 查询发票信息
		}
		return result;
	}
	
	/**
     * 查询导出excel需要的数据数量
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceExcelCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public int selectClaimInvoiceRemittanceExcelCnt (@RequestBody FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO ) throws Exception {
		List<ClaimInvoiceRemittanceVO> list = claimInvoiceRemittanceService.selectClaimInvoiceRemittanceExcel(findClaimInvoiceRemittanceSearchVO);
		int count = list.size();
		return count;
	}
	
	/**
     * 获取导入数据
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/selectClaimInvoiceRemittanceUploadFile.do", method = RequestMethod.POST)
   @ResponseBody
   public List<ClaimInvoiceRemittanceUploadVO> selectClaimInvoiceRemittanceUploadFile(
                                                            @RequestParam("uploadFile") MultipartFile uploadFile,
                                                            @RequestParam("progressId") String progressId,
                                                            HttpServletRequest request,
                                                            HttpServletResponse response) throws Exception {

        List<ClaimInvoiceRemittanceUploadVO> list = new ArrayList<ClaimInvoiceRemittanceUploadVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){ // 判断文件是否存在

            try{ 
                ExcelReader<ClaimInvoiceRemittanceUploadVO> excelReader = new ExcelReader<ClaimInvoiceRemittanceUploadVO>(ClaimInvoiceRemittanceUploadVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);
                // 查询所有汇款单信息
                List<ClaimInvoiceRemittanceVO> claimInvoiceRemittanceVOList = claimInvoiceRemittanceService.findClaimInvoiceRemittance(new FindClaimInvoiceRemittanceSearchVO());
                list = excelReader.readExcelData(status);
                int rnum = 1;
                for (ClaimInvoiceRemittanceUploadVO claimInvoiceRemittanceUploadVO : list){ // 循环导入的excel中的数据
                	claimInvoiceRemittanceUploadVO.setRnum(rnum);
                	rnum++;
                	String errorMessage = "";
                	// 判断导入的经销商信息是否为空
            		if (claimInvoiceRemittanceUploadVO.getDlrCd() == null || "".equals(claimInvoiceRemittanceUploadVO.getDlrCd())){
            			claimInvoiceRemittanceUploadVO.setErrorYn("Y");
            			claimInvoiceRemittanceUploadVO.setErrorMessage(errorMessage+"没有经销商信息.");
            			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
            			continue;
            		}
            		// 判断导入的结算单编号是否为空
            		if (claimInvoiceRemittanceUploadVO.getInvcNo() == null || "".equals(claimInvoiceRemittanceUploadVO.getInvcNo())){
            			claimInvoiceRemittanceUploadVO.setErrorYn("Y");
            			claimInvoiceRemittanceUploadVO.setErrorMessage(errorMessage+"没有结算单编号.");
            			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
            			continue;
            		}
                	for (ClaimInvoiceRemittanceVO claimInvoiceRemittanceVO : claimInvoiceRemittanceVOList){ // 循环所有汇款单信息
                		// 判断导入的经销商信息和结算单编号是否正确
                		if (claimInvoiceRemittanceUploadVO.getDlrCd().equals(claimInvoiceRemittanceVO.getDlrCd()) && 
                				claimInvoiceRemittanceUploadVO.getInvcNo().equals(claimInvoiceRemittanceVO.getInvcNo())){
                			claimInvoiceRemittanceUploadVO.setErrorYn("N");
                			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
                			break;
                		}
                		if (claimInvoiceRemittanceUploadVO.getDlrCd().equals(claimInvoiceRemittanceVO.getDlrCd()) && 
                				!claimInvoiceRemittanceUploadVO.getInvcNo().equals(claimInvoiceRemittanceVO.getInvcNo())){ // 判断导入的结算单编号是否正确
                			claimInvoiceRemittanceUploadVO.setErrorYn("Y");
                			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
                			claimInvoiceRemittanceUploadVO.setErrorMessage(errorMessage+"没有结算单编号.");
                		}else if (!claimInvoiceRemittanceUploadVO.getDlrCd().equals(claimInvoiceRemittanceVO.getDlrCd()) && 
                				claimInvoiceRemittanceUploadVO.getInvcNo().equals(claimInvoiceRemittanceVO.getInvcNo())){ // 判断导入的经销商信息是否正确
                			claimInvoiceRemittanceUploadVO.setErrorYn("Y");
                			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
                			claimInvoiceRemittanceUploadVO.setErrorMessage(errorMessage+"没有经销商信息.");
                		}else {
                			claimInvoiceRemittanceUploadVO.setErrorYn("Y");
                			claimInvoiceRemittanceUploadVO.setUploadDt(new Date());
                			claimInvoiceRemittanceUploadVO.setErrorMessage("没有经销商信息.没有结算单编号");
                		}
                	}
                }
               
                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return list;

    }
	
	/**
     * 批量修改汇款单信息
     * @param
     * @return SearchResult
     */
	@RequestMapping(value = "/ser/wac/claimInvoice/updateClaimInvoiceRemittanceBatch.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateClaimInvoiceRemittanceBatch (@Validated @RequestBody ClaimInvoiceRemittanceSaveVO claimInvoiceRemittanceSaveVO ) throws Exception {
		int count = claimInvoiceRemittanceService.updateClaimInvoiceRemittanceBatch(claimInvoiceRemittanceSaveVO);
		return count;
	}
	
}
