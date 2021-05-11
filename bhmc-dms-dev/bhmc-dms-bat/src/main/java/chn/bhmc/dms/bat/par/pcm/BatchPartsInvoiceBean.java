package chn.bhmc.dms.bat.par.pcm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsInvoiceBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Ju Won Lee     최초 생성
 * </pre>
 */

public class BatchPartsInvoiceBean extends BaseJobBean {

	@Autowired
	BatInvcInrService partsService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            int day = 1;

            String sID = context.getJobDetail().getJobDataMap().getString("sID");

            String strDay = context.getJobDetail().getJobDataMap().getString("day");
            if(strDay != null){
                day = Integer.parseInt(strDay);
            }

            if(sID.equals("PAR106")){
                partsService.insertInvoiceInfo(day);
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}