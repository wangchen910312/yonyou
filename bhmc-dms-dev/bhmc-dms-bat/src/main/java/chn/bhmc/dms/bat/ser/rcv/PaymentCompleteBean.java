package chn.bhmc.dms.bat.ser.rcv;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.rcv.service.PaymentCompleteService;

public class PaymentCompleteBean extends BaseJobBean{
	
	@Autowired
	PaymentCompleteService paymentCompleteService;

	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		try {
			paymentCompleteService.finish();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
