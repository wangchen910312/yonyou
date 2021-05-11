package chn.bhmc.dms.bat;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

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

public class BatchSampleJobBean extends BaseJobBean {

    public static final Logger log = LoggerFactory.getLogger(BatchSampleJobBean.class);
    
    @Autowired
    SystemConfigInfoService systemConfigInfoService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다..
            //SystemConfigInfoService systemConfigInfoService = getBean(SystemConfigInfoService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

            log.info("chn.bhmc.dms.bat.BatchSampleJobBean :: dateFormat {}", dateFormat);

            JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();

            log.info("FILE_UPLOAD_PATH :: " + jobDataMap.getString("FILE_UPLOAD_PATH"));


        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
