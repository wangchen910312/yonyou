package chn.bhmc.dms.bat.par.stm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftStockProcedureBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 1.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatchPartsItemSaftyStockProcedureBean extends BaseJobBean {
	
	@Autowired
	BatchPartsItemSaftyStockService batchPartsItemSaftyStockService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //BatchPartsItemSaftyStockService batchPartsItemSaftyStockService = getBean(BatchPartsItemSaftyStockService.class);
            batchPartsItemSaftyStockService.executeItemSaftyStockProcedure();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}