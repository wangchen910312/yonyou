package chn.bhmc.dms.bat.ser.mig;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.mig.service.GdmsDataMigService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GdmsDataMigBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Yunseung
 * @since 2017. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 22.   Kin Yunseung     최초 생성
 * </pre>
 */

public class GdmsDataMigBatchJobBean extends BaseJobBean{

	@Autowired
	GdmsDataMigService gdmsDataMigService;

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
            gdmsDataMigService.insertGdmsToDcs(day);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
