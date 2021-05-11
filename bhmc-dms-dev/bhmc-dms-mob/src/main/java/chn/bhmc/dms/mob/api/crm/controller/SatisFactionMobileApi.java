package chn.bhmc.dms.mob.api.crm.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSaveVO;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoOutBoundService;
import chn.bhmc.dms.mob.api.crm.service.CrmSatisFactionManageService;
import chn.bhmc.dms.mob.api.crm.service.CrmSurveyAnswerService;
import chn.bhmc.dms.mob.api.crm.service.CrmSurveyQuestionService;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SurveySatisFactionVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;



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

@RestController
@RequestMapping(value = "api/crm/satisFactionMobile")
@Api("CRM满意度相关接口")
public class SatisFactionMobileApi extends HController {

    /**
     * 만족도 관리 서비스
     */
    @Resource(name="satisFactionMobileService")
    SatisFactionMobileService satisFactionMobileService;

    /**
     * 만족도 조사 관리 서비스
     */
    @Resource(name="CrmsatisFactionManageService")
    CrmSatisFactionManageService CrmsatisFactionManageService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="CrmsurveyQuestionService")
    CrmSurveyQuestionService CrmsurveyQuestionService;

    /**
     * 설문 보기 서비스
     */
    @Resource(name="CrmsurveyAnswerService")
    CrmSurveyAnswerService CrmsurveyAnswerService;




    /**
     * Customer Relation Information Management Service
     */
    @Resource(name = "customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;

    /**
     * Group Management Service
     */
    @Resource(name = "customerGroupService")
    CustomerGroupService customerGroupService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 주소관리 서비스
     */
    @Resource(name = "addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name = "userService")
    UserService userService;

    /**
     * CustomerInfoOutBoundService
     */
    @Resource(name = "CrmcustomerInfoOutBoundService")
    CrmCustomerInfoOutBoundService CrmcustomerInfoOutBoundService;

    /**
     * IDCC Role 코멘트서비스
     */
    @Resource(name="idccRoleMgmtService")
    IdccRoleMgmtService idccRoleMgmtService;

    /**
     * CRM-满意度调查.
     * @return
     */
    @ResponseBody
    @ApiOperation("CRM-满意度调查")
    @RequestMapping(value = "/selectSatisFactionMobileMain.do", method = RequestMethod.GET)
    public BaseJSON selectSatisFactionMobileMain(Model model) throws Exception {
        BaseJSON baseJSON =  new BaseJSON();

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
        stsfIvstNmList = CrmsatisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        model.addAttribute("stsfIvstNmList", stsfIvstNmList);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/css/satisFactionMobile/baseJsp/selectSatisFactionMobileMain.jsp");

      //  return "/ZnewMob/templatesNewMob/mobTemplateA";
         baseJSON.setResult(model);
         return baseJSON;
    }


    @RequestMapping(value = "/mob/crm/css/satisFactionMobile/selectSatisFactionMobileList.do", method = RequestMethod.GET)
    public String selectSatisFactionMobileList(Model model) throws Exception {
        return "/mob/crm/css/satisFactionMobile/selectSatisFactionMobileList";
    }


    @ApiOperation("客户满意度调查")
    @RequestMapping(value = "/selectSatisFactionSurveyMobiles.do", method = RequestMethod.POST)
    @ResponseBody
    public  BaseJSON selectSatisFactionMobiles(@RequestBody SatisFactionMobileSearchVO schMobileVO) throws Exception {
       BaseJSON baseJSON =  new BaseJSON();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //SatisFactionManageSearchVO  manageSchVO = new SatisFactionManageSearchVO();
        //manageSchVO.setsSeq(schMobileVO.getsSeq());
        schMobileVO.setsDlrCd(mobLoginVO.getDlrCd());
        //schMobileVO.setsPltCd(mobLoginVO.getPltCd());
        SatisFactionManageVO manageVO = CrmsatisFactionManageService.selectSurveyCdByKey(schMobileVO);

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
        schVO.setsSeq((manageVO.getSeq()));
        schVO.setsDlrCd((manageVO.getDlrCd()));
        schVO.setsSubyTmplSeq(Integer.parseInt(manageVO.getSubyTmplSeq()));

        //1. setting된 key값으로 QustionList조회
        List<SurveySatisFactionVO> questionList = new ArrayList<SurveySatisFactionVO>();
        Map<String, Object> result = new HashMap<String, Object>();
        questionList = CrmsurveyQuestionService.selectSurveyQuestionViewByCondition(schVO);
        if(questionList != null && questionList.size() != 0){
            result.put("questionList",questionList);
            result.put("questionListCnt",questionList.size());
        }else{
            result.put("questionListCnt",0);
        }

        //2. setting된 key값으로 AnswerList조회
        List<SurveySatisFactionVO> answerList = new ArrayList<SurveySatisFactionVO>();
        answerList = CrmsurveyAnswerService.selectSurveyAnswerViewByCondition(schVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
            result.put("answerListCnt",answerList.size());
        }else{
            result.put("answerListCnt",0);
        }
          baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     * 保存调查回复信息.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @ApiOperation("CRM-保存满意度调查信息")
    @RequestMapping(value = "/multiUsrAnswerSurveys.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiSatisFactionMobiles(@Validated @RequestBody SatisFactionMobileSaveVO saveVO)throws Exception {
    	BaseJSON  baseJSON = new BaseJSON();
        satisFactionMobileService.multiUsrAnswerSurveys(saveVO);
        return baseJSON;
    }


    @ApiOperation("查询满意度调查清单表")
    @RequestMapping(value = "/selectSatisFactionManagesNew.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSatisFactionManagesNew(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {
        BaseJSON  baseJSON =  new BaseJSON();

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //만족도 조사명(kendoDropDownList 구성) - 조건1.사용여부 Y, 조건2.만족도에 설문이 매핑되어 있어야함, 조건3.만족도조사 기간이 오늘 날짜를 포함하고 있어야함
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustTargYn("Y");//고객대상여부
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsPltCd(mobLoginVO.getPltCd());
        List<SatisFactionManageVO> stsfIvstNmList = new ArrayList<SatisFactionManageVO>();
        stsfIvstNmList = CrmsatisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        //model.addAttribute("stsfIvstNmList", stsfIvstNmList);


        result.setTotal(stsfIvstNmList.size());

        if(result.getTotal() != 0){
            result.setData(stsfIvstNmList);
        }

             baseJSON.setResult(result);
        return baseJSON;

    }




    /**
     * 查看客户数据列表.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @ApiOperation("CRM-满意度客户查询")
    @RequestMapping(value = "/customerListSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON customerListSearch(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
    	BaseJSON  baseJSON  =  new BaseJSON();
        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 ) Reg. Date
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();
        if (searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null) {

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsRegDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsRegDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsRegDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsRegDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 ) Sales Date
         ******************************************/
        if (searchVO.getsSaleDtFrom() != null || searchVO.getsSaleDtTo() != null) {
            startCal = Calendar.getInstance();
            endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsSaleDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsSaleDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsSaleDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsSaleDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(CrmcustomerInfoOutBoundService.selectCustomerByConditionCnt(searchVO));

        if (result.getTotal() != 0) {


            result.setData(CrmcustomerInfoOutBoundService.selectCustomerByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

}
