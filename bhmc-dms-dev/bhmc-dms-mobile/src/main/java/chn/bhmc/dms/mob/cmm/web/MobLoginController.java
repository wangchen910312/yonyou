package chn.bhmc.dms.mob.cmm.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.vo.LoginVO;

/**
 * 모바일 로그인
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/cmm/login")
public class MobLoginController extends HController {
    /**
     * 로그인 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 로그인 화면.
     * @return
     */
    @RequestMapping(value = "/selectLoginMain.do")
    public String selectLoginMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("certiNum", commonCodeService.selectCommonCodesByCmmGrpCd("COM063", null, langCd));
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来;请求的登录页改为平板登录页 start
//        return "/mob/cmm/login/selectLoginMain";
        return "/cmm/ath/login/selectLoginMain";
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来;请求的登录页改为平板登录页 start
    }

    /**
     * 로그인 처리를 진행한다.
     * @return
     */
    @RequestMapping(value = "/selectLoginAction.do", method = RequestMethod.POST)
    public String selectLoginAction(@RequestBody LoginVO loginVO,Model model) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));

        return "/mob/cmm/login/selectLoginAction";
    }

    /**
     * 접근 거부 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAccessDenied.do", method = RequestMethod.GET)
    public String selectAccessDenied(Model model) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));

        return "/mob/cmm/login/selectAccessDenied";
    }

    /**
     * 로그아웃 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/login/selectLogoutAction.do", method = RequestMethod.POST)
    public String selectLogoutAction(@RequestBody LoginVO loginVO,Model model) throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));

        return "/mob/cmm/login/selectLogoutAction";
    }
}
