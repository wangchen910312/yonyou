package chn.bhmc.dms.bat.sal.inv;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.inv.service.StockMntPreMonthDelService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMntPreMonthDelBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
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

public class StockMntPreMonthDelBatchJobBean extends BaseJobBean{


    @Resource(name="stockMntPreMonthDelService")
    StockMntPreMonthDelService stockMntPreMonthDelService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        int day = context.getJobDetail().getJobDataMap().getInt("day");
        try{

            stockMntPreMonthDelService.updateStockMntPreMonthDel(day);

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }


    }



}
