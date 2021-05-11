package chn.bhmc.dms.mob.crm.css.web;

import java.util.ArrayList;
import java.util.List;

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
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SurveySatisFactionService;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobSatisFactionManageController.java
 * @Description : 만족도조사 관리 Controller
 * @author JongHee Lim
 * @since 2016. 6. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 27.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobSatisFactionManageController extends HController {

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
     * 메세지소스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/selectSatisFactionManageMain.do", method = RequestMethod.GET)
    public String selectSatisFactionManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //설문 템플릿 정보(kendoDropDownList 구성)
        SurveySatisFactionSearchVO searchVo = new SurveySatisFactionSearchVO();
        searchVo.setsDelYn("Y");//사용여부
        searchVo.setsDlrCd(mobLoginVO.getDlrCd());
        List<SurveySatisFactionVO> surveyTmplList = new ArrayList<SurveySatisFactionVO>();
        surveyTmplList = surveySatisFactionService.selectSurveyTmplsByCondition(searchVo);
        model.addAttribute("surveyTmplList", surveyTmplList);

        //만족도 조사 유형
        List<CommonCodeVO> stsfIvstMthCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd);
        model.addAttribute("stsfIvstMthCdList", stsfIvstMthCdList);

        //만족도 조사 수단
        List<CommonCodeVO> stsfIvstExpdCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd);
        model.addAttribute("stsfIvstExpdCdList", stsfIvstExpdCdList);

        //만족도 조사 타입
        List<CommonCodeVO> stsfIvstTpCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd);
        model.addAttribute("stsfIvstTpCdList", stsfIvstTpCdList);

        //고객추출 정보
        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        List<CrmTargExtractVO> targExtractList = new ArrayList<CrmTargExtractVO>();
        targExtractList = crmTargExtractService.selectTargExtractListByCondition(searchVO);
        model.addAttribute("targExtractList", targExtractList);

        //대상자 추출 DropDownBoxLitt 필요

        return "/mob/crm/css/satisFactionManage/selectSatisFactionManageMain";
    }

    /**
     * 만족도 조사 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/selectSatisFactionManages.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionManages(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
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



    @RequestMapping(value = "/mob/crm/css/satisFactionManage/selectSatisFactionManagesNew.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionManagesNew(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //만족도 조사명(kendoDropDownList 구성) - 조건1.사용여부 Y, 조건2.만족도에 설문이 매핑되어 있어야함, 조건3.만족도조사 기간이 오늘 날짜를 포함하고 있어야함
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustTargYn("Y");//고객대상여부
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsPltCd(mobLoginVO.getPltCd());
        List<SatisFactionManageVO> stsfIvstNmList = new ArrayList<SatisFactionManageVO>();
        stsfIvstNmList = satisFactionManageService.selectStsfIvstNmsByCondition(searchVO);
        //model.addAttribute("stsfIvstNmList", stsfIvstNmList);


        result.setTotal(stsfIvstNmList.size());

        if(result.getTotal() != 0){
            result.setData(stsfIvstNmList);
        }


        return result;

    }

    /**
     * 만족도 조사 관리 대상자를 콜센터로 이관한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/selectCallSenProc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCallSenProc(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        satisFactionManageService.selectCallSenProc(searchVO);

        return true;

    }

    /**
     * 만족도 조사 관리 대상자추출을 실행한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/selectCallRcpeExtrMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectCallRcpeExtrMapping(@RequestBody SatisFactionManageVO stsfMngVO) throws Exception {
        /*
         *  [TODO]  1. 대상자 추출조건으로 대상자 추출 proc를 태운다.
         *          2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행
         *          3. 해당 tmp table에서 data삭제
         *          4. 만족도조사 의 마지막 추출일 update
         */
        satisFactionManageService.selectCallRcpeExtrMapping(stsfMngVO);
        return true;

    }

    /**
     * 만족도 조사 관리 정보를 등록한다.
     * @param satisFactionManageVO - 만족도 조사를 등록하는 SatisFactionManageVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/insertSatisFactionManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSatisFactionManage(@Validated @RequestBody SatisFactionManageVO satisFactionManageVO) throws Exception {

        satisFactionManageService.insertSatisFactionManage(satisFactionManageVO);
        return true;
    }

    /**
     * 만족도 조사 관리 정보를 수정한다.
     * @param satisFactionManageVO - 만족도 조사를 수정하는 SatisFactionManageVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/updateSatisFactionManage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSatisFactionManage(@Validated @RequestBody SatisFactionManageVO satisFactionManageVO) throws Exception {

        satisFactionManageService.updateSatisFactionManage(satisFactionManageVO);
        return true;
    }


    /**
     * 만족도 조사 관리 정보를 등록한다.
     * @param saveVO - 설문 템플릿 관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/crm/css/satisFactionManage/multiExtrUsrs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiExtrUsrs(@Validated @RequestBody SatisFactionMobileResultSaveVO saveVO) throws Exception {

        satisFactionMobileResultService.multiExtrUsrs(saveVO);
        return true;
    }

}
