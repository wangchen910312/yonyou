package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceBatchJobBean.java
 * @Description : 索赔发票信息跑批.
 * @author tianjiaxing
 * @since 2021. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 19.     tianjiaxing     索赔发票信息跑批
 * </pre>
 */
public class ClaimInvoiceBatchJobBean extends BaseJobBean{
	
	@Autowired
	ClaimInvoiceService claimInvoiceService;

	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {

		try{
			claimInvoiceService.insertClaimInvoice();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
	}

}
