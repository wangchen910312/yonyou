package chn.bhmc.dms.cmm.ath.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ThemeResolver;

import chn.bhmc.dms.security.vo.SessionSaveVO;

import chn.bhmc.dms.cmm.ath.service.dao.LoginDAO;
import chn.bhmc.dms.core.i18n.SupportedLangService;
import chn.bhmc.dms.security.service.LoginService;
import chn.bhmc.dms.security.vo.CustomUserVO;

public class LoginServiceImpl extends HService implements LoginService {

	/**
	 * 로그인 관리 DAO
	 */
    @Autowired
	private LoginDAO loginDAO;

	/**
	 * 지원언어 서비스
	 */
	@Autowired
	private SupportedLangService supportedLangService;

	/**
	 * 로케일 리졸버
	 */
	@Autowired
	private LocaleResolver localeResolver;

	/**
	 * 테마 리졸버
	 */
	@Autowired
	private ThemeResolver themeResolver;

	@Override
	public CustomUserVO actionLogin(CustomUserVO userVO) {
		return loginDAO.actionLogin(userVO);
	}

	@Override
	public void afterLogin(HttpServletRequest httpRequest, HttpServletResponse httpResponse, CustomUserVO user) {

		CustomUserVO loginVO = (CustomUserVO)user;

		//사용자 설정 언어를 지원하면 해당언어 로케일을 설정하고 지원하지 않는 언어인 경우 기본 지원언어 로케일을 설정한다.
    	if(supportedLangService.isSupportedLang(loginVO.getLangCd())){
    		localeResolver.setLocale(httpRequest, httpResponse, org.springframework.util.StringUtils.parseLocaleString(loginVO.getLangCd().toLowerCase()));
    	}else{
    		localeResolver.setLocale(httpRequest, httpResponse, org.springframework.util.StringUtils.parseLocaleString(this.supportedLangService.defaultLang().toLowerCase()));
    	}

    	//테마적용
		if (themeResolver != null && !StringUtils.isBlank(loginVO.getThemeId())) {
			themeResolver.setThemeName(httpRequest, httpResponse, loginVO.getThemeId());
		}

	}

	@Override
    public int insertSessionInfo(SessionSaveVO sessionSaveVO) {
	    return loginDAO.insertSessionInfo(sessionSaveVO);
	}

	@Override
    public int updateSessionInfo(SessionSaveVO sessionSaveVO) {
        return loginDAO.updateSessionInfo(sessionSaveVO);
    }

    @Override
    public SessionSaveVO selectSessionInfoByKey(String sessionId) {
        return loginDAO.selectSessionInfoByKey(sessionId);
    }

}
