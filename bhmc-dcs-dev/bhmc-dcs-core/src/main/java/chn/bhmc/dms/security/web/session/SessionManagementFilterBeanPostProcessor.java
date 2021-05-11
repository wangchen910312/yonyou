package chn.bhmc.dms.security.web.session;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.security.web.session.InvalidSessionStrategy;
import org.springframework.security.web.session.SessionManagementFilter;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomBeanPostProcessor.Java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SessionManagementFilterBeanPostProcessor implements BeanPostProcessor{

    InvalidSessionStrategy invalidSessionStrategy;

    public SessionManagementFilterBeanPostProcessor(InvalidSessionStrategy invalidSessionStrategy){
        this.invalidSessionStrategy = invalidSessionStrategy;
    }

    /*
     * @see org.springframework.beans.factory.config.BeanPostProcessor#postProcessBeforeInitialization(java.lang.Object, java.lang.String)
     */
    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        if (bean instanceof SessionManagementFilter) {
            SessionManagementFilter filter = (SessionManagementFilter) bean;
            filter.setInvalidSessionStrategy(this.invalidSessionStrategy);
        }
        return bean;
    }

    /*
     * @see org.springframework.beans.factory.config.BeanPostProcessor#postProcessAfterInitialization(java.lang.Object, java.lang.String)
     */
    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        return bean;
    }

}
