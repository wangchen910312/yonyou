
package chn.bhmc.dms.security.userdetails.hierarchicalroles;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.security.config.SecuredObjectConfig;
import chn.bhmc.dms.security.securedobject.SecuredObjectService;


public class HierarchyStringsFactoryBean implements FactoryBean<String>, ApplicationContextAware {
	private ApplicationContext context;

    private String hierarchyStrings;
    private SecuredObjectService securedObjectService;

	public void setSecuredObjectService(SecuredObjectService securedObjectService) {
		this.securedObjectService = securedObjectService;
	}

    public void init() throws Exception {
    	// 설정 간소화 처리가 지정된 경우
    	if (context.getBeanNamesForType(SecuredObjectConfig.class).length > 0) {
    		SecuredObjectConfig config = context.getBean(SecuredObjectConfig.class);

    		if (StringUtils.hasText(config.getRoleHierarchyString())) {

    			hierarchyStrings =config.getRoleHierarchyString();

    			return;
    		}
    	}

    	// 기본 처리
        hierarchyStrings = (String) securedObjectService.getHierarchicalRoles();
    }

    public String getObject() throws Exception {
        if (hierarchyStrings == null) {
            init();
        }
        return hierarchyStrings;
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
