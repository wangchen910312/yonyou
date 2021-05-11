package chn.bhmc.dms.ser.svi.web;

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
import chn.bhmc.dms.ser.svi.service.LaborCodeManageService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LaborCodeDetailVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeManageVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeMasterVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeSearchVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborManageController.java
 * @Description : 공임코드 관리 컨트롤러
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Controller
public class LaborCodeManageController extends HController{


    @Resource(name="laborCodeManageService")
    LaborCodeManageService laborCodeManageService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
    *
    * 공임코드관리 화면 메인
    *
    * @param model
    * @return 공임코드관리 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodeManageMain.do")
    public String selectLaborManageMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 법인 딜러 구분코드
        model.addAttribute("dstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));

        //삭제여부
        model.addAttribute("delYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER902", null, langCd));

        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 수리코드 유형
        model.addAttribute("lbrCdTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER038", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));



        return "/ser/svi/laborManage/selectLaborCodeManageMain";
    }

    /**
     * LTS MODEL CODE 조회
     * Statements
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/laborManage/selectLtsModels.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLtsModels(@RequestBody LtsModelSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

//       LtsModelSearchVO searchVO = new LtsModelSearchVO();
       result.setData(ltsModelMappingService.selectLtsModelsByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;

    }

    /**
     *
     * 공임코드관리 공임 등록 팝업 화면 메인
     *
     * @param model
     * @return 공임코드관리 화면
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodeRegPopup.do")
    public String selectLaborCodeRegPopup(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        // 법인 딜러 구분코드
        model.addAttribute("dstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 수리코드 유형
        model.addAttribute("lbrCdTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER038", null, langCd));

        return "/ser/svi/laborManage/selectLaborCodeRegPopup";

    }

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
    * @return 공임코드 목록 데이터
    * @throws Exception
    */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodeManages.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLaborCodeManages(@RequestBody LaborCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(laborCodeManageService.selectLaborCodeManageByConditionCnt(searchVO));

        if(result.getTotal() !=0){
            result.setData(laborCodeManageService.selectLaborCodeManages(searchVO));
        }
        return result;
    }



    /**
     *
     * 공임코드 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodeManageDetail.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLaborCodeManageDetail(@RequestBody LaborCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(laborCodeManageService.selectLaborCodeManageByConditionCnt(searchVO));
        if(result.getTotal() !=0 ){
            result.setData(laborCodeManageService.selectLaborCodeManageByCondition(searchVO));
        }
        return result;
    }

    /**
     * 공임코드관리 마스터 정보를 등록/수정 한다.
     * @param saveVO - 공임코드관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/ser/svi/laborManage/multiLaborMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLaborMaster(@Validated @RequestBody LaborCodeManageVO manageVO) throws Exception {

        laborCodeManageService.multiLaborMaster(manageVO);

        return true;

    }

    /**
     * 공임코드관리 상세 정보를 등록/수정 한다.
     * @param saveVO - 공임코드관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/ser/svi/laborManage/multiLaborDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLaborDetail(@Validated @RequestBody LaborCodeManageVO manageVO) throws Exception {

        laborCodeManageService.multiLaborDetail(manageVO);

        return true;

    }

    /**
     * 공임코드관리 마스터 정보를 삭제 한다.
     * @param saveVO - 공임코드관리 정보 삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/ser/svi/laborManage/deleteLabor.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteLabor(@Validated @RequestBody LaborCodeMasterVO laborCodeMasterVO) throws Exception {

        laborCodeManageService.deleteLabor(laborCodeMasterVO);

        return true;

    }


    /**
     * 공임코드관리 정보를 등록한다.
     * @param saveVO - 공임코드관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/ser/svi/laborManage/insertLaborCodePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLaborCodeManages(@Validated @RequestBody LaborCodeManageVO labrCodeVO) throws Exception {

        laborCodeManageService.multiLaborDetail(labrCodeVO);

        return true;

    }
    /**
     * 공임코드관리 정보를 등록한다.
     * @param saveVO - 공임코드관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/ser/svi/laborManage/insertCheckLaborMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCheckLaborMaster(@Validated @RequestBody LaborCodeMasterVO manageVO) throws Exception {

        laborCodeManageService.insertCheckLaborMaster(manageVO);

        return true;

    }


    /**
     * 공임코드관리 엑셀 정보 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO - 마케팅 캠페인
     * @param bindingResult
     * @return 등록 대상자 수
     */
    @RequestMapping(value = "/ser/svi/laborManage/insertLaborCodeDetailExcel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertLaborCodeDetailExcel(@RequestBody LaborCodeDetailVO laborCodeDetailVO)throws Exception {

        //if (StringUtils.isEmpty(laborCodeDetailVO.gettDlrCd())){laborCodeDetailVO.settDlrCd(LoginUtil.getDlrCd());}

        laborCodeDetailVO.setDlrCd(LoginUtil.getDlrCd());
        laborCodeDetailVO.setRegUsrId(LoginUtil.getUserId());
        laborCodeManageService.insertLaborCodeDetailExcel(laborCodeDetailVO);
        return true;
    }

    /**
     *
     * 공임코드관리 엑셀 정보를 TEMP 테이블에 등록한다.
     *
     * @param uploadFile
     * @param progressId
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/laborManage/insertLaborExcelUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertLaborExcelUpload(
                                            @RequestParam("uploadFile") MultipartFile uploadFile,
                                            @RequestParam("progressId") String progressId,
                                            HttpServletRequest request,
                                            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<LaborCodeDetailVO> laborCodeDetailList = new ArrayList<LaborCodeDetailVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<LaborCodeDetailVO> excelReader = new ExcelReader<LaborCodeDetailVO>(LaborCodeDetailVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                laborCodeDetailList = excelReader.readExcelData(status);

                laborCodeManageService.excelUploadLaborCode(laborCodeDetailList);

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
     *
     * 공임코드 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodeExcelData.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLaborCodeExcelData(@RequestBody LaborCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(laborCodeManageService.selectLaborCodeManageExcelTmpByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(laborCodeManageService.selectLaborCodeManageExcelTmpByCondition(searchVO));
        }
        return result;
    }


}
