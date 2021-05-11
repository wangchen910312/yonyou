package chn.bhmc.dms.bat.cmm.tss;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.tss.service.TransmissionDataToTssService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

public class TransmissionDataToTssJobBean extends BaseJobBean{

	@Autowired
	TransmissionDataToTssService transmissionDataToTssService;
	
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		
		 try {
			 
			 transmissionDataToTssService.getDCSDataToTSS();
			 
		 } catch (Exception e){
	            throw new JobExecutionException(e.getMessage(), e);
	     }
		 
	}

}
