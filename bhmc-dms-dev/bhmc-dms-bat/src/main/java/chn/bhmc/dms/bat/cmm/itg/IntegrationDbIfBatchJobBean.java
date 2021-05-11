package chn.bhmc.dms.bat.cmm.itg;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.itg.service.IntegrationDbIfService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IntegrationDbIfBatchJobBean
 * @Description : DMS - DCS 통합 DB I/F Batch
 * @author Choi KyungYong
 * @since 2017. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 1. 20.     Choi KyungYong            최초 생성
 * </pre>
 */

public class IntegrationDbIfBatchJobBean extends BaseJobBean {

	@Autowired
	IntegrationDbIfService integrationDbIfService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {

            int day = 1;

            String strDay = context.getJobDetail().getJobDataMap().getString("day");
            if(strDay != null){
                day = Integer.parseInt(strDay);
            }
            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            integrationDbIfService.requestIntegrationDbIf(day);

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}