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
import chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO;
import chn.bhmc.dms.dply.spec.vo.DeployReportDetailVO;
import chn.bhmc.dms.dply.spec.vo.DmsSearchVO;
import chn.bhmc.dms.dply.spec.vo.DmsVO;
import chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO;
import chn.bhmc.dms.dply.spec.vo.DplyMastVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Cheolman Man Oh     최초 생성
 * </pre>
 */

@Controller
public class DeployHistoryMngController extends HController {
/*
    @Resource(name="baseNames")
    List<String> baseNames;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
*/
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
     * DEPLOY HISTORY 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDplyHistMain.do", method = RequestMethod.GET)
    public String selectDplyHistMain(Model model) throws Exception {

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


        return "/dply/spec/dplyHist/selectDplyHistMain";
    }


    /**
     * SPEC_CD, DEPLOY_VER_NO 조건으로 Deploy History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeployHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDeployHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployHistory(@RequestBody DeployHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectDeployHistory(searchVO));

        return result;

    }


    /**
     * DEPLOY REPORT DETAIL 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDplyReportDetailPopup.do", method = RequestMethod.GET)
    public String selectBundlePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY결과코드
        model.addAttribute("deployRsltTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM041", null, langCd));

        // SPEC타입별 DEPLOY결과코드
        model.addAttribute("deployRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM044", null, langCd));

        // SPEC타입별 롤백결과코드
        model.addAttribute("rollbackRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM045", null, langCd));

        // Deploy요청유형코드
        model.addAttribute("deployReqTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM047", null, langCd));

        return "/dply/spec/dplyHist/selectDplyReportDetailPopup";
    }

    /**
     * Deploy Master 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeployHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDeployReportMasterByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployReportMasterByCondition(@RequestBody DeployHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectDeployReportMasterByCondition(searchVO));

        return result;

    }

    /**
     * Deploy Detail 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeployHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDeployReportDetailByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployReportDetailByCondition(@RequestBody DeployHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<DeployReportDetailVO> list = specMngService.selectDeployReportDetailByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;

    }


    /**
     * REDEPLOY 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectRedeployPopup.do", method = RequestMethod.GET)
    public String selectRedeployPopup(Model model) throws Exception {

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

        return "/dply/spec/dplyHist/selectRedeployPopup";
    }

    /**
     * Redeploy DMS Popup 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DmsSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/dplyHist/selectDmsPopupListForRedeploy.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsPopupListForRedeploy(@RequestBody DmsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<DmsVO> list = specMngService.selectDmsPopupListForRedeploy(searchVO);
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // REDEPLOY DEALER 신규 등록
    @RequestMapping(value = "/dply/spec/dplyHist/insertDplyDlrForRedeploy.do", method = RequestMethod.POST)
    @ResponseBody
    public DplyMastVO insertDplyDlrForRedeploy(@RequestBody DplyDlrSaveVO saveVO) throws Exception {

        return specMngService.insertDplyDlrForRedeploy(saveVO);
//        return "";

    }

    // DEPLOY MASTER 상태를 Running으로 update, DEPLOY시작일자를 SYSDATE로 update
    @RequestMapping(value = "/dply/spec/dplyHist/updateDplyMastStateToRun.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDplyMastStateToRun(@RequestBody DplyMastVO saveVO) throws Exception {

        return specMngService.updateDplyMastStateToRun(saveVO);

    }



}
