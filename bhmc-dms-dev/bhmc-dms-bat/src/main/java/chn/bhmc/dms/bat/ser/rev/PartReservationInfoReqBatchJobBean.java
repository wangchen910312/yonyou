package chn.bhmc.dms.bat.ser.rev;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.rev.service.PartReservationInfoReqService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationInfoReqBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim KyungMok
 * @since 2017. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 18.   Kim KyungMok     최초 생성
 * </pre>
 */

public class PartReservationInfoReqBatchJobBean extends BaseJobBean {

	@Autowired
	PartReservationInfoReqService partReservationInfoReqService;

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
            partReservationInfoReqService.insertPartReservationReq(day);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}