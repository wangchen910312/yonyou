package chn.bhmc.dms.bat.sal.orc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.orc.service.BatchOrcMngService;

/**
 * @ClassName   :
 * @Description : 미배정오더배치
 * @author Lee Seungmin
 * @since 2017. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 25.    Lee Seungmin       최초 생성
 * </pre>
 */

public class BatchOrcMngBean extends BaseJobBean {
	
	@Autowired
	BatchOrcMngService batchOrcMngService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //BatchOrcMngService batchOrcMngService = getBean(BatchOrcMngService.class);
            batchOrcMngService.callOrcUpdateProcess();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}