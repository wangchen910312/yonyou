
package chn.bhmc.dms.security.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.xml.AbstractSingleBeanDefinitionParser;
import org.springframework.beans.factory.xml.ParserContext;
import org.w3c.dom.Element;


public class SecurityConfigInitializerBeanDefinitionParser extends AbstractSingleBeanDefinitionParser {

	private static final Logger LOGGER = LoggerFactory.getLogger(SecurityConfigInitializerBeanDefinitionParser.class);

	@Override
	protected Class<?> getBeanClass(Element element) {
		return SecurityConfigInitializer.class;
	}

	@Override
	protected void doParse(Element element, ParserContext parserContext, BeanDefinitionBuilder builder) {

		LOGGER.debug("Load '/META-INF/spring/security/security-config.xml'");
		parserContext.getReaderContext().getReader().loadBeanDefinitions("classpath*:/META-INF/spring/security/security-config.xml");
		String supportPointcut = element.getAttribute("supportPointcut");

		if (supportPointcut.equalsIgnoreCase("true")) {
			LOGGER.debug("Load '/META-INF/spring/security/pointcut-config.xml'");
			parserContext.getReaderContext().getReader().loadBeanDefinitions("classpath*:/META-INF/spring/security/pointcut-config.xml");
		}

		String supportMethod = element.getAttribute("supportMethod");

		if (supportMethod.equalsIgnoreCase("true")) {
			LOGGER.debug("Load '/META-INF/spring/security/method-config.xml'");
			parserContext.getReaderContext().getReader().loadBeanDefinitions("classpath*:/META-INF/spring/security/method-config.xml");
		}
	}
}