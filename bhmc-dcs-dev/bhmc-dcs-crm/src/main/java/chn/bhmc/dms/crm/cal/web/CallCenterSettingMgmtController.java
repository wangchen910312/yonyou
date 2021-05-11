package chn.bhmc.dms.crm.cal.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.crm.cal.service.CallCenterSettingMgmtService;

/**
 * 콜센터설정 관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.05.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.05         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cal/callCenter")
@Controller
public class CallCenterSettingMgmtController extends HController {

    /**
     * 콜센터설정 관리 서비스
     */
    @Resource(name="callCenterSettingMgmtService")
    CallCenterSettingMgmtService callCenterSettingMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 콜센터설정 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCallCenterSettingMgmtMain.do", method = RequestMethod.GET)
    public String selectCallCenterSettingMgmtMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);     // 판매고문

        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 콜센터설정유형코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 콜센터설정상태코드

        return "/crm/cal/callCenter/selectCallCenterSettingMgmtMain";
    }

}