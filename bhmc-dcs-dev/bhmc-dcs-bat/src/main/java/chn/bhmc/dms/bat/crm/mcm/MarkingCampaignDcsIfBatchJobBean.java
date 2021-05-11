package chn.bhmc.dms.bat.crm.mcm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarkingCampaignDcsIfBatchJobBean.java
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

public class MarkingCampaignDcsIfBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatMarkingCampaignService batMarkingCampaignService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatMarkingCampaignService batMarkingCampaignService = getBean(BatMarkingCampaignService.class);
            BatMarkingCampaignVO batMarkingCampaignVO = new BatMarkingCampaignVO();

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            //DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
            batMarkingCampaignService.multiDcsIfCpoy(batMarkingCampaignVO);

            batMarkingCampaignService.multiDcsIfCpoyEAI();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}