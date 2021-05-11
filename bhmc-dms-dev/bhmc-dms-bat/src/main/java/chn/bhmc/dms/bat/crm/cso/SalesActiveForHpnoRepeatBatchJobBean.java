package chn.bhmc.dms.bat.crm.cso;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cso.service.BatSalesActiveForHpnoRepeatService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

public class SalesActiveForHpnoRepeatBatchJobBean extends BaseJobBean {

	@Autowired
	BatSalesActiveForHpnoRepeatService batSalesActiveForHpnoRepeatService;
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try {
			batSalesActiveForHpnoRepeatService.updateSalesActiveForHpnoRepeat();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
