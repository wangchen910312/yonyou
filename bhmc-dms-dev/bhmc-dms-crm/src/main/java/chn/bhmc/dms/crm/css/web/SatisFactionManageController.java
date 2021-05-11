package chn.bhmc.dms.crm.css.web;

import java.util.ArrayList;
import java.util.Date;
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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionTargExtractService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.SurveySatisFactionService;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 만족도 조사 관리 컨트롤러
 *
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         Kim Hyun Ho            최초 생성
 * </pre>
 */


@Controller
public class SatisFactionManageController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 만족도 관리 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 설문 템플릿 관리 서비스
     */
    @Resource(name="surveySatisFactionService")
    SurveySatisFactionService surveySatisFactionService;

    /**
     * 설문 결과(대상자) 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객추출 정보 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     *  설문질문 서비스
     */
    @Resource(name="surveyQuestionService")
    SurveyQuestionService surveyQuestionService;


    /**
     *  만족도 조사 대상자 추출 조건 서비스
     */
    @Resource(name="satisFactionTargExtractService")
    SatisFactionTargExtractService satisFactionTargExtractService;


    /**
     * 메세지소스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionManageMain.do", method = RequestMethod.GET)
    public String selectSatisFactionManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //설문 템플릿 정보(kendoDropDownList 구성)
        SurveySatisFactionSearchVO searchVo = new SurveySatisFactionSearchVO();
        searchVo.setsDelYn("Y");//사용여부
        searchVo.setsDlrCd(LoginUtil.getDlrCd());
        List<SurveySatisFactionVO> surveyTmplList = new ArrayList<SurveySatisFactionVO>();
        surveyTmplList = surveySatisFactionService.selectSurveyTmplsByCondition(searchVo);
        model.addAttribute("surveyTmplList", surveyTmplList);

        //만족도 조사 타입
        List<CommonCodeVO> stsfIvstTpCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd);
        model.addAttribute("stsfIvstTpCdList", stsfIvstTpCdList);

        //만족도 조사 유형
        List<CommonCodeVO> stsfIvstMthCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd);
        model.addAttribute("stsfIvstMthCdList", stsfIvstMthCdList);

        //만족도 조사 수단
        List<CommonCodeVO> stsfIvstExpdCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd);
        model.addAttribute("stsfIvstExpdCdList", stsfIvstExpdCdList);

        //고객추출 정보
        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<CrmTargExtractVO> targExtractList = new ArrayList<CrmTargExtractVO>();
        targExtractList = crmTargExtractService.selectTargExtractListByCondition(searchVO);
        model.addAttribute("targExtractList", targExtractList);

        //고객추출주기 ( 요일 )
        List<CommonCodeVO> custExtrCycleWeekList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM901", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("custExtrCycleWeekList", custExtrCycleWeekList);
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, 0), systemConfigInfoService.selectStrValueByKey("dateFormat")));

        model.addAttribute("sysDateExcelNm", DateUtil.getDate("yyyyMMddHHmm"));     // 엑셀 이름에 날짜지정할때 하이픈(-)이 들어가면 안됨. 그래서 날짜포맷 임시로 지정함
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        /*고객추출조건 DS 시작*/
        model.addAttribute("lbrTps", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd)); //정비위탁유형
        model.addAttribute("rePairTps", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd)); //수리유형
        model.addAttribute("dlrRoTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd)); //딜러자체 유형
        /*고객추출조건 DS 종료*/

        return "/crm/css/satisFactionManage/selectSatisFactionManageMain";
    }


    /**
     * 만족도조사 관리 > 만족도조사 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionManages.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionManages(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LoginUtil.getLangCd());

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
        if(searchVO.getsStartDt() != null || searchVO.getsEndDt() != null ){

            // 시작일
            startCal.setTime(searchVO.getsStartDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(satisFactionManageService.selectSatisFactionManagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionManageService.selectSatisFactionManagesByCondition(searchVO));
        }


        return result;

    }

    /** 20170420 삭제예정 ( 서비스 확인 )
     * 만족도 조사 관리 대상자를 콜센터로 이관한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectCallSenProc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCallSenProc(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        satisFactionManageService.selectCallSenProc(searchVO);

        return true;

    }

    /**
     * 만족도조사 관리 > 만족도 조사 관리 대상자추출을 실행한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectCallRcpeExtrMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCallRcpeExtrMapping(@RequestBody SatisFactionManageVO stsfMngVO) throws Exception {
        /*
         *  [TODO]  1. 대상자 추출조건으로 대상자 추출 proc를 태운다.
         *          2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행
         *          3. 추출된 대상자를 콜센터로 이관
         *          4. 해당 tmp table에서 data삭제
         *          5. 만족도조사 의 마지막 추출일 update
         */
        satisFactionManageService.selectCallRcpeExtrMapping(stsfMngVO);
        return true;

    }

    /**
     * 만족도조사 관리 > 상세팝업 > 만족도 조사 관리 정보를 등록한다.
     * @param satisFactionManageVO - 만족도 조사를 등록하는 SatisFactionManageVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/insertSatisFactionManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSatisFactionManage(@Validated @RequestBody SatisFactionManageVO satisFactionManageVO) throws Exception {
        //[TODO] 만족도조사 사용여부, 주기설정자동여부 에 따라서 Batch를 등록함 (impl단에서 확인)
        satisFactionManageService.insertSatisFactionManage(satisFactionManageVO);
        return true;
    }

    /**
     * 만족도조사 관리 > 상세 팝업 > 만족도 조사 관리 정보를 수정한다.
     * @param satisFactionManageVO - 만족도 조사를 수정하는 SatisFactionManageVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/updateSatisFactionManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSatisFactionManage(@Validated @RequestBody SatisFactionManageVO satisFactionManageVO) throws Exception {

        satisFactionManageService.updateSatisFactionManage(satisFactionManageVO);
        return true;
    }

    /**
     * 만족도조사 관리 > 상세팝업 > 만족도 조사 대상 관리 > 대상자 삭제
     * @param saveVO - 설문 템플릿 관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/multiExtrUsrs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiExtrUsrs(@Validated @RequestBody SatisFactionMobileResultSaveVO saveVO) throws Exception {

        satisFactionMobileResultService.multiExtrUsrs(saveVO);
        return true;
    }


    /**
     * 만족도조사 관리 > 상세 팝업 > 만족도조사 관리 상세정보를 조회한다.
     * @param SatisFactionManageSearchVO - 만족도 조사 번호
     * @return 만족도 조사 정보
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionManageByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SatisFactionManageVO selectSatisFactionManageByKey(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SatisFactionManageVO vo = satisFactionManageService.selectSatisFactionManageByKey(searchVO);
        return vo;

    }

    /**
     * 만족도조사 관리 > 상세 팝업 > 만족도 유형 데이터를 조회한다.
     * @param searchVO - 조사타입 공통코드
     * @return 만족도 유형 공통코드 목록
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectStsfIvstMthCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStsfIvstMthCdList(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(satisFactionManageService.selectStsfIvstMthCdList(searchVO));

        return result;
    }



    /**
     * 만족도조사 관리 > 상세팝업 > 만족도 조사 대상 관리 탭 목록을 조회한다.
     * @param SatisFactionMobileResultSearchVO - 만족도 조사 현황 대상자 목록
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSurveyCustResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveyCustResults(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(satisFactionMobileResultService.selectSurveyCustResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionMobileResultService.selectSurveyCustResultsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 만족도조사 관리 > 상세 팝업 > 만족도 조사결과 > 객/주관식 상세 (만족도 조사 답안결과) ( sQestTp : C(주관식) / M(객관식) )
     * @param SatisFactionMobileResultSearchVO - 만족도 조사결과 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectMultipleQuestionResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SatisFactionResultDtlMgmtVO selectMultipleQuestionResults(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SatisFactionResultDtlMgmtVO result = new SatisFactionResultDtlMgmtVO();

        result.setTotal(satisFactionMobileResultService.selectSurveyResultDtlInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            Map<String, List> map = satisFactionMobileResultService.selectSurveyResultDtlCondition(searchVO);

            result.setData( map.get("dataSet") );
            result.setColumnList( map.get("columnList") );
        }

        return result;
    }

    /**
     * 만족도조사 관리 > 상세팝업 > 만족도 조사결과탭 > 객관식 요약 - 만족도 조사 객관식 답안결과
     * @param blueMembershipCalcSearchVO - 만족도 조사결과 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectShortQuestionResults.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectShortQuestionResults(@RequestBody SatisFactionMobileSearchVO schMobileVO) throws Exception {

        schMobileVO.setsDlrCd(LoginUtil.getDlrCd());
        SatisFactionManageVO manageVO = satisFactionManageService.selectSurveyCdByKey(schMobileVO);

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
        schVO.setsSeq((manageVO.getSeq()));
        schVO.setsDlrCd((manageVO.getDlrCd()));
        schVO.setsSubyTmplSeq(Integer.parseInt(manageVO.getSubyTmplSeq()));
        schVO.setsQestTp(schMobileVO.getsQestTp());
        schVO.setsStsfIvstSeq(manageVO.getSeq());


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
        answerList = satisFactionMobileResultService.selectShortQuestionResultsByCondition(schVO);

        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
            result.put("answerListCnt",answerList.size());
        }else{
            result.put("answerListCnt",0);
        }

        result.put("subyTmplSeq",manageVO.getSubyTmplSeq()); //설문 템플릿 일련번호

        result.put("stsfIvstNm",manageVO.getStsfIvstNm()); //만족도명
        result.put("stsfIvstY",manageVO.getStsfIvstY()); //만족여부 - 만족
        result.put("stsfIvstN",manageVO.getStsfIvstN()); //만족여부 - 불만족

        return result;

    }


    /**
     * 만족도조사 관리 > 상세 팝업 > 만족도 조사결과 > 객/관식 상세 (만족도 조사 답안결과) ( sQestTp : C(주관식) / M(객관식) ) 엑셀Export 수량 데이터를 조회한다.
     * @param SatisFactionMobileResultSearchVO - 만족도 조사결과 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectMultipleQuestionResultsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectMultipleQuestionResultsExcelExportCnt(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {
        return satisFactionMobileResultService.selectSurveyResultDtlInfoByConditionCnt(searchVO);
    }


    /**
     * 만족도조사 관리 > 상세팝업 > 만족도 조사 대상 관리 탭 목록을 조회한다.
     * @param SatisFactionMobileResultSearchVO - 만족도 조사 현황 대상자 목록
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectCrmTargExtractDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmTargExtractDetails(@RequestBody SatisFactionCrmTargExtractSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setData(satisFactionTargExtractService.selectCrmTargExtractDetails(searchVO));

        return result;
    }

}
