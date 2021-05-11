package chn.bhmc.dms.bat.par.pmm;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pmm.service.BatchInvoiceService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchInvoiceProcedureBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.     Mid Eum Park     최초 생성
 * </pre>
 */

public class BatchInvoiceProcedureBean extends BaseJobBean{

    @Resource(name="batchInvoiceService")
    BatchInvoiceService batchInvoiceService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            batchInvoiceService.executeInvoiceProcedure();
        } catch (Exception e) {
            throw new JobExecutionException(e.getMessage(), e);
        }
    }


}
