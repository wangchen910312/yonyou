package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgController.java
 * @Description : 멤버십 등급변경 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class MembershipGradeChgController extends HController {
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등급변경 서비스
     */
    @Resource(name="membershipGradeChgService")
    MembershipGradeChgService membershipGradeChgService;

    /**
     * 멤버십 등급관리 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 등급설정 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeChg/selectMembershipGradeChgMain.do", method = RequestMethod.GET)
    public String selectMembershipGradeChgMain(Model model) throws Exception {
        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        MembershipGradeChgSearchVO searchVO = new MembershipGradeChgSearchVO();
        model.addAttribute("gradeSeqList", membershipGradeChgService.selectMasterGradeSeqByCondition(searchVO));

        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));

        return "/crm/dmm/membershipGradeChg/selectMembershipGradeChgMain";
    }

    /**
     * 멤버십 등급설정 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeChg/selectMembershipGradeChgs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipGradeChgs(@RequestBody MembershipGradeChgSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipGradeChgService.selectMembershipGradeChgsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipGradeChgService.selectMembershipGradeChgsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 멤버십 등급을 수정한다.
     * @param saveVO - 멤버십 등급 정보를 수정하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeChg/multiMembershipGrades.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiMembershipGrades(@Validated @RequestBody MembershipGradeChgSaveVO saveVO) throws Exception {

        membershipService.multiMembershipGrades(saveVO);
        return true;
    }
}
