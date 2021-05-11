package chn.bhmc.dms.crm.css.web;

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
import chn.bhmc.dms.core.util.LoginUtil;
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
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<CrmTargExtractVO> targExtractList = new ArrayList<CrmTargExtractVO>();
        targExtractList = crmTargExtractService.selectTargExtractListByCondition(searchVO);
        model.addAttribute("targExtractList", targExtractList);

        //고객추출주기 ( 요일 )
        List<CommonCodeVO> custExtrCycleWeekList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM901", null, langCd);
        model.addAttribute("custExtrCycleWeekList", custExtrCycleWeekList);

        //대상자 추출 DropDownBoxLitt 필요

        return "/crm/css/satisFactionManage/selectSatisFactionManageMain";
    }

    /**
     * 만족도 조사 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionManages.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionManages(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
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

    /**
     * 만족도 조사 관리 대상자 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionManageUsrs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionManageUsrs(@RequestBody SatisFactionManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        /*SatisFactionMobileResultSearchVO usrSearchVO = new SatisFactionMobileResultSearchVO();

        usrSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        usrSearchVO.setsSeq(searchVO.getsSeq());
        usrSearchVO.setsStsfIvstExpdCd(searchVO.getsStsfIvstExpdCd());
        usrSearchVO.setsStsfIvstMthCd(searchVO.getsStsfIvstMthCd());
        usrSearchVO.setsStsfIvstTpCd(searchVO.getsStsfIvstTpCd());
        usrSearchVO.setsStsfIvstNm(searchVO.getsStsfIvstNm());
        usrSearchVO.setsSubyTmplSeq(searchVO.getsSubyTmplSeq());*/

        result.setTotal(satisFactionManageService.selectSatisFactionManageUsrsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionManageService.selectSatisFactionManageUsrsByCondition(searchVO));
        }


        return result;

    }

    /**
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
     * 만족도 조사 관리 대상자추출을 실행한다.
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
     * 만족도 조사 관리 정보를 등록한다.
     * @param saveVO - 설문 템플릿 관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/multiSatisFactionManages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSurveySatisFactions(@Validated @RequestBody SatisFactionManageSaveVO saveVO) throws Exception {

        satisFactionManageService.multiSatisFactionManages(saveVO);
        return true;
    }

    /**
     * 만족도 조사 관리 정보를 등록한다.
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
     * 만족도 조사 관리 정보를 수정한다.
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
     * 만족도 조사 고객추출 - 오늘 고객 추출 수량 조회 ( 배치에서 사용 )
     * @param searchVO - sDlrCd / sCurruntDt
     * @return 오늘 스케줄 돌아야 할 수량
     */
    @RequestMapping(value = "/crm/css/satisFactionManage/selectSatisFactionBatchCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSatisFactionBatchCnt(@RequestBody SatisFactionManageSearchVO searvhVO) throws Exception {

        return satisFactionManageService.selectSatisFactionBatchCnt(searvhVO);
    }


    /**
     * 만족도 조사 관리 정보를 등록한다.
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

}
