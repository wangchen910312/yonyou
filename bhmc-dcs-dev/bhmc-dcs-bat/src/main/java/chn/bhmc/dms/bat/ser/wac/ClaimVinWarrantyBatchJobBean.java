package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.ClaimWarrantyConditionService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimVinWarrantyBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 10. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 4.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class ClaimVinWarrantyBatchJobBean extends BaseJobBean{
	
	@Autowired
	ClaimWarrantyConditionService claimWarrantyConditionService;
	
    /**
    * BWMS 빈별 보증 정보
    * @throws JobExecutionException
    */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //ClaimWarrantyConditionService claimWarrantyConditionService = getBean(ClaimWarrantyConditionService.class);
            claimWarrantyConditionService.insertBwmsVinConditionInfo();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
