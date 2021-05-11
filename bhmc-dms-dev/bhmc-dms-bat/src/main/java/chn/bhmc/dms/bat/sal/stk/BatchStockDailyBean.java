package chn.bhmc.dms.bat.sal.stk;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.stk.service.BatchStockDailyService;

/**
 * @ClassName   :
 * @Description : 재고일배치
 * @author Lee Seungmin
 * @since 2017. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 23.    Lee Seungmin       최초 생성
 * </pre>
 */

public class BatchStockDailyBean extends BaseJobBean {
	
	@Autowired
	BatchStockDailyService batchStockDailyService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //BatchStockDailyService batchStockDailyService = getBean(BatchStockDailyService.class);
            batchStockDailyService.callStockCntProcess();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}