package chn.bhmc.dms.mob.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import chn.bhmc.dms.mob.config.BaseJSON;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.security.service.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/api/user")
@Api("用户相关功能接口")
public class UserApi {

	@Autowired
	UserService userService;
	@Autowired
	SystemConfigInfoService systemConfigInfoService;
	@Autowired
	LoginService loginService;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;

	@ApiOperation("用户登录")
	@ApiImplicitParams({
	@ApiImplicitParam(paramType = "query", name = "usrId", dataType = "String", required = true, value = "帐号", defaultValue = "admin"),
	@ApiImplicitParam(paramType = "query", name = "usrPwEnc", dataType = "String", required = true, value = "密码", defaultValue = "38083c7ee9121e17401883566a148aa5c2e2d55dc53bc4a94a026517dbff3c6b") })
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public BaseJSON selectLoginAction(String usrId, String usrPwEnc) throws Exception {

		//CustomUserVO userVO = new CustomUserVO();
		//userVO.setUsrId(usrId);
		//userVO.setUsrPw(usrPwEnc);

		//userVO = loginService.actionLogin(userVO);

		//request.getSession().setMaxInactiveInterval(36000);

        //사용자 정보 세션저장
		//request.getSession().setAttribute("LOGIN_USER", userVO);

        //로그인 추가적인 설정 적용
        //loginService.afterLogin(request, response, userVO);


		BaseJSON baseJSON = new BaseJSON();
		//baseJSON.setResult(userVO.getEnabledYn());

		return baseJSON;
	}
}
