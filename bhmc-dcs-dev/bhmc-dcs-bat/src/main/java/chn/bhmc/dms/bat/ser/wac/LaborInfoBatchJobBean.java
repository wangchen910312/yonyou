package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.LaborInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborInfoBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class LaborInfoBatchJobBean extends BaseJobBean {
	
	@Autowired
	LaborInfoService laborInfoService;

    /**
     * BWMS 공임 정보를 가져온다.
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //LaborInfoService laborInfoService = getBean(LaborInfoService.class);
            laborInfoService.insertBwmslaborInfo();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
