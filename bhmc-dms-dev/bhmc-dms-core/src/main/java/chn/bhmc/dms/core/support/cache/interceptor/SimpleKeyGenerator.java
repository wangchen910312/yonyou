package chn.bhmc.dms.core.support.cache.interceptor;

import java.lang.reflect.Method;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.cache.interceptor.KeyGenerator;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SimpleKeyGenerator.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 5.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SimpleKeyGenerator implements KeyGenerator {

    /**
     * @see org.springframework.cache.interceptor.KeyGenerator#generate(java.lang.Object, java.lang.reflect.Method, java.lang.Object[])
     */
    @Override
    public Object generate(Object target, Method method, Object... params) {
        return generateKey(method.getName(), params);
    }

    /**
     * Generate a key based on the specified parameters.
     */
    public static Object generateKey(String methodName, Object... params) {
        if (params.length == 0) {
            return SimpleKey.EMPTY;
        }
        if (params.length == 1) {
            Object param = params[0];
            if (param != null && !param.getClass().isArray()) {
                return 31 * param.hashCode() + methodName.hashCode();
            }
        }

        return new SimpleKey(ArrayUtils.add(params, methodName));
    }
}
