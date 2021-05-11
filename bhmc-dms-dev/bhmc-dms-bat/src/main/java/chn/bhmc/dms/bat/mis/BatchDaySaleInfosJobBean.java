package chn.bhmc.dms.bat.mis;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.mis.service.BatchDaySaleInfosJobService;

/**
 * <pre>
 * [BatchJob] 판매정보(MS_1002T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleInfosJobBean.java
 * @Description : [BatchJob] 판매정보(MS_1002T_2016)
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

public class BatchDaySaleInfosJobBean extends BaseJobBean {

	@Autowired
	BatchDaySaleInfosJobService batchDaySaleInfosJobService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            batchDaySaleInfosJobService.insertSaleInfosJob();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
