package chn.bhmc.dms.bat.ser.rev;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.rev.service.ReseReceiptService;

public class ReseReceiptBean extends BaseJobBean{
    @Autowired
	ReseReceiptService reseReceiptService;
    
	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {
		try {
			reseReceiptService.insertReservationReceipt();
		} catch (Exception e) {
			new JobExecutionException(e.getMessage(), e);
		}
		
	}

}
