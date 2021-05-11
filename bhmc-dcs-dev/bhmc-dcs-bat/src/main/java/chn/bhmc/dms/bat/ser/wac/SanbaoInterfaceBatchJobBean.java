package chn.bhmc.dms.bat.ser.wac;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.wac.service.SanbaoInterfaceService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInterfaceBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoInterfaceBatchJobBean extends BaseJobBean{
	
	@Autowired
	SanbaoInterfaceService sanbaoInterfaceService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            //SanbaoInterfaceService sanbaoInterfaceService = getBean(SanbaoInterfaceService.class);
            sanbaoInterfaceService.insertSanbaoInfoIf();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
