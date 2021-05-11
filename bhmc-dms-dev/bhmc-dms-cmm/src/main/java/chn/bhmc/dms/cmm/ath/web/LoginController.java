package chn.bhmc.dms.cmm.ath.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.context.WebAppContext;
import chn.bhmc.dms.security.config.SecurityConfig;

/**
 * 로그인 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 2. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.022         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class LoginController extends HController {
    /**
     * 로그인 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 로그인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/login/selectLoginMain.do")
    public String selectLoginMain() throws Exception {
        return "/cmm/ath/login/selectLoginMain";
    }

    /**
     * 인증번호 화면을 출력한다. //khskhs
     * @return
     */
    @RequestMapping(value = "/cmm/ath/login/selectCreateCertificationNumber.do")
    public String selectCreateCertificationNumber() throws Exception {
        return "/cmm/ath/login/selectCreateCertificationNumber";
    }

    /**
     * 로그인 처리를 진행한다.
     * @see chn.bhmc.dms.security.filter.SpringSecurityLoginFilter
     * @return
     *
    @RequestMapping(value = "/cmm/ath/login/selectLoginAction.do")
    public String selectLoginAction() throws Exception {
        return "/cmm/ath/login/selectLoginAction";
    }
    */

    /**
     * 로그아웃 처리를 진행한다.
     * @see chn.bhmc.dms.security.filter.SpringSecurityLogoutFilter
     * @return
     *
    @RequestMapping(value = "/cmm/ath/login/selectLogoutAction.do")
    public String selectLogoutAction() throws Exception {
        return "/cmm/ath/login/selectLogoutAction";
    }
    */

    /**
     * 접근 거부 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/login/selectAccessDenied.do", method = RequestMethod.GET)
    public String selectAccessDenied() throws Exception {
        return "/cmm/ath/login/selectAccessDenied";
    }

    /**
     * 로그인 화면이동을 위한 처리 페이지로 이동한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/login/selectLoginFormProcess.do", method = RequestMethod.GET)
    public String selectLoginFormProcess(Model model, HttpServletRequest request) throws Exception {
        String logoutSuccessUrl = null;

        if(request.getAttribute("logoutSuccessUrl") != null){
            logoutSuccessUrl = (String)request.getAttribute("logoutSuccessUrl");
        }else{
            SecurityConfig securityConfig = WebAppContext.getApplicationContext().getBean(SecurityConfig.class);
            logoutSuccessUrl = securityConfig.getLoginUrl();
        }

        model.addAttribute("logoutSuccessUrl", logoutSuccessUrl);

        return "/cmm/ath/login/selectLoginFormProcess";
    }

}
