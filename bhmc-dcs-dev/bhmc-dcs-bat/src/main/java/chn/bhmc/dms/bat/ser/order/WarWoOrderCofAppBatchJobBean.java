package chn.bhmc.dms.bat.ser.order;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;



import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.order.service.WarWoOrderCofAppService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarWoOrderCofAppBatchJobBean.java
 * @Description : 需求编号 327 DMS特殊申请发送DCS、DCS接收 DMS-北京现代APP工单确认-保修工单确认申请.
 *                定时每5分钟跑批SER140接口接收的数据   写入主表DMS、DCS特殊申请表SE_1162T
 * @author jiaMing
 * @since 2021.04.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  22021.04.02.     jiaMing            
 * </pre>
 */
public class WarWoOrderCofAppBatchJobBean extends BaseJobBean{
	
	@Resource(name="warWoOrderCofAppService")
	WarWoOrderCofAppService warWoOrderCofAppService;
	
	
	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {
		try {
			warWoOrderCofAppService.updateInsertInfo();
		} catch (Exception e) {
			throw new JobExecutionException(e.getMessage(), e);
		}
		
	}

}
