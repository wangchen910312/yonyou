package chn.bhmc.dms.bat.par.stm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.stm.service.BatchPartsItemSaftyStockSuggestService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftStockSuggestProcedureBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 5.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatchPartsItemSaftyStockSuggestProcedureBean extends BaseJobBean {
	
	@Autowired
	BatchPartsItemSaftyStockSuggestService batchPartsItemSaftyStockSuggestService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //BatchPartsItemSaftyStockSuggestService batchPartsItemSaftyStockSuggestService = getBean(BatchPartsItemSaftyStockSuggestService.class);
            batchPartsItemSaftyStockSuggestService.executeItemSaftyStockSuggestProcedure();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}