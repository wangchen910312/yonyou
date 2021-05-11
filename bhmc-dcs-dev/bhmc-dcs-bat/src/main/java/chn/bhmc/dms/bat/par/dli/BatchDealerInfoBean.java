package chn.bhmc.dms.bat.par.dli;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.dli.service.BatchDealerInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchDealerInfoBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyun
 * @since 2017. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 20.     Lee Hyeong gyun     최초 생성
 * </pre>
 */

public class BatchDealerInfoBean extends BaseJobBean{

    @Autowired
    BatchDealerInfoService batchDealerInfoService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            batchDealerInfoService.batDealerInfo();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
