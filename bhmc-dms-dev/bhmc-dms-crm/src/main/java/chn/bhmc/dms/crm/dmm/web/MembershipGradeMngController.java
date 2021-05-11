package chn.bhmc.dms.crm.dmm.web;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngController.java
 * @Description : 멤버십 등급설정 컨트롤러.
 * @author Kim Hyun Ho
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class MembershipGradeMngController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등급설정 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 멤버십 등급설정 서비스
     */
    @Resource(name="membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;

    /**
     * 멤버십 등급설정 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/selectMembershipGradeMngMain.do", method = RequestMethod.GET)
    public String selectMembershipGradeMngMain(Model model) throws Exception {
        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 적용 적용 등급
        model.addAttribute("stdPridMonthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM803", null, LocaleContextHolder.getLocale().getLanguage()));
        // 기준최근
        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("stdPridMonthCd", membershipGradeMngService.selectStdPridMonthByKey(searchVO));

        return "/crm/dmm/membershipGradeMng/selectMembershipGradeMngMain";
    }

    /**
     * 멤버십 등급설정 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/selectMembershipGradeMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipGradeMngs(@RequestBody MembershipGradeMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipGradeMngSupportService.selectMembershipGradeMngsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipGradeMngSupportService.selectMembershipGradeMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 멤버십 등급설정 정보를 등록한다.
     * @param saveVO - 멤버십 등급설정 관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/multiMembershipGradeMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> multiMembershipGradeMngs(@Validated @RequestBody MembershipGradeMngSaveVO saveVO) throws Exception {

        Map<String,Object> result = new HashMap<String,Object>();
        membershipGradeMngService.multiMembershipGradeMngs(saveVO);
     // 기준최근
        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.put("month", membershipGradeMngService.selectStdPridMonthByKey(searchVO));
        return result;
    }

    /**
     * 멤버십 등급조건 설정을 수정한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/updateMembershipGradeMng.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateMembershipGradeMng(@RequestBody MembershipGradeMngVO membershipGradeMngVO) throws Exception {

        int result = 0;
        membershipGradeMngVO.setRegUsrId(LoginUtil.getUserId());
        membershipGradeMngVO.setDlrCd(LoginUtil.getDlrCd());

        result = membershipGradeMngService.updateMembershipGradeMng(membershipGradeMngVO);//기준최근 업데이트
        if(result > 0){
            membershipGradeMngService.updateStdPridMonth(membershipGradeMngVO); //최근기준 일괄 update
        }
        return result;
    }

    /**
     * 기준최근을 업데이트 한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/updateStdPridMonth.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateStdPridMonth(@RequestBody MembershipGradeMngVO membershipGradeMngVO) throws Exception {

        int result = 0;
        membershipGradeMngVO.setRegUsrId(LoginUtil.getUserId());
        membershipGradeMngVO.setDlrCd(LoginUtil.getDlrCd());

        //membershipGradeMngVOSearchResult result = new SearchResult();

        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result = membershipGradeMngSupportService.selectMembershipGradeMngsByConditionCnt(searchVO);
        if(result != 0){
            result = membershipGradeMngService.updateStdPridMonth(membershipGradeMngVO);//기준최근 업데이트
        }

        return result;
    }

    /**
     * 멤버십 등급조건 설정을 삭제한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/deleteMembershipGradeMng.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteMembershipGradeMng(@RequestBody MembershipGradeMngVO membershipGradeMngVO) throws Exception {

        int result = 0;
        membershipGradeMngVO.setRegUsrId(LoginUtil.getUserId());
        membershipGradeMngVO.setDlrCd(LoginUtil.getDlrCd());

        result = membershipGradeMngService.deleteMembershipGradeMng(membershipGradeMngVO);

        return result;
    }

    /**
     * 멤버십 등급 조건 등록 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/selectMembershipGradeMngPopup.do", method = RequestMethod.GET)
    public String selectSpecialPointPopup(Model model,HttpServletRequest request) throws Exception {

        model.addAttribute("stdPridMonth",  request.getParameter("stdPridMonth"));

        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("stdPridMonthCd", membershipGradeMngService.selectStdPridMonthByKey(searchVO));

        // 적용 등급
        model.addAttribute("stdPridMonthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM803", null, LocaleContextHolder.getLocale().getLanguage()));

        if(request.getParameter("gradeSeq") != null && request.getParameter("gradeSeq") != ""){
            searchVO.setsGradeSeq(request.getParameter("gradeSeq"));
            MembershipGradeMngVO dataInfo = membershipGradeMngService.selectMembershipGradeMngByKey(searchVO);
            if(dataInfo != null){
                model.addAttribute("dataInfo", dataInfo);
            }
        }

        return "/crm/dmm/membershipGradeMng/selectMembershipGradeMngPopup";
    }

    /**
     * 멤버십 신청을 신규로 생성한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeMng/insertMembershipGradeMng.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertMembershipGradeMng(@RequestBody MembershipGradeMngVO membershipGradeMngVO) throws Exception {

        int result = 0;
        membershipGradeMngVO.setRegUsrId(LoginUtil.getUserId());
        membershipGradeMngVO.setDlrCd(LoginUtil.getDlrCd());

        result = membershipGradeMngService.insertMembershipGradeMng(membershipGradeMngVO);
        if(result > 0){
            membershipGradeMngService.updateStdPridMonth(membershipGradeMngVO);
        }

        return result;
    }

}
