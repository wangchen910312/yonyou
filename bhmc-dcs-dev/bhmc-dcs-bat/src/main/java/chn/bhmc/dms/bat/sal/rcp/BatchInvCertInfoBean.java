package chn.bhmc.dms.bat.sal.rcp;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.rcp.service.BatchInvCertInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 판매 - 영수증 취합배치
 * @author Kim Jin Suk
 * @since 2018. 4. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchInvCertInfoBean extends BaseJobBean {

	@Autowired
	BatchInvCertInfoService batchInvCertInfoService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        String sID = context.getJobDetail().getJobDataMap().getString("sID");

        try{
            batchInvCertInfoService.InvCertInfoRun(sID);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
