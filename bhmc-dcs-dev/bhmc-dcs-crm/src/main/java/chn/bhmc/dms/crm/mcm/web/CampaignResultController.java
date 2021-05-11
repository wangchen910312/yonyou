package chn.bhmc.dms.crm.mcm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.mcm.service.CampaignResultService;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSaveVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;

/**
 * 캠페인결과 관리 컨트롤러
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
public class CampaignResultController extends HController {
    /**
     * 캠페인결과 관리 서비스
     */
    @Resource(name="campaignResultService")
    CampaignResultService campaignResultService;

    /**
     * 마케팅 캠페인 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 만족도 조사 관리 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 캠페인결과 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectCampaignResultMain.do", method = RequestMethod.GET)
    public String selectCampaignResultMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("makTpList",    commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형
        model.addAttribute("statList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태
        model.addAttribute("hostList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최

        SatisFactionManageSearchVO searchVO = new SatisFactionManageSearchVO();
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustTargYn("N");//고객대상여부 -> 나중에 꼭~ "N"으로 값 변경~!!!
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<SatisFactionManageVO> stsfIvstNmList = new ArrayList<SatisFactionManageVO>();
        stsfIvstNmList = satisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        model.addAttribute("stsfIvstNmList", stsfIvstNmList);

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());

        return "/crm/mcm/campaignResult/selectCampaignResultMain";
    }

    /**
     * 캠페인결과 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectCampaignResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignResults(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(campaignResultService.selectCampaignResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<CampaignResultVO> selectCampaignResultsByCondition = campaignResultService.selectCampaignResultsByCondition(searchVO);

            result.setData(selectCampaignResultsByCondition);
        }

        return result;

    }

    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectMakTpCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMakTpCdList(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();

        marketingCampaignSearchVO.setCmmCd(searchVO.getCmmCd());

        result.setData(marketingCampaignService.selectMakTpCdListByCondition(marketingCampaignSearchVO));

        return result;
    }





    /**
     * 캠페인결과(목표) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectGoalResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGoals(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(campaignResultService.selectGoalResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(campaignResultService.selectGoalResultsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 캠페인결과(목표) 정보를 등록한다.
     * @param saveVO - 캠페인결과(목표) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/multiGoalResults.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiGoalResults(@Validated @RequestBody CampaignResultSaveVO saveVO) throws Exception {
        campaignResultService.multiGoalResults(saveVO);
        return true;
    }





    /**
     * 캠페인결과(업체평가) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectSatisFactionSurvey01s.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSatisFactionSurvey01s(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        CampaignResultVO campaignResultVO = campaignResultService.selectSurveyByKey(searchVO.getsDlrCd(), searchVO.getsPltCd(), searchVO.getsSeq());

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        searchVO.setsSeq((campaignResultVO.getSeq()));
        searchVO.setsDlrCd((campaignResultVO.getDlrCd()));
        searchVO.setsSubyTmplSeq(campaignResultVO.getSubyTmplSeq());
        searchVO.setsIvstTp("01");

        //1. setting된 key값으로 QustionList조회
        List<CampaignResultVO> questionList = new ArrayList<CampaignResultVO>();
        Map<String, Object> result = new HashMap<String, Object>();
        questionList = campaignResultService.selectSurveyQuestionByCondition(searchVO);
        if(questionList != null && questionList.size() != 0){
            result.put("questionList",questionList);
            result.put("questionListCnt",questionList.size());
        }else{
            result.put("questionListCnt",0);
        }

        //2. setting된 key값으로 AnswerList조회
        List<CampaignResultVO> answerList = new ArrayList<CampaignResultVO>();
        answerList = campaignResultService.selectSurveyAnswerByCondition(searchVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
            result.put("answerListCnt",answerList.size());
        }else{
            result.put("answerListCnt",0);
        }

        return result;

    }

    /**
     * 마케팅결과에서 설문응답 정보를 저장 한다.(업체평가)
     * @param CampaignResultSaveVO - 마케팅 캠페인 결과 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/multiCampaign01AnswerSurveys.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCampaign01AnswerSurveys(@Validated @RequestBody CampaignResultSaveVO saveVO)throws Exception {

        campaignResultService.multiCampaign01AnswerSurveys(saveVO);
        return true;
    }





    /**
     * 캠페인결과(영업사원 설문) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectSatisFactionSurvey02s.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSatisFactionSurvey02s(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        CampaignResultVO campaignResultVO = campaignResultService.selectSurveyByKey(searchVO.getsDlrCd(), searchVO.getsPltCd(), searchVO.getsSeq());

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        searchVO.setsSeq((campaignResultVO.getSeq()));
        searchVO.setsDlrCd((campaignResultVO.getDlrCd()));
        searchVO.setsSubyTmplSeq(campaignResultVO.getSubyTmplSeq());
        searchVO.setsIvstTp("02");

        //1. setting된 key값으로 QustionList조회
        List<CampaignResultVO> questionList = new ArrayList<CampaignResultVO>();
        Map<String, Object> result = new HashMap<String, Object>();
        questionList = campaignResultService.selectSurveyQuestionByCondition(searchVO);
        if(questionList != null && questionList.size() != 0){
            result.put("questionList",questionList);
            result.put("questionListCnt",questionList.size());
        }else{
            result.put("questionListCnt",0);
        }

        //2. setting된 key값으로 AnswerList조회
        List<CampaignResultVO> answerList = new ArrayList<CampaignResultVO>();
        answerList = campaignResultService.selectSurveyAnswerByCondition(searchVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
            result.put("answerListCnt",answerList.size());
        }else{
            result.put("answerListCnt",0);
        }

        CampaignResultVO makCdList = new CampaignResultVO();
        makCdList = campaignResultService.selectSurveyMakCdByKey(searchVO);
        result.put("makCdListCnt",makCdList);

        return result;

    }

    /**
     * 마케팅결과에서 설문응답 정보를 저장 한다.(영업사원 설문)
     * @param CampaignResultSaveVO - 마케팅 캠페인 결과 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/multiCampaign02AnswerSurveys.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCampaign02AnswerSurveys(@Validated @RequestBody CampaignResultSaveVO saveVO)throws Exception {

        campaignResultService.multiCampaign02AnswerSurveys(saveVO);
        return true;
    }





    /**
     * 담당자 의견 조회 - Detail
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectPrsnContByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CampaignResultVO selectPrsnContByKey(@RequestBody CampaignResultSearchVO searchVO) throws Exception {
        CampaignResultVO result = new CampaignResultVO();

        result = campaignResultService.selectPrsnContByKey(searchVO);

        return result;
    }

    /**
     * 캠페인결과(담당자 의견) 정보를 등록 한다.
     * @param campaignResultVO - 캠페인결과(담당자 의견) 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/insertPrsnConts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertPrsnConts(@Validated(Draft.class) @RequestBody CampaignResultVO campaignResultVO)throws Exception {

        campaignResultVO.setRegUsrId(LoginUtil.getUserId());
        campaignResultVO.setUpdtUsrId(LoginUtil.getUserId());

        campaignResultService.insertPrsnCont(campaignResultVO);

        return true;
    }

    /**
     * 캠페인결과(담당자 의견) 정보를 수정 한다.
     * @param marketingCampaignVO - 캠페인결과(담당자 의견) 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/updatePrsnConts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePrsnConts(@Validated(Draft.class) @RequestBody CampaignResultVO campaignResultVO)throws Exception {

        campaignResultVO.setRegUsrId(LoginUtil.getUserId());
        campaignResultVO.setUpdtUsrId(LoginUtil.getUserId());

        campaignResultService.updatePrsnCont(campaignResultVO);

        return true;
    }

    /**
     * 캠페인 기본목표에 대한 결과값을 계산처리 한다.
     * @param campaignResultVO - 캠페인결과 정보
     * @return saveVO
     */
    @RequestMapping(value = "/crm/cmm/campaignResult/selectCrmDefultTargSum.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectCrmDefultTargSum(@RequestBody CampaignResultVO campaignResultVO)throws Exception {

        Map<String,Object> result = new HashMap<String,Object>();

        campaignResultVO.setDlrCd(LoginUtil.getDlrCd());
        campaignResultVO.setUpdtUsrId(LoginUtil.getUserId());

        CampaignResultVO saveVO = new CampaignResultVO();

        saveVO = campaignResultService.selectCrmDefultTargSum(campaignResultVO);

        result.put("result", saveVO.getResult());

        return result;
    }

    /**
     * 캠페인 설문 결과 여부를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/mcm/campaignResult/selectSatisFactionSurveyResult.do", method = RequestMethod.POST)
    public @ResponseBody SatisFactionManageVO selectSatisFactionSurveyResult(@RequestBody CampaignResultSearchVO searchVO) throws Exception {

        SatisFactionManageVO satisFactionManageVO = new SatisFactionManageVO();
        searchVO.setsIvstTp("01");

        CampaignResultVO campaignResultVO = campaignResultService.selectSurveyMakCdByKey(searchVO);

        if ( campaignResultVO != null ) {

            // 캠페인 결과가 있을경우 설문지 명, 설문지 번호를 가져온다.
            SatisFactionMobileSearchVO searchVO1 = new SatisFactionMobileSearchVO();
            searchVO1.setsDlrCd(campaignResultVO.getDlrCd());
            searchVO1.setsSeq(campaignResultVO.getStsfIvstSeq());
            satisFactionManageVO = satisFactionManageService.selectSurveyCdByKey(searchVO1);

        };

        return satisFactionManageVO;

    }
}