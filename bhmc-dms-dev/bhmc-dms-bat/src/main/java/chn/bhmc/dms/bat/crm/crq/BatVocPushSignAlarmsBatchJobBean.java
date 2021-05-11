package chn.bhmc.dms.bat.crm.crq;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.crq.service.BatVocPushSignAlarmsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatVocPushSignAlarmsBatchJobBean
 * @Description : VOC PushAlarm
 * @author LEE IN MOON
 * @since 2016.12.15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.12.15.     LEE IN MOON     최초 생성
 * </pre>
 */

public class BatVocPushSignAlarmsBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatVocPushSignAlarmsService batVocPushSignAlarmsService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            // VOC PushAlarm
            //BatVocPushSignAlarmsService batVocPushSignAlarmsService = getBean(BatVocPushSignAlarmsService.class);
            batVocPushSignAlarmsService.selectVocPushSignAlarms();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}