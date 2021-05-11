package chn.bhmc.dms.bat;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SimpleEaiCallJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SimpleEaiCallJobBean extends BaseJobBean{
	
	@Autowired
	EaiClient eaiClient;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{

            String ifId = context.getJobDetail().getJobDataMap().getString("ifId");

            //EAI 호출
            //EaiClient eaiClient = getBean(EaiClient.class);
            CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
            .ifId(ifId)
            .company("H")
            .sender("DCS")
            .build()
            .buildCommDMSDoc();

            eaiClient.sendRequest(reqCommDMSDoc);

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
