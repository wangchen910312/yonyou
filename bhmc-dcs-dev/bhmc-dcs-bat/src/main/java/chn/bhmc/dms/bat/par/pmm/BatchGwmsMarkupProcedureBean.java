package chn.bhmc.dms.bat.par.pmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsMarkupService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchGwmsProcedureBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 10.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatchGwmsMarkupProcedureBean extends BaseJobBean {
	
	@Autowired
	BatchGwmsPartsMarkupService batchGwmsPartsMarkupService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        try {

            //BatchGwmsPartsMarkupService batchGwmsPartsMarkupService = getBean(BatchGwmsPartsMarkupService.class);
            //프로시져 호출.
            batchGwmsPartsMarkupService.executeGwmsPartsMarkupProcedure();


       } catch (Exception e){
           throw new JobExecutionException(e.getMessage(), e);
       }

    }


}
