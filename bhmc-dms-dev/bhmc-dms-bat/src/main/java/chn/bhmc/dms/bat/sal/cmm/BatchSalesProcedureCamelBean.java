package chn.bhmc.dms.bat.sal.cmm;

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
 * @ClassName   :
 * @Description : 판매 - 프로시져 호출 후 Camel 호출
 * @author Kim Jin Suk
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchSalesProcedureCamelBean extends BaseJobBean {
	
	@Autowired
	BatchSalesService salesService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //BatchSalesService salesService = getBean(BatchSalesService.class);
            String procedure = context.getJobDetail().getJobDataMap().getString("pNm");
            String sid = context.getJobDetail().getJobDataMap().getString("sID");

            salesService.executeSalesProcedure(procedure);
            salesService.executeCamel(sid);
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}