package chn.bhmc.dms.bat.cmm.bak;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.bak.service.DbBackupService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DbBackupBatchJobBean
 * @Description : DMS Tibero Backup을 위한 JobBean
 * @author Choi KyungYong
 * @since 2016. 12. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 9. 1.     Choi KyungYong            최초 생성
 * </pre>
 */

public class DbBackupBatchJobBean extends BaseJobBean {
	
	@Autowired
	DbBackupService dbBackupService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {

            JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //DbBackupService dbBackupService = getBean(DbBackupService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            dbBackupService.requestDbBackupBatch(jobDataMap.getString("DB_BACKUP_PATH"));

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}