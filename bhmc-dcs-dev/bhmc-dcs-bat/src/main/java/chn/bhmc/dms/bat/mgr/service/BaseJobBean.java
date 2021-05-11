package chn.bhmc.dms.bat.mgr.service;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BaseJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public abstract class BaseJobBean extends QuartzJobBean {

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {

        executeJob(context);

        //배치 수행에 에러가 없다면 배치결과값(0)을 설정한다.
        //배치 결과값이 0 이면 배치수행이 성공으로 판단한다.
        //@see chn.bhmc.dms.bat.mgr.service.BatchJobListener
        context.setResult(0);
    }

    protected abstract void executeJob(JobExecutionContext context) throws JobExecutionException;
    
    /*
    protected Object getBean(String name) {
        return WebAppContext.getApplicationContext().getBean(name);
    }

    protected <T> T getBean(Class<T> requiredType) {
        return WebAppContext.getApplicationContext().getBean(requiredType);
    }

    protected ApplicationContext getApplicationContext() {
        return WebAppContext.getApplicationContext();
    }
    */
}
