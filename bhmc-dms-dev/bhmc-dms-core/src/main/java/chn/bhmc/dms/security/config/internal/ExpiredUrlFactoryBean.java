package chn.bhmc.dms.security.config.internal;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.security.config.SecurityConfig;

public class ExpiredUrlFactoryBean implements FactoryBean<String>, ApplicationContextAware {
	private ApplicationContext context;

	public static final String DEFAULT_EXPIRED_URL = "/index.htm";

	public String getObject() throws Exception {
		try {
			SecurityConfig config = context.getBean(SecurityConfig.class);

			if (StringUtils.hasText(config.getConcurrentExpiredUrl())) {
				return config.getConcurrentExpiredUrl();
			}
		} catch (NoSuchBeanDefinitionException nsbde) {
			// no-op
		}

		return DEFAULT_EXPIRED_URL;
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
}