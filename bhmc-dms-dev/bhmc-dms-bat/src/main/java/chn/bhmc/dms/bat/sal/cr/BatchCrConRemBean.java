package chn.bhmc.dms.bat.sal.cr;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cr.service.BatchCrConRemService;


public class BatchCrConRemBean extends BaseJobBean{
   
	@Autowired
	BatchCrConRemService batchCrConRemService;
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try {
			batchCrConRemService.insertMessRem();
		} catch (Exception e) {
			throw new JobExecutionException(e.getMessage(), e);
		}
		
	}

}
