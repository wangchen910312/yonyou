package chn.bhmc.dms.bat.crm.cif;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cif.service.BatCustomerInfoDmsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
/**
 * 客户接口表生成业务表
 * @author liuxueying
 */
public class CustomerInfoDmsInterfaceBatchJobBean extends BaseJobBean {
	@Autowired 
	BatCustomerInfoDmsService batCustInfoDmsDcsService;
	@Override
	protected void executeJob(JobExecutionContext context)
			throws JobExecutionException {
		 try {
			 batCustInfoDmsDcsService.insertCustInfoDmsDcs();
	        } catch (Exception e){
	            throw new JobExecutionException(e.getMessage(), e);
	        }
	}
}
