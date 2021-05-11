package chn.bhmc.dms.cmm.bbs.web;

import java.util.Date;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.bbs.service.IssueBoardService;
import chn.bhmc.dms.cmm.bbs.vo.IssueBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.IssueBoardVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * Issue 정보 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class IssueBoardController extends HController {

    /**
     * Issue 정보 관리 서비스
     */
    @Resource(name="issueBoardService")
    IssueBoardService issueBoardService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 파일관리 서비스
     */
    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * 시스템설정 정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * Issue 정보 관리 메인 화면을 출력한다.
     * @param issueBoardTp '01':이슈 관리, '02':변경요청사항관리
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/selectIssueBoardMain.do", method = RequestMethod.GET)
    public String selectIssueBoardMain(@RequestParam(name="issueBoardTp", defaultValue="01") String issueBoardTp, Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String today = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        //오늘일자
        model.addAttribute("today", today);
        //이슈 게시판 구분 '01':이슈관리, '02':변경요청사항관리
        model.addAttribute("issueBoardTp", issueBoardTp);
        //Issue 유형
        model.addAttribute("issueTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM052", null, langCd));
        //Issue 영역
        model.addAttribute("issueAreaList", commonCodeService.selectCommonCodesByCmmGrpCd("COM053", null, langCd));
        //Issue 처리상태
        model.addAttribute("issueStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM054", null, langCd));
        //Issue 발생일자
        model.addAttribute("issueDt", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
        //Issue 심각도
        model.addAttribute("severityList", commonCodeService.selectCommonCodesByCmmGrpCd("COM061", null, langCd));

        //이슈관리
        if("01".equals(issueBoardTp)){
            return "/cmm/bbs/issueBoard/selectIssueBoardMain";
        //변경요청사항관리
        }else{
            return "/cmm/bbs/issueBoard/selectChangeRequestBoardMain";
        }

    }

    /**
     * Issue 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueBoardSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/selectIssueBoards.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueBoards(@RequestBody IssueBoardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(issueBoardService.selectIssueBoardsByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(issueBoardService.selectIssueBoardsByCondition(searchVO));
        }

        return result;
    }

    /**
     * Issue 정보를 조회한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/selectIssueBoard.do", method = RequestMethod.GET)
    @ResponseBody
    public IssueBoardVO selectIssueBoard(@RequestParam("issueNo") int issueNo) throws Exception {
        return issueBoardService.selectIssueBoardByKey(issueNo);
    }

    /**
     * Issue 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/insertIssueBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertIssueBoard(@Validated @RequestBody IssueBoardVO issueBoardVO) throws Exception {

        issueBoardVO.setRegUsrId(LoginUtil.getUserId());
        issueBoardVO.setIssueStatCd("01"); //접수
        issueBoardService.insertIssueBoard(issueBoardVO);

        if(StringUtils.isNotBlank(issueBoardVO.getFileDocNo())){
            fileMgrService.updateFileDocEnabled(new FileDocVO(issueBoardVO.getFileDocNo(), LoginUtil.getUserId()));
        }

        return true;
    }

    /**
     * Issue 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/updateIssueBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateIssueBoard(@Validated @RequestBody IssueBoardVO issueBoardVO, BindingResult bindingResult) throws Exception {

        IssueBoardVO oldIssueBoardVO = issueBoardService.selectIssueBoardByKey(issueBoardVO.getIssueNo());


        //완료[03], 요건재확인[04], BHIT확인[05], BHMC확인[09], 추후추진[06]
        //처리상태가 완료 상태 인 경우는 요건재확인/BHIT확인/BHMC확인/추후추진 상태로만 변경 가능하다.
        if("03".equals(oldIssueBoardVO.getIssueStatCd()) &&
            !(
                "03".equals(issueBoardVO.getIssueStatCd())
                || "04".equals(issueBoardVO.getIssueStatCd())
                || "05".equals(issueBoardVO.getIssueStatCd())
                || "06".equals(issueBoardVO.getIssueStatCd())
                || "09".equals(issueBoardVO.getIssueStatCd())
            )
        ){
            throw new BizException(messageSource.getMessage("cmm.error.update.issueBoard.IssueStatCd1", null, LocaleContextHolder.getLocale()));
        }

        //BHIT확인[05], BHMC확인[09], 추후추진[06], 요건재확인[04]
        //처리상태가 BHIT확인 상태 인 경우는 처리상태를 BHMC확인/추후추진/요건재확인  상태로 만 변경 할 수 있다.
        if((
                "05".equals(oldIssueBoardVO.getIssueStatCd())
           ) && !(
                "05".equals(issueBoardVO.getIssueStatCd())
                || "06".equals(issueBoardVO.getIssueStatCd())
                || "09".equals(issueBoardVO.getIssueStatCd())
                || "04".equals(issueBoardVO.getIssueStatCd())
           )
        ){
            throw new BizException(messageSource.getMessage("cmm.error.update.issueBoard.IssueStatCd2", null, LocaleContextHolder.getLocale()));
        }

        //완료[03], 추후추진[06]
        //처리상태가 추후추진 상태 인 경우는 처리상태를 완료  상태로 만 변경 할 수 있다.
        if((
                "06".equals(oldIssueBoardVO.getIssueStatCd())
           ) && !(
                "03".equals(issueBoardVO.getIssueStatCd())
                || "06".equals(issueBoardVO.getIssueStatCd())
           )
        ){
            throw new BizException(messageSource.getMessage("cmm.error.update.issueBoard.IssueStatCd3", null, LocaleContextHolder.getLocale()));
        }

        //BHMC확인[09], 요건재확인[04]
        //처리상태가 BHMC확인 상태 인 경우는 요건재확인 상태로만 변경할 수 있다.
        if((
                "09".equals(oldIssueBoardVO.getIssueStatCd())
           ) && !(
                "09".equals(issueBoardVO.getIssueStatCd())
                || "04".equals(issueBoardVO.getIssueStatCd())
           )
        ){
            throw new BizException(messageSource.getMessage("cmm.error.update.issueBoard.IssueStatCd4", null, LocaleContextHolder.getLocale()));
        }


        /*if("09".equals(oldIssueBoardVO.getIssueStatCd()) && !"09".equals(issueBoardVO.getIssueStatCd())){
            throw new BizException(messageSource.getMessage("cmm.error.update.issueBoard.IssueStatCd4", null, LocaleContextHolder.getLocale()));
        }
        */

        //처리상태가 변경 된 경우 처리상태변경일자를 수정한다.
        if(!oldIssueBoardVO.getIssueStatCd().equals(issueBoardVO.getIssueStatCd())){
            issueBoardVO.setIssueStatUpdtDt(new Date());
        }

        issueBoardVO.setUpdtUsrId(LoginUtil.getUserId());

        issueBoardService.updateIssueBoard(issueBoardVO);

        if(StringUtils.isNotBlank(issueBoardVO.getFileDocNo())){
            fileMgrService.updateFileDocEnabled(new FileDocVO(issueBoardVO.getFileDocNo(), LoginUtil.getUserId()));
        }

        return true;
    }

    /**
     * Issue 정보를 수정한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/issueBoard/deleteIssueBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteIssueBoard(@RequestParam("issueNo") int issueNo) throws Exception {
        issueBoardService.deleteIssueBoard(issueNo);
        return true;
    }

}
