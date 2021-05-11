package chn.bhmc.dms.sal.dsc.web;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dsc.service.AuthorityFixService;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSaveVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSearchVO;

/**
 *
 *  일상업무 권한 관리(권한설정)
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dsc/authorityFix")
public class AuthorityFixController extends HController {

    /**
     * 일상업무 권한 관리(권한설정) 서비스
     */
    @Resource(name="authorityFixService")
    private AuthorityFixService authorityFixService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 일상업무 권한 관리(권한설정) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAuthorityFixMain.do", method = RequestMethod.GET)
    public String selectAuthorityFixMain(Model model) throws Exception{
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        AuthorityFixSearchVO searchVO = new AuthorityFixSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("usrDSList", authorityFixService.selectAuthorityFixUsrIdList(searchVO));


        // 심사등급 : SAL005
        model.addAttribute("evalGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL005", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/dsc/authorityFix/selectAuthorityFixMain";
    }

    /**
     * 일상업무 권한 관리(권한설정) 메인 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAuthorityFixMains.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAuthorityFixMains(@RequestBody AuthorityFixSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(authorityFixService.selectAuthorityFixMainsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(authorityFixService.selectAuthorityFixMainsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 일상업무 권한 관리(권한설정) 서브 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAuthorityFixSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAuthorityFixSub(@RequestBody AuthorityFixSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(authorityFixService.selectAuthorityFixSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(authorityFixService.selectAuthorityFixSubsByCondition(searchVO));
        }

        return result;
    }


    /**
     *  저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiAuthorityFixs.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiAuthorityFixs(@Validated @RequestBody AuthorityFixSaveVO saveVO) throws Exception {
        return authorityFixService.multiAuthorityFixs(saveVO);
    }

}
