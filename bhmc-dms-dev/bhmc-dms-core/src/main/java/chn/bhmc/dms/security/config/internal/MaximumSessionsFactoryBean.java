package chn.bhmc.dms.security.config.internal;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import chn.bhmc.dms.security.config.SecurityConfig;

public class MaximumSessionsFactoryBean implements FactoryBean<Integer>, ApplicationContextAware {
	private ApplicationContext context;

	public static final int DEFAULT_MAX_SESSIONS = -1;

	public Integer getObject() throws Exception {
		try {
			SecurityConfig config = context.getBean(SecurityConfig.class);

			if (config.getConcurrentMaxSessons() > 0) {
				return config.getConcurrentMaxSessons();
			}
		} catch (NoSuchBeanDefinitionException nsbde) {
			// no-op
		}

		return DEFAULT_MAX_SESSIONS;
	}

	public Class<Integer> getObjectType() {
		return Integer.class;
	}

	public boolean isSingleton() {
		return true;
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = applicationContext;
	}
}