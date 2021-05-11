package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.CampaignUsedInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignUsedInfoBatchJobBean.java
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

public class CampaignUsedInfoBatchJobBean extends BaseJobBean {
	
	@Autowired
	CampaignUsedInfoService campaignUsedInfoService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //CampaignUsedInfoService campaignUsedInfoService = getBean(CampaignUsedInfoService.class);
            campaignUsedInfoService.insertCampaignUsedReq();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}