package chn.bhmc.dms.cmm;

import java.util.Iterator;
import java.util.Map.Entry;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.context.WebAppContext;

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

public class BatchSampleJob extends QuartzJobBean {

    private static final Logger logger = LoggerFactory.getLogger(BatchSampleJob.class);

    @Override
    protected void executeInternal(JobExecutionContext context)
            throws JobExecutionException {

        try {
            SystemConfigInfoService systemConfigInfoService = WebAppContext.getApplicationContext().getBean(SystemConfigInfoService.class);
            logger.debug("BatchSampleJob 실행  - 시스템설정 타입존 {}", systemConfigInfoService.selectStrValueByKey("dateFormat"));

            //JobDataMap 내역출력
            Iterator<Entry<String, Object>> params = context.getJobDetail().getJobDataMap().entrySet().iterator();
            while(params.hasNext()){
                Entry<String, Object> entry = params.next();
                logger.debug("{} : {}", entry.getKey(), entry.getValue());
            }

            context.setResult(0);
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

    }

}
