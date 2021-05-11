package chn.bhmc.dms.bat;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSampleJob.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SimpleBatchJobBean extends BaseJobBean {

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
