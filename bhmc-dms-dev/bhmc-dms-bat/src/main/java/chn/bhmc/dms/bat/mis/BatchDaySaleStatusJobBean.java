package chn.bhmc.dms.bat.mis;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.mis.service.BatchDaySaleStatusJobService;
/**
 * <pre>
 * [BatchJob] 판매현황(MS_1001T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStatusJobBean.java
 * @Description : [BatchJob] 판매현황(MS_1001T_2016)
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

public class BatchDaySaleStatusJobBean extends BaseJobBean {

	@Autowired
	BatchDaySaleStatusJobService batchDaySaleStatusJobService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            batchDaySaleStatusJobService.insertSaleStatusJob();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}