package chn.bhmc.dms.bat.sal.cnt;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cnt.service.BatchContractToFmsService;

public class BatchContractToFmsBean extends BaseJobBean{
	@Autowired
	BatchContractToFmsService batchContractToFmsService;

	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try {
			batchContractToFmsService.executeProcedure();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
