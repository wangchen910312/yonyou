package chn.bhmc.dms.bat.sal.div;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.div.service.TracticsDeliveryPreMonthDelService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TracticsDeliveryPreMonthDelBatchJobBean.java
 * @Description : 이전달 전략출고 대기 , 거절건 삭제 Batch
 * @author Ki hyun Kwon
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class TracticsDeliveryPreMonthDelBatchJobBean extends BaseJobBean{

    @Resource(name="tracticsDeliveryPreMonthDelService")
    TracticsDeliveryPreMonthDelService tracticsDeliveryPreMonthDelService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {



        int day = context.getJobDetail().getJobDataMap().getInt("day");
        try{

            tracticsDeliveryPreMonthDelService.updateTracticsDelivery(day);

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
