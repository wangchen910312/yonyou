package chn.bhmc.dms.crm.css.web;

import java.util.ArrayList;
import java.util.List;

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

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.SurveySatisFactionService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveyAnswerSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveyQuestionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 설문 템플릿 관리 컨트롤러
 *
 * @author hyun ho kim
 * @since 2016. 3. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.03         hyun ho kim            최초 생성
 * </pre>
 */

@Controller
public class SurveySatisFactionController extends HController {
    /**
     * 설문 템플릿 관리 서비스
     */
    @Resource(name="surveySatisFactionService")
    SurveySatisFactionService surveySatisFactionService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="surveyQuestionService")
    SurveyQuestionService surveyQuestionService;

    /**
     * 설문 보기 서비스
     */
    @Resource(name="surveyAnswerService")
    SurveyAnswerService surveyAnswerService;

    /**
     * 설문 결과 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

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
     * 설문 템플릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectSurveySatisFactionMain.do", method = RequestMethod.GET)
    public String selectSurveySatisFactionMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("scId", LoginUtil.getUserId());

        // sc 일경우 true / 아닐경우 false 를 반환.
        //boolean isSc = LoginUtil.hasRole("sc");
        //model.addAttribute("isSc", isSc);

        //설문질문유형코드
        model.addAttribute("qestTpCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("CRM093", null, langCd));

        return "/crm/css/surveySatisFaction/selectSurveySatisFactionMain";
    }

    /**
     * 설문 템플릿 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectSurveySatisFactions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveySatisFactions(@RequestBody SurveySatisFactionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        result.setTotal(surveySatisFactionService.selectSurveySatisFactionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(surveySatisFactionService.selectSurveySatisFactionsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 설문 템플릿 관리 정보를 등록한다.
     * @param saveVO - 설문 템플릿 관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/multiSurveySatisFactions.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSurveySatisFactions(@Validated @RequestBody SurveySatisFactionSaveVO saveVO) throws Exception {

        surveySatisFactionService.multiSurveySatisFactions(saveVO);
        return true;
    }

    /**
     * 설문 질문 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectSurveyQuestions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveyQuestions(@RequestBody SurveyQuestionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /*result.setTotal(surveyQuestionService.selectSurveyQuestionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(surveyQuestionService.selectSurveyQuestionsByCondition(searchVO));
        }*/
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        result.setData(surveyQuestionService.selectSurveyQuestionsByCondition(searchVO));
        return result;
    }

    /**
     * 설문 질문 정보를 등록한다.
     * @param saveVO - 설문 질문 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/multiSurveyQuestions.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSurveyQuestions(@Validated @RequestBody SurveyQuestionSaveVO saveVO) throws Exception {

        surveyQuestionService.multiSurveyQuestions(saveVO);
        return true;
    }

    /**
     * 설문 답변 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveyAnswerSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectSurveyAnswers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveyAnswers(@RequestBody SurveyAnswerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /*result.setTotal(surveyQuestionService.selectSurveyQuestionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(surveyQuestionService.selectSurveyQuestionsByCondition(searchVO));
        }*/
        result.setData(surveyAnswerService.selectSurveyAnswersByCondition(searchVO));
        return result;
    }

    /**
     * 설문 보기 정보를 등록한다.
     * @param saveVO - 설문 보기 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/multiSurveyAnswers.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSurveyAnswers(@Validated @RequestBody SurveyAnswerSaveVO saveVO) throws Exception {

        surveyAnswerService.multiSurveyAnswers(saveVO);
        return true;
    }

    /**
     * 설문 미리보기 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectSurveyViewPopup.do", method = RequestMethod.GET)
    public String selectSurveyViewPopup(Model model,HttpServletRequest request) throws Exception  {


        SurveySatisFactionSearchVO searchVo = new SurveySatisFactionSearchVO();
        searchVo.setsSubyTmplSeq((Integer.parseInt(request.getParameter("subyTmplSeq"))));
        searchVo.setsDlrCd(request.getParameter("dlrCd"));
        searchVo.setsPltCd(request.getParameter("pltCd"));

        //1. QustionList
        List<SurveySatisFactionVO> questinList = new ArrayList<SurveySatisFactionVO>();
        questinList = surveyQuestionService.selectSurveyQuestionViewByCondition(searchVo);
        model.addAttribute("questinList",  questinList);

        //2. AnswerList
        List<SurveySatisFactionVO> answerList = new ArrayList<SurveySatisFactionVO>();
        answerList = surveyAnswerService.selectSurveyAnswerViewByCondition(searchVo);
        model.addAttribute("answerList",  answerList);

        //3. Tmplet Name
        SurveySatisFactionVO tmpl = surveySatisFactionService.selectSurveySatisFactionByKey(searchVo);
        model.addAttribute("tmpl",  tmpl);

        return "/crm/css/surveySatisFaction/selectSurveyViewPopup";

    }

    /**
     * 설문 템플릿 결과저장 여부를 확인한다.
     * @param saveVO - 설문 템플릿 결과 조회 하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/surveySatisFaction/selectUseSurvey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUseSurvey(@RequestBody SatisFactionMobileResultSearchVO searchVO) throws Exception {
        int cnt = satisFactionMobileResultService.selectUseSurvey(searchVO);
        SearchResult result = new SearchResult();
        result.setTotal(cnt);
        return result;
    }

}