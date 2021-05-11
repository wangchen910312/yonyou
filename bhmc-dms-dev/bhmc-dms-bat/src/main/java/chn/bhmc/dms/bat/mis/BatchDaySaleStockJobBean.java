package chn.bhmc.dms.bat.mis;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.mis.service.BatchDaySaleStockJobService;

/**
 * <pre>
 * [BatchJob] 판매재고(MS_1003T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStockJobBean.java
 * @Description : [BatchJob] 판매재고(MS_1003T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */

public class BatchDaySaleStockJobBean extends BaseJobBean {
	
	@Autowired
	BatchDaySaleStockJobService batchDaySaleStockJobService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchDaySaleStockJobService batchDaySaleStockJobService = getBean(BatchDaySaleStockJobService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batchDaySaleStockJobService.selectSaleStockJob();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
