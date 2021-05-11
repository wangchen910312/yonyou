package chn.bhmc.dms.core.web.bind.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RequestParamsArgumentResolver.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 2.     Kang Seok Han     최초 생성
 * </pre>
 */

public class JsonRequestParamsArgumentResolver implements HandlerMethodArgumentResolver {

    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(JsonRequestParamsArgumentResolver.class);

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().equals(JsonRequestParams.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter,
            ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
            WebDataBinderFactory binderFactory) throws Exception {

        JsonRequestParams requestParams = new JsonRequestParams();

//        for(Iterator<String> iterator = webRequest.getParameterNames(); iterator.hasNext();){
//            String key = iterator.next();
//            String[] values = webRequest.getParameterValues(key);
//
//            if (values != null) {
//                requestParams.put(key, (values.length > 1) ? values: values[0]);
//                log.debug(key + ":" + StringUtils.join(values));
//            }
//        }

        return requestParams;
    }

}
