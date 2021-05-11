package chn.bhmc.dms.bat.cmm.sms;

import java.util.List;

import org.json.simple.JSONObject;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsAmountService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsAmountBatchJobBean
 * @Description : DCS Mig를 위한 배치 JobBean
 * @author Choi KyungYong
 * @since 2017. 07. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since             author              description
 *  ============    ===============    ========================
 *  2017. 07. 10.    Choi KyungYong            최초 생성
 * </pre>
 */

public class SendSmsAmountBatchJobBean extends BaseJobBean {

	@Autowired
	SendSmsAmountService sendSmsAmountService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //SendSmsAmountService sendSmsAmountService = getBean(SendSmsAmountService.class);

            //Dlr 리스트의
            List<JSONObject> dlrList = sendSmsAmountService.getDlrSmsAmount();

            //딜러별로 잔액 조회
            if(dlrList != null && dlrList.size() > 0){
                sendSmsAmountService.requestSMSAmount(dlrList);
            }

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

    }

}
