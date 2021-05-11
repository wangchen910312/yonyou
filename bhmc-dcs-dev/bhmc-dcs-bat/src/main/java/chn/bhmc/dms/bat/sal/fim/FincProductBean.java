package chn.bhmc.dms.bat.sal.fim;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.fim.service.FincProductService;

/**
 * @ClassName   : FincProductBean
 * @Description : 금융상품정보 I/F DCS -> DMS
 * @author KIM JIN SUK
 * @since 2017. 4. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 17.    KIM JIN SUK            최초 생성
 * </pre>
 */

public class FincProductBean  extends BaseJobBean{
	
	@Autowired
	FincProductService fincProductService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        String sID = context.getJobDetail().getJobDataMap().getString("sID");
        
        try{
            //FincProductService fincProductService = getBean(FincProductService.class);
            
            fincProductService.batFincProductSearch(sID);
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }

}
