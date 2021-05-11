package chn.bhmc.dms.bat.ser.ro;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.ro.service.RepairOrderHistoryToFmsService;

/**
 * 维保记录传送
 * @ClassName   : RepairOrderHistoryToFmsBatchJobBean.java
 * @author TJX
 * @since 2020. 4. 1.
 * 
 */

public class RepairOrderHistoryToFmsBatchJobBean extends BaseJobBean{

	@Autowired
	RepairOrderHistoryToFmsService repairOrderHistoryToFmsService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
        	repairOrderHistoryToFmsService.insertRoHistoryToFmsSend();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}