package chn.bhmc.dms.bat.sal.rcp.web;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.rcp.service.BatchInvImgInfoService;

/**
* @ClassName: BatchInvImgInfoBean 
* @Description: 机动车统一发票信息发票数据转图片存入本地
* @author: tjx
* @date: 2020年8月20日
 */
public class BatchInvImgInfoBean extends BaseJobBean{

	@Resource(name="batchInvImgInfoService")
	BatchInvImgInfoService batchInvImgInfoService;
	
	
	@Override
	protected void executeJob(JobExecutionContext context) throws JobExecutionException {
		try{
			batchInvImgInfoService.readBlod2Pictures();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
		
	}

}
