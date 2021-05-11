package chn.bhmc.dms.crm.css.web;

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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
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
/**
 * 만족도 조사 모바일 컨트롤러
 *
 * @author Kim Hyun Ho
 * @since 2016. 03. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.15         Kim Hyun Ho            최초 생성
 * </pre>
 */


@Controller
public class SatisFactionMobileController extends HController {

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
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 만족도 조사 > 만족도 조사 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionMobile/selectSatisFactionMobileMain.do", method = RequestMethod.GET)
    public String selectSatisFactionMobileMain(Model model) throws Exception {
        //만족도 조사명(kendoDropDownList 구성) - 조건1.사용여부 Y, 조건2.만족도에 설문이 매핑되어 있어야함, 조건3.만족도조사 기간이 오늘 날짜를 포함하고 있어야함
        SatisFactionManageSearchVO searchVO = new SatisFactionManageSearchVO();
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustTargYn("Y");//고객대상여부
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        List<SatisFactionManageVO> stsfIvstNmList = new ArrayList<SatisFactionManageVO>();
        stsfIvstNmList = satisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        model.addAttribute("stsfIvstNmList", stsfIvstNmList);

        return "/crm/css/satisFactionMobile/selectSatisFactionMobileMain";
    }

    /**
     *
     * 만족도 조사 > 만족도 조사 > 설문하기 조회. ( 결과는 조회 안함. )
     *
     * @param schMobileVO
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/crm/css/satisFactionMobile/selectSatisFactionSurveyMobiles.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSatisFactionMobiles(@RequestBody SatisFactionMobileSearchVO schMobileVO) throws Exception {

        //SatisFactionManageSearchVO  manageSchVO = new SatisFactionManageSearchVO();
        //manageSchVO.setsSeq(schMobileVO.getsSeq());
        schMobileVO.setsDlrCd(LoginUtil.getDlrCd());
        //schMobileVO.setsPltCd(LoginUtil.getPltCd());
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
        }

        //2. setting된 key값으로 AnswerList조회
        List<SurveySatisFactionVO> answerList = new ArrayList<SurveySatisFactionVO>();
        answerList = surveyAnswerService.selectSurveyAnswerViewByCondition(schVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
        }

        result.put("subyTmplSeq",manageVO.getSubyTmplSeq()); //설문 템플릿 일련번호

        return result;

    }

    /**
     * 만족도 조사 > 만족도 조사 설문 설문응답 정보를 저장 한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     *
     * 수정이력
     * 20160819 return type 수정 : 저장완료시 sysdate 및 result 반환
     *
     */
    @RequestMapping(value = "/crm/css/satisFactionMobile/multiUsrAnswerSurveys.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> multiSatisFactionMobiles(@Validated @RequestBody SatisFactionMobileSaveVO saveVO)throws Exception {

        boolean result = false;
        Map<String, String> resultMap = new HashMap<String, String>();

        result = satisFactionMobileService.multiUsrAnswerSurveys(saveVO);

        if ( result ) {
            resultMap.put("resultDt", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"))); //콜센터에서 만족도 조사 후 조사일 입력.
            resultMap.put("result", "SUCCESS");
        } else {
            resultMap.put("result", "FAIL");
        }

        return resultMap;
    }


}
