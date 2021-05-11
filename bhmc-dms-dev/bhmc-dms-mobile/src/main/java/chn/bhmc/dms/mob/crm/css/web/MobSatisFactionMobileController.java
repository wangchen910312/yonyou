package chn.bhmc.dms.mob.crm.css.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileService;
import chn.bhmc.dms.crm.css.service.SurveyAnswerService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobSatisFactionMobileController.java
 * @Description : 만족도조사 모바일 Controller
 * @author JongHee Lim
 * @since 2016. 6. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 24.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobSatisFactionMobileController extends HController {

    /**
     * 만족도 관리 서비스
     */
    @Resource(name="satisFactionMobileService")
    SatisFactionMobileService satisFactionMobileService;

    /**
     * 만족도 조사 관리 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

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
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 메세지소스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionMobile/selectSatisFactionMobileMain.do", method = RequestMethod.GET)
    public String selectSatisFactionMobileMain(Model model) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //만족도 조사명(kendoDropDownList 구성) - 조건1.사용여부 Y, 조건2.만족도에 설문이 매핑되어 있어야함, 조건3.만족도조사 기간이 오늘 날짜를 포함하고 있어야함
        SatisFactionManageSearchVO searchVO = new SatisFactionManageSearchVO();
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustTargYn("Y");//고객대상여부
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsPltCd(mobLoginVO.getPltCd());
        List<SatisFactionManageVO> stsfIvstNmList = new ArrayList<SatisFactionManageVO>();
        stsfIvstNmList = satisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        model.addAttribute("stsfIvstNmList", stsfIvstNmList);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/css/satisFactionMobile/baseJsp/selectSatisFactionMobileMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }


    @RequestMapping(value = "/mob/crm/css/satisFactionMobile/selectSatisFactionMobileList.do", method = RequestMethod.GET)
    public String selectSatisFactionMobileList(Model model) throws Exception {
        return "/mob/crm/css/satisFactionMobile/selectSatisFactionMobileList";
    }


    @RequestMapping(value = "/mob/crm/css/satisFactionMobile/selectSatisFactionSurveyMobiles.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSatisFactionMobiles(@RequestBody SatisFactionMobileSearchVO schMobileVO) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //SatisFactionManageSearchVO  manageSchVO = new SatisFactionManageSearchVO();
        //manageSchVO.setsSeq(schMobileVO.getsSeq());
        schMobileVO.setsDlrCd(mobLoginVO.getDlrCd());
        //schMobileVO.setsPltCd(mobLoginVO.getPltCd());
        SatisFactionManageVO manageVO = satisFactionManageService.selectSurveyCdByKey(schMobileVO);

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
        schVO.setsSeq((manageVO.getSeq()));
        schVO.setsDlrCd((manageVO.getDlrCd()));
        schVO.setsSubyTmplSeq(Integer.parseInt(manageVO.getSubyTmplSeq()));

        //1. setting된 key값으로 QustionList조회
        List<SurveySatisFactionVO> questionList = new ArrayList<SurveySatisFactionVO>();
        Map<String, Object> result = new HashMap<String, Object>();
        questionList = surveyQuestionService.selectSurveyQuestionViewByCondition(schVO);
        if(questionList != null && questionList.size() != 0){
            result.put("questionList",questionList);
            result.put("questionListCnt",questionList.size());
        }else{
            result.put("questionListCnt",0);
        }

        //2. setting된 key값으로 AnswerList조회
        List<SurveySatisFactionVO> answerList = new ArrayList<SurveySatisFactionVO>();
        answerList = surveyAnswerService.selectSurveyAnswerViewByCondition(schVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
            result.put("answerListCnt",answerList.size());
        }else{
            result.put("answerListCnt",0);
        }

        return result;

    }

    /**
     * 설문응답 정보를 저장 한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionMobile/multiUsrAnswerSurveys.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSatisFactionMobiles(@Validated @RequestBody SatisFactionMobileSaveVO saveVO)throws Exception {

        satisFactionMobileService.multiUsrAnswerSurveys(saveVO);
        return true;
    }


}
