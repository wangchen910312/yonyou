package chn.bhmc.dms.sal.usc.web;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.usc.service.ExchResultService;
import chn.bhmc.dms.sal.usc.vo.ExchRegistUploadSaveDTO;
import chn.bhmc.dms.sal.usc.vo.ExchResultVO;



/**
 * 중고차치환판매심사결과조회등록
 *
 * @author Kim yewon
 * @since 2016. 6. 13
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 13           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/exchRslt")
public class UsedCarExchRegistController extends HController {

    /**
     * 중고차치환판매심사결과조회
     */
    @Resource(name="exchResultService")
    ExchResultService exchResultService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;


    /**
     * 사무소 관리 서비스
     */
    @Resource(name="officeService")
    OfficeService officeService;


    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;




    /**
     * 중고차치환판매심사결과조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectExchRegistMain.do", method = RequestMethod.GET)
    public String selectExchResultMain(@RequestParam(value="sysCd", defaultValue="I") String sysCd,Model model) throws Exception {

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        DealerVO dealerVO ;
        DealerSearchVO searchVO = new DealerSearchVO();
        if(!Constants.SYS_CD_CORP.equals(sysCd)){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            dealerVO = salesCommonService.selectDealerInfo(searchVO);
            model.addAttribute("dealerVO", dealerVO);
        }else {
            //사업부 리스트
            model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));
        }

        model.addAttribute("sysCd", sysCd);

        return "/sal/usc/exchRslt/selectExchRegistMain";
    }


    /**
     * excel import popup
     * @param
     * @return String viewName
     */
    @RequestMapping(value="/exchRegistUploadPopup.do", method = RequestMethod.GET)
    public String exchRegistUploadPopup(Model model) throws Exception {


        return "/sal/usc/exchRslt/exchRegistUploadPopup";
    }




    @RequestMapping(value = "/insertExchRegistUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertMembershipCardUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<ExchResultVO> list = new ArrayList<ExchResultVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        List<ExchResultVO> resultList = new ArrayList<ExchResultVO>();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<ExchResultVO> excelReader = new ExcelReader<ExchResultVO>(ExchResultVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);


                resultList = exchResultService.selectExchResultValidate(list);

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
     * 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/insertExchRegistSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertExchRegistSave(@RequestBody ExchRegistUploadSaveDTO exchRegistList) throws Exception {

        List<ExchResultVO> list = exchRegistList.getExchRegistList();

        exchResultService.insertExchRegistUpload(list);

        return true;

    }



}
