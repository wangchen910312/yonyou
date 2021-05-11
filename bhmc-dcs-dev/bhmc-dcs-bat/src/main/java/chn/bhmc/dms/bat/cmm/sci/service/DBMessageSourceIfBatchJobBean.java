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
 * 메세지소스 IF JobBean
 * </pre>
 *
 * @ClassName   : DBMessageSourceIfBatchJobBean.java
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

public class DBMessageSourceIfBatchJobBean extends BaseJobBean{
	
	@Autowired
	EaiClient eaiClient;
	
	@Autowired
	DBMessageSourceIfService dbMessageSourceIfService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        int day = 1;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }

        try{
            //DBMessageSourceIfService dbMessageSourceIfService = getBean(DBMessageSourceIfService.class);
            dbMessageSourceIfService.insertDBMessageSourceIf(day);

            //EAI 호출
            //EaiClient eaiClient = getBean(EaiClient.class);
            CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
            .ifId("COM034")
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
