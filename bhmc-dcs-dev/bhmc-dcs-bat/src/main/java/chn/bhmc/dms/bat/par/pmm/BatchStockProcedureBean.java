package chn.bhmc.dms.bat.par.pmm;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pmm.service.BatchStockService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchStockProcedureBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 19.     Mid Eum Park     최초 생성
 * </pre>
 */

public class BatchStockProcedureBean extends BaseJobBean{

    @Resource(name="batchStockService")
    BatchStockService batchStockService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            batchStockService.executeStockProcedure();
        }catch(Exception e) {
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
