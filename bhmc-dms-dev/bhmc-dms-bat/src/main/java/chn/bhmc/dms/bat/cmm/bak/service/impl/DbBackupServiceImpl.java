package chn.bhmc.dms.bat.cmm.bak.service.impl;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.bak.service.DbBackupService;
import chn.bhmc.dms.bat.mgr.service.BatchShellScriptJob;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DbBackupServiceImpl
 * @Description : DMS Tibero Backup을 위한  ServiceImpl
 * @author Choi KyungYong
 * @since 2016. 12. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 12. 6.     Choi KyungYong           최초 생성
 * </pre>
 */
@Service("dbBackupServiceImpl")
public class DbBackupServiceImpl extends HService implements DbBackupService {


    /*
     * @see chn.bhmc.dms.bat.cmm.bak.service.requestDbBackupBatch#requestDbBackupBatch
     */
    @Override
    public void requestDbBackupBatch(String pPath) throws Exception {
        try{
            BatchShellScriptJob batchShellScriptJob = new BatchShellScriptJob();
            String path = "D:\\apps\\bhmc-dms-backup\\dbbackup.bat";
            batchShellScriptJob.executeProgram(path, "");
        }catch(Exception e){
            log.error(e.getMessage(), e);
        }
    }

}
