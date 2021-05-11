package chn.bhmc.dms.bat.ser.rcv;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.rcv.service.BatchServiceReceiveInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchServiceReceiveInfoReqBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 4.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class BatchServiceReceiveInfoReqBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatchServiceReceiveInfoService batchServiceReceiveInfoService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        int day = 3;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }
        
        try{
            //BatchServiceReceiveInfoService batchServiceReceiveInfoService = getBean(BatchServiceReceiveInfoService.class);
            batchServiceReceiveInfoService.spSerReceiveInfoReq(day);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}