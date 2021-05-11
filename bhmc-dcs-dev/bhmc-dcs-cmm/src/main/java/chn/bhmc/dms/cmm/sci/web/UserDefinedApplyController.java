package chn.bhmc.dms.cmm.sci.web;

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
import chn.bhmc.dms.cmm.sci.service.UserDefinedApplyService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplySaveVO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedApplyController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class UserDefinedApplyController extends HController {
    /**
     * 사용자 정의 신청
     */
    @Resource(name="userDefinedApplyService")
    UserDefinedApplyService userDefinedApplyService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 정의 신청  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefinedApply/selectUserDefinedApplyMain.do", method = RequestMethod.GET)
    public String selectUserDefinedApplyMain(Model model) throws Exception {
        // 승인 유형
        List<CommonCodeVO> arrPaymentStateTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM040", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("arrPaymentStateTp", arrPaymentStateTp);

        return "/cmm/sci/userDefinedApply/selectUserDefinedApplyMain";
    }

    @RequestMapping(value = "/cmm/sci/userDefinedApply/selectUserDefinedApply.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefinedApply(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(userDefinedApplyService.selectUserDefinedApplyByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userDefinedApplyService.selectUserDefinedApplyByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefinedApply/selectUserDefinedApplyPopup.do", method = RequestMethod.GET)
    public String selectUserDefinedApplyPopup(Model model) throws Exception {
        return "/cmm/sci/userDefinedApply/selectUserDefinedApplyPopup";
    }

    @RequestMapping(value = "/cmm/sci/userDefinedApply/updateUserDefinedApplyState.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateUserDefinedApplyState(@RequestBody SurveyReplyVO saveVO) throws Exception {
        userDefinedApplyService.updateUserDefinedApplyState(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/userDefinedApply/multiUserDefinedApply.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUserDefinedApply(@RequestBody SurveyReplySaveVO saveVO) throws Exception {
        userDefinedApplyService.multiUserDefined(saveVO);

        return true;
    }
}