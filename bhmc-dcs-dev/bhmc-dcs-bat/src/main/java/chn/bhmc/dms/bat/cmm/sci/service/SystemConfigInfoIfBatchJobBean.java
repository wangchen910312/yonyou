package chn.bhmc.dms.bat.cmm.sci.service;

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
 * @ClassName   : SystemConfigInfoBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SystemConfigInfoIfBatchJobBean extends BaseJobBean{
	
	@Autowired
	EaiClient eaiClient;
	
	@Autowired
	SystemConfigInfoIfBatchService systemConfigInfoIfBatchService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        try{
            //시스템설정정보 테이블[CM_0201T]에서 시스템설정정보 전송 테이블[CM_0201IS]로 데이터를 저장한다.
            //SystemConfigInfoIfBatchService systemConfigInfoIfBatchService = getBean(SystemConfigInfoIfBatchService.class);
            systemConfigInfoIfBatchService.insertSystemConfigInfoIf();

            //EAI 호출
            //EaiClient eaiClient = getBean(EaiClient.class);
            CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
            .ifId("COM039")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();

            eaiClient.sendRequest(reqCommDMSDoc);

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
