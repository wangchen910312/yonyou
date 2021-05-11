package chn.bhmc.dms.bat.cmm.eai;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsAmountBatchJobBean
 * @Description : DCS Mig를 위한 배치 JobBean
 * @author Choi KyungYong
 * @since 2017. 07. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since             author              description
 *  ============    ===============    ========================
 *  2017. 07. 10.    Choi KyungYong            최초 생성
 * </pre>
 */

public class EaiScheduleBatchJobBean extends BaseJobBean {

	@Autowired
	BatchSalesService batchSalesService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        String ifId = context.getJobDetail().getJobDataMap().getString("ifId");
        String sender = context.getJobDetail().getJobDataMap().getString("sender");

        try {
            batchSalesService.executeEaiService(ifId, sender);

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
