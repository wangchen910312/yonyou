package chn.bhmc.dms.bat.ser.cal;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.cal.service.BatchCalculateInfoReqService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchCalculateInfoReqBatchJobBean.java
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

public class BatchCalculateInfoReqBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatchCalculateInfoReqService batchCalculateInfoReqService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        int day = 3;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        String strPgm = context.getJobDetail().getJobDataMap().getString("pgm");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }
        
        try{
            //BatchCalculateInfoReqService batchCalculateInfoReqService = getBean(BatchCalculateInfoReqService.class);
            
            if(strPgm.equals("CAL")){
                batchCalculateInfoReqService.spSerCalulateInfoReq(day);
            }else{
                batchCalculateInfoReqService.spSerTabInfoReq(day);
            }           
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}