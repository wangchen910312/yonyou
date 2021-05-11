package chn.bhmc.dms.bat.sal.cnt;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cnt.service.BatchContractCustomerService;

public class BatchContractCustomerBean  extends BaseJobBean {

	@Autowired
	BatchContractCustomerService contractCustomerService;
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try {
			contractCustomerService.executeProcedure();
		} catch (Exception e) {
			 throw new JobExecutionException(e.getMessage(), e);
		}
	}

}
