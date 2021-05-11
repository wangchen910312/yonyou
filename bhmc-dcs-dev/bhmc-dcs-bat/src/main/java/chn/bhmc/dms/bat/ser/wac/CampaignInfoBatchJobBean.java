package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.CampaignInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignInfoBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class CampaignInfoBatchJobBean extends BaseJobBean{
	
	@Autowired
	CampaignInfoService campaignInfoService;
    
	/*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //CampaignInfoService campaignInfoService = getBean(CampaignInfoService.class);
            campaignInfoService.insertCampaignInfo();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
