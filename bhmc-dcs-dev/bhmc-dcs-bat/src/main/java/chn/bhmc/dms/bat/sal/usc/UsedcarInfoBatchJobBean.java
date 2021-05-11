package chn.bhmc.dms.bat.sal.usc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.usc.service.UsedcarInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedcarInfoBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 24.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class UsedcarInfoBatchJobBean  extends BaseJobBean{

	@Autowired
	UsedcarInfoService usedcarInfoService;
	
    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {



        String preFixId = context.getJobDetail().getJobDataMap().getString("preFixId");
        try{
            //UsedcarInfoService usedcarInfoService = getBean(UsedcarInfoService.class);

            if(preFixId.equals("SAL122")){
                usedcarInfoService.insertSusunDcsUvinmst();
            }else if(preFixId.equals("SAL123")){
                usedcarInfoService.insertSusunDcsOwner();
            }else if(preFixId.equals("SAL124")){
                usedcarInfoService.insertSusunDcsCrtvin();
            }else if(preFixId.equals("SAL125")){
                usedcarInfoService.insertSusunDcsCrtdlr();
            }
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
