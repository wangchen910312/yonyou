package chn.bhmc.dms.bat.sal.cmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 판매 - Camel 호출 데이터 수집
 * @author Kim Jin Suk
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchSalesDlrProcedureBean extends BaseJobBean {

	@Autowired
	BatchSalesService salesService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            salesService.executeSalesDlrCheckProcedure();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}