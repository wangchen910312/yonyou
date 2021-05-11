
package chn.bhmc.dms.security.config;

import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.xml.AbstractSingleBeanDefinitionParser;
import org.springframework.util.StringUtils;
import org.w3c.dom.Element;


public class SecuritySecuredObjectConfigBeanDefinitionParser extends AbstractSingleBeanDefinitionParser {

	@Override
	protected Class<?> getBeanClass(Element element) {
		return SecuredObjectConfig.class;
	}

	@Override
	protected void doParse(Element element, BeanDefinitionBuilder bean) {
	    String sqlViewResourceMapping = element.getAttribute("sqlViewResourceMapping");
        if (StringUtils.hasText(sqlViewResourceMapping)) {
            bean.addPropertyValue("sqlViewResourceMapping", sqlViewResourceMapping);
        }

        String sqlHierarchicalRoles = element.getAttribute("sqlHierarchicalRoles");
        if (StringUtils.hasText(sqlHierarchicalRoles)) {
            bean.addPropertyValue("sqlHierarchicalRoles", sqlHierarchicalRoles);
        }

		String sqlRolesAndUrl = element.getAttribute("sqlRolesAndUrl");
		if (StringUtils.hasText(sqlRolesAndUrl)) {
			bean.addPropertyValue("sqlRolesAndUrl", sqlRolesAndUrl);
		}

		String sqlRolesAndMethod = element.getAttribute("sqlRolesAndMethod");
		if (StringUtils.hasText(sqlRolesAndMethod)) {
			bean.addPropertyValue("sqlRolesAndMethod", sqlRolesAndMethod);
		}

		String sqlRolesAndPointcut = element.getAttribute("sqlRolesAndPointcut");
		if (StringUtils.hasText(sqlRolesAndPointcut)) {
			bean.addPropertyValue("sqlRolesAndPointcut", sqlRolesAndPointcut);
		}

		String sqlRegexMatchedRequestMapping = element.getAttribute("sqlRegexMatchedRequestMapping");
		if (StringUtils.hasText(sqlRegexMatchedRequestMapping)) {
			bean.addPropertyValue("sqlRegexMatchedRequestMapping", sqlRegexMatchedRequestMapping);
		}

		String roleHierarchyString = element.getAttribute("roleHierarchyString");
		if (StringUtils.hasText(roleHierarchyString)) {
			bean.addPropertyValue("roleHierarchyString", roleHierarchyString);
		}

	}
}