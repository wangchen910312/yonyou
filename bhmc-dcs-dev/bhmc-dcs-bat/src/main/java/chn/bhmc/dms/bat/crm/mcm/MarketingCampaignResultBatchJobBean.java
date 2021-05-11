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
 * @ClassName   : MarketingCampaignResultBatchJobBean.java
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

public class MarketingCampaignResultBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatMarkingCampaignService batMarkingCampaignService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatMarkingCampaignService batMarkingCampaignService = getBean(BatMarkingCampaignService.class);

            //DMS에서 DCS로 다시 이관된 DCS캠페인 대상자에 대한 결과치를 갱신한다.(추출대상자)
            batMarkingCampaignService.updateCrmDcsTargetResult();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}