
package chn.bhmc.dms.security.config.internal;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.web.util.matcher.AnyRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import chn.bhmc.dms.security.config.SecurityConfig;


public class RequestMatcherTypeFactoryBean implements FactoryBean<RequestMatcher>, ApplicationContextAware {
	private ApplicationContext context;

	public RequestMatcher getObject() throws Exception {
		SecurityConfig config = context.getBean(SecurityConfig.class);

		if (config == null) {
			throw new NoSuchBeanDefinitionException("No bean of type [SecurityConfig.class] is defined.");
		}

		return AnyRequestMatcher.INSTANCE;
	}

	public Class<RequestMatcher> getObjectType() {
		return RequestMatcher.class;
	}

	public boolean isSingleton() {
		return true;
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = applicationContext;
	}

}
