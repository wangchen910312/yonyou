package chn.bhmc.dms.bat.sal.veh;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.veh.service.BatchVehFirstRetailDateService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchVehFirstRetailDateBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 6. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 27.     Lee Seungmin     최초 생성
 * </pre>
 */

public class BatchVehFirstRetailDateBean extends BaseJobBean{

    @Autowired
    BatchVehFirstRetailDateService batchVehFirstRetailDateService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            batchVehFirstRetailDateService.batFirstRetailDate();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
