package chn.bhmc.dms.crm.mcm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.exception.BizException;
import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.TaskVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.SurveySatisFactionService;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;
import chn.bhmc.dms.crm.mcm.service.CampaignResultService;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignLTSExcelVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSaveExVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSaveVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSignVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVinExcelVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 마케팅 캠페인 관리 컨트롤러
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Controller
public class MarketingCampaignController extends HController {
    /**
     * 마케팅 캠페인 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 캠페인결과 관리 서비스
     */
    @Resource(name="campaignResultService")
    CampaignResultService campaignResultService;

    /**
     * 설문 템플릿 관리 서비스
     */
    @Resource(name="surveySatisFactionService")
    SurveySatisFactionService surveySatisFactionService;

    /**
     *
     */
    @Resource(name="ltsModelMappingService")
    LtsModelMappingService ltsModelMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 고객추출 정보 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     * 결재양식관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    /**
     * 결재문서번호 생성 서비스
     */
    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;


    @Autowired
    RateManageService rateManageService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="surveyQuestionService")
    SurveyQuestionService surveyQuestionService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="satisFactionResultMgmtService")
    SatisFactionResultMgmtService satisFactionResultMgmtService;


    /**
     * 마케팅 캠페인 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do", method = RequestMethod.GET)
    public String selectMarketingCampaignMain(Model model
                                            , @RequestParam(value="makCd", defaultValue="") String makCd
                                                ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록에서 makCd 받아서 상세조회.
        if( !StringUtils.isEmpty(makCd) ){
            model.addAttribute("makCd",    makCd);
        }

        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형
        model.addAttribute("statList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태
        model.addAttribute("hostList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최

        //고객추출조건번호
        /*CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<CrmTargExtractVO> targExtractList = new ArrayList<CrmTargExtractVO>();
        targExtractList = crmTargExtractService.selectTargExtractListByCondition(searchVO);
        model.addAttribute("targExtractList", targExtractList);*/

        //결재유형
        List<CommonCodeVO> arrSignTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, langCd);
        model.addAttribute("arrSignTp", arrSignTp);

        //결재처리코드
        List<CommonCodeVO> arrSignProcCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd);
        model.addAttribute("arrSignProcCd", arrSignProcCd);

        //고객추출주기 ( 요일 )
        List<CommonCodeVO> custExtrCycleWeekList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM901", null, langCd);
        model.addAttribute("custExtrCycleWeekList", custExtrCycleWeekList);

        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));

        //만족여부
        List<CommonCodeVO> stsfIvstYnList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM096", null, langCd);
        model.addAttribute("stsfIvstYnList", stsfIvstYnList);


        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());

        return "/crm/mcm/marketingCampaign/selectMarketingCampaignMain";
    }

    /**
     * 마케팅 캠페인 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMarketingCampaigns(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {



        /******************************************
         *** 날짜 검색 조건 시작  ( 활동 스케줄러에서.. 당월 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsEndDt() != null ){
            int year;
            int month;
            int day;
            startCal.setTime(searchVO.getsEndDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year,month,day+1);
            searchVO.setsEndDt(startCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/


        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectMarketingCampaignsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<MarketingCampaignVO> selectMarketingCampaignsByCondition = marketingCampaignService.selectMarketingCampaignsByCondition(searchVO);

            result.setData(selectMarketingCampaignsByCondition);
        }

        return result;

    }









    /**
     * 마케팅 캠페인 정보를 저장 한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertMarketingCampaigns.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertMarketingCampaigns(@Validated(Draft.class) @RequestBody MarketingCampaignVO marketingCampaignVO)throws Exception {

        marketingCampaignVO.setRegUsrId(LoginUtil.getUserId());
        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());

        return marketingCampaignService.insertMarketingCampaign(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인 정보를 저장 한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/updateMarketingCampaigns.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateMarketingCampaigns(@Validated(Draft.class) @RequestBody MarketingCampaignVO marketingCampaignVO)throws Exception {

        marketingCampaignVO.setRegUsrId(LoginUtil.getUserId());
        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());

        return marketingCampaignService.updateMarketingCampaign(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인 정보를 삭제 한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/deleteMarketingCampaign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteMarketingCampaigns(@RequestBody MarketingCampaignVO marketingCampaignVO)throws Exception {

        // 예약 취소시 상태값 변경
        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());
        marketingCampaignService.deleteMarketingCampaign(marketingCampaignVO);
        return true;

    }

    /**
     * 캠페인을 취소처리 한다.
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/updateCampaignCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCampaignCancel(@Validated @RequestBody MarketingCampaignVO marketingCampaignVO) throws Exception {

        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());
        marketingCampaignVO.setStatCd("05");

        // 캠페인 진행상태 값 업데이트
        marketingCampaignService.updateStatCd(marketingCampaignVO);

        return true;
    }

    /**
     * 마케팅 캠페인 상세조회
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaignByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public MarketingCampaignVO selectMarketingCampaignByKey(@RequestBody MarketingCampaignSearchVO searchVO)throws Exception {
        MarketingCampaignVO targetMarketingCampaignVO = new MarketingCampaignVO();

        targetMarketingCampaignVO = marketingCampaignService.selectMarketingCampaignByKey(searchVO);

        return targetMarketingCampaignVO;

    }

    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMakTpCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMakTpCdList(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(marketingCampaignService.selectMakTpCdListByCondition(searchVO));

        return result;
    }

    /**
     * 마케팅 캠페인(활동방안) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectActives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActives(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectActivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectActivesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(활동방안) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(활동방안) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiActives.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiActives(@Validated @RequestBody MarketingCampaignVO saveVO) throws Exception {
        marketingCampaignService.multiActives(saveVO);
        return true;
    }

    /**
     * 캠페인-화술방안 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectTalkPlanPopup.do", method = RequestMethod.GET)
    public String selectTalkPlanPopup(Model model) {

        return "/crm/mcm/marketingCampaign/selectTalkPlanPopup";
    }

    /**
     * 마케팅 캠페인 화술방안 목록 데이터를 조회한다.(팝업화면)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectTalkPlans.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTalkPlans(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectTalkPlansByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<MarketingCampaignVO> selectTalkPlansByCondition = marketingCampaignService.selectTalkPlansByCondition(searchVO);

            result.setData(selectTalkPlansByCondition);
        }

        return result;

    }




    /**
     * 마케팅 캠페인(목표) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectGoals.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGoals(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectGoalsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectGoalsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(목표) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(목표) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiGoals.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiGoals(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {
        marketingCampaignService.multiGoals(saveVO);
        return true;
    }





    /**
     * 마케팅 캠페인(대상자) 목록 데이터를 조회한다.
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargets(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectTargetsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectTargetsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(대상자) 정보를 저장 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiTargets(@Validated @RequestBody MarketingCampaignVO activeVO)throws Exception {

        // 마케팅 캠페인(대상자)에서 등록후 추출차수를 return
        int extrDgreCnt;

        extrDgreCnt = marketingCampaignService.multiTargets(activeVO);

        return extrDgreCnt;

    }

    /**
     * 마케팅 캠페인(대상자) 정보를 삭제 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/deleteTarget.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteTarget(@RequestBody MarketingCampaignVO activeVO)throws Exception {

        // 고객케어관리에서 등록후 고객케어 번호를 return
        int resultCnt = 0 ;
        resultCnt = marketingCampaignService.deleteTarget(activeVO);
        return resultCnt;

    }

    /**
     * 대상자 정보를 엑셀로 일괄등록한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectTargetUploadPopup.do", method = RequestMethod.GET)
    public String selectTargetUploadPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));

        return "/crm/mcm/marketingCampaign/selectTargetUploadPopup";
    }

    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertTargetUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertTargetUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<MarketingCampaignVO> list = new ArrayList<MarketingCampaignVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<MarketingCampaignVO> excelReader = new ExcelReader<MarketingCampaignVO>(MarketingCampaignVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                List<MarketingCampaignVO> listFilt = new ArrayList<MarketingCampaignVO>();
                for(MarketingCampaignVO marketingCampaignVO : list) {
                    if (StringUtils.isNotEmpty(marketingCampaignVO.getCustNo())) {
                        listFilt.add(marketingCampaignVO);
                    }
                }

                listFilt = marketingCampaignService.selectCustomerInfoChkByExcelImp(listFilt);
                result.setTotal(listFilt.size());
                result.setData(listFilt);

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
     * 마케팅 캠페인(대상자) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO - 마케팅 캠페인
     * @param bindingResult
     * @return 등록 대상자 수
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertTargetExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertTargetExcelData(@Validated @RequestBody MarketingCampaignSaveExVO activeVO)throws Exception {

        if (StringUtils.isEmpty(activeVO.gettDlrCd())){activeVO.settDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignService.insertTargetExcelData(activeVO);

    }

    /**
     * 대상자 고객을 추출한다.(캠페인 대상자 탭에서 생성)
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertTargetExtractSave.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertTargetExtractSave(@RequestBody MarketingCampaignVO marketingCampaignVO)throws Exception {

        Map<String,Object> result = new HashMap<String,Object>();

        CrmTargExtractVO targetVO = new CrmTargExtractVO();

        targetVO.setDlrCd(marketingCampaignVO.getDlrCd());
        targetVO.setCustExtrTermNo(marketingCampaignVO.getCustExtrTermNo());
        targetVO.setRegUsrId(LoginUtil.getUserId());
        targetVO.setUpdtUsrId(LoginUtil.getUserId());

        marketingCampaignVO.setRegUsrId(LoginUtil.getUserId());
        marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());

        // 마케팅 캠페인(대상자)에서 등록후 추출차수를 return 시작
        // 추출차수가 없거나 추출차수가 있고 추출대상자 수가 존재할 경우 대상자 마스터에 신규등록 한다.
        if(marketingCampaignVO.getExtrDgreCnt() <= 0 || (marketingCampaignVO.getExtrDgreCnt() > 0 && marketingCampaignVO.getRealTargetCnt() > 0)){
            int extrDgreCnt;
            extrDgreCnt = marketingCampaignService.multiTargets(marketingCampaignVO);
            marketingCampaignVO.setExtrDgreCnt(extrDgreCnt);
        }
        // 마케팅 캠페인(대상자)에서 등록후 추출차수를 return 종료

        CrmTargExtractVO saveVO = new CrmTargExtractVO();

        //대상자 추출 TEMP테이블(CR_1003T, CR_1004T)에 대상자 추출
        saveVO = crmTargExtractService.selectTargetExtractSaveExcel(targetVO);
        marketingCampaignVO.setExtractSeq(saveVO.getSeq()); //temp 테이블 키값을 담기 위한 임시변수

        marketingCampaignVO.setAdMediaCd(Integer.toString(saveVO.getSeq())); //temp 테이블 키값을 담기 위한 임시변수

        //마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 등록한다.(수동으로 대상자 추출버튼을 통해 생성)
        marketingCampaignService.insertTargetExtractSave(marketingCampaignVO);

        //마케팅 캠페인(대상자) 정보를 수정한다.(대상자 추출버튼을 통한 대상자 마스터 업데이트)
        marketingCampaignService.updateTargetExtractMaster(marketingCampaignVO);

        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();

        searchVO.setsDlrCd(marketingCampaignVO.getDlrCd());
        searchVO.setsSeq(saveVO.getSeq());

        //대상자 추출 TEMP테이블(CR_1003T, CR_1004T)을 삭제한다.
        crmTargExtractService.deleteTempList(searchVO);

        result.put("extrDgreCnt", marketingCampaignVO.getExtrDgreCnt());
        return result;

    }

    /**
     * 마케팅 캠페인(대상자 마스터/디테일) 정보를 삭제한다.(추출조건차수을 삭제할때 추출조건차수에 대상자가 존재하면 같이 삭제.)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/deleteTargetEx.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteTargetEx(@RequestBody MarketingCampaignVO activeVO)throws Exception {

        // 고객케어관리에서 등록후 고객케어 번호를 return
        int resultCnt = 0 ;
        resultCnt = marketingCampaignService.deleteTargetEx(activeVO);
        return resultCnt;

    }





    /**
     * 마케팅 캠페인(예산) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectBudgets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBudgets(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectBudgetsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectBudgetsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(예산) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(예산) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiBudgets.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBudgets(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {
        marketingCampaignService.multiBudgets(saveVO);
        return true;
    }





    /**
     * 기본 결재선 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectDocLineExs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDocLineExs(@RequestBody DocLineSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(docService.selectDocLinesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(docService.selectDocLinesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 실제 결재선 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectSignLineExs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignLineExs(@RequestBody SignLineSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        List<SignLineVO> signLineList = signService.selectSignLinesByCondition(searchVO);

        result.setTotal(signLineList.size());
        result.setData(signLineList);

        return result;
    }

    /**
     * 심사요청
     * @return
     * @throws Exception
     *
     */

    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertSignEx.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertSignEx(@Validated @RequestBody MarketingCampaignSignVO marketingCampaignSignVO, Model model) throws Exception {

        //심사요청(결재요청)
        String nextString = "";
        String makCd = marketingCampaignSignVO.getMakCd();

        MarketingCampaignSearchVO searchVO = new MarketingCampaignSearchVO();
        searchVO.setsMakCd(makCd);



        MarketingCampaignVO mCampaignVO = marketingCampaignService.selectMarketingCampaignByKey(searchVO);

        if(mCampaignVO.getStartDt() == null || mCampaignVO.getEndDt() == null){
            // {캠페인 날자}을(를) 확인하여 주세요.
            throw new BizException(messageSource.getMessage("crm.err.plsCheckBaseInfo",null,LocaleContextHolder.getLocale()));

        };

        //공임코드별로 부품이 존재하는데 원인부품이 없으면 심사요청을 할 수 없도록 한다.
        if(marketingCampaignService.selectWorkItemsByConditionCnt(searchVO) <= 0){

            String signDocId = marketingCampaignSignVO.getSignLineVO().getSignDocId();

            //1.결재양식 ID가 존재하는지 확인
            DocSearchVO docSchVO = new DocSearchVO();
            docSchVO.setsSignDocId(signDocId);
            List<DocVO> listDocVO = docService.selectDocsByCondition(docSchVO);
            if(listDocVO == null){
                //등록된 결재양식이 존재하지 않습니다.
                throw new BizException(messageSource.getMessage("crm.err.noSignDocId",null,LocaleContextHolder.getLocale()));
            }

            //2. 결재 양식이 존재할 경우 해당 결재양식에 대한 결재선 존재여부 확인
            DocLineSearchVO docLineSchVO = new DocLineSearchVO();
            docLineSchVO.setsDlrCd(LoginUtil.getDlrCd());
            docLineSchVO.setsSignDocId(signDocId);
            List<DocLineVO> docLineVO = docService.selectDocLinesByCondition(docLineSchVO);
            if(docLineVO == null){
                //등록된 결재양식에 대한 결재선이 존재하지 않습니다.
                throw new BizException(messageSource.getMessage("crm.err.noSignLine",null,LocaleContextHolder.getLocale()));
            }

            nextString = signDocNoIdgenService.getNextStringId();

            marketingCampaignSignVO.getSignLineVO().setSignDocNo(nextString);

            SignVO signVO = new SignVO();
            signVO.setReqTitleNm(listDocVO.get(0).getSignDocNm());
            signVO.setSignDocNo(nextString);
            signVO.setSignDocId(signDocId);
            signVO.setReqUsrId(LoginUtil.getUserId());
            signVO.setReqEmpNo(LoginUtil.getEmpNo());
            signVO.setReqUsrNm(LoginUtil.getUserNm());
            signVO.setRefDocParams("makCd="+makCd);
            signVO.setTempSaveYn(marketingCampaignSignVO.getTempSaveYn());

            List<SignLineVO> insertedSignLienVO = new ArrayList<SignLineVO>() ;
            for(int i = 0; i < docLineVO.size(); i++ ){

                SignLineVO slineVO = new SignLineVO();
                slineVO.setSignDocNo(nextString);
                slineVO.setSignDocId(signDocId);
                slineVO.setSignDocLineNo(docLineVO.get(i).getSignDocLineNo());
                slineVO.setLastSignYn(docLineVO.get(i).getLastSignYn());
                slineVO.setSignTp(docLineVO.get(i).getSignTp());
                slineVO.setSignUsrNm(docLineVO.get(i).getSignUsrNm());
                slineVO.setSignUsrId(docLineVO.get(i).getSignUsrId());
                slineVO.setSignEmpNo(docLineVO.get(i).getSignEmpNo());

                insertedSignLienVO.add(slineVO);
            }
            signVO.setSignLines(insertedSignLienVO);

            signService.insertSign(signVO);


            MarketingCampaignVO marketingCampaignVO = new MarketingCampaignVO();
            marketingCampaignVO.setMakCd(makCd); // 캠페인 번호를 가져오기 위한 임시변수 임.

            //캠페인 마스터에 결재문서번호 수정
            marketingCampaignVO.setApprDocNo(nextString);
            marketingCampaignVO.setUpdtUsrId(LoginUtil.getUserId());
            marketingCampaignService.updateApprDocNo(marketingCampaignVO);

        }

        return nextString;

    }

    /**
     * 반려 [특별포인트, 멤버십 양도, 캠페인]
     * 심사 [캠페인]
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/updateSignLineEx.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSignLineEx(@Validated @RequestBody SignLineVO signLineVO, Model model) throws Exception {

        signService.updateSignLine(signLineVO);

        return true;
    }





    /**
     * 마케팅 캠페인(결과-목표) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectResultGoals.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectResultGoals(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(marketingCampaignService.selectResultGoalsByCondition(searchVO));

        return result;

    }

    /**
     * 마케팅 캠페인(결과-업체평가) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectResultCorps.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectResultCorps(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(marketingCampaignService.selectResultCorpsByCondition(searchVO));

        return result;

    }

    /**
     * 마케팅 캠페인(결과-캠페인직원평가) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectResultPersons.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectResultPersons(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(marketingCampaignService.selectResultPersonsByCondition(searchVO));

        return result;

    }

    /**
     * 설문자에 대한 설문결과 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup.do", method = RequestMethod.GET)
    public String selectMarketingCampaignSurveyPopup(Model model,HttpServletRequest request) throws Exception  {

        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));
        model.addAttribute("empId",  request.getParameter("empId"));
        model.addAttribute("ivstTp",  request.getParameter("ivstTp"));
        model.addAttribute("stsfIvstSeq",  request.getParameter("stsfIvstSeq"));    //sSeq
        model.addAttribute("subyTmplSeq",  request.getParameter("subyTmplSeq"));

        SurveySatisFactionSearchVO searchVo = new SurveySatisFactionSearchVO();
        searchVo.setsSubyTmplSeq((Integer.parseInt(request.getParameter("subyTmplSeq"))));
        searchVo.setsDlrCd(request.getParameter("dlrCd"));
        searchVo.setsPltCd(request.getParameter("pltCd"));

        // Tmplet Name
        SurveySatisFactionVO tmpl = surveySatisFactionService.selectSurveySatisFactionByKey(searchVo);
        model.addAttribute("tmpl",  tmpl);

        return "/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup";

    }

    /**
     * 캠페인결과 설문 데이터를 조회한다.  - 만족도 조사 설문지 및 결과 조회 [OB실행>상세팝업>만족도조사탭], [캠페인결과관리>업체평가], ]캠페인관리>결과>업체평가 ]
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectSurveyPopups.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSurveyPopups(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        searchVO.setsBizCd("06");
        Map<String, Object> result = new HashMap<String, Object>();
        result = satisFactionResultMgmtService.selectSurveyAnswerResultByCodition(searchVO);

        return result;

    }

    /**
     * 대상자추출 정보를 조회하는 팝업을 연다.
     * @param saveVO - 대상자추출 정보 조회
     * @param
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractSearchPopup.do", method = RequestMethod.GET)
    public String selectCrmTargExtractSearchPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));

        return "/crm/cmm/crmTargExtract/selectCrmTargExtractSearchPopup";
    }

    /**
     * 캠페인에 따른 추출대상자 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractPopups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmTargExtractPopups(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectCrmTargExtractPopupsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<MarketingCampaignVO> selectCrmTargExtractPopupsByCondition = marketingCampaignService.selectCrmTargExtractPopupsByCondition(searchVO);

            result.setData(selectCrmTargExtractPopupsByCondition);
        }

        return result;

    }

    /**
     * 대상자추출 정보를 추출차수별로 조회하는 팝업을 연다.
     * @param saveVO - 대상자추출 정보 조회
     * @param
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailSearchPopup.do", method = RequestMethod.GET)
    public String selectCrmTargExtractDetailSearchPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));
        model.addAttribute("extrDgreCnt",  request.getParameter("extrDgreCnt"));
        model.addAttribute("statCd",  request.getParameter("statCd"));

        return "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailSearchPopup";
    }

    /**
     * 캠페인에 따른 추출대상자 데이터를 추출차수별로 삭제한다
     * @param saveVO - 캠페인정보 삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/multiCrmTargExtractDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCrmTargExtractDetails(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {

        marketingCampaignService.multiCrmTargExtractDetails(saveVO);
        return true;

    }





    /**
     * 마케팅 캠페인(작업정보) 데이터를 조회한다.(정비캠페인)
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectWorks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorks(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectWorkByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectWorkByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(작업정보) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(작업정보) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiWorks.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiWorks(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {
        marketingCampaignService.multiWorks(saveVO);
        return true;
    }

    /**
     * 마케팅 캠페인(작업정보) 정보를 삭제한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/deleteWork.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteWork(@RequestBody MarketingCampaignVO activeVO)throws Exception {

        int resultCnt = 0 ;
        resultCnt = marketingCampaignService.deleteWork(activeVO);
        return resultCnt;

    }



    /**
     * 마케팅 캠페인(VIN정보) 데이터를 조회한다.(정비캠페인)
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectVins.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVins(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectVinByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectVinByCondition(searchVO));
        }

        return result;

    }

    /**
     * VIN번호 정보를 엑셀로 일괄등록한다.
     * @param bindingResult
     * @return
     */

    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectVinUploadPopup.do", method = RequestMethod.GET)
    public String selectVinUploadPopup(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));

        return "/crm/mcm/marketingCampaign/selectVinUploadPopup";
    }

    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertVinUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertVinUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("makCd") String makCd,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<MarketingCampaignVinExcelVO> list = new ArrayList<MarketingCampaignVinExcelVO>();
        List<MarketingCampaignVinExcelVO> list2 = new ArrayList<MarketingCampaignVinExcelVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        List<ExcelUploadError> errors = null;
        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<MarketingCampaignVinExcelVO> excelReader = new ExcelReader<MarketingCampaignVinExcelVO>(MarketingCampaignVinExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                for(MarketingCampaignVinExcelVO vo : list){
                    if (!(StringUtil.nullConvert(vo.getVinNo())).equals("")){
                        //LTS 정보 TEMP Table 저장
                        if(vo.getVinNo().length()==17){
                            MarketingCampaignVO marketingCampaignVO = new MarketingCampaignVO();
                            marketingCampaignVO.setVinNo(vo.getVinNo());
                            marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());
                            marketingCampaignVO.setMakCd(makCd);
                            marketingCampaignService.insertVinTmpExcelData(marketingCampaignVO);
                            list2.add(vo);
                        }else{
                            errors = new ArrayList<ExcelUploadError>();
                            errors.add(new ExcelUploadError(
                                    messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.vinNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                            );
                            vo.setErrors(errors);
                            list2.add(vo);
                            vo.setErrorCount(vo.getErrors().size());
                        }
                    }
                }
                result.setTotal(list2.size());
                result.setData(list2);

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
     * LTS 정보를 엑셀로 일괄등록한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectLTSUploadPopup.do", method = RequestMethod.GET)
    public String selectLTSUploadPopup(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("dlrCd",  request.getParameter("dlrCd"));
        model.addAttribute("makCd",  request.getParameter("makCd"));
        return "/crm/mcm/marketingCampaign/selectLTSUploadPopup";
    }

    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertLTSUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertLTSUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("makCd") String makCd,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<MarketingCampaignLTSExcelVO> list = new ArrayList<MarketingCampaignLTSExcelVO>();
        List<MarketingCampaignLTSExcelVO> list2 = new ArrayList<MarketingCampaignLTSExcelVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        List<ExcelUploadError> errors = null;

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){
            try{
                ExcelReader<MarketingCampaignLTSExcelVO> excelReader = new ExcelReader<MarketingCampaignLTSExcelVO>(MarketingCampaignLTSExcelVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);
                for(MarketingCampaignLTSExcelVO vo : list){
                    if (!(StringUtil.nullConvert(vo.getLtsModelCd())).equals("")){
                        //LTS 정보 TEMP Table 저장
                        LtsModelSearchVO searchVO = new LtsModelSearchVO();
                        searchVO.setsLtsModelCd(vo.getLtsModelCd());

                        if(ltsModelMappingService.selectLtsModelExistYn(searchVO)){
                            list2.add(vo);
                        }else{
                            errors = new ArrayList<ExcelUploadError>();
                            errors.add(new ExcelUploadError(
                                    messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("ser.lbl.ltsModelCd", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                            );
                            vo.setErrors(errors);
                            list2.add(vo);
                            vo.setErrorCount(vo.getErrors().size());
                        }
                    }
                }
                result.setTotal(list2.size());
                result.setData(list2);

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
     * 마케팅 캠페인(VIN) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO - 마케팅 캠페인
     * @param bindingResult
     * @return 등록 대상자 수
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertVinExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertVinExcelData(@Validated @RequestBody MarketingCampaignSaveExVO activeVO)throws Exception {

        if (StringUtils.isEmpty(activeVO.gettDlrCd())){activeVO.settDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignService.insertVinExcelData(activeVO);

    }


    /**
     * 마케팅 캠페인(LTS MODEL) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO - 마케팅 캠페인
     * @param bindingResult
     * @return 등록 대상자 수
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/insertLtsModelExcelData.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertLtsModelExcelData(@Validated @RequestBody MarketingCampaignSaveExVO activeVO)throws Exception {

        if (StringUtils.isEmpty(activeVO.gettDlrCd())){activeVO.settDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignService.insertLtsModelExcelData(activeVO);

    }


    /**
     * 마케팅 캠페인(공임정보) 데이터를 조회한다.(정비캠페인)
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectLabors.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLabors(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectLaborByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectLaborByCondition(searchVO));
        }

        return result;

    }

    /**
     * 마케팅 캠페인(공임정보) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(공임정보) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiLabor.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLabor(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {
        marketingCampaignService.multiLabor(saveVO);
        return true;
    }


    /**
     * 제조사 캠페인(부품정보) 데이터를 조회한다.(정비캠페인)
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItems(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectItemsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 딜러 캠페인(부품정보) 데이터를 조회한다.(정비캠페인)
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectDlrItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrItems(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(marketingCampaignService.selectDlrItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(marketingCampaignService.selectDlrItemsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 공임코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectLbrCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLbrCdList(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(marketingCampaignService.selectLbrCdListByCondition(searchVO));

        return result;
    }

    /**
     * 마케팅 캠페인(부품정보) 정보를 등록한다.
     * @param saveVO - 마케팅 캠페인(작업정보) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/multiItems.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItems(@Validated @RequestBody MarketingCampaignSaveVO saveVO) throws Exception {
        marketingCampaignService.multiItems(saveVO);
        return true;
    }

    /**
     * 마케팅 캠페인(부품정보) 정보를 삭제한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/deleteItems.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteItems(@RequestBody MarketingCampaignVO activeVO)throws Exception {

        int resultCnt = 0 ;
        resultCnt = marketingCampaignService.deleteItems(activeVO);
        return resultCnt;

    }

    /**
     * 고객 추출 조건 목록 조회
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectTargExtractList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CrmTargExtractVO> selectTargExtractList() throws Exception {

        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<CrmTargExtractVO> targExtractList = new ArrayList<CrmTargExtractVO>();
        targExtractList = crmTargExtractService.selectTargExtractListByCondition(searchVO);

        return targExtractList;
    }

    /**
     * 직무명을 조회한다.
     * @param searchVO 사용자 조회 조건
     * @return 사용자 조건을 만족하는 직무 정보를 반환한다.
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectUsersForTaskName.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectUsersForTaskName(@RequestBody UserSearchVO searchVO) throws Exception {

        String taskNm = "";
        UserVO  userVO  = userService.selectUserByKey(searchVO.getsUsrId());

        if (StringUtils.isEmpty(userVO.getTskCd())) {
            taskNm = "";
        } else {
            TaskVO taskVO = taskService.selectTaskByKey("20", userVO.getTskCd());   // cmpTp 회사구분 '10':DCS(본사), '20':DMS(딜러)

            if (taskVO != null) {
                if (StringUtils.isNotEmpty(taskVO.getTskNm())) {
                    taskNm = taskVO.getTskNm();
                }
            }
        }

        return taskNm;
    }

    /**
     * 마케팅 캠페인 관리 프린트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaignPrint.do", method = RequestMethod.GET)
    public String selectMarketingCampaignPrint(Model model
                                            , @RequestParam(value="makCd") String makCd
                                            , @RequestParam(value="dlrCd") String dlrCd
                                                ) throws Exception {
        /**
         *  공통 탭
         *      - 기본정보/방안/목표/대상/예산
         *  유형 : 정비인경우 ( MakTpCd : 03 )
         *      - 딜러 HOST_CD(02)   : 정비항목 / 부품수령 / VIN
         *      - 제조사 HOST_CD(01) :  공임 / 교환부품 / VIN
         *  상태 : 심사중 이후 부터 ( statCd : 01 이 아닌경우 )
         *      - 결재탭
         *  상태 : 심사완료 ( statCd : 03 ) && 종료일이 지난경우
         *      - 결과 그리드
         */


        MarketingCampaignVO marketingCampaignVO = new MarketingCampaignVO();
        MarketingCampaignSearchVO searchVO = new MarketingCampaignSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsMakCd(makCd);
        marketingCampaignVO = marketingCampaignService.selectMarketingCampaignByKey(searchVO);

        if ( marketingCampaignVO != null ) {
            String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
            String sysDate = DateUtil.getDate(dateFormat);

            model.addAttribute("dateFormat", dateFormat);
            model.addAttribute("sysDate", sysDate);
            model.addAttribute("marketingCampaignVO", marketingCampaignVO);

        } else {
            model.addAttribute("marketingCampaignVO", null);
        }

        return "/crm/mcm/marketingCampaign/selectMarketingCampaignPrint";
    }

    /**
     * 마케팅 캠페인 정보를 복사 한다.
     * @param searchVO - makCd
     * @return 캠페인 번호
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/copyMarketingCampaign.do", method = RequestMethod.POST)
    @ResponseBody
    public String copyMarketingCampaign(@RequestBody MarketingCampaignVO marketingCampaignVO)throws Exception {
        return marketingCampaignService.copyMarketingCampaign(marketingCampaignVO);
    }


    /**
     * 마케팅 캠페인 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectMarketingCampaignsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectMarketingCampaignsExcelExportCnt(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        return marketingCampaignService.selectMarketingCampaignsByConditionCnt(searchVO);

    }

    /**
     * 마케팅 캠페인(예산) 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/marketingCampaign/selectBudgetsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectBudgetsExcelExportCnt(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        return marketingCampaignService.selectBudgetsByConditionCnt(searchVO);

    }


    /**
     * 캠페인에 따른 추출대상자 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractPopupsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCrmTargExtractPopupsExcelExportCnt(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

        return marketingCampaignService.selectCrmTargExtractPopupsByConditionCnt(searchVO);

    }



}