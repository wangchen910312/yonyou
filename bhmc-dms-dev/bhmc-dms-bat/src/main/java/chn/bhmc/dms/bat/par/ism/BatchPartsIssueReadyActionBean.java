package chn.bhmc.dms.bat.par.ism;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.ism.service.BatchPartsIssueReadyActionService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsIssueReadyActionBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2017. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 14.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatchPartsIssueReadyActionBean extends BaseJobBean {
	
	@Autowired
	BatchPartsIssueReadyActionService batchPartsIssueReadyActionService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //예류설정기간 지난 항목 조회 및 자동취소 처리.
            //BatchPartsIssueReadyActionService batchPartsIssueReadyActionService = getBean(BatchPartsIssueReadyActionService.class);
            batchPartsIssueReadyActionService.executeIssuePartsReadyActionAutoCancel();            
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}