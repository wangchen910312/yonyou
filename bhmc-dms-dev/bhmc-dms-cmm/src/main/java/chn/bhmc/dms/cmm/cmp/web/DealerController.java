package chn.bhmc.dms.cmm.cmp.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DateBaDmsDownReVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 딜러 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DealerController extends HController {

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/selectDealerMain.do", method = RequestMethod.GET)
    public String selectDealerMain(Model model, HttpServletRequest request) throws Exception {
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        //멤버쉽 운영기준
        List<CommonCodeVO> membershipPolicyList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM808", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("membershipPolicyList", membershipPolicyList);
        //자동배정기준
        List<CommonCodeVO> autoAssignCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM225", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("autoAssignCdList", autoAssignCdList);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //시스템구분이 법인 인 경우
        if(Constants.SYS_CD_CORP.equals(sysCd)){
            return "/cmm/cmp/dealer/selectDealerMainForDcs";
        }

        return "/cmm/cmp/dealer/selectDealerMainForDms";
    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/selectDealers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealers(@RequestBody DealerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(dealerService.selectDealersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(dealerService.selectDealersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 딜러 정보를 가져온다.
     * @param searchVO 딜러 조회 조건
     * @return 조회 조건을 만족하는 딜러 정보를 반환한다.
     */
    @RequestMapping(value="/cmm/cmp/dealer/selectDealer.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectDealer(@RequestBody DealerSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        List<DealerVO> groupDealerList = new ArrayList<DealerVO>();

        //딜러정보
        DealerVO dealerVO = dealerService.selectDealerByKey(searchVO.getsDlrCd());

        //동일그룹 딜러목록
        if(StringUtils.isNoneBlank(dealerVO.getDlrGrpCd())){
            DealerSearchVO dealerGroupSearchVO = new DealerSearchVO();
            dealerGroupSearchVO.setsDlrGrpCd(dealerVO.getDlrGrpCd());
            groupDealerList = dealerService.selectDealersByCondition(searchVO);
        }

        result.put("dealer", dealerVO);
        result.put("groupDealerList", groupDealerList);

        return result;
    }

    /**
     * 딜러 정보를 수정한다.
     * @param saveVO - 딜러정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/updateDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDealer(@Validated @RequestBody DealerVO saveVO) throws Exception {
        dealerService.updateDealer(saveVO);
        return true;
    }

    @RequestMapping(value = "/cmm/cmp/dealer/selectDealerBatchUploadPopup.do", method = RequestMethod.GET)
    public String selectDealerBatchUploadPopup(HttpServletRequest request) throws Exception {
        return "/cmm/cmp/dealer/selectDealerBatchUploadPopup";
    }
    
   
    
    /**
     * 下载备份dms数据库当天备份文件 贾明 2019-6-20  检查文件是否存在，不管存在不存在都要做记录
     * fileCatalogue 文件路径
     * fileName      文件名
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/cmp/dealer/checkWhetherFileExists.do",  method = RequestMethod.GET)
    public  @ResponseBody Map<String, Object> checkWhetherFileExists(
    		@RequestParam("fileCatalogue") String fileCatalogue, @RequestParam("fileName") String fileName,
    		@RequestParam("distChar") String distChar,
    		HttpServletRequest request
     ) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        String fileRoute = distChar + ":" + fileCatalogue;
        DateBaDmsDownReVO  dateBaDmsDownReVO = new DateBaDmsDownReVO();
        dateBaDmsDownReVO.setDlrCd(LoginUtil.getDlrCd());
        dateBaDmsDownReVO.setRegUsrId(LoginUtil.getUserId());
        dateBaDmsDownReVO.setFileNm(fileName);
        dateBaDmsDownReVO.setFileRoute(fileRoute);
        
        String fileN = fileRoute + fileName;
        File file = new File(fileN);
        boolean fielExists = file.exists();
        if(fielExists){
        	result.put("doesFileExist", true);
        	dateBaDmsDownReVO.setSucceDown("S");
        }else{
        	result.put("doesFileExist", false);
        	dateBaDmsDownReVO.setSucceDown("F");
        	dateBaDmsDownReVO.setFailReason("文件不存在");
        }
        //记录下载记录
        dealerService.insertDatabaseDmsBackupDownRecords(dateBaDmsDownReVO);
        
        
        
        return result;
    }
    
    /**
     * 下载备份dms数据库当天备份文件 贾明 2019-6-20 
     * @param inline
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/cmp/dealer/selectFileDownload.do",  method = RequestMethod.GET)
    public ModelAndView selectFileDownload(
    		@RequestParam(value="inline", required=false, defaultValue="false") boolean inline,
    		@RequestParam("fileCatalogue") String fileCatalogue, @RequestParam("fileName") String fileName,
    		@RequestParam("distChar") String distChar,
    		  HttpServletRequest request) throws Exception {
    	 DownloadVO downloadVO = new DownloadVO();
    	 String fileRoute = distChar + ":" + fileCatalogue;
    	 String fileN = fileRoute + fileName;
         File file = new File(fileN);
         downloadVO.setFileName(fileName); 
         downloadVO.setFilePath(fileN);   
         downloadVO.setFileSize(file.length());
         downloadVO.setContentType("application/x-zip-compressed");//DealerController  application/x-zip-compressed application/zip

         ModelAndView mav = new ModelAndView("downloadView");
         mav.addObject("FILE_INFO", downloadVO);
         mav.addObject("INLINE", inline);
         return mav;
    }
    
    /**
     * 下载备份dms数据库当天备份文件 贾明 2019-8-05
     * @param fileCatalogue
     * @param fileName
     * @param distChar
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/cmm/cmp/dealer/download")
    public void download(@RequestParam("fileCatalogue") String fileCatalogue, @RequestParam("fileName") String fileName,
    		@RequestParam("distChar") String distChar,
    		HttpServletRequest request,HttpServletResponse response) throws IOException{
    	//String path = request.getServletContext().getRealPath("WEB-INF/data/");
    	String fileRoute = distChar + ":" + fileCatalogue;
   	    String fileN = fileRoute + fileName;
    	File file = new File(fileN);
    	response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fileName,"UTF-8"));
        response.addHeader("Content-Type","application/json;charset=UTF-8");
        try(
        	InputStream is = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
        	){
                int read = 0;
                byte[] bytes = new byte[2048];
                while ((read = is.read(bytes)) != -1)
                    os.write(bytes, 0, read);
            }
    }
    
    
    
    /**
     * 根据经销商id查询是否允许聚合支付  wushibin  2019-08-05
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/cmp/dealer/selectPayType.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectPayType(@RequestBody DealerSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        DealerVO dealerVO = dealerService.selectDealerByKey(LoginUtil.getDlrCd());
        result.put("dealer", dealerVO);
        return result;
    }
}
   

