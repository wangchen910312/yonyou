package chn.bhmc.dms.bat.cmm.bat.service;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * 배치결과정보 이관 및 데이터 삭제 배치
 * </pre>
 *
 * @ClassName   : BatchResultBackupJobBean.java
 * @Description : 배치결과정보 이관 및 데이터 삭제 배치
 * @author Kang Seok Han
 * @since 2017. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 8.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BatchResultBackupJobBean extends BaseJobBean {

    @Autowired
    BatchResultBackupService batchResultBackupService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        int day = 1;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }

        try{
            batchResultBackupService.insertBatchResultHistory(day);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
