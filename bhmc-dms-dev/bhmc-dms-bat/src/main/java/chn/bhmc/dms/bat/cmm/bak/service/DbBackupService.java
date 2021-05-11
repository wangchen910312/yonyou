package chn.bhmc.dms.bat.cmm.bak.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DbBackupService
 * @Description : DMS Tibero Backup을 위한  Service
 * @author Choi KyungYong
 * @since 2016. 12. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 12. 6.     Choi KyungYong            최초 생성
 * </pre>
 */

public interface DbBackupService {

    /**
     * DMS Tibero Export Batch
     * @param null
     * @return void
     */
    public void requestDbBackupBatch(String pPath) throws Exception;

}