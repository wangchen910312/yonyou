package chn.bhmc.dms.bat.sal.veh;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.veh.service.BatchVehRfidResetService;

/**
 * @ClassName   : BatchVehRfidResetBean
 * @Description : VIN RFID Reset
 * @author Lee Seungmin
 * @since 2017. 6. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 7.   Lee Seungmin       최초 생성
 * </pre>
 */

public class BatchVehRfidResetBean extends BaseJobBean {

	@Autowired
	BatchVehRfidResetService batchVehRfidResetService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //BatchStockDailyService batchStockDailyService = getBean(BatchStockDailyService.class);
            batchVehRfidResetService.callVehRfidResetProcess();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}