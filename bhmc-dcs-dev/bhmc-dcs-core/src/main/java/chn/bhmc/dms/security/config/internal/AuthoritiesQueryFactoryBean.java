
package chn.bhmc.dms.security.config.internal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.security.config.SecurityConfig;


public class AuthoritiesQueryFactoryBean implements FactoryBean<String>, ApplicationContextAware {

    private static final Logger log = LoggerFactory.getLogger(AuthoritiesQueryFactoryBean.class);
	private ApplicationContext context;
	private String defaultQuery;

	public String getObject() throws Exception {
		try {
			SecurityConfig config = context.getBean(SecurityConfig.class);

			if (StringUtils.hasText(config.getJdbcAuthoritiesByUsernameQuery())) {
			    log.debug("authoritiesByUsernameQuery : {}", config.getJdbcAuthoritiesByUsernameQuery());
				return config.getJdbcAuthoritiesByUsernameQuery();
			}
		} catch (NoSuchBeanDefinitionException nsbde) {
			// no-op
		}
		log.debug("authoritiesByUsernameQuery : {}", defaultQuery);
		return defaultQuery;
	}

	public Class<String> getObjectType() {
		return String.class;
	}

	public boolean isSingleton() {
		return true;
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = applicationContext;
	}

	public String getDefaultQuery() {
		return defaultQuery;
	}

	@Required
	public void setDefaultQuery(String defaultQuery) {
		this.defaultQuery = defaultQuery;
	}
}
