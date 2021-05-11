package chn.bhmc.dms.bat.sal.inv.web;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.inv.service.StockMntService;
/**
* @ClassName: StockMntBatchJobBean 
* @Description: TODO(战略终端申请接口表生成业务表，由于接口中存储过程并发有问题顾增加此定时) 
* @author: liuxueying
* @date: 2020年7月17日
 */
public class StockMntBatchJobBean extends BaseJobBean{
	@Autowired
	StockMntService stockMntService;

	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		try{
			stockMntService.insertStockIf();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
	}
}
