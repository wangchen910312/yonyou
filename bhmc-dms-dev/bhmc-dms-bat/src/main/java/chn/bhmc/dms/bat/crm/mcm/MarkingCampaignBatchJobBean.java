package chn.bhmc.dms.bat.crm.mcm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarkingCampaignBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyoung Jun An
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.    Hyoung Jun An     최초 생성
 * </pre>
 */

public class MarkingCampaignBatchJobBean extends BaseJobBean {

	@Autowired
	BatMarkingCampaignService batMarkingCampaignService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {

            //캠페인에서 배치를 수행할 목록부터 조회한다.
            batMarkingCampaignService.multiTargetExtract();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}