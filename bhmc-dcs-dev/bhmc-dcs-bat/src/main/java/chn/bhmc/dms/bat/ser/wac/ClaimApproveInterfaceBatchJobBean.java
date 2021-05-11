package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.ClaimApproveService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimApproveInterfaceBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class ClaimApproveInterfaceBatchJobBean extends BaseJobBean{
	
	@Autowired
	ClaimApproveService claimApproveService;
	
    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

    	int day = 3;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }
        
        try{
            //ClaimApproveService claimApproveService = getBean(ClaimApproveService.class);
            claimApproveService.insertClaimApprove(day);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
