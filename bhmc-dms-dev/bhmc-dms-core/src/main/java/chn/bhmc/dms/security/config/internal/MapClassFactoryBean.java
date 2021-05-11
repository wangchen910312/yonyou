
package chn.bhmc.dms.security.config.internal;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.security.config.SecurityConfig;


public class MapClassFactoryBean implements FactoryBean<String>, ApplicationContextAware {
	private ApplicationContext context;

	private String defaultMapClass;

	public String getObject() throws Exception {
		try {
			SecurityConfig config = context.getBean(SecurityConfig.class);

			if (StringUtils.hasText(config.getJdbcMapClass())) {
				return config.getJdbcMapClass();
			}
		} catch (NoSuchBeanDefinitionException nsbde) {
			// no-op
		}

		return defaultMapClass;
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

	public String getDefaultMapClass() {
		return defaultMapClass;
	}

	@Required
	public void setDefaultMapClass(String defaultMapClass) {
		this.defaultMapClass = defaultMapClass;
	}
}
