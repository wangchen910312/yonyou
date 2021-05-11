package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.ClaimPioPartService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioPartBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class ClaimPioPartBatchJobBean extends BaseJobBean{
	
	@Autowired
	ClaimPioPartService claimPioPartService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //ClaimPioPartService claimPioPartService = getBean(ClaimPioPartService.class);
            claimPioPartService.insertClaimPioPart();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
