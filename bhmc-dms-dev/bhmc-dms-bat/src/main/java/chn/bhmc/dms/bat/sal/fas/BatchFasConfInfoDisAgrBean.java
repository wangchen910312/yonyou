package chn.bhmc.dms.bat.sal.fas;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.fas.service.BatchFasConfInfoService;

/**
 * @ClassName   :
 * @Description : 강제출고심사완료알림-불승인
 * @author Lee Seungmin
 * @since 2017. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 16.    Lee Seungmin       최초 생성
 * </pre>
 */

public class BatchFasConfInfoDisAgrBean extends BaseJobBean {
	
	@Autowired
	BatchFasConfInfoService batchFasConfInfoService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchFasConfInfoService batchFasConfInfoService = getBean(BatchFasConfInfoService.class);
            batchFasConfInfoService.callAlarmProcess("N");
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}