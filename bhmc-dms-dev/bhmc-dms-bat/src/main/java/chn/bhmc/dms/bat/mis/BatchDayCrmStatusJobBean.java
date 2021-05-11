package chn.bhmc.dms.bat.mis;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.mis.service.BatchDayCrmStatusJobService;
/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayCrmStatusJobBean.java
 * @Description : [BatchJob] 고객정보(MS_1004T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */

public class BatchDayCrmStatusJobBean extends BaseJobBean {
	
	@Autowired
	BatchDayCrmStatusJobService batchDayCrmStatusJobService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchDayCrmStatusJobService batchDayCrmStatusJobService = getBean(BatchDayCrmStatusJobService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batchDayCrmStatusJobService.selectCrmStatusJob();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}