
package chn.bhmc.dms.security.intercept;

import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.support.MethodReplacer;
import org.springframework.security.access.ConfigAttribute;

import chn.bhmc.dms.security.securedobject.SecuredObjectService;


public class LookupAttributesMethodReplacer implements MethodReplacer {

    private SecuredObjectService securedObjectService;

    /**
     * <p>
     * SecuredObjectService를 설정하는 메소드이다.
     * </p>
     * @param securedObjectService <code>SecuredObjectService</code>
     */
    public void setSecuredObjectService(SecuredObjectService securedObjectService) {
        this.securedObjectService = securedObjectService;
    }

    /**
     * <p>
     * best matching 보호자원-권한 맵핑 정보를 DB에서 조회한다.
     * </p>
     * @param target <code>Object</code>
     * @param method <code>Method</code>
     * @param args <code>Object[]</code>
     * @return
     * @throws Exception
     * @see org.springframework.beans.factory.support.MethodReplacer#reimplement(java.lang.Object, java.lang.reflect.Method, java.lang.Object[])
     */
    public Object reimplement(Object target, Method method, Object[] args) throws Exception {
        List<ConfigAttribute> attributes = null;

        // DB 검색
        attributes = securedObjectService.getMatchedRequestMapping((String) args[0]);

        return attributes;
    }

}
