package chn.bhmc.dms.dply.cmm.web;

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
import chn.bhmc.dms.dply.cmm.service.DashboardService;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.DMSConnectErrorsVO;
import chn.bhmc.dms.dply.cmm.vo.DashboardSearchVO;
import chn.bhmc.dms.dply.cmm.vo.DeployFailContentsVO;
import chn.bhmc.dms.dply.cmm.vo.DeployGroupDealerForDashboardVO;
import chn.bhmc.dms.dply.cmm.vo.DeployGroupForDashboardVO;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.ScheduleSummaryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DashboardController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 16.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Controller
public class DashboardController extends HController {
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;

    /**
     * Dashboard 서비스
     */
    @Resource(name="dashboardService")
    DashboardService dashboardService;




    /**
     * Dashboard 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectDashboardMain.do", method = RequestMethod.GET)
    public String selectDmsProfileMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

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

        // DEPLOY결과코드
        model.addAttribute("deployRsltCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM041", null, langCd));

        // REPOSITORY 작업명령어코드
        model.addAttribute("repositoryOperCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM042", null, langCd));


        return "/dply/cmm/dashboard/selectDashboardMain";
    }

    /**
     * Dashboard 배포스케줄요약 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectScheduleSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectScheduleSummary(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<ScheduleSummaryVO> list = null;

        list = dashboardService.selectScheduleSummary(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }


    /**
     * Dashboard 일별 배포스케줄요약 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectScheduleSummaryByDay.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectScheduleSummaryByDay(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<ScheduleSummaryVO> list = null;

        list = dashboardService.selectScheduleSummaryByDay(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }


    /**
     * Dashboard 배포스케줄목록 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectScheduleList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectScheduleList(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<ScheduleSummaryVO> list = null;

        list = dashboardService.selectScheduleList(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * Dashboard 배포그룹목록을 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectDeployGroupForDashboard.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployGroupForDashboard(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<DeployGroupForDashboardVO> list = null;

        list = dashboardService.selectDeployGroupForDashboard(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     *Dashboard 배포 DMS 목록을 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectDeployGroupDealerForDashboard.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployGroupDealerForDashboard(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<DeployGroupDealerForDashboardVO> list = null;

        list = dashboardService.selectDeployGroupDealerForDashboard(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     *DMS측 배포실행 오류내역 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectDeployFailContents.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployFailContents(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<DeployFailContentsVO> list = null;

        list = dashboardService.selectDeployFailContents(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }


    /**
     *DMS 연동 오류내역을 조회한다
     * @param searchVO - 조회 조건을 포함하는 DashboardSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dashboard/selectDMSConnectErrors.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDMSConnectErrors(@RequestBody DashboardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<DMSConnectErrorsVO> list = null;

        list = dashboardService.selectDMSConnectErrors(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }






}
