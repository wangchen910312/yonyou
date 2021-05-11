package chn.bhmc.dms.cmm.apr.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 결재 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class SignController extends HController {

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    /**
     * 결재양식 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 결재문서 번호 생성 서비스
     */
    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;

    /**
     * 결재상신 결재양식 선택 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignMain.do", method = RequestMethod.GET)
    public String selectSignMain(Model model) throws Exception {
        //결재유형
        List<CommonCodeVO> arrSignTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("arrSignTp", arrSignTp);

        return "/cmm/apr/sign/selectSignMain";
    }

    /**
     * 결재상신 작성 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignWritePopup.do", method = RequestMethod.GET)
    public String selectSignWritePopup(@RequestParam("signDocId") String signDocId, @RequestParam(value="signDocNo", required=false) String signDocNo, Model model) throws Exception {

        //결재구분
        List<CommonCodeVO> signTpList = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("signTpList", signTpList);

        SignVO signVO = null;

        //결재상신 신규 문서 인 경우
        if(signDocNo != null){
            signVO = signService.selectSignByKey(signDocNo);

        //결재상신 임시저장 문서 인 경우
        }else{
            DocVO docVO = docService.selectDocByKey(signDocId);
            signVO = new SignVO();
            signVO.setSignDocId(signDocId);
            signVO.setSignDocNm(docVO.getSignDocNm());
            signVO.setReqEmpNo(LoginUtil.getEmpNo());
            signVO.setReqUsrId(LoginUtil.getUserId());
            signVO.setReqUsrNm(LoginUtil.getUserNm());
            signVO.setReqDt(new Date());
        }

        model.addAttribute("signVO", signVO);

        return "/cmm/apr/sign/selectSignWritePopup";
    }

    /**
     * 결재상신 상세 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignViewPopup.do", method = RequestMethod.GET)
    public String selectSignViewPopup(@RequestParam("signDocNo") String signDocNo, Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //결재구분
        List<CommonCodeVO> signTpList = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, langCd);
        model.addAttribute("signTpList", signTpList);

        //결재선 - 결재진행상태
        List<CommonCodeVO> signStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM012", null, langCd);
        model.addAttribute("signStatCdList", signStatCdList);

        //결재선 - 결재처리유형
        List<CommonCodeVO> signRsltCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd);
        model.addAttribute("signRsltCdList", signRsltCdList);

        SignVO signVO = signService.selectSignByKey(signDocNo);

        model.addAttribute("signVO", signVO);

        return "/cmm/apr/sign/selectSignViewPopup";
    }

    /**
     * 결재상신 결재선 변경 팝업 화면을 출력 한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectChangeSignLinePopup.do", method = RequestMethod.GET)
    public String selectChangeSignLinePopup(Model model, HttpServletRequest request) throws Exception {

        //직무구분(딜러/제조사)
        String cmpTp = null;
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            cmpTp = Constants.CMP_TP_CORP;
        }else{
            cmpTp = Constants.CMP_TP_DLR;
        }

        //시스템코드 'D':딜러, 'I':임포터
        model.addAttribute("sysCd", sysCd);

        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(cmpTp);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(cmpTp);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));

        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);

        //결재유형
        model.addAttribute("signTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/apr/sign/selectChangeSignLinePopup";
    }

    /**
     * 결재상신 결재선 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignLines.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignLines(@RequestBody SignLineSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<SignLineVO> signLineList = signService.selectSignLinesByCondition(searchVO);

        result.setTotal(signLineList.size());
        result.setData(signLineList);

        return result;

    }

    /**
     * 결재상신 정보를 저장한다.
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/cmm/apr/sign/insertSign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSign(@Validated @RequestBody SignVO signVO) throws Exception {
        signVO.setSignDocNo(signDocNoIdgenService.getNextStringId());
        signVO.setSignStatCd("01"); //대기

        signService.insertSign(signVO);
        return true;
    }

    /**
     * 결재상신 정보를 변경한다.
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/cmm/apr/sign/updateSign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSign(@Validated @RequestBody SignVO signVO) throws Exception {
        signVO.setSignStatCd("01"); //대기

        signService.updateSign(signVO);
        return true;
    }

    /**
     * 결재상신 정보를 삭제한다.
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/cmm/apr/sign/deleteSign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteSign(@RequestParam(value="signDocNo", required=true) String signDocNo) throws Exception {
        signService.deleteSign(signDocNo);
        return true;
    }

    /**
     * 결재상신목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignRequestMain.do", method = RequestMethod.GET)
    public String selectSignListMain(Model model) throws Exception {
        //결재진행상태
        List<CommonCodeVO> signStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM010", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("signStatCdList", signStatCdList);

        return "/cmm/apr/sign/selectSignRequestMain";
    }

    /**
     * 결재상신목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignsRequest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignRequest(@RequestBody SignSearchVO searchVO) throws Exception {
        searchVO.setsReqUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setTotal(signService.selectSignsRequestByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(signService.selectSignsRequestByCondition(searchVO));
        }

        return result;
    }

    /**
     * 결재상신 처리완료 화면을 출력한다.
     * @return
     *
    @RequestMapping(value = "/cmm/apr/sign/selectSignCompleteMain.do", method = RequestMethod.GET)
    public String selectSignCompleteMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //결재유형
        List<CommonCodeVO> arrSignTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, langCd);
        model.addAttribute("arrSignTp", arrSignTp);

        //결재진행상태
        List<CommonCodeVO> arrSignStatCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM010", null, langCd);
        model.addAttribute("arrSignStatCd", arrSignStatCd);

        //결재처리코드
        List<CommonCodeVO> arrSignProcCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd);
        model.addAttribute("arrSignProcCd", arrSignProcCd);

        //결재처리상태
        List<CommonCodeVO> arrSignProcStat = commonCodeService.selectCommonCodesByCmmGrpCd("COM012", null, langCd);
        model.addAttribute("arrSignProcStat", arrSignProcStat);

        return "/cmm/apr/sign/selectSignCompleteMain";
    }
    */

    /**
     * 결재대기목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignWaitListMain.do", method = RequestMethod.GET)
    public String selectSignWaitListMain(Model model) throws Exception {
        //결재선 - 결재처리유형
        List<CommonCodeVO> signRsltCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("signRsltCdList", signRsltCdList);

        return "/cmm/apr/sign/selectSignWaitListMain";
    }

    /**
     * 결재대기목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignWaitList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignWaitList(@RequestBody SignSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsSignUsrId(LoginUtil.getUserId());

        result.setTotal(signService.selectSignsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(signService.selectSignsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 결재상신문서 상세 정보를 출력한다.
     * 결재상신문서가 임시저장 상태인 경우 결재상신문서를 저장[상신] 할 수 있다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/sign/selectSignApprPopup.do", method = RequestMethod.GET)
    public String selectSignApprPopup(@RequestParam("signDocNo") String signDocNo, @RequestParam(value="viewMode", defaultValue="A") String viewMode, Model model) throws Exception {
        //결재선 결재처리유형
        List<CommonCodeVO> signRsltCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("signRsltCdList", signRsltCdList);

        //결재문서 정보 조회
        SignVO signVO = signService.selectSignByKey(signDocNo);

        //결재문서의 결재자에 해당하는 결재라인 정보 조회
        SignLineVO signLineVO = signService.selectSignLineBySignUsrId(signDocNo, LoginUtil.getUserId());

        model.addAttribute("signVO", signVO);
        model.addAttribute("signLineVO", signLineVO);

        return "/cmm/apr/sign/selectSignApprPopup";
    }

    /**
     * 결재상신문서를 승인/반려 한다.
     *
     * @param signLineVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/apr/sign/updateSignLine.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSignLine(@Validated @RequestBody SignLineVO signLineVO) throws Exception {
        signService.updateSignLine(signLineVO);
        return true;
    }
}
