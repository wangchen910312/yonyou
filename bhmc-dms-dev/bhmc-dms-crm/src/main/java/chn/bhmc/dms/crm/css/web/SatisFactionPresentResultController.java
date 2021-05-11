package chn.bhmc.dms.crm.css.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionPresentService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionPresentResultController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class SatisFactionPresentResultController extends HController {
    /**
     * 만족도 관리 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 만족도 설문 결과 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * VOC 이력 서비스
     */
    @Resource(name="satisFactionPresentService")
    SatisFactionPresentService satisFactionPresentService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 만족도 조사결과 현황 > 만족도 조사결과 현황 / 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/selectSatisFactionPresentResultMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //만족도 조사 유형
        List<CommonCodeVO> stsfIvstMthCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd);
        model.addAttribute("stsfIvstMthCdList", stsfIvstMthCdList);

        //만족도 조사 수단
        List<CommonCodeVO> stsfIvstExpdCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd);
        model.addAttribute("stsfIvstExpdCdList", stsfIvstExpdCdList);

        //만족도 조사 타입
        List<CommonCodeVO> stsfIvstTpCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd);
        model.addAttribute("stsfIvstTpCdList", stsfIvstTpCdList);

        //만족여부
        List<CommonCodeVO> stsfIvstYnList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM096", null, langCd);
        model.addAttribute("stsfIvstYnList", stsfIvstYnList);

        model.addAttribute("sysDateExcelNm", DateUtil.getDate("yyyyMMddHHmm"));     // 엑셀 이름에 날짜지정할때 하이픈(-)이 들어가면 안됨. 그래서 날짜포맷 임시로 지정함

        return "/crm/css/satisFactionPresentResult/selectSatisFactionPresentResultMain";
    }

    /**
     * 만족도 조사결과 현황 > 만족도 조사결과 현황 목록 을 조회한다.
     * @param SatisFactionMobileResultSearchVO - 만족도 조사결과 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/selectSatisFactionPresentResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionPresents(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(satisFactionMobileResultService.selectSatisFactionPresentsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionMobileResultService.selectSatisFactionPresentsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 만족도 조사결과 현황 > 상세 팝업 > 만족도 조사 설문결과를 조회 한다. / 만족도조사 낮은점수 처리관리 > 상세 팝업 > 설문항목 상세 탭 조회
     * @param satisFactionMobileResultSearchVO - 만족도 조사결과 설문항목
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/selectSurveyResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveyResults(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();
        result.setData(satisFactionMobileResultService.selectSurveyResultsByCondition(searchVO));

        return result;
    }

    /**
     * 만족도 조사결과 현황 > 만족도 조사결과 현황에서 낮은점수처리를 한다.
     * @param saveVO - 낮은점수처리 수정목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/updateSatisFactionPresentResults.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSatisFactionPresents(@Validated @RequestBody SatisFactionMobileResultSaveVO saveVO) throws Exception {

        satisFactionPresentService.multiSatisFactionPresent(saveVO);
        return true;
    }

    /**
     * 만족도 조사결과 현황 > 만족도 조사결과 현황에서 조사결과 무효처리를 한다.
     * @param satisFactionMobileResultVO - 조사결과 무효처리를 하는 SatisFactionMobileResultVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/multiStsfResultInvalidity.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStsfResultInvalidity(@Validated @RequestBody SatisFactionMobileResultSaveVO saveVO) throws Exception {
        satisFactionMobileResultService.multiStsfResultInvalidity(saveVO);
        return true;
    }


    /**
     * 만족도 조사결과 현황 > 만족도 조사결과 현황  엑셀Export 수량 데이터를 조회한다.
     * @param SatisFactionMobileResultSearchVO - 만족도 조사결과 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresentResult/selectSatisFactionPresentResultsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSatisFactionPresentResultsExcelExportCnt(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        return satisFactionMobileResultService.selectSatisFactionPresentsByConditionCnt(searchVO);
    }

}
