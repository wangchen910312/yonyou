package chn.bhmc.dms.crm.css.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionPresentController.java
 * @Description : 만족도 조사 현황 컨트롤러
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
public class SatisFactionPresentController extends HController {

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
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 만족도조사 낮은점수 처리 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresent/selectSatisFactionPresentMain.do", method = RequestMethod.GET)
    public String selectSatisFactionPresentResultMain(Model model) throws Exception {

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

        return "/crm/css/satisFactionPresent/selectSatisFactionPresentMain";
    }

    /**
     * 만족도 조사 현황을 조회한다.
     * @param searchVO - 만족도 조사 현황
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresent/selectSatisFactionPresents.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionPresentResults(@RequestBody SatisFactionManageSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(satisFactionManageService.selectSatisFactionPresentResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionManageService.selectSatisFactionPresentResultsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 만족도 조사 현황에서의 대상자 목록을 조회한다.
     * @param blueMembershipCalcSearchVO - 만족도 조사 현황 대상자 목록
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionPresent/selectSurveyCustResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSurveyCustResults(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(satisFactionMobileResultService.selectSurveyCustResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionMobileResultService.selectSurveyCustResultsByCondition(searchVO));
        }

        return result;
    }

}
