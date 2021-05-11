package chn.bhmc.dms.security.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import chn.bhmc.dms.security.service.UserDetailsService;
import chn.bhmc.dms.security.vo.CustomUserVO;

public class TestUserDetailsServiceImpl implements UserDetailsService {

	@Override
	public Object getAuthenticatedUser() {

		CustomUserVO loginVO = new CustomUserVO();
		loginVO.setUsrId("TEST1");
		loginVO.setUsrPw("a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=");
		loginVO.setUsrNm("더미사용자");

		return RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
	}

	@Override
	public List<String> getAuthorities() {
		// 권한 설정을 리턴한다.
		List<String> listAuth = new ArrayList<String>();

		return listAuth;
	}

	@Override
	public Boolean isAuthenticated() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute(
					"loginVO", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}
	}

}
