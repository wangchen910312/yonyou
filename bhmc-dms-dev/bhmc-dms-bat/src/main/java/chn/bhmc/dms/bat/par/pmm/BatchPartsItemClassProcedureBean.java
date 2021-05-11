package chn.bhmc.dms.bat.par.pmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemClassService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemClassProcedureBean.java
 * @Description : 배치 부품가격프로시져 호출
 * @author In Bo Shim
 * @since 2017. 06. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 06. 17.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatchPartsItemClassProcedureBean extends BaseJobBean {

	@Autowired
	BatchPartsItemClassService batchPartsItemClassService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
              //BatchPartsItemClassService batchPartsItemClassService = getBean(BatchPartsItemClassService.class);
              batchPartsItemClassService.executeItemClassProcedure("PTS_ITEM_CLASS");
        } catch (Exception e){
        	throw new JobExecutionException(e.getMessage(), e);
        }
    }
}