package chn.bhmc.dms.bat.sal.usc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.usc.service.BatchSalesPurcService;

/**
 * 二手车收购数据上报dcs
 * @author liuxueying
 *
 */
public class BathSalesPurcBean  extends BaseJobBean {
	
	@Autowired
	BatchSalesPurcService batchSalesPurcService;
	

	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try {
			batchSalesPurcService.insertPurcInterfaceData();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
