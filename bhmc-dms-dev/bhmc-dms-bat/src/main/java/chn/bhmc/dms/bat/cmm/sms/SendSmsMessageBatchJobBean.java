package chn.bhmc.dms.bat.cmm.sms;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsMessageService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsMessageBatchJobBean
 * @Description : DCS - SMS Relay 서버간 I/F 전송을 위한 배치 JobBean
 * @author Choi KyungYong
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 9. 1.     Choi KyungYong            최초 생성
 * </pre>
 */

public class SendSmsMessageBatchJobBean extends BaseJobBean {

	@Autowired
	SendSmsMessageService sendSmsMessageService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            sendSmsMessageService.requestSMSMessage();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}