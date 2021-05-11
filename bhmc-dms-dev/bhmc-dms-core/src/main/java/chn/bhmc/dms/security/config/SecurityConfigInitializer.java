
package chn.bhmc.dms.security.config;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.Filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.util.StringUtils;


public class SecurityConfigInitializer implements ApplicationContextAware {

	private static final Logger LOGGER = LoggerFactory.getLogger(SecurityConfigInitializer.class);

	private ApplicationContext context;

	private SecurityConfig config;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = applicationContext;

		config = (SecurityConfig) context.getBean(SecurityConfig.class);
	}

	@PostConstruct
	public void init() {
		LOGGER.debug("init() started...");

		if (StringUtils.hasText(config.getAccessDeniedUrl())) {
			LOGGER.debug("Replaced access denied url : {}", config.getAccessDeniedUrl());
			registerAccessDeniedUrl(config.getAccessDeniedUrl());
		}

		if (StringUtils.hasText(config.getLoginUrl())) {
			LOGGER.debug("Replaced login url : {}", config.getLoginUrl());
			registerLoginUrl();
		}

		if (StringUtils.hasText(config.getLoginUrlParameter())) {
			LOGGER.debug("Replaced login url parameter : {}", config.getLoginUrlParameter());
			registerLoginUrlParameter();
		}

		if (StringUtils.hasText(config.getLoginFailureUrl())) {
			LOGGER.debug("Replaced login failure url : {}", config.getLoginFailureUrl());
			registerLoginFailureUrl( config.getLoginFailureUrl());
		}

		if (StringUtils.hasText(config.getLoginFailureUrlParameter())) {
			LOGGER.debug("Replaced login failure url parameter : {}", config.getLoginFailureUrlParameter());
			registerLoginFailureUrlParameter( config.getLoginFailureUrlParameter());
		}

		if (StringUtils.hasText(config.getLogoutSuccessUrl())) {
			LOGGER.debug("Replaced logout success url : {}", config.getLogoutSuccessUrl());
			registerLogoutSuccessUrl(config.getLogoutSuccessUrl());
		}

		if (StringUtils.hasText(config.getLogoutSuccessUrlParameter())) {
			LOGGER.debug("Replaced logout success url parameter : {}", config.getLogoutSuccessUrlParameter());
			registerLogoutSuccessUrlParameter(config.getLogoutSuccessUrlParameter());
		}

		registerJdbcInfo(config.getJdbcUsersByUsernameQuery(), config.getJdbcAuthoritiesByUsernameQuery(), config.getJdbcMapClass());

		if (StringUtils.hasText(config.getHash())) {
			LOGGER.debug("Password Encoder Algorithm : {}", config.getHash());
			registerHash(config.getHash(), config.isHashBase64());
		}

		if (config.getConcurrentMaxSessons() > 0 || StringUtils.hasText(config.getConcurrentExpiredUrl())) {
			LOGGER.debug("Concurrent max sessions : {}", config.getConcurrentMaxSessons());
			LOGGER.debug("Concurrent concurrent expired url  : {}", config.getConcurrentExpiredUrl());

			registerConcurrentControl(config.getConcurrentMaxSessons(), config.getConcurrentExpiredUrl());
		}

		if (StringUtils.hasText(config.getDefaultTargetUrl())) {
			LOGGER.debug("Default target url : {}", config.getDefaultTargetUrl());
			registerDefaultTargetUrl(config.getDefaultTargetUrl());
		}

		if (StringUtils.hasText(config.getDefaultTargetUrlParameter())) {
			LOGGER.debug("Defaudslt target url parameter : {}", config.getDefaultTargetUrlParameter());
			registerDefaultTargetUrlParameter(config.getDefaultTargetUrlParameter());
		}

		LOGGER.debug("init() ended...");
	}

	private <T extends Filter> T getSecurityFilter(Class<T> type) {

		Map<String, DefaultSecurityFilterChain> filterChainMap = context.getBeansOfType(DefaultSecurityFilterChain.class);

		for (DefaultSecurityFilterChain filterChain : filterChainMap.values()) {
			for (Filter filter : filterChain.getFilters()) {
				if (type.isInstance(filter)) {
					return type.cast(filter);
				}
			}
		}

		//throw new NoSuchBeanDefinitionException("No bean of type [" + type.getName() + "] is defined.");
		throw new NoSuchBeanDefinitionException(type);
	}

	private void registerLogoutSuccessUrl(String logoutSuccessUrl) {
		LogoutFilter filter = getSecurityFilter(LogoutFilter.class);

		checkUrl(logoutSuccessUrl);

		try {
			Field field = filter.getClass().getDeclaredField("logoutSuccessHandler");

			field.setAccessible(true);

			SimpleUrlLogoutSuccessHandler logoutSuccessHandler = (SimpleUrlLogoutSuccessHandler) field.get(filter);

			logoutSuccessHandler.setDefaultTargetUrl(logoutSuccessUrl);

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	private void registerLogoutSuccessUrlParameter(String logoutSuccessUrlParameter) {
		LogoutFilter filter = getSecurityFilter(LogoutFilter.class);

		try {
			Field field = filter.getClass().getDeclaredField("logoutSuccessHandler");

			field.setAccessible(true);

			SimpleUrlLogoutSuccessHandler logoutSuccessHandler = (SimpleUrlLogoutSuccessHandler) field.get(filter);

			logoutSuccessHandler.setTargetUrlParameter(logoutSuccessUrlParameter);

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	private void registerLoginFailureUrl(String loginFailureUrl) {
		/*
		UsernamePasswordAuthenticationFilter filter = getSecurityFilter(UsernamePasswordAuthenticationFilter.class);

		checkUrl(loginFailureUrl);

		SimpleUrlAuthenticationFailureHandler failureHandler = null;

		Method method = null;

		try {
			//method = UsernamePasswordAuthenticationFilter.class.getDeclaredMethod("getFailureHandler", (Class<?>[]) null);
			method = AbstractAuthenticationProcessingFilter.class.getDeclaredMethod("getFailureHandler", (Class<?>[]) null);

			method.setAccessible(true);

			failureHandler = (SimpleUrlAuthenticationFailureHandler) method.invoke(filter, (Object[])null);
		} catch (Exception ex) {
			LOGGER.error("## registerLoginFailureUrl : {}", ex);
			throw new RuntimeException(ex);
		}

		failureHandler.setDefaultFailureUrl(loginFailureUrl);
		*/

		//SimpleUrlAuthenticationFailureHandler 설정을 통해 지정함(LoginFailureUrlFactoryBean 참조)
	}


	private void registerLoginFailureUrlParameter(String loginFailureUrlParameter) {
		/*
		UsernamePasswordAuthenticationFilter filter = getSecurityFilter(UsernamePasswordAuthenticationFilter.class);

		SimpleUrlAuthenticationFailureHandler failureHandler = null;

		Method method = null;

		try {
			//method = UsernamePasswordAuthenticationFilter.class.getDeclaredMethod("getFailureHandler", (Class<?>[]) null);
			method = AbstractAuthenticationProcessingFilter.class.getDeclaredMethod("getFailureHandler", (Class<?>[]) null);

			method.setAccessible(true);

			failureHandler = (SimpleUrlAuthenticationFailureHandler) method.invoke(filter, (Object[])null);
		} catch (Exception ex) {
			LOGGER.error("## registerLoginFailureUrl : {}", ex);
			throw new RuntimeException(ex);
		}

		failureHandler.setTargetUrlParameter(loginFailureUrlParameter);
		*/

		//SimpleUrlAuthenticationFailureHandler 설정을 통해 지정함(LoginFailureUrlParameterFactoryBean 참조)

	}

	private void registerLoginUrl() {
		/*
		ExceptionTranslationFilter filter = getSecurityFilter(ExceptionTranslationFilter.class);

		checkUrl(loginUrl);

		LoginUrlAuthenticationEntryPoint entryPoint = (LoginUrlAuthenticationEntryPoint) filter.getAuthenticationEntryPoint();

		entryPoint.setLoginFormUrl(loginUrl);
		*/

		// LoginUrlAuthenticationEntryPoint 설정을 통해 지정함 (LoginFormUrlFactoryBean 참조)
	}

	private void registerLoginUrlParameter() {

		// LoginUrlAuthenticationEntryPoint 설정을 통해 지정함 (LoginFormUrlParameterFactoryBean 참조)
	}

	protected void registerAccessDeniedUrl(String accessDeniedUrl) {

		ExceptionTranslationFilter filter = getSecurityFilter(ExceptionTranslationFilter.class);

		checkUrl(accessDeniedUrl);

		AccessDeniedHandlerImpl accessDeniedHandler = new AccessDeniedHandlerImpl();
		accessDeniedHandler.setErrorPage(accessDeniedUrl);

		filter.setAccessDeniedHandler(accessDeniedHandler);
	}

	protected void registerJdbcInfo(String jdbcUsersByUsernameQuery, String jdbcAuthoritiesByUsernameQuery, String jdbcMapClass) {
		/*
		CustomJdbcUserDetailsManager manager = (CustomJdbcUserDetailsManager)context.getBean(CustomJdbcUserDetailsManager.class);

		//manager.setDataSource(dataSource);		// set by DataSourceFactorybBean
		manager.setUsersByUsernameQuery(jdbcUsersByUsernameQuery);
		manager.setAuthoritiesByUsernameQuery(jdbcAuthoritiesByUsernameQuery);
		manager.setMapClass(jdbcMapClass);
		*/

		// FactoryBean을 통해 지정
	}

	protected void registerHash(String hash, boolean isHashBase64) {
		DaoAuthenticationProvider authentication = context.getBean(DaoAuthenticationProvider.class);

		if (hash.equalsIgnoreCase("plaintext")) {

			authentication.setPasswordEncoder(new PlaintextPasswordEncoder());

		} else if (hash.equalsIgnoreCase("md5")) {

			Md5PasswordEncoder password = new Md5PasswordEncoder();
			password.setEncodeHashAsBase64(isHashBase64);
			authentication.setPasswordEncoder(password);

		} else if (hash.equalsIgnoreCase("sha")) {

			ShaPasswordEncoder password = new ShaPasswordEncoder();
			password.setEncodeHashAsBase64(isHashBase64);
			authentication.setPasswordEncoder(password);

		} else if (hash.equalsIgnoreCase("sha-256")) {

			ShaPasswordEncoder password = new ShaPasswordEncoder(256);
			password.setEncodeHashAsBase64(isHashBase64);
			authentication.setPasswordEncoder(password);

		} else if (hash.equalsIgnoreCase("bcrypt")) {

			BCryptPasswordEncoder password = new BCryptPasswordEncoder();

			authentication.setPasswordEncoder(password);

		} else {

			throw new IllegalArgumentException("'hash' attribute have to be plaintext, md5, sha, sha-256, or bcrypt");

		}
	}

	private void registerConcurrentControl(int concurrentMaxSessons, String concurrentExpiredUrl) {
		// concurrentMaxSessons and concurrentExpiredURL are set by config (<session-management> and ConcurrentSessionFilter)
	}

	private void registerDefaultTargetUrl(String defaultTargetUrl) {
		//UsernamePasswordAuthenticationFilter
		AbstractAuthenticationProcessingFilter filter = getSecurityFilter(AbstractAuthenticationProcessingFilter.class);

		checkUrl(defaultTargetUrl);

		Method method = null;
		try {
			method = AbstractAuthenticationProcessingFilter.class.getDeclaredMethod("getSuccessHandler", (Class<?>[]) null);

			method.setAccessible(true);

			SavedRequestAwareAuthenticationSuccessHandler successHandler = (SavedRequestAwareAuthenticationSuccessHandler) method.invoke(filter, (Object[])null);

//			successHandler.setAlwaysUseDefaultTargetUrl(true);
			successHandler.setDefaultTargetUrl(defaultTargetUrl);

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}

	}

	private void registerDefaultTargetUrlParameter(String defaultTargetUrlParameter) {
		//UsernamePasswordAuthenticationFilter
		AbstractAuthenticationProcessingFilter filter = getSecurityFilter(AbstractAuthenticationProcessingFilter.class);

		Method method = null;
		try {
			method = AbstractAuthenticationProcessingFilter.class.getDeclaredMethod("getSuccessHandler", (Class<?>[]) null);

			method.setAccessible(true);

			SavedRequestAwareAuthenticationSuccessHandler successHandler = (SavedRequestAwareAuthenticationSuccessHandler) method.invoke(filter, (Object[])null);

//			successHandler.setAlwaysUseDefaultTargetUrl(true);
			successHandler.setTargetUrlParameter(defaultTargetUrlParameter);

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}

	}

	private void checkUrl(String url) {
		if (UrlUtils.isValidRedirectUrl(url)) {
			// no-op
		} else {
			LOGGER.warn("Url ({} is not a valid redirect URL (must start with '/' or http(s))", url);
		}

	}
}
