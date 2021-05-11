
package chn.bhmc.dms.security.securedobject.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;

import chn.bhmc.dms.security.config.SecurityConfig;
import chn.bhmc.dms.security.securedobject.SecuredObjectService;


public class SecuredObjectServiceImpl implements SecuredObjectService, ApplicationContextAware {

	private SecuredObjectDAO securedObjectDAO;

    private String requestMatcherType = "ant";	// default

	public void setApplicationContext(ApplicationContext context) throws BeansException {

		if (context.getBeanNamesForType(SecurityConfig.class).length > 0) {
			SecurityConfig config = context.getBean(SecurityConfig.class);

			if (config != null) {
				requestMatcherType = config.getRequestMatcherType();
			}
		}
	}

    public void setSecuredObjectDAO(SecuredObjectDAO securedObjectDAO) {
        this.securedObjectDAO = securedObjectDAO;
    }

    public void setRequestMatcherType(String requestMatcherType) {
    	this.requestMatcherType = requestMatcherType;
    }

	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getRolesAndUrl() throws Exception {
		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> ret = new LinkedHashMap<RequestMatcher, List<ConfigAttribute>>();

		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDAO.getRolesAndUrl(requestMatcherType);

		Set<Object> keys = data.keySet();

		for (Object key : keys) {
			ret.put((RequestMatcher) key, data.get(key));
		}

		return ret;

	}

	public LinkedHashMap<String, List<ConfigAttribute>> getRolesAndMethod() throws Exception {
		LinkedHashMap<String, List<ConfigAttribute>> ret = new LinkedHashMap<String, List<ConfigAttribute>>();

		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDAO.getRolesAndMethod();

		Set<Object> keys = data.keySet();

		for (Object key : keys) {
			ret.put((String)key, data.get(key));
		}

		return ret;
	}

	public LinkedHashMap<String, List<ConfigAttribute>> getRolesAndPointcut() throws Exception {
		LinkedHashMap<String, List<ConfigAttribute>> ret = new LinkedHashMap<String, List<ConfigAttribute>>();

		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDAO.getRolesAndPointcut();

		Set<Object> keys = data.keySet();

		for (Object key : keys) {
			ret.put((String)key, data.get(key));
		}

		return ret;
	}

	public List<ConfigAttribute> getMatchedRequestMapping(String url) throws Exception {
		return securedObjectDAO.getRegexMatchedRequestMapping(url);
	}

	public String getHierarchicalRoles() throws Exception {
		return securedObjectDAO.getHierarchicalRoles();
	}

	@Override
	public List<Map<String, Object>> getViewResourceMapping(
			Map<String, Object> params) throws Exception {
		return securedObjectDAO.getViewResourceMapping(params);
	}


}
