
package chn.bhmc.dms.security.config;

import org.springframework.beans.factory.xml.NamespaceHandlerSupport;


public class SecurityNameHandler extends NamespaceHandlerSupport {

    public void init() {
        registerBeanDefinitionParser("config", new SecurityConfigBeanDefinitionParser());
        registerBeanDefinitionParser("initializer", new SecurityConfigInitializerBeanDefinitionParser());
        registerBeanDefinitionParser("secured-object-config", new SecuritySecuredObjectConfigBeanDefinitionParser());
    }

}
