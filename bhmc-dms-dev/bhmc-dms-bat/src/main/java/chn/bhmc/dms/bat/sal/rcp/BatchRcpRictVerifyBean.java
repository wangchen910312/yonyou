package chn.bhmc.dms.bat.sal.rcp;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.rcp.service.BatchRcpRictVerifyService;

/**
 * <p>Title: 机动车发票定时调用集中式接口验证真伪</p>
 * @author Gongrs 2021年3月30日 下午4:17:47
 * @remark 1.由于开票日期为当前日期的发票有可能在国税系统查询不到，导致发票真伪不能立即反馈
 * @remark 2.增加该功能定时更新“开票日期非当前日期”且“未验证”的发票的验证结果
 */
public class BatchRcpRictVerifyBean extends BaseJobBean {

	@Autowired
	BatchRcpRictVerifyService batchRcpRictVerifyService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //BatchRcpRictVerifyService batchRcpRictVerifyService = getBean(BatchRcpRictVerifyService.class);
        	batchRcpRictVerifyService.updateRcpRictVerify();
        } catch (Exception e) {
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}