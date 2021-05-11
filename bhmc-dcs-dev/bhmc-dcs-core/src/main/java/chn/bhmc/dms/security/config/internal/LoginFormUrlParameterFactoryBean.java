
package chn.bhmc.dms.security.config.internal;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import chn.bhmc.dms.security.config.SecurityConfig;


public class LoginFormUrlParameterFactoryBean implements FactoryBean<String>, ApplicationContextAware {
	private ApplicationContext context = null;

	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}

	public String getObject() throws Exception {
		SecurityConfig config = context.getBean(SecurityConfig.class);

		if (config == null) {
			throw new NoSuchBeanDefinitionException("No bean of type [SecurityConfig.class] is defined.");
		}
		return config.getLoginUrlParameter();
	}

	public Class<String> getObjectType() {
		return String.class;
	}

	public boolean isSingleton() {
		return true;
	}
}
