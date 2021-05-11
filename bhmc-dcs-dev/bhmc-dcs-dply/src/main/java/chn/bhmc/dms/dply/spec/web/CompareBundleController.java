package chn.bhmc.dms.dply.spec.web;

import java.util.Calendar;
import java.util.Date;
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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.vo.CompareBundleSearchVO;
import chn.bhmc.dms.dply.spec.vo.CompareBundleSummaryVO;
import chn.bhmc.dms.dply.spec.vo.CompareResultVO;
import chn.bhmc.dms.dply.spec.vo.CompareTargetBundleVO;
import chn.bhmc.dms.dply.spec.vo.OBRBundleForCompSaveVO;
import chn.bhmc.dms.dply.spec.vo.OBRBundleForCompVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CompareBundleController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Controller
public class CompareBundleController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * SPEC 등록 관리 서비스
     */
    @Resource(name="specMngService")
    SpecMngService specMngService;

    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;

    /**
     * 대사 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectCompareBundleMain.do", method = RequestMethod.GET)
    public String selectCompareBundleMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));


        // DEPLOY유형
        model.addAttribute("deployTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM023", null, langCd));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, langCd));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM034", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, langCd));

        // PROPERTY파일타입
        model.addAttribute("prtyFileTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM038", null, langCd));

        // 대사결과코드
        model.addAttribute("compareResultTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM049", null, langCd));

        // 대사상세결과코드
        model.addAttribute("compareDetailResultTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM050", null, langCd));


        return "/dply/spec/comp/selectCompareBundleMain";
    }

    /**
     * 대사 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectOBRBundleMngPopup.do", method = RequestMethod.GET)
    public String selectOBRBundleMngPopup(Model model) throws Exception {
        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, LocaleContextHolder.getLocale().getLanguage()));


        return "/dply/spec/comp/selectOBRBundleMngPopup";
    }


    /**
     * 특정 대사일자를 조건으로 대사요약 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectCompareBundleSummaryList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCompareBundleSummaryList(@RequestBody CompareBundleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(specMngService.selectCompareBundleSummaryListCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(specMngService.selectCompareBundleSummaryList(searchVO));
        }

        return result;
    }

    /**
     * 특정 대사일자를 조건으로 대사대상 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectCompareTargetBundleList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCompareTargetBundleList(@RequestBody CompareBundleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<CompareTargetBundleVO> list = null;

        list = specMngService.selectCompareTargetBundleList(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 특정 대사일자를 조건으로 대사대상 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectCompareBundleSummaryByResult.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCompareBundleSummaryByResult(@RequestBody CompareBundleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<CompareBundleSummaryVO> list = null;

        list = specMngService.selectCompareBundleSummaryByResult(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 특정 대사일자, Dealer Code를 조건으로 대사 결과를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectCompareRsltList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCompareRsltList(@RequestBody CompareBundleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<CompareResultVO> list = null;

        list = specMngService.selectCompareRsltList(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 특정 대사일자를 조건으로 대사요약 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectOBRBundleForCompList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOBRBundleList(@RequestBody CompareBundleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<OBRBundleForCompVO> list = null;

        list = specMngService.selectOBRBundleForCompList(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 대사대상 테이블에서 가장 최근의 대사일자를 조회한다
     * @param searchVO - 조회 조건을 포함하는 CompareBundleSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/selectMaxCompareTargetStdDt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMaxCompareTargetStdDt(@RequestBody CompareBundleSearchVO searchVO) throws Exception {
//        return specMngService.selectMaxCompareTargetStdDt(searchVO);

        SearchResult result = new SearchResult();

        List<CompareBundleSummaryVO> list = null;

        list = specMngService.selectMaxCompareTargetStdDt(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;

    }

    /**
     * 대사대상 테이블에서 생성, 수정, 삭제한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/dply/spec/comp/multiOBRBundleForComp.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiOBRBundleForComp(@RequestBody OBRBundleForCompSaveVO saveVO) throws Exception {
        return specMngService.multiOBRBundleForComp(saveVO);

    }


}
