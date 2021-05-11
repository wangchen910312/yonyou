package chn.bhmc.dms.bat.par.pcm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pcm.service.BatchOrdBoService;

/**
 * 系统自动判断，关闭缺货申请
 * @author jiaMing 2020-11-26 
 *
 */

public class BatchOrdBoJobBean extends BaseJobBean{
	@Autowired
	BatchOrdBoService batchOrdBoService;
	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {
		//接收来自页面配置的ifId
        String ifId = context.getJobDetail().getJobDataMap().getString("ifId");
        try {
			if("OrdBoInfo001".equals(ifId)){//根据订单bo数量自动关闭
				batchOrdBoService.executeBatchORdBoProcedure();
			}else if("OrdBoInfo002".equals(ifId)){//采购科回复记录中配件的到达仓库时间晚于（当前日期+N天）某日期 ，修改单据状态为采购科处理中。
				batchOrdBoService.updateAppealStatus();
			}
		} catch (Exception e) {
			 throw new JobExecutionException(e.getMessage(), e);
		}
	}

}
