package chn.bhmc.dms.bat.sal.rcp;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.rcp.service.PullDownVehicleReceiptService;

/**
 * 
 * <p>Title: 定时任务代码:将待绑定机票的VIN对应车辆拉取下来</p >
 * @author chenshengan 2021年5月8日 上午11:08:33
 * @param 
 * @return
 */
public class PullDownVehicleReceiptBean extends BaseJobBean {

	@Autowired
	PullDownVehicleReceiptService pullDownVehicleReceiptService;
	
	@Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
        	pullDownVehicleReceiptService.updateVehicleReceipt();
        } catch (Exception e) {
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
	
}
