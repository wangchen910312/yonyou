package chn.bhmc.dms.par.cpm.web;

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

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.SalePlanService;
import chn.bhmc.dms.par.cpm.vo.SalePlanActVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanExcelVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;

/**
 * CorpSalesAchievements Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 31.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 31.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class CorpSalesAchievementsController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 임무관리 계획 서비스
     */
    @Resource(name="salePlanService")
    SalePlanService salePlanService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 실적관리 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/corpSalesAchievements/selectSalesAchievementsMain.do", method = RequestMethod.GET)
    public String selectSalesAchievementsMain(Model model) throws Exception {

        // 판매유형 공통코드정보 조회.
        model.addAttribute("saleTypeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/par/cpm/corpSalesAchievements/selectSalesAchievementsMain";

    }

    /**
     * 임무관리 계획 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/corpSalesAchievements/selectSalesAchievementsPlanMain.do", method = RequestMethod.GET)
    public String selectSalesAchievementsPlanMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 판매유형 공통코드정보 조회.
        model.addAttribute("saleTypeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));
        //임무구분 공통코드정보 조회.
        model.addAttribute("dstDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR504", null, langCd));
        //임무 공통코드정보 조회.
        model.addAttribute("dstDstinTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR505", null, langCd));
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //현재일자 년
        model.addAttribute("sysNowDateYear", DateUtil.getDate("YYYY"));
        //현재일자 월
        model.addAttribute("sysNowDateMonth", DateUtil.getDate("MM"));

        return "/par/cpm/corpSalesAchievements/selectSalesAchievementsPlanMain";

    }

    /**
     * 임무관리 계획 및 실적 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/corpSalesAchievements/selectSalesAchievementsPlanActMain.do", method = RequestMethod.GET)
    public String selectSalesAchievementsPlanActMain(Model model) throws Exception {

        // 판매유형 공통코드정보 조회.
        model.addAttribute("saleTypeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/par/cpm/corpSalesAchievements/selectSalesAchievementsPlanActMain";

    }

    /**
     * 임무관리 계획 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalePlanSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/corpSalesAchievements/selectSalesAchievementsPlans.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesAchievementsPlans(@RequestBody SalePlanSearchVO searchVO) throws Exception{

        String sLangCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(sLangCd);

        if(salePlanService.selectSalePlansByConditionCnt(searchVO) == 0){
            //부품유형 공통코드정보 조회.
            CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
            itemDistinCdSearchVO.setsLangCd(sLangCd);
            itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
            itemDistinCdSearchVO.setsUseYn("Y");
            itemDistinCdSearchVO.setsRemark1("PAR");

            List<CommonCodeVO> itemDstinCdList =  commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO);
            salePlanService.multiSaleInsertPlans(searchVO.getsYy(), itemDstinCdList);
        }

        List<SalePlanActVO> list = new ArrayList<SalePlanActVO>();
        list = salePlanService.selectSalePlansByCondition(searchVO);
        SearchResult result = new SearchResult();
        result.setData(list);
        result.setTotal(list.size());

        return result;
    }

    /**
     * 임무관리 계획 목록 데이터를 추가/수정한다.
     * @param venderMasterVO - 임무관리 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/cpm/corpSalesAchievements/multiSalePlans.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSalePlan(@Validated @RequestBody BaseSaveVO<SalePlanActVO> salePlanSaveVO) throws Exception
    {
        salePlanService.multiSalePlans(salePlanSaveVO);

        return true;
    }


    @RequestMapping(value = "/par/cmm/selectSalePlanExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectSalePlanExcelUploadPopup(Model model) throws Exception {

        return "/par/cmm/selectSalePlanExcelUploadPopup";
    }

    @RequestMapping(value = "/par/cpm/corpSalesAchievements/insertSalePlanExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertStorageItemExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<SalePlanExcelVO> list = new ArrayList<SalePlanExcelVO>();
        List<SalePlanExcelVO> resultList = new ArrayList<SalePlanExcelVO>();

        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<SalePlanExcelVO> excelReader = new ExcelReader<SalePlanExcelVO>(SalePlanExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       resultList.add(list.get(i));
                   }else{

                      resultList.add(list.get(i));
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                }else{
                    result.setTotal(-999);
                    result.setData(resultList);
                }
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
}
