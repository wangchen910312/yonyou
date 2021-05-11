package chn.bhmc.dms.bat;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

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

public class SimpleCamelCallJobBean extends BaseJobBean{
	
	@Autowired
	CamelClientFactory camelClientFactory;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            String ifId = context.getJobDetail().getJobDataMap().getString("ifId");

            //Camel 호출
            //CamelClientFactory camelClientFactory = getBean(CamelClientFactory.class);
            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId(ifId);
            camelClient.sendRequest();

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}