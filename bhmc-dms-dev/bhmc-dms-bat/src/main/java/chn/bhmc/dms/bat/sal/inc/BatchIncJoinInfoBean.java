package chn.bhmc.dms.bat.sal.inc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.inc.service.BatchIncJoinInfoService;

/**
 * @ClassName   :
 * @Description : 판매 - 보험 고객추적 배치
 * @author Kim Jin Suk
 * @since 2017. 2. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 06.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchIncJoinInfoBean extends BaseJobBean {
	
	@Autowired
	BatchIncJoinInfoService incJoinInfoBatchService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchIncJoinInfoService incJoinInfoBatchService = getBean(BatchIncJoinInfoService.class);
            //String sid = context.getJobDetail().getJobDataMap().getString("sID");
            //Map<String, ?> sMap = context.getJobDetail().getJobDataMap();
            
            // 보험추적 알림
            incJoinInfoBatchService.callIncJoinProcess();
            
            // 보험만료 알림
            incJoinInfoBatchService.callIncJoinExpire();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
