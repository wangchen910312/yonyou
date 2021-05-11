package chn.bhmc.dms.core.i18n;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

public class SupportedLangLocaleChangeInterceptor extends
		LocaleChangeInterceptor {

	SupportedLangService supportedLangService;

	public void setSupportedLangService(SupportedLangService supportedLangService) {
		this.supportedLangService = supportedLangService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException {

		String lang = request.getParameter(getParamName());


		if (lang != null) {
			LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
			if (localeResolver == null) {
				throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
			}

			if(supportedLangService.isSupportedLang(lang)){
				localeResolver.setLocale(request, response, StringUtils.parseLocaleString(lang));
			}else{
				localeResolver.setLocale(request, response, StringUtils.parseLocaleString(supportedLangService.defaultLang()));
			}

		}
		// Proceed in any case.
		return true;
	}

}
