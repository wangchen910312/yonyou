
package chn.bhmc.dms.security.config;

import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.xml.AbstractSingleBeanDefinitionParser;
import org.springframework.util.StringUtils;
import org.w3c.dom.Element;


public class SecurityConfigBeanDefinitionParser extends AbstractSingleBeanDefinitionParser {

	@Override
	protected Class<?> getBeanClass(Element element) {
		return SecurityConfig.class;
	}

	@Override
	protected void doParse(Element element, BeanDefinitionBuilder bean) {
		String loginUrl = element.getAttribute("loginUrl");
		if (StringUtils.hasText(loginUrl)) {
			bean.addPropertyValue("loginUrl", loginUrl);
		}

		String loginUrlParameter = element.getAttribute("loginUrlParameter");
		if (StringUtils.hasText(loginUrlParameter)) {
			bean.addPropertyValue("loginUrlParameter", loginUrlParameter);
		}

		String loginFormProcessUrl = element.getAttribute("loginFormProcessUrl");
        if (StringUtils.hasText(loginFormProcessUrl)) {
            bean.addPropertyValue("loginFormProcessUrl", loginFormProcessUrl);
        }

		String logoutSuccessUrl = element.getAttribute("logoutSuccessUrl");
		if (StringUtils.hasText(logoutSuccessUrl)) {
			bean.addPropertyValue("logoutSuccessUrl", logoutSuccessUrl);
		}

		String logoutSuccessUrlParameter = element.getAttribute("logoutSuccessUrlParameter");
		if (StringUtils.hasText(logoutSuccessUrlParameter)) {
			bean.addPropertyValue("logoutSuccessUrlParameter", logoutSuccessUrlParameter);
		}

		String loginFailureUrl = element.getAttribute("loginFailureUrl");
		if (StringUtils.hasText(loginFailureUrl)) {
			bean.addPropertyValue("loginFailureUrl", loginFailureUrl);
		}

		String loginFailureUrlParameter = element.getAttribute("loginFailureUrlParameter");
		if (StringUtils.hasText(loginFailureUrlParameter)) {
			bean.addPropertyValue("loginFailureUrlParameter", loginFailureUrlParameter);
		}

		String accessDeniedUrl = element.getAttribute("accessDeniedUrl");
		if (StringUtils.hasText(accessDeniedUrl)) {
			bean.addPropertyValue("accessDeniedUrl", accessDeniedUrl);
		}

		String dataSource = element.getAttribute("dataSource");
		if (StringUtils.hasText(dataSource)) {
			bean.addPropertyReference("dataSource", dataSource);
		}

		String jdbcUsersByUsernameQuery = element.getAttribute("jdbcUsersByUsernameQuery");
		if (StringUtils.hasText(jdbcUsersByUsernameQuery)) {
			bean.addPropertyValue("jdbcUsersByUsernameQuery", jdbcUsersByUsernameQuery);
		}

		String jdbcAuthoritiesByUsernameQuery = element.getAttribute("jdbcAuthoritiesByUsernameQuery");
		if (StringUtils.hasText(jdbcAuthoritiesByUsernameQuery)) {
			bean.addPropertyValue("jdbcAuthoritiesByUsernameQuery", jdbcAuthoritiesByUsernameQuery);
		}

		String jdbcMapClass = element.getAttribute("jdbcMapClass");
		if (StringUtils.hasText(jdbcMapClass)) {
			bean.addPropertyValue("jdbcMapClass", jdbcMapClass);
		}

		String requestMatcherType = element.getAttribute("requestMatcherType");
		if (StringUtils.hasText(requestMatcherType)) {
			bean.addPropertyValue("requestMatcherType", requestMatcherType);
		}

		String hash = element.getAttribute("hash");
		if (StringUtils.hasText(hash)) {
			bean.addPropertyValue("hash", hash);
		}

		String hashBase64 = element.getAttribute("hashBase64");
		if (StringUtils.hasText(hashBase64)) {
			bean.addPropertyValue("hashBase64", hashBase64);
		}

		String concurrentMaxSessons = element.getAttribute("concurrentMaxSessons");
		if (StringUtils.hasText(concurrentMaxSessons)) {
			bean.addPropertyValue("concurrentMaxSessons", concurrentMaxSessons);
		}

		String concurrentExpiredUrl = element.getAttribute("concurrentExpiredUrl");
		if (StringUtils.hasText(concurrentExpiredUrl)) {
			bean.addPropertyValue("concurrentExpiredUrl", concurrentExpiredUrl);
		}

		String defaultTargetUrl = element.getAttribute("defaultTargetUrl");
		if (StringUtils.hasText(defaultTargetUrl)) {
			bean.addPropertyValue("defaultTargetUrl", defaultTargetUrl);
		}

		String defaultTargetUrlParameter = element.getAttribute("defaultTargetUrlParameter");
		if (StringUtils.hasText(defaultTargetUrlParameter)) {
			bean.addPropertyValue("defaultTargetUrlParameter", defaultTargetUrlParameter);
		}

	}
}