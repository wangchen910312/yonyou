package chn.bhmc.dms.bat.sal.dlv;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.dlv.service.BatchDlvConfInfoService;

/**
 * @ClassName   :
 * @Description : 이월소매취소심사완료알림-불승인
 * @author Lee Seungmin
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.    Lee Seungmin       최초 생성
 * </pre>
 */

public class BatchDlvConfInfoDisAgrBean extends BaseJobBean {
	
	@Autowired
	BatchDlvConfInfoService batchDlvConfInfoService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchDlvConfInfoService batchDlvConfInfoService = getBean(BatchDlvConfInfoService.class);
            batchDlvConfInfoService.callAlarmProcess("N");
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
